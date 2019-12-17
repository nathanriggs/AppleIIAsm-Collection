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
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 494+                 *
* SIZE: 420 BYTES              *
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
* THAT EXAMPLE, WITH CHANGES   *
* VARIABLE NAMES, IS INCLUDED  *
* BELOW.                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]XC      EQU   WPAR1
]YC      EQU   WPAR2
]R       EQU   BPAR1
]F       EQU   BPAR2
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
TCIRCLE
*
** FIRST, INITIALIZE VARIABLES
*
         LDA   #0         ; CLEAR YPOS
         STA   ]Y
         LDA   ]R         ; LOAD RADIUS
         STA   ]X         ; X = RADIUS
         STA   ]ERR       ; ERROR = RADIUS
         ASL              ; R * 2
         STA   ]DIAM      ; STORE DIAMETER
*
** NOW DRAW FIRST PART OF CIRCLE
*
** CALCULATE -X AND -Y
*
         LDA   ]X         ; GET XPOS
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]XT        ; STORE NEGATED IN XT
         LDA   ]Y         ; GET YPOS
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]YT        ; STORE NEGATED IN YT
*
** PLOT XC+X,YC
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         TAY              ; TRANSER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         JSR   GBCALC     ; GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE IN SCREEN MEMORY
*
** PLOT XC-X,YC
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAX              ; TRANSFER TO .X
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         JSR   GBCALC     ; GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE IN SCREEN MEMORY
*
** PLOT XC,YC+X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE IN SCREEN MEMORY
*
** PLOT XC,YC-X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN MEMORY POS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE IN SCREEN MEMORY
*
** NOW LOOP UNTIL CIRCLE IS FINISHED
*
:LOOP
*
** CHECK IF CIRCLE FINISHED
*
         LDA   ]Y         ; IF Y > X
         CMP   ]X
         BCC   :LPCONT    ; CONTINUE LOOPING
         JMP   :EXIT      ; OTHERWISE, CIRCLE DONE
:LPCONT
:STEPY                    ; STEP THE Y POSITION
         LDA   ]Y         ; LOAD YPOS
         ASL              ; MULTIPLY BY 2
*CLC
         ADC   #1         ; ADD +1
         STA   ]DY        ; STORE CHANGE OF Y
         INC   ]Y         ; INCREASE YPOS
         LDA   ]DY        ; NEGATE
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       ; ADD ERR
         STA   ]ERR       ; ERR = ERR - DY
         BPL   :PLOT      ; IF ERR IS +, SKIP TO PLOT
:STEPX
         LDA   ]X         ; LOAD XPOS
         ASL              ; MULTIPLY BY 2
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         ADC   #1         ; (X*2) + 1
         STA   ]DX        ; STORE CHANGE OF X
         DEC   ]X         ; DECREASE YPOS
         LDA   ]DX        ; NEGATE
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       ; ADD ERR
         STA   ]ERR       ; ERR = ERR - DX
*
:PLOT
*
** NOW CALCULATE -X AND -Y
*
         LDA   ]X
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]XT
         LDA   ]Y
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]YT
*
** NOW PLOT CIRCLE OCTANTS
*
** PLOT XC+X,YC+Y
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]Y         ; ADD CURRENT YPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC-X,YC+Y
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND TO .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]Y         ; ADD CURRENT YPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC-X,YC-Y
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]YT        ; ADD NEGATED CURRENT YPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHARACTER
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC+X,YC-Y
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]YT        ; ADD NEGATE CURRENT YPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC+Y,YC+X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]Y         ; ADD CURRENT YPOS
         TAX              ; TRANSFER TO .X
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC-Y,YC+X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]YT        ; ADD NEGATED CURRENT YPOS
         TAX              ; TRANSFER TO .X
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]X         ; ADD CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC-Y,YC-X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]YT        ; ADD NEGATED CURRENT YPOS
         TAX              ; TRANSFER TO .X
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
*
** PLOT XC+Y,YC-X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]Y         ; ADD CURRENT YPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         JSR   GBCALC     ; GET X,Y SCREEN ADDRESS
         LDA   ]F         ; LOAD FILL CHAR
         STA   (GBPSH),Y  ; STORE AT SCREEN ADDRESS
         JMP   :LOOP      ; LOOP UNTIL FINISHED
:EXIT
         RTS
