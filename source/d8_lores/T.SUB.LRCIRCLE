*``````````````````````````````*
* LRCIRCLE      (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE DRAWS A      *
* CIRCLE ON THE CURRENT WORK   *
* PAGE AT THE GIVEN COORDINATE *
* AND COLOR.                   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = CIRCLE X CENTER     *
*  WPAR2 = CIRCLE Y CENTER     *
*  WPAR3 = CIRCLE RADIUS       *
*  BPAR1 = CIRCLE COLOR        *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 711+                 *
* SIZE: 501 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]XC      EQU   WPAR1      ; CIRCLE X CENTER
]YC      EQU   WPAR2      ; CIRCLE Y CENTER
]R       EQU   WPAR3      ; RADIUS
]COLOR   EQU   BPAR2      ; COLOR
*
]YY      EQU   VARTAB+5   ; WORKING Y POSITION
]XX      EQU   VARTAB+7   ; WORKING X POSITION
]DX      EQU   VARTAB+9   ; CHANGE IN X
]DY      EQU   VARTAB+11  ; CHANGE IN Y
]ERR     EQU   VARTAB+13  ; ERROR POSSIBILITY
]DIAM    EQU   VARTAB+15  ; CIRCLE DIAMETER
]XT      EQU   VARTAB+17  ; NEGATIVE OF X
]YT      EQU   VARTAB+19  ; NEGATIVE OF Y
*
LRCIRCLE
*
** FIRST, INITIALIZE VARIABLES
*
         LDA   #0         ; CLEAR YPOS
         STA   ]YY
         LDA   ]R         ; LOAD RADIUS
         STA   ]XX        ; X = RADIUS
         STA   ]ERR       ; ERROR = RADIUS
         ASL              ; R * 2
         STA   ]DIAM      ; STORE DIAMETER
*
** NOW DRAW FIRST PART OF CIRCLE
*
** CALCULATE -X AND -Y
*
         LDA   ]XX        ; GET XPOS
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]XT        ; STORE NEGATED IN XT
         LDA   ]YY        ; GET YPOS
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]YT        ; STORE NEGATED IN YT
*
** PLOT XC+X,YC
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XX        ; ADD CURRENT XPOS
         TAX
         TAY              ; TRANSER TO .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC-X,YC
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAX
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC,YC+X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]XX        ; ADD CURRENT XPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC,YC-X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** NOW LOOP UNTIL CIRCLE IS FINISHED
*
:LOOP
*
** CHECK IF CIRCLE FINISHED
*
         LDA   ]YY        ; IF Y > X
         CMP   ]XX
         BCC   :LPCONT    ; CONTINUE LOOPING
         JMP   :EXIT ; OTHERWISE, CIRCLE DONE
:LPCONT
:STEPY                    ; STEP THE Y POSITION
         LDA   ]YY        ; LOAD YPOS
         ASL              ; MULTIPLY BY 2
*CLC
         ADC   #1         ; ADD +1
         STA   ]DY        ; STORE CHANGE OF Y
         INC   ]YY        ; INCREASE YPOS
         LDA   ]DY        ; NEGATE
         EOR   #$FF
         CLC
         ADC   #1
         ADC   ]ERR       ; ADD ERR
         STA   ]ERR       ; ERR = ERR - DY
         BPL   :PLOT      ; IF ERR IS +, SKIP TO PLOT
:STEPX
         LDA   ]XX        ; LOAD XPOS
         ASL              ; MULTIPLY BY 2
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         ADC   #1         ; (X*2) + 1
         STA   ]DX        ; STORE CHANGE OF X
         DEC   ]XX        ; DECREASE YPOS
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
         LDA   ]XX
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
         STA   ]XT
         LDA   ]YY
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
         ADC   ]XX        ; ADD CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]YY        ; ADD CURRENT YPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
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
         ADC   ]YY        ; ADD CURRENT YPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
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
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC+X,YC-Y
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]XX        ; ADD CURRENT XPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]YT        ; ADD NEGATE CURRENT YPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC+Y,YC+X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]YY        ; ADD CURRENT YPOS
         TAX              ; TRANSFER TO .X
         TAY              ; AND .Y
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC              ; CLEAR CARRY
         ADC   ]XX        ; ADD CURRENT XPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
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
         ADC   ]XX        ; ADD CURRENT XPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
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
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
*
** PLOT XC+Y,YC-X
*
         LDA   ]XC        ; LOAD CIRCLE CENTER XPOS
         CLC              ; CLEAR CARRY
         ADC   ]YY        ; ADD CURRENT YPOS
         TAY              ; TRANSFER TO .Y
         TAX              ; AND .X
         LDA   ]YC        ; LOAD CIRCLE CENTER YPOS
         CLC
         ADC   ]XT        ; ADD NEGATED CURRENT XPOS
         TAY
         LDA   ]COLOR
         JSR   LOCPLOT
         JMP   :LOOP
:EXIT
         RTS
