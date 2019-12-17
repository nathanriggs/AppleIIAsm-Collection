*``````````````````````````````*
* HEXASC2HEX                   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = HEX STRING ADDRESS  *
*                              *
* OUTPUT:                      *
*                              *
*  .A = HEX BYTE VALUE         *
*  RETURN = HEX BYTE VALUE     *
*  RETLEN = 1                  *
*                              *
* DESTROYS: AXYNVBDIZCMS       *
*           ^^^^    ^^^        *
*                              *
* CYCLES: 82+                  *
* SIZE: 61 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HI      EQU   VARTAB     ; HIGH BYTE
]LO      EQU   VARTAB+2   ; LOW BYTE
]STR     EQU   WPAR1      ; ADDR OF STRING TO CONVERT
*
HEXASC2HEX
         LDY   #1         ; GET FIRST HEX CHARACTER
         LDA   (]STR),Y
         STA   ]HI        ; STORE IN HIBYTE
         INY              ; INCREASE INDEX
         LDA   (]STR),Y   ; TO GET SECOND HEX CHARACTER
         STA   ]LO        ; AND STORE THAT IN LOW BYTE
*
         SEC              ; SET CARRY
         SBC   #'0'       ; SUBTRACT '0' CHAR FROM ]LO CHAR
         CMP   #10        ; ASCII NUMERALS OFFSET
         BCC   :CONT      ; IF NUMERAL, CONTINUE
         SBC   #7         ; OTHERWISE SUBTRACT LETTER OFFSET
:CONT
         STA   ]LO        ; STORE VALUE INTO LOW BYTE
         LDA   ]HI        ; NO WORK ON HIGH BYTE
         SEC              ; SET CARRY
         SBC   #'0'       ; SUBTRACT '0' ASCII
         CMP   #10        ; IS NUMBER?
         BCC   :C2        ; THEN DONE
         SBC   #7         ; OTHERWISE LETTER OFFSET
:C2
         STA   ]HI        ; STORE HIGH BYTE VALUE
         ASL              ; CLEAR LOW BYTE OF ]HI
         ASL
         ASL
         ASL
         ORA   ]LO        ; OR OPERATION TO INSERT
                          ; LOW BYTE INTO RESULT
         LDY   #1         ; SET LENGTH OF RETURN
         STY   RETLEN
         STA   RETURN     ; PASS BACK VIA RETURN AND .A
         RTS
