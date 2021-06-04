*``````````````````````````````*
* HEXASC2HEX                   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = HEX STRING ADDRESS  *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 94+                  *
* SIZE: 56 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HI      EQU   VARTAB     ; HIGH BYTE
]LO      EQU   VARTAB+2   ; LOW BYTE
]STR     EQU   WPAR1      ; ADDR OF STRING TO CONVERT
*
HEXASC2HEX
         LDY   #1         ; {3C2B} GET FIRST HEX CHARACTER
         LDA   (]STR),Y   ; {6C2B}
         STA   ]HI        ; {4C3B} STORE IN HIBYTE
         INY              ; {2C1B} INCREASE INDEX
         LDA   (]STR),Y   ; {6C2B} TO GET SECOND HEX CHARACTER
         STA   ]LO        ; {4C3B} AND STORE THAT IN LOW BYTE
*
         SEC              ; {2C1B} SET CARRY
         SBC   #'0'       ; {3C2B} SUBTRACT '0' CHAR FROM ]LO CHAR
         CMP   #10        ; {3C2B} ASCII NUMERALS OFFSET
         BCC   :CONT      ; {3C2B} IF NUMERAL, CONTINUE
         SBC   #7         ; {2C2B} OTHERWISE SUBTRACT LETTER OFFSET
:CONT
         STA   ]LO        ; {4C3B} STORE VALUE INTO LOW BYTE
         LDA   ]HI        ; {4C3B} NO WORK ON HIGH BYTE
         SEC              ; {2C1B} SET CARRY
         SBC   #'0'       ; {2C2B} SUBTRACT '0' ASCII
         CMP   #10        ; {3C2B} IS NUMBER?
         BCC   :C2        ; {3C2B} THEN DONE
         SBC   #7         ; {2C2B} OTHERWISE LETTER OFFSET
:C2
         STA   ]HI        ; {4C3B} STORE HIGH BYTE VALUE
         ASL              ; {2C1B} CLEAR LOW BYTE OF ]HI
         ASL              ; {2C1B}
         ASL              ; {2C1B}
         ASL              ; {2C1B}
         ORA   ]LO        ; {7C3B} OR OPERATION TO INSERT
                          ; LOW BYTE INTO RESULT
         LDY   #1         ; {3C2B} SET LENGTH OF RETURN
         STY   RETLEN     ; {4C3B}
         STA   RETURN     ; {4C3B} PASS BACK VIA RETURN AND .A
         RTS              ; {6C1B}
