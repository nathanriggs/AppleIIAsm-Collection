*``````````````````````````````*
* STRCAP        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE TAKES A      *
* STRING OF LOWERCASE LETTERS  *
* AND CAPITALIZES LETTERS WHEN *
* IT IS APPROPRIATE--AFTER A   *
* PERIOD, ETC.                 *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = STRING ADDRESS      *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 171+                 *
* SIZE: 100 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   ZPW1       ; STRING ADDRESS
]LEN     EQU   ZPB1       ; STRING LENGTH
]FLAG    EQU   ZPW2       ; CAPITALIZATION FLAG
*
STRCAP
*
         LDA   #0         ; {3C2B} RESET .A REGISTER
         TAX              ; {2C1B} RESET .X
         TAY              ; {2C1B} RESET .Y
         STA   ]FLAG      ; {3C2B}
         LDA   (]STR),Y   ; {5C2B} GET THE STRING LENGTH
         STA   ]LEN       ; {3C2B} AND STORE IN ]LEN
         INC   ]LEN       ; {5C2B} TEMPORARILY INCREASE LENGTH
         LDY   #255       ; {3C2B} COUNTER = -1
:COPYLP
         INY              ; {2C1B} INCREASE INDEX COUNTER
         LDA   (]STR),Y   ; {5C2B} LOAD CHARACTER FROM STRING
         STA   RETLEN,Y   ; {5C2B} STORE IN RETURN AREA AT INDEX
         CPY   ]LEN       ; {3C2B} IF .Y != STRING LENGTH
         BNE   :COPYLP    ; {3C2B} KEEP LOOPING UNTIL ALL COPIED
*
         LDY   #0         ; {3C2B} RESET INDEX COUNTER
         DEC   ]LEN       ; {5C2B} LENGTH BACK TO NORMAL
:MAINLP
         INY              ; {2C1B} INCREASE INDEX COUNTER
         LDA   RETLEN,Y   ; {5C2B} GET CHARACTER FROM STRING
         CMP   #"."       ; {3C2B} IS IT A PERIOD?
         BEQ   :SETFLAG   ; {3C2B} IF SO, SET CAPITAL FLAG
         CMP   #"?"       ; {3C2B} IS IT A QUESTION MARK?
         BEQ   :SETFLAG   ; {3C2B} IF SO, SET CAPITAL FLAG
         CMP   #"!"       ; {3C2B} IS IT AN EXCLAMATION MARK?
         BEQ   :SETFLAG   ; {3C2B} IF SO, SET CAPITAL FLAG
*
         CMP   #225       ; {3C2B} COMPARE TO LOWERCASE A
         BCC   :RELOOP    ; {3C2B} IF ASCII < THAT, DO NOT REPLACE
         CMP   #251       ; {3C2B} COMPARE TO LOWERCASE Z
         BCS   :RELOOP    ; {3C2B} IF ASCII >= THAT, DON'T REPLACE
*
         LDX   ]FLAG      ; {3C2B} LOAD CAPITALIZATION FLAG
         CPX   #1         ; {3C2B} COMPARE TO #1 (SET)
         BNE   :RELOOP    ; {3C2B} IF NOT SET, LOOP TO NEXT CHAR
         SEC              ; {2C1B} IF SET, THEN SET CARRY
         SBC   #32        ; {3C2B} SUBTRACT #32 ASCII
         STA   RETLEN,Y   ; {5C2B} STORE OVER TOP LOWERCASE
         LDX   #0         ; {3C2B} CLEAR .X REGISTER
         STX   ]FLAG      ; {3C2B} AND CLEAR CAPITALIZATION FLAG
:RELOOP  CPY   ]LEN       ; {3C2B} NOW CHECK IF Y = LENGTH
         BNE   :MAINLP    ; {3C2B} AND IF NOT, CONTINUE LOOP
         JMP   :EXIT      ; {3C3B} IF SO, JUMP TO EXIT
:SETFLAG
         LDX   #1         ; {3C2B} LOAD #1 IN .X REGISTER
         STX   ]FLAG      ; {3C2B} STORE IN FLAG (MEANING IT IS SET)
         JMP   :RELOOP    ; {3C3B} LOOP TO NEXT CHARACTER
:EXIT
         LDY   #1         ; {3C2B} LOAD FIRST LETTER OF STRING
         LDA   RETLEN,Y   ; {5C2B}
         CMP   #225       ; {3C2B} COMPARE TO LOWERCASE A
         BCC   :EXIT2     ; {3C2B} IF < LC A, EXIT FOR REAL
         CMP   #251       ; {3C2B} COMPARE TO LOWERCASE Z
         BCS   :EXIT2     ; {3C2B} IF >= LC Z, EXIT FOR REAL
         SEC              ; {2C1B} OTHERWISE, SET THE CARRY
         SBC   #32        ; {3C2B} AND SUBTRACT 32 FROM ASCII
         STA   RETLEN,Y   ; {5C2B} AND STORE OVER TOP FIRST CHAR
:EXIT2
         LDA   ]LEN       ; {3C2B} SEND BACK LENGTH IN .A
         RTS              ; {6C1B}
