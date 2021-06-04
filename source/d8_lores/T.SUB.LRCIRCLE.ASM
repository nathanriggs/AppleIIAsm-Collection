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
* CYCLES: 2404+                *
* SIZE: 457 BYTES              *
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
         LDA   #0         ; {3C2B} CLEAR YPOS
         STA   ]YY        ; {4C3B}
         LDA   ]R         ; {4C3B} LOAD RADIUS
         STA   ]XX        ; {4C3B} X = RADIUS
         STA   ]ERR       ; {4C3B} ERROR = RADIUS
         ASL              ; {2C1B} R * 2
         STA   ]DIAM      ; {4C3B} STORE DIAMETER
*
** NOW DRAW FIRST PART OF CIRCLE
*
** CALCULATE -X AND -Y
*
         LDA   ]XX        ; {4C3B} GET XPOS
         EOR   #$FF       ; {2C2B} NEGATE
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         STA   ]XT        ; {4C3B} STORE NEGATED IN XT
         LDA   ]YY        ; {4C3B} GET YPOS
         EOR   #$FF       ; {2C2B} NEGATE
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         STA   ]YT        ; {4C3B} STORE NEGATED IN YT
*
** PLOT XC+X,YC
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAX              ; {2C1B}
         TAY              ; {2C1B} TRANSER TO .Y
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C109B}
*
** PLOT XC-X,YC
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS
         TAX              ; {2C1B}
         TAY              ; {2C1B} AND .Y
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC,YC+X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC,YC-X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** NOW LOOP UNTIL CIRCLE IS FINISHED
*
:LOOP
*
** CHECK IF CIRCLE FINISHED
*
         LDA   ]YY        ; {4C3B} IF Y > X
         CMP   ]XX        ; {3C2B}
         BCC   :LPCONT    ; {3C2B} CONTINUE LOOPING
         JMP   :EXIT      ; {3C3B} OTHERWISE, CIRCLE DONE
:LPCONT
:STEPY                    ; STEP THE Y POSITION
         LDA   ]YY        ; {4C3B} LOAD YPOS
         ASL              ; {2C2B} MULTIPLY BY 2
*CLC
         ADC   #1         ; {3C2B} ADD +1
         STA   ]DY        ; {4C3B} STORE CHANGE OF Y
         INC   ]YY        ; {6C3B} INCREASE YPOS
         LDA   ]DY        ; {4C3B} NEGATE
         EOR   #$FF       ; {3C2B}
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         ADC   ]ERR       ; {4C3B} ADD ERR
         STA   ]ERR       ; {4C3B} ERR = ERR - DY
         BPL   :PLOT      ; {3C2B} IF ERR IS +, SKIP TO PLOT
:STEPX
         LDA   ]XX        ; {4C3B} LOAD XPOS
         ASL              ; {2C2B} MULTIPLY BY 2
         EOR   #$FF       ; {2C2B} NEGATE
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         ADC   #1         ; {3C2B} (X*2) + 1
         STA   ]DX        ; {4C3B} STORE CHANGE OF X
         DEC   ]XX        ; {6C3B} DECREASE YPOS
         LDA   ]DX        ; {4C3B} NEGATE
         EOR   #$FF       ; {2C2B}
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         ADC   ]ERR       ; {4C3B} ADD ERR
         STA   ]ERR       ; {4C3B} ERR = ERR - DX
*
:PLOT
*
** NOW CALCULATE -X AND -Y
*
         LDA   ]XX        ; {4C3B}
         EOR   #$FF       ; {2C2B} NEGATE
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         STA   ]XT        ; {4C3B}
         LDA   ]YY        ; {4C3B}
         EOR   #$FF       ; {2C2B} NEGATE
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         STA   ]YT        ; {4C3B}
*
** NOW PLOT CIRCLE OCTANTS
*
** PLOT XC+X,YC+Y
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YY        ; {4C3B} ADD CURRENT YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC-X,YC+Y
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND TO .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YY        ; {4C3B} ADD CURRENT YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC-X,YC-Y
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XT        ; {3C2B} ADD NEGATED CURRENT XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC+X,YC-Y
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YT        ; {4C3B} ADD NEGATE CURRENT YPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC+Y,YC+X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YY        ; {4C3B} ADD CURRENT YPOS
         TAX              ; {2C1B} TRANSFER TO .X
         TAY              ; {2C1B} AND .Y
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC-Y,YC+X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS
         TAX              ; {2C1B} TRANSFER TO .X
         TAY              ; {2C1B} AND .Y
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XX        ; {4C3B} ADD CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC-Y,YC-X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YT        ; {4C3B} ADD NEGATED CURRENT YPOS
         TAX              ; {2C1B} TRANSFER TO .X
         TAY              ; {2C1B} AND .Y
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
*
** PLOT XC+Y,YC-X
*
         LDA   ]XC        ; {4C3B} LOAD CIRCLE CENTER XPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]YY        ; {4C3B} ADD CURRENT YPOS
         TAY              ; {2C1B} TRANSFER TO .Y
         TAX              ; {2C1B} AND .X
         LDA   ]YC        ; {4C3B} LOAD CIRCLE CENTER YPOS
         CLC              ; {2C1B}
         ADC   ]XT        ; {4C3B} ADD NEGATED CURRENT XPOS
         TAY              ; {2C1B}
         LDA   ]COLOR     ; {3C2B}
         JSR   LOCPLOT    ; {168C0B}
         JMP   :LOOP      ; {3C3B}
:EXIT
         RTS              ; {6C1B}
