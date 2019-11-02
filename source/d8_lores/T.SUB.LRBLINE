*``````````````````````````````*
* LRBLINE       (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE USES THE     *
* BRESSENHAM LINE ALGORITHM TO *
* DRAW A DIAGONAL LINE FROM    *
* PONT X1,Y1 TO X2,Y2 IN THE   *
* SPECIFIED COLOR.             *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X START POSITION    *
*  WPAR1+1 = Y START POSITION  *
*  WPAR2 = X ENDING POINT      *
*  WPAR2+1 = Y ENDING POINT    *
*  BPAR1 = COLOR OF LINE       *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 210+                 *
* SIZE: 244 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; STARTING X POINT
]Y1      EQU   WPAR1+1    ; STARTING Y POINT
]X2      EQU   WPAR2      ; ENDING X POINT
]Y2      EQU   WPAR2+1    ; ENDING Y POINT
]COLOR   EQU   BPAR1      ; COLOR OF LINE
*
]DX      EQU   VARTAB+9   ; CHANGE IN X
]DY      EQU   VARTAB+10  ; CHANGE IN Y
]SX      EQU   VARTAB+11  ; X + OR - STEPPER
]SY      EQU   VARTAB+12  ; Y + OR - STEPPER
]ERR     EQU   VARTAB+13  ; ERROR QUOTIENT
]ERR2    EQU   VARTAB+14  ; BACKUP ERROR
*
LRBLINE
*
** CHECK IF Y STEP IS POSITIVE OR NEGATIVE
*
         LDX   #$FF       ; .X = -1
         LDA   ]Y1        ; GET Y1 - Y2
         SEC              ; RESET CARRY
         SBC   ]Y2
         BPL   :YSTORE    ; IF POSITIVE, SKIP TO STORE
         LDX   #1         ; .X = +1
         EOR   #$FF       ; NEG ACCUMULATOR
         CLC
         ADC   #1
:YSTORE
         STA   ]DY        ; STORE CHANGE IN Y
         STX   ]SY        ; STORE + OR - Y STEPPER
*
** NOW CHECK POSITIVE OR NEGATIVE X STEP
*
         LDX   #$FF       ; .X = -1
         LDA   ]X1        ; GET X1 - X2
         SEC              ; RESET CARRY
         SBC   ]X2        ; SUBTRACT X2
         BPL   :XSTORE    ; IF POSITIVE, SKIP TO X STORE
         LDX   #1         ; .X = +1
         EOR   #$FF       ; NEGATIVE ACCUMULATOR
         CLC
         ADC   #1
:XSTORE
         STA   ]DX        ; STORE CHANGE IN X
         STX   ]SX        ; STORE + OR - X STEPPER
*
** IF CHANGE IN X IS GREATER THAN CHANGE IN Y,
** THEN INITIAL ERROR IS THE CHANGE IN X; ELSE,
** INITIAL ERROR IS THE CHANGE IN Y
*
         CMP   ]DY        ; DX IS ALREADY IN .A
         BEQ   :SKIP      ; IF EQUAL, US CHANGE IN Y
         BPL   :SKIP2     ; IF GREATER THAN, USE CHANGE IN X
:SKIP
         LDA   ]DY        ; GET CHANGE IN Y
         EOR   #$FF       ; NEGATE
         CLC
         ADC   #1
:SKIP2
         STA   ]ERR       ; STORE EITHER DX OR DY IN ERR
         ASL   ]DX        ; DX = DX * 2
         ASL   ]DY        ; DY = DY * 2
*
** NOW LOOP THROUGH EACH POINT ON LINE
*
:LP
*
** PLOT PIXEL FIRST
*
         LDA   ]COLOR     ; .A = COLOR TO PASS
         LDY   ]Y1        ; .Y = Y POS TO PASS
         LDX   ]X1        ; .X = X POS TO PASS
         JSR   LOCPLOT    ; JUMP TO SHARED PLOTTING ROUTINE
*
** NOW CHECK IF X1 = X2, Y = Y2
*
         LDA   ]X1        ; IF X1 != X2 THEN
         CMP   ]X2        ; KEEP LOOPING
         BNE   :KEEPGO
         LDA   ]Y1        ; ELSE, CHECK IF Y1 = Y2
         CMP   ]Y2
         BEQ   :EXIT      ; IF EQUAL, EXIT; ELSE, LOOP
:KEEPGO
         LDA   ]ERR       ; LOAD ERR AND BACKUP
         STA   ]ERR2      ; FOR LATER COMPARISON
         CLC              ; CLEAR CARRY
         ADC   ]DX        ; ADD CHANGE IN X
         BMI   :SKIPX     ; IF RESULT IS -, SKIP
         BEQ   :SKIPX     ; TO CHANGING Y POS
         LDA   ]ERR       ; RELOAD ERR
         SEC              ; SET CARRY
         SBC   ]DY        ; SUBTRACT CHANGE IN Y
         STA   ]ERR       ; STORE ERROR
         LDA   ]X1        ; LOAD CURRENT X POSITION
         CLC              ; CLEAR CARRY
         ADC   ]SX        ; INCREASE OR DECREASE BY 1
         STA   ]X1        ; STORE NEW X POSITION
:SKIPX
         LDA   ]ERR2      ; LOAD EARLIER ERR
         CMP   ]DY        ; IF ERR - CHANGE IN Y IS +
         BPL   :SKIPY     ; SKIP CHANGING Y POS
         LDA   ]ERR       ; RELOAD ERR
         CLC              ; CLEAR CARRY
         ADC   ]DX        ; ADD CHANGE IN X
         STA   ]ERR       ; STORE NEW ERR
         LDA   ]Y1        ; LOAD Y POSITION
         CLC              ; CLEAR CARRY
         ADC   ]SY        ; INCREASE OR DECREASE YPOS BY 1
         STA   ]Y1        ; STORE NEW Y POSITION
:SKIPY
         JMP   :LP        ; LOOP LINE DRAWING
:EXIT
         RTS
