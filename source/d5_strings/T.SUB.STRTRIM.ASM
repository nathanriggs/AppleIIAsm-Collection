*``````````````````````````````*
* STRTRIM       (NATHAN RIGGS) *
*                              *
* STRTRIM CUTS THE SPECIFIED   *
* CHARACTER FROM THE FRONT AND *
* END OF THE GIVEN STRING, IF  *
* IT EXISTS.                   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS      *
*  WPAR2 = DELIMITER           *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 95+                  *
* SIZE: 58 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   WPAR1      ; STRING ADDRESS
]DELIM   EQU   WPAR2      ; DELIMITER
]RET     EQU   WPAR3      ; RETURN AREA
]LEN     EQU   BPAR1      ; STRING LENGTH
*
STRTRIM
         LDY   #0         ; {3C2B} RESET .Y COUNTER
         LDA   (]STR),Y   ; {5C3B} GET STRING LENGTH
         STA   ]LEN       ; {3C2B} STORE IN TEMP VARIABLE
         TYA              ; {2C1B} RESET .A
         TAX              ; {2C1B} RESET .X
:FIRST
         LDY   #1         ; {3C2B} LOAD FIRST CHAR OF STRING
         LDA   (]STR),Y   ; {5C3B}
         CMP   ]DELIM     ; {3C2B} COMPARE TO THE DELIMITER
         BNE   :NOFIRST   ; {3C2B} IF NO MATCH, SKIP TO :NOFIRST
         LDX   #255       ; {3C2B} IF MATCHED, SET X TO -1
         LDY   #1         ; {3C2B} AND SET Y TO 1
         JMP   :COPY      ; {3C3B} JUMP OVER TO COPYING
:NOFIRST
         LDX   #255       ; {3C2B} SET .X TO -1
         LDY   #0         ; {3C2B} SET .Y TO 0
:COPY
         INY              ; {2C1B} INCREASE .Y
         INX              ; {2C1B} INCREASAE .X
         LDA   (]STR),Y   ; {5C3B} LOAD CHAR FROM STRING AT .Y
         STA   RETURN,X   ; {5C3B} STORE IN RETURN AT .X
         CPY   ]LEN       ; {3C2B} IF .Y != STRING LENGTH
         BNE   :COPY      ; {3C2B} THEN RELOOP COPYING
:LAST
         LDY   ]LEN       ; {3C2B} LOAD LENGTH INTO .Y
         LDA   (]STR),Y   ; {5C3B} LOAD LAST CHAR OF STRING
         CMP   ]DELIM     ; {3C2B} IF NOT EQUAL TO DELIMITER
         BNE   :EXIT      ; {3C2B} THEN GOTO EXIT
         DEC   ]LEN       ; {2C1B} OTHERWISE, DECREASE LENGTH
:EXIT
         LDY   ]LEN       ; {3C2B} LOAD (POSSIBLY) ALTERED LENGTH
         STY   RETLEN     ; {4C3B} STORE IN RETLEN
         TYA              ; {2C1B} PASS LENGTH IN .A REGISTER
         RTS              ; {6C1B}
