*``````````````````````````````*
* SUBPOS        (NATHAN RIGGS) *
*                              *
* RETURNS THE POSITION OF A    *
* SUBSTRING IN A GIVEN STRING. *
* IF NO SUBSTRING IS FOUND,    *
* THEN #255 IS PASSED BACK     *
* INSTEAD.                     *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SUBSTRING (ADDRESS) *
*  WPAR2 = STRING ADDRESS      *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 171+                 *
* SIZE: 107 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRIND  EQU   VARTAB     ; STRING INDEX
]SUBIND  EQU   VARTAB+1   ; SUBSTRING INDEX
]CNT     EQU   VARTAB+2   ; COUNTER
]STRLEN  EQU   VARTAB+3   ; STRING LENGTH
]SUBLEN  EQU   VARTAB+4   ; SUBSTRING LENGTH
]SIDX    EQU   VARTAB+6   ; STRING INDEX
]SUB     EQU   WPAR1      ; ZP SUBSTRING ADDR PTR
]STR     EQU   WPAR2      ; ZP STRING ADDR POINTER
*
SUBPOS
         LDY   #0         ; {3C2B} RESET INDEX COUNTER
         LDA   (]STR),Y   ; {5C2B} GET LENGTH OF STRING
         BEQ   :NOTFND    ; {3C2B} EXIT IF LENGTH = 0
         STA   ]STRLEN    ; {4C3B} STORE STRING LENGTH
         LDA   (]SUB),Y   ; {5C2B} GET SUBSTR LENGTH
         BEQ   :NOTFND    ; {3C2B} EXIT IF SUB LENGTH = 0
         STA   ]SUBLEN    ; {4C3B} STORE SUBSTRING LENGTH
         LDA   ]SUBLEN    ; {4C3B} IF SUBSTRING LENGTH IS
         CMP   ]STRLEN    ; {4C3B} > STRING LENGTH, DECLARE
         BEQ   :LENOK     ; {3C2B} THE STRING NOT FOUND
         BCS   :NOTFND    ; {3C2B} OTHERWISE, CONTINUE
:LENOK
         LDA   #1         ; {3C2B} SET STRING INDEX TO
         STA   ]STRIND    ; {4C3B} THE FIRST CHARACTER
         LDA   ]STRLEN    ; {4C3B} GET STRING LENGTH
         SEC              ; {2C1B} SET CARRY
         SBC   ]SUBLEN    ; {4C3B} SUBTRACT SUBSTRING LENGTH
         STA   ]CNT       ; {4C3B} STORE AS COUNTER
         INC   ]CNT       ; {5C2B} INCREASE BY 1
:SLP1
         LDA   ]STRIND    ; {4C3B}
         STA   ]SIDX      ; {4C3B}
         LDA   #1         ; {3C2B} START SUBSTRING INDEX
         STA   ]SUBIND    ; {4C3B} AT 1
:CMPLP
         LDY   ]SIDX      ; {4C3B} LOAD STRING INDEX TO .7
         LDA   (]STR),Y   ; {5C2B} GET NEXT CHAR FROM STR
         LDY   ]SUBIND    ; {4C3B} LOAD SUBSTRING INDEX TO .Y
         CMP   (]SUB),Y   ; {5C2B} COMPARE TO NEXT SUB CHAR
         BNE   :SLP2      ; {3C2B} NOT A MATCH; BRANCH
         CPY   ]SUBLEN    ; {4C3B} TEST IF SUB INDEX = SUB LENGTH
         BEQ   :FOUND     ; {3C2B} IF SO, FOUND THE SUBSTRING
         INY              ; {2C1B} ELSE INC TO NEXT CHAR
         STY   ]SUBIND    ; {4C3B} STORE NEW SUBSTRING INDEX
         INC   ]SIDX      ; {5C2B} INCREASE STRING INDEX
         JMP   :CMPLP     ; {3C3B} LOOP UNTIL DONE
:SLP2
         INC   ]STRIND    ; {5C2B} INCREMENT INDEX
         DEC   ]CNT       ; {5C2B} DEC COUNT
         BNE   :SLP1      ; {3C2B} LOOP BACK IF UNFINISHED
         BEQ   :NOTFND    ; {3C2B} ELSE EXIT TO NOT FOUND
:FOUND
         LDA   ]STRIND    ; {4C3B} FOUND, STORE INDEX IN .A
         JMP   :EXIT      ; {3C3B}
:NOTFND
         LDA   #255       ; {3C2B} SUB NOT FOUND, .A = 255
:EXIT
         STA   RETURN     ; {4C3B} STORE INDEX OR 255 IN RETURN
         LDY   #1         ; {3C2B} STORE BYTE LENGTH OF 1
         STY   RETLEN     ; {4C3B} INTO RETLEN
         LDY   ]SUBLEN    ; {4C3B}
         RTS              ; {6C1B}
