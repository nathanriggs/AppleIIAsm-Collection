*``````````````````````````````*
* INTASC2HEX    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = STRING ADDRESS      *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 392+                 *
* SIZE: 181 SIZE               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NACCUM  EQU   ZPW2
]SIGN    EQU   ZPW3
]NINDEX  EQU   ZPW4
]STR     EQU   ZPW1
*
INTASC2HEX
*
         LDY   #0         ; {3C2B} INIT INDEX
         LDA   (]STR),Y   ; {6C2B} GET STRING LENGTH
         TAX              ; {2C1B} TRANSFER TO .X
         LDA   #1         ; {3C2B} SET NINDEX TO 1
         STA   ]NINDEX    ; {4C3B}
         LDA   #0         ; {3C2B} INIT ]NACCUM LOW, HIGH
         STA   ]NACCUM    ; {4C3B} ACCUM = 0
         STA   ]NACCUM+1  ; {4C3B}
         STA   ]SIGN      ; {4C3B} INIT SIGN TO 0 (POSITIVE)
         TXA              ; {2C1B} TRANSFER .X BACK TO .A
         BNE   :INIT1     ; {4C3B} IF .A != 0, CONTINUE INIT
         JMP   :EREXIT    ; {3C3B} ELSE, EXIT WITH ERROR--NO STRING
:INIT1
         LDY   ]NINDEX    ; {4C3B} INITIALLY, SET TO 1
         LDA   (]STR),Y   ; {6C2B} LOAD FIRST CHARACTER
         CMP   #173       ; {3C2B} IF .A != "-"
         BNE   :PLUS      ; {3C2B} THEN NUMBER IS POSITIVE
         LDA   #$0FF      ; {3C2B} ELSE SET FLAG TO NEGATIVE
         STA   ]SIGN      ; {4C3B}
         INC   ]NINDEX    ; {5C2B} INCREASE INDEX
         DEX              ; {2C1B} DECREMENT LENGTH COUNT
         BEQ   :EREXIT    ; {3C2B} EXIT WITH ERROR IF .X = 0
         JMP   :CNVERT    ; {3C3B}
:PLUS
         CMP   #'+'       ; {3C2B}
         BNE   :CHKDIG    ; {3C2B} START CONVERSION IF 1ST
                          ; CHARACTER IS NOT A +
         INC   ]NINDEX    ; {5C2B} INCREASE NEW INDEX
         DEX              ; {2C1B} DEC COUNT; IGNORE + SIGN
         BEQ   :EREXIT    ; {3C2B} ERROR EXIT IF ONLY
                          ; + IN THE BUFFER
:CNVERT
         LDY   ]NINDEX    ; {4C3B} GET NEW INDEX
         LDA   (]STR),Y   ; {6C2B} GET NEXT CHARACTER
:CHKDIG                   ; CHECK DIGIT
         CMP   #$B0       ; {3C2B} "0"
         BMI   :EREXIT    ; {3C2B} ERROR IF NOT A NUMERAL
         CMP   #$BA       ; {3C2B} '9'+1; TECHNICALLY :
         BPL   :EREXIT    ; {3C2B} ERR IF > 9 (NOT NUMERAL)
         PHA              ; {3C1B} DIGIT TO STACK
*
** VALID DECIMAL DIGIT SO
** ACCUM = ACCUM * 10
**       = ACCUM * (8+2)
**       = (ACCUM * 8) + (ACCUM * 2)
*
         ASL   ]NACCUM    ; {6C3B}
         ROL   ]NACCUM+1  ; {7C3B} TIMES 2
         LDA   ]NACCUM    ; {4C3B}
         LDY   ]NACCUM+1  ; {4C3B} SAVE ACCUM * 2
         ASL   ]NACCUM    ; {6C3B}
         ROL   ]NACCUM+1  ; {7C3B}
         ASL   ]NACCUM    ; {6C3B}
         ROL   ]NACCUM+1  ; {7C3B} TIMES 8
         CLC              ; {2C1B}
         ADC   ]NACCUM    ; {4C3B} SUM WITH * 2
         STA   ]NACCUM    ; {4C3B}
         TYA              ; {2C1B}
         ADC   ]NACCUM+1  ; {4C3B}
         STA   ]NACCUM+1  ; {4C3B} ACCUM=ACCUM * 10
*
         PLA              ; {3C1B} GET THE DIGIT FROM STACK
         SEC              ; {2C1B} SET CARRY
         SBC   #$B0       ; {2C2B} SUBTRACT ASCII '0'
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]NACCUM    ; {4C3B} ADD TO ACCUMULATION
         STA   ]NACCUM    ; {4C3B} STORE IN ACCUMULATION
         LDA   #0         ; {3C2B} NOW ADJUST HIGH BYTE
         ADC   ]NACCUM+1  ; {4C3B}
         STA   ]NACCUM+1  ; {4C3B}
         INC   ]NINDEX    ; {5C3B} INC TO NEXT CHARACTER
         DEX              ; {2C1B} DECREMENT .X COUNTER
         BNE   :CNVERT    ; {3C2B} IF .X != 0, CONTINUE CONVERSION
         LDA   ]SIGN      ; {4C3B} ELSE LOAD SIGN FLAG
         BPL   :OKEXIT    ; {3C2B} IF POSITIVE, EXIT WITHOUT ERROR
         LDA   #0         ; {4C3B} ELSE SET THE VALUE TO NEGATIVE
         SEC              ; {2C1B} SET CARRY
         SBC   ]NACCUM    ; {4C3B} 0 - ]NACCUM
         STA   ]NACCUM    ; {4C3B} STORE AS ]NACCUM
         LDA   #0         ; {3C2B} ADJUST HIGHBYTE
         SBC   ]NACCUM+1  ; {4C3B}
         STA   ]NACCUM+1  ; {4C3B}
*
:OKEXIT
         CLC              ; {2C1B} CLEAR CARRY TO SIGNIFY NO ERRORS
         BCC   :EXIT      ; {3C2B}
:EREXIT
         SEC              ; {2C1B} SET CARRY TO INIDICATE ERROR
:EXIT
         LDA   #2         ; {3C2B} BYTE LENGTH IS 2
         STA   RETLEN     ; {4C3B}
         LDX   ]NACCUM+1  ; {4C3B} LOAD HIGH BYTE INTO .X
         LDA   ]NACCUM    ; {4C3B} AND LOW BYTE INTO .A
         STA   RETURN     ; {4C3B} ALSO STORE RESULT IN RETURN
         STX   RETURN+1   ; {4C3B}
         RTS              ; {6C1B}
