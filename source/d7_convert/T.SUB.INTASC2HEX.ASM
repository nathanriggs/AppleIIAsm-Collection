*``````````````````````````````*
* INTASC2HEX    (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS      *
*                              *
* OUTPUT:                      *
*                              *
*  .A = HEX VALUE LOW BYTE     *
*  .X = HEX VALUE HIGH BYTE    *
*  RETURN = HEX VALUE          *
*  RETLEN = 2                  *
*                              *
* DESTROYS: AXYNVBDIZCMS       *
*           ^^^^    ^^^        *
*                              *
* CYCLES: 266+                 *
* SIZE: 196 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]NACCUM  EQU   VARTAB
]SIGN    EQU   VARTAB+4
]NINDEX  EQU   VARTAB+6
]STR     EQU   WPAR1
*
INTASC2HEX
*
         LDY   #0         ; INIT INDEX
         LDA   (]STR),Y   ; GET STRING LENGTH
         TAX              ; TRANSFER TO .X
         LDA   #1         ; SET NINDEX TO 1
         STA   ]NINDEX    ;
         LDA   #0         ; INIT ]NACCUM LOW, HIGH
         STA   ]NACCUM    ; ACCUM = 0
         STA   ]NACCUM+1
         STA   ]SIGN      ; INIT SIGN TO 0 (POSITIVE)
         TXA              ; TRANSFER .X BACK TO .A
         BNE   :INIT1     ; IF .A != 0, CONTINUE INIT
         JMP   :EREXIT    ; ELSE, EXIT WITH ERROR--NO STRING
:INIT1
         LDY   ]NINDEX    ; INITIALLY, SET TO 1
         LDA   (]STR),Y   ; LOAD FIRST CHARACTER
         CMP   #173       ; IF .A != "-"
         BNE   :PLUS      ; THEN NUMBER IS POSITIVE
         LDA   #$0FF      ; ELSE SET FLAG TO NEGATIVE
         STA   ]SIGN
         INC   ]NINDEX    ; INCREASE INDEX
         DEX              ; DECREMENT LENGTH COUNT
         BEQ   :EREXIT    ; EXIT WITH ERROR IF .X = 0
         JMP   :CNVERT
:PLUS
         CMP   #'+'
         BNE   :CHKDIG    ; START CONVERSION IF 1ST
                          ; CHARACTER IS NOT A +
         INC   ]NINDEX    ; INCREASE NEW INDEX
         DEX              ; DEC COUNT; IGNORE + SIGN
         BEQ   :EREXIT    ; ERROR EXIT IF ONLY
                          ; + IN THE BUFFER
:CNVERT
         LDY   ]NINDEX    ; GET NEW INDEX
         LDA   (]STR),Y   ; GET NEXT CHARACTER
:CHKDIG                   ; CHECK DIGIT
         CMP   #$B0       ; "0"
         BMI   :EREXIT    ; ERROR IF NOT A NUMERAL
         CMP   #$BA       ; '9'+1; TECHNICALLY :
         BPL   :EREXIT    ; ERR IF > 9 (NOT NUMERAL)
         PHA              ; PUSH DIGIT TO STACK
*
** VALID DECIMAL DIGIT SO
** ACCUM = ACCUM * 10
**       = ACCUM * (8+2)
**       = (ACCUM * 8) + (ACCUM * 2)
*
         ASL   ]NACCUM
         ROL   ]NACCUM+1  ; TIMES 2
         LDA   ]NACCUM
         LDY   ]NACCUM+1  ; SAVE ACCUM * 2
         ASL   ]NACCUM
         ROL   ]NACCUM+1
         ASL   ]NACCUM
         ROL   ]NACCUM+1  ; TIMES 8
         CLC
         ADC   ]NACCUM    ; SUM WITH * 2
         STA   ]NACCUM
         TYA
         ADC   ]NACCUM+1
         STA   ]NACCUM+1  ; ACCUM=ACCUM * 10
*
         PLA              ; GET THE DIGIT FROM STACK
         SEC              ; SET CARRY
         SBC   #$B0       ; SUBTRACT ASCII '0'
         CLC              ; CLEAR CARRY
         ADC   ]NACCUM    ; ADD TO ACCUMULATION
         STA   ]NACCUM    ; STORE IN ACCUMULATION
         LDA   #0         ; NOW ADJUST HIGH BYTE
         ADC   ]NACCUM+1
         STA   ]NACCUM+1
         INC   ]NINDEX    ;INC TO NEXT CHARACTER
         DEX              ; DECREMENT .X COUNTER
         BNE   :CNVERT    ; IF .X != 0, CONTINUE CONVERSION
         LDA   ]SIGN      ; ELSE LOAD SIGN FLAG
         BPL   :OKEXIT    ; IF POSITIVE, EXIT WITHOUT ERROR
         LDA   #0         ; ELSE SET THE VALUE TO NEGATIVE
         SEC              ; SET CARRY
         SBC   ]NACCUM    ; 0 - ]NACCUM
         STA   ]NACCUM    ; STORE AS ]NACCUM
         LDA   #0         ; ADJUST HIGHBYTE
         SBC   ]NACCUM+1
         STA   ]NACCUM+1
*
:OKEXIT
         CLC              ; CLEAR CARRY TO SIGNIFY NO ERRORS
         BCC   :EXIT
:EREXIT
         SEC              ; SET CARRY TO INIDICATE ERROR
:EXIT
         LDA   #2         ; BYTE LENGTH IS 2
         STA   RETLEN
         LDX   ]NACCUM+1  ; LOAD HIGH BYTE INTO .X
         LDA   ]NACCUM    ; AND LOW BYTE INTO .A
         STA   RETURN     ; ALSO STORE RESULT IN RETURN
         STX   RETURN+1
         RTS
