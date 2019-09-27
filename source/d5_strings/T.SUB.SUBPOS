*``````````````````````````````*
* SUBPOS        (NATHAN RIGGS) *
*                              *
* CHECK IF A SUBSTRING CAN BE  *
* FOUND IN A STRING; IF SO,    *
* RETURN INDEX IN .A; ELSE,    *
* RETURN 0 IN .A.              *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SUBSTRING ADDRESS   *
*  WPAR2 = STRING ADDRESS      *
*                              *
* OUTPUT:                      *
*                              *
*  .A = SUBSTRING INDEX        *
*  RETURN = SUBSTRING INDEX    *
*  RETLEN = 1                  *
*                              *
* DESTROYS: AXYNVBDIZCMS       *
*           ^^^^    ^^^        *
*                              *
* CYCLES: 150+                 *
* SIZE: 103 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRIND  EQU   VARTAB     ; STRING INDEX
]SUBIND  EQU   VARTAB+1   ; SUBSTRING INDEX
]CNT     EQU   VARTAB+2   ; COUNTER
]STRLEN  EQU   VARTAB+3   ; STRING LENGTH
]SUBLEN  EQU   VARTAB+4   ; SUBSTRING LENGTH
]SIDX    EQU   VARTAB+6
]SUB     EQU   WPAR1      ; ZP SUBSTRING ADDR PTR
]STR     EQU   WPAR2      ; ZP STRING ADDR POINTER
*
SUBPOS
*
         LDY   #0         ; RESET INDEX COUNTER
         LDA   (]STR),Y   ; GET LENGTH OF STRING
         BEQ   :NOTFND    ; EXIT IF LENGTH = 0
         STA   ]STRLEN    ; STORE STRING LENGTH
         LDA   (]SUB),Y   ; GET SUBSTR LENGTH
         BEQ   :NOTFND    ; EXIT IF SUB LENGTH = 0
         STA   ]SUBLEN    ; STORE SUBSTRING LENGTH
*
         LDA   ]SUBLEN    ; IF SUBSTRING LENGTH IS
         CMP   ]STRLEN    ; > STRING LENGTH, DECLARE
         BEQ   :LENOK     ; THE STRING NOT FOUND
         BCS   :NOTFND    ; OTHERWISE, CONTINUE
*
:LENOK
         LDA   #1         ; SET STRING INDEX TO
         STA   ]STRIND    ; THE FIRST CHARACTER
         LDA   ]STRLEN    ; GET STRING LENGTH
         SEC              ; SET CARRY
         SBC   ]SUBLEN    ; SUBTRACT SUBSTRING LENGTH
         STA   ]CNT       ; STORE AS COUNTER
         INC   ]CNT       ; INCREASE BY 1
*
:SLP1
         LDA   ]STRIND
         STA   ]SIDX
         LDA   #1         ; START SUBSTRING INDEX
         STA   ]SUBIND    ; AT 1
*
:CMPLP
         LDY   ]SIDX      ; LOAD STRING INDEX TO .7
         LDA   (]STR),Y   ; GET NEXT CHAR FROM STR
         LDY   ]SUBIND    ; LOAD SUBSTRING INDEX TO .Y
         CMP   (]SUB),Y   ; COMPARE TO NEXT SUB CHAR
         BNE   :SLP2      ; NOT A MATCH; BRANCH
         CPY   ]SUBLEN    ; TEST IF SUB INDEX = SUB LENGTH
         BEQ   :FOUND     ; IF SO, FOUND THE SUBSTRING
         INY              ; ELSE INC TO NEXT CHAR
         STY   ]SUBIND    ; STORE NEW SUBSTRING INDEX
         INC   ]SIDX      ; INCREASE STRING INDEX
         JMP   :CMPLP     ; LOOP UNTIL DONE
*
:SLP2
         INC   ]STRIND    ; INCREMENT INDEX
         DEC   ]CNT       ; DEC COUNT
         BNE   :SLP1      ; LOOP BACK IF UNFINISHED
         BEQ   :NOTFND    ; ELSE EXIT TO NOT FOUND
*
:FOUND
         LDA   ]STRIND    ; FOUND, STORE INDEX IN .A
         JMP   :EXIT
*
:NOTFND
         LDA   #0         ; SUB NOT FOUND, .A = 0
:EXIT
         STA   RETURN     ; STORE INDEX OR 0 IN RETURN
         LDY   #1         ; STORE BYTE LENGTH OF 1
         STY   RETLEN     ; INTO RETLEN
         RTS
