*``````````````````````````````*
* STRREV        (NATHAN RIGGS) *
*                              *
* REVERSE A STRING.            *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS      *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 50+                  *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   WPAR1      ; STRING ADDRESS
]REV     EQU   RETLEN     ; REVERSE STRING ADDRESS
]LEN     EQU   BPAR1      ; STRING LENGTH
*
STRREV
         LDY   #0         ; {3C2B} CLEAR .Y REGISTER
         LDX   #0         ; {3C2B} CLEAR .X REGISTER
         LDA   (]STR),Y   ; {5C2B} LOAD STRING LENGTH
         STA   ]LEN       ; {3C2B} AND STORE IN ]LEN
         TAY              ; {2C1B} TRANSFER LENGTH TO .Y INDEX
         INY              ; {2C1B} INCREASE BY ONE
*
:LP1
         INX              ; {2C1B} INCREASE .X COUNTER
         DEY              ; {2C1B} DECREASE .Y COUNTER
         LDA   (]STR),Y   ; {5C2B} LOAD CHAR FROM BACK OF STRING
         STA   ]REV,X     ; {5C2B} STORE IN REVERSE ADDRESS
         CPX   ]LEN       ; {3C2B} COMPARE .X COUNTER TO LENGTH
         BNE   :LP1       ; {3C2B} IF !=, THEN RELOOP
:EXIT
         TXA              ; {2C1B} MOVE LENGTH TO .A REGISTER
         STX   RETLEN     ; {4C3B} ALSO STORE IN RETLEN
         RTS              ; {6C1B}
