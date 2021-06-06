*``````````````````````````````*
* STRUPPER      (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE ACCEPTS A    *
* STRING AND PASSES BACK A NEW *
* STRING THAT IS ITS UPPERCASE *
* EQUIVALENT.                  *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = STRING ADDRESS      *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 93+                  *
* SIZE: 47 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   ZPW1       ; STRING ADDRESS
]LEN     EQU   ZPB1       ; STRING LENGTH
]RET     EQU   ZPW2       ; RETURN ADDRESS
*
STRUPPER
*
         LDA   #0         ; {3C2B} RESET .A REGISTER
         TAX              ; {2C1B} RESET .X
         TAY              ; {2C1B} RESET .Y
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
         LDA   RETLEN,Y   ; {5C2B} LOAD CHARACTER FROM RETURN
         CMP   #225       ; {3C2B} IS IT < LOWERCASE A?
         BCC   :RELOOP    ; {3C2B} IF SO, LOOP TO NEXT CHAR
         CMP   #251       ; {3C2B} IS IT >= LOWERCASE Z?
         BCS   :RELOOP    ; {3C2B} IF SO, LOOP TO NEXT CHAR
         SEC              ; {2C1B} ELSE, WE FOUND A LOWERCASE LETTER
         SBC   #32        ; {3C2B} SO SUBTRACT 32 TO GET UPPERCASE
         STA   RETLEN,Y   ; {5C2B} AND REPLACE THE LETTER IN RETURN
:RELOOP  CPY   ]LEN       ; {3C2B} NOW CHECK IF Y = LENGTH
         BNE   :MAINLP    ; {3C2B} AND IF NOT, CONTINUE LOOP
:EXIT
         TYA              ; {2C1B} SEND BACK LENGTH IN .A
         RTS              ; {6C1B}
