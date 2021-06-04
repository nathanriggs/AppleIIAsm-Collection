*
*``````````````````````````````*
* TCIRCLE      (NATHAN RIGGS)  *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X CENTER POS        *
*  WPAR2 = Y CENTER POS        *
*  BPAR1 = RADIUS              *
*  BPAR2 = FILL CHARACTER      *
*                              *
* OUTPUT:                      *
*                              *
*  USES BRESENHAM'S CIRCLE     *
*  ALGORITHM TO DRAW A CIRCLE  *
*  TO THE 40-COLUMN TEXTMODE   *
*  SCREEN.                     *
*                              *
* DESTROY: NZCIDV              *
*                              *
*                              *
* CYCLES: 601+                 *
* SIZE: 371 BYTES              *
*                              *
* SUBSTANTIAL DEBT IS OWED TO  *
* MARC GOLOMBECK AND HIS GREAT *
* IMPLEMENTATION OF THE        *
* BRESENHAM CIRCLE ALGORITHM   *
* IN 6502 AND APPLESOFT, WHICH *
* IS BASED ON THE GERMAN LANG  *
* VERSION OF WIKIPEDIA'S ENTRY *
* ON THE ALGORITHM THAT HAS A  *
* BASIC PSEUDOCODE EXAMPLE.    *
* THAT EXAMPLE, WITH CHANGED   *
* VARIABLE NAMES, IS INCLUDED  *
* BELOW.                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]XC      EQU   WPAR1      ; X CENTER POSITION
]YC      EQU   WPAR2      ; Y CENTER POSITION
]R       EQU   BPAR1      ; RADIUS
]F       EQU   BPAR2      ; FILL CHAR
*
]Y       EQU   VARTAB     ; CENTER YPOS
]X       EQU   VARTAB+1   ; CENTER XPOS
]DY      EQU   VARTAB+2   ; CHANGE IN Y
]DX      EQU   VARTAB+4   ; CHANGE IN X
]ERR     EQU   VARTAB+6   ; ERROR VALUE
]DIAM    EQU   VARTAB+8   ; DIAMETER
]XT      EQU   VARTAB+10  ; INVERTED X VALUE
]YT      EQU   VARTAB+12  ; INVERTED Y VALUE
*
********************************
*                              *
*  BASIC PSEUDOCODE            *
*                              *
********************************
*
* X = R
* Y = 0
* ERROR = R
* SETPIXEL XC + X, YC + Y
* WHILE Y < X
*   DY = Y * 2 + 1
*   Y = Y + 1
*   ERROR = ERROR - DY
*   IF ERROR < 0 THEN
*     DX = 1 - X * 2
*     X = X - 1
*     ERROR = ERROR - DX
*   END IF
*   SETPIXEL XC + X, YC + Y
*   SETPIXEL XC - X, YC + Y
*   SETPIXEL XC - X, YC - Y
*   SETPIXEL XC + X, YC - Y
*   SETPIXEL XC + Y, YC + X
*   SETPIXEL XC - Y, YC + X
*   SETPIXEL XC - Y, YC - X
*   SETPIXEL XC + Y, YC - X
* WEND
*
********************************
*
TCIRCLE
*
** FIRST, INITIALIZE VARIABLES
*
         LDA   #0         ; {2C2B} CLEAR YPOS {NZ}
         STA   ]Y         ; {4C3B}
         LDA   ]R         ; {4C3B} LOAD RADIUS {NZ}
         STA   ]X         ; {4C3B} X = RADIUS
         STA   ]ERR       ; {4C3B} ERROR = RADIUS
         ASL              ; {2C1B} R * 2 {NZC}
         STA   ]DIAM      ; {4C3B} STORE DIAMETER
*
** NOW DRAW FIRST PART OF CIRCLE
*
** CALCULATE -X AND -Y
*
         LDA   ]X         ; {4C3B} GET XPOS {NZ}
         NEGA             ; {6C5B} {NZCV}
         STA   ]XT        ; {4C3B} STORE NEGATED IN XT
         LDA   ]Y         ; {4C3B} GET YPOS {NZ}
         NEGA             ; {6C5B} {NZCV}
         STA   ]YT        ; {4C3B} STORE NEGATED IN YT
