*
*``````````````````````````````*
* TBLINE        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ]X0 = X ORIGIN              *
*  ]X1 = X DESTINATION         *
*  ]Y0 = Y ORIGIN              *
*  ]Y1 = Y DESTINATION         *
*  ]F  = LINE FILL CHARACTER   *
*                              *
* OUTPUT:                      *
*                              *
* OUTPUTS A LINE FROM COORDS   *
* X0,Y0 TO X1,Y1 USING THE     *
* BRESSENHAM LINE ALOGORITHM   *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 280+                 *
* SIZE: 178 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X0      EQU   WPAR1      ; XPOS ORIGIN PASSED VIA ZP
]X1      EQU   WPAR2      ; XPOS DEST PASSED VIA ZP
]Y0      EQU   WPAR1+1    ; YPOS ORIGIN PASSED VIA ZP
]Y1      EQU   WPAR2+1    ; YPOS DEST PASSED VIA ZP
]F       EQU   BPAR1      ; FILL VALUE
*
]DX      EQU   ADDR1      ; CHANGE IN X
]DY      EQU   ADDR1+1    ; CHANGE IN Y
]SX      EQU   ADDR2      ; X POSITION STEP
]SY      EQU   ADDR2+1    ; Y POSITION STEP
]ERR     EQU   ADDR3      ; SLOPE ERROR
]ERRX2   EQU   ADDR3+1    ; COMPARISON COPY OF ]ERR
*
TBLINE
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
         LDA   ]Y0        ; {3C2B} .A = Y POSITION {NZ}
         LDY   ]X0        ; {3C2B} .Y = X POSITION {NZ}
         JSR   GBCALC     ; {43C24B} FIND SCREEN MEM LOCATION {NZCV}
         LDA   ]F         ; {3C2B} LOAD FILL INTO .A {NZ}
         STA   (GBPSH),Y  ; {6C2B} PUSH TO SCREEN MEMORY
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
