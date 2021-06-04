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
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 400+                 *
* SIZE: 152 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X0      EQU   WPAR1      ; STARTING X POINT
]Y0      EQU   WPAR1+1    ; STARTING Y POINT
]X1      EQU   WPAR2      ; ENDING X POINT
]Y1      EQU   WPAR2+1    ; ENDING Y POINT
]COLOR   EQU   BPAR1      ; COLOR OF LINE
*
]DX      EQU   ADDR1      ; CHANGE IN X
]DY      EQU   ADDR1+1    ; CHANGE IN Y
]SX      EQU   ADDR2      ; X POSITION STEP
]SY      EQU   ADDR2+1    ; Y POSITION STEP
]ERR     EQU   ADDR3      ; SLOPE ERROR
]ERRX2   EQU   ADDR3+1    ; COMPARISON COPY OF ]ERR
*
LRBLINE
*
         LDA   ]X1        ; {3C2B} SUBTRACT X0 FROM X1
         SEC              ; {2C1B}
         SBC   ]X0        ; {3C2B}
         BPL   :ABSF1     ; {3C2B} IF POS, SKIP ABSOLUTE VALUE
         SEC              ; {2C1B} SUBTRACT 1 AND EOR #$FF
         SBC   #1         ; {3C2B} TO GET THE ABSOLUTE VALUE
         EOR   #$FF       ; {2C2B}
:ABSF1
         STA   ]DX        ; {3C2B} STORE VALUE AS CHANGE IN X
*
         LDA   ]Y1        ; {3C2B} SUBTRACT Y0 FROM Y1
         SEC              ; {2C1B}
         SBC   ]Y0        ; {3C2B}
         BPL   :ABSF2     ; {3C2B} IF POSITIVE, SKIP ABS VALUE
         SEC              ; {2C1B} SUBTRACT 1 AND EOR #$FF
         SBC   #1         ; {3C2B} TO GET THE ABSOLUTE VALUE
         EOR   #$FF       ; {2C2B}
:ABSF2
         STA   ]DY        ; {3C2B} STORE VALUE AS CHANGE IN Y
*
         LDA   ]DX        ; {3C2B} ]ERR = DX - DY
         SEC              ; {2C1B}
         SBC   ]DY        ; {3C2B}
         STA   ]ERR       ; {3C2B}
*
         LDX   #$FF       ; {3C2B} .X = -1
         LDA   ]X0        ; {3C2B} IF X0 >= X1
         CMP   ]X1        ; {3C2B}
         BCS   :NONEG     ; {3C2B} THEN SKIP CHANGE IN .X
         LDX   #$01       ; {3C2B} ELSE, CHANGE .X TO +1
:NONEG   STX   ]SX        ; {3C2B} STORE EITHER -1 OR +1 IN SX
*
         LDX   #$FF       ; {3C2B} .X = -1
         LDA   ]Y0        ; {3C2B} IF Y0 >= Y1
         CMP   ]Y1        ; {3C2B}
         BCS   :NONEG2    ; {3C2B} THEN SKIP CHANGE IN .X
         LDX   #$01       ; {3C2B} ELSE CHANGE .X TO +1
:NONEG2  STX   ]SY        ; {3C2B} STORE EITHER -1 OR +1 IN SY
*
** MAIN LOOP
*
:LOOP
         LDA   ]COLOR     ; {3C2B} .A = COLOR TO PASS
         LDY   ]Y0        ; {3C2B} .Y = Y POS TO PASS
         LDX   ]X0        ; {3C2B} .X = X POS TO PASS
         JSR   LOCPLOT    ; {168C109B} JUMP TO PLOTTING ROUTINE
*
         LDA   ]X0        ; {3C2B} IF X0 != X1, KEEP LOOPING
         CMP   ]X1        ; {3C2B}
         BNE   :CONT      ; {3C2B}
         LDA   ]Y0        ; {3C2B} IF Y0 != Y1, KEEP LOOPING
         CMP   ]Y1        ; {3C2B}
         BNE   :CONT      ; {3C2B}
         JMP   TBLEXIT    ; {3C3B} ELSE, EXIT LOOP
:CONT
*
         LDA   ]ERR       ; {3C2B} ]ERR = ]ERR * 2
         ASL              ; {2C1B}
         STA   ]ERRX2     ; {3C2B}
*
         LDA   ]DY        ; {3C2B} NEGATE ]DY
         EOR   #$FF       ; {3C2B}
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         SEC              ; {2C1B} USE SBC FOR SIGNED COMPARE
         SBC   ]ERRX2     ; {3C2B}
         BMI   :NFSETX    ; {3C2B} IF N FLAG SET, GO CHECK V FLAG
         BVC   :GEX       ; {3C2B} IF V = 0 & N = 0, VAL >= .A REG
:LTX                      ;        N = 0 AND V = 1, SO LESS THAN
         LDA   ]ERR       ; {3C2B} ]ERR = ]ERR - ]DY
         SEC              ; {2C1B}
         SBC   ]DY        ; {3C2B}
         STA   ]ERR       ; {3C2B}
         LDA   ]X0        ; {3C2B} X0 = X0 + SX
         CLC              ; {2C1B}
         ADC   ]SX        ; {3C2B}
         STA   ]X0        ; {3C2B}
         JMP   :GEX       ; {3C3B}
:NFSETX  BVC   :LTX       ; {3C2B} IF N = 1 & V = 0, VAL < .A REG
:GEX                      ;        N = 1 & V = 1, SO VAL >= .A REG
*
         LDA   ]ERRX2     ; {3C2B} IF ER * 2 < DX, GOTO :LTY
         SEC              ; {2C1B}
         SBC   ]DX        ; {3C2B}
         BMI   :SKIPY     ; {3C2B} IF N FLAG = 1, GO CHECK V FLAG
         BVC   :GEY       ; {3C2B} N = 0 & V = 0, SO VAL >= .A REG
:LTY     LDA   ]ERR       ; {3C2B} N = 0 AND V = 1, SO LESS THAN
         CLC              ; {2C1B}
         ADC   ]DX        ; {3C2B} ]ERR = ]ERR + ]DX
         STA   ]ERR       ; {3C2B}
         LDA   ]Y0        ; {3C2B} ]Y0 = ]Y0 + ]SY
         CLC              ; {2C1B}
         ADC   ]SY        ; {3C2B}
         STA   ]Y0        ; {3C2B}
         JMP   :GEY       ; {3C3B}
:SKIPY   BVC   :LTY       ; {3C2B} IF N = 1 & V = 0, VAL < .A REG
:GEY                      ; {3C2B} N = 1 & V = 1, SO VAL >= .A REG
*
         JMP   :LOOP      ; {3C3B}
TBLEXIT
         RTS              ; {6C1B}