*
** PLOT XC+X,YC
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         TAY              ; {2C1B} TRANSER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS {NZ}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; {4C3B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {5C3B} STORE IN SCREEN MEMORY
*
** PLOT XC-X,YC
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         TAY              ; {2C1B} AND .Y {NZ}
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS {NZ}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; {4C3B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {5C3B} STORE IN SCREEN MEMORY
*
** PLOT XC,YC+X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS {NZ}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; {4C3B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {5C3B} STORE IN SCREEN MEMORY
*
** PLOT XC,YC-X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS {NZ}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; {4C3B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {5C3B} STORE IN SCREEN MEMORY
*
** NOW LOOP UNTIL CIRCLE IS FINISHED
*
:LOOP
*
** CHECK IF CIRCLE FINISHED
*
         LDA   ]Y         ; {4C3B} IF Y > X {NZ}
         CMP   ]X         ; {4C3B} {NZC}
         BCC   :LPCONT    ; {3C2B} CONTINUE LOOPING
         JMP   :EXIT      ; {3C3B} OTHERWISE, CIRCLE DONE
:LPCONT
:STEPY                    ; STEP THE Y POSITION
         LDA   ]Y         ; {4C3B} LOAD YPOS {NZ}
         ASL              ; {2C1B} MULTIPLY BY 2 {NZC}
*CLC
         ADC   #1         ; {3C2B} ADD +1 {NZCV}
         STA   ]DY        ; {4C3B} STORE CHANGE OF Y
         INC   ]Y         ; {6C3B} INCREASE YPOS {NZ}
         LDA   ]DY        ; {3C2B} NEGATE {NZ}
         NEGA             ; {6C5B} {NZCV}
         ADC   ]ERR       ; {4C3B} ADD ERR {NZCV}
         STA   ]ERR       ; {4C3B} ERR = ERR - DY
         BPL   :PLOT      ; {3C2B} IF ERR IS +, SKIP TO PLOT
:STEPX
         LDA   ]X         ; {3C2B} LOAD XPOS {NZ}
         ASL              ; {2C1B} MULTIPLY BY 2 {NZC}
         NEGA             ; {6C5B} NEGATE {NZCV}
         ADC   #1         ; {3C2B} (X*2) + 1 {NZCV}
         STA   ]DX        ; {4C3B} STORE CHANGE OF X
         DEC   ]X         ; {6C3B} DECREASE YPOS {NZ}
         LDA   ]DX        ; {3C2B} NEGATE {NZ}
         NEGA             ; {6C5B} {NZCV}
         ADC   ]ERR       ; {4C3B} ADD ERR {NZCV}
         STA   ]ERR       ; {4C3B} ERR = ERR - DX
*
:PLOT
*
** NOW CALCULATE -X AND -Y
*
         LDA   ]X         ; {3C2B} {NZ}
         NEGA             ; {6C5B} NEGATE {NZCV}
         STA   ]XT        ; {4C3B}
         LDA   ]Y         ; {3C2B} {NZ}
         NEGA             ; {6C5B} NEGATE {NZCV}
         STA   ]YT        ; {4C3B}
*
** NOW PLOT CIRCLE OCTANTS
*
** PLOT XC+X,YC+Y
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]Y         ; {4C3B} ADD CURRENT YPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC-X,YC+Y
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND TO .X {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]Y         ; {4C3B} ADD CURRENT YPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC-X,YC-Y
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHARACTER {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC+X,YC-Y
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]YT        ; {4C3B} ADD NEGATE CURRENT YPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC+Y,YC+X
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]Y         ; {4C3B} ADD CURRENT YPOS {NZCV}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         TAY              ; {2C1B} AND .Y {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC-Y,YC+X
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS {NZCV}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         TAY              ; {2C1B} AND .Y {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]X         ; {4C3B} ADD CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC-Y,YC-X
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS {NZCV}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         TAY              ; {2C1B} AND .Y {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
*
** PLOT XC+Y,YC-X
*
         LDA   ]XC        ; {3C2B} LOAD CIRCLE CENTER XPOS {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]Y         ; {4C3B} ADD CURRENT YPOS {NZCV}
         TAY              ; {2C1B} TRANSFER TO .Y {NZ}
         TAX              ; {2C1B} AND .X {NZ}
         LDA   ]YC        ; {3C2B} LOAD CIRCLE CENTER YPOS {NZ}
         CLC              ; {2C1B} {C=0}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS {NZCV}
         JSR   GBCALC     ; {43C3B} GET X,Y SCREEN ADDRESS {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL CHAR {NZ}
         STA   (GBPSH),Y  ; {6C2B} STORE AT SCREEN ADDRESS
         JMP   :LOOP      ; {3C3B} LOOP UNTIL FINISHED
:EXIT
         RTS              ; {6C1B}
