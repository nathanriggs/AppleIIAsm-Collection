*
*``````````````````````````````*
* TBLINE        (NATHAN RIGGS) *
*                              *
* OUTPUTS A LINE FROM COORDS   *
* X1,Y1 TO X2,Y2 USING THE     *
* BRESSENHAM LINE ALOGORITHM   *
*                              *
* INPUT:                       *
*                              *
*  ]X1 STORED IN WPAR1         *
*  ]X2 STORED IN WPAR1+1       *
*  ]Y1 STORED IN WPAR2         *
*  ]Y2 STORED IN WPAR2+1       *
*  ]F  STORED IN BPAR1         *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 283+                 *
* SIZE: 188 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; PARAMETERS PASSED VIA
]X2      EQU   WPAR2      ; ZERO PAGE LOCATIONS
]Y1      EQU   WPAR1+1
]Y2      EQU   WPAR2+1
]F       EQU   BPAR1
*
]DX      EQU   VARTAB     ; CHANGE IN X; 1 BYTE
]DY      EQU   VARTAB+1   ; CHANGE IN Y; 1 BYTE
]SX      EQU   VARTAB+2   ; X POSITION STEP; 1 BYTE
]SY      EQU   VARTAB+3   ; Y POSITION STEP; 1 BYTE
]ERR     EQU   VARTAB+4   ; SLOPE ERROR; 1 BYTE
]ERR2    EQU   VARTAB+5   ; COMPARISON COPY OF ]ERR; 1 BYTE
*
TBLINE
*
** FIRST CALCULATE INITIAL VALUES
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
** PRINT CHARACTER FIRST
*
         LDA   ]Y1 ; .A = Y POSITION
         LDY   ]X1 ; .Y = X POSITION
         JSR   GBCALC ; FIND SCREEN MEM LOCATION
         LDA   ]F ; LOAD FILL INTO .A
         STA   (GBPSH),Y ; PUSH TO SCREEN MEMORY
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
