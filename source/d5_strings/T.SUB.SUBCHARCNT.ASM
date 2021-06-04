*``````````````````````````````*
* SUBCHARCNT    (NATHAN RIGGS) *
*                              *
* COUNT THE NUMBER OF TOKENS,  *
* OR OCCURRENCES OF A GIVEN    *
* CHARACTER, IN A STRING.      *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS      *
*  WPAR2 = CHARACTER TO FIND   *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 61+                  *
* SIZE: 36 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   WPAR1      ; STRING ADDRESS
]CHAR    EQU   WPAR2      ; TOKEN TO FIND
]LEN     EQU   BPAR2      ; LENGTH OF STRING
*
SUBCHARCNT
         LDA   #0         ; {3C2B} CLEAR OUT .A REGISTER
         TAY              ; {2C1B} CLEAR OUT .Y
         TAX              ; {2C1B} CLEAR OUT .X
         LDA   (]STR),Y   ; {5C2B} GET LENGTH FROM STRING
         STA   ]LEN       ; {3C2B} AND HOLD TEMPORARILY
:LP1
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   (]STR),Y   ; {5C2B} LOAD CHAR AT INDEX
         CMP   ]CHAR      ; {3C2B} COMPARE TO TOKEN
         BEQ   :FOUND     ; {3C2B} IF EQUAL, THEN GOTO :FOUND
:RELOOP  CPY   ]LEN       ; {3C2B} COMPARE .Y TO STRING LENGTH
         BNE   :LP1       ; {3C2B} RELOOP UNTIL EQUAL
         JMP   :EXIT      ; {3C3B} JUMP OVER REST
:FOUND
         INX              ; {2C1B} INCREASE .X COUNTER
         JMP   :RELOOP    ; {3C3B} JUMP BACK TO LOOP
:EXIT
         STX   RETURN     ; {4C3B} STORE .X COUNT IN RETURN
         LDA   #1         ; {3C2B} LOAD #1 AND
         STA   RETLEN     ; {4C3B} STORE IN RETLEN
         TXA              ; {2C1B} ALSO RETURN NUMBER IN .A
         RTS              ; {6C1B}
