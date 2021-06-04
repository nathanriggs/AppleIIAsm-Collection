*``````````````````````````````*
* SUBTOK        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE PULLS FROM A *
* STRING OF ARGUMENTS THAT ARE *
* SEPARATED BY A DELIMITER AND *
* RETURNS THE ARGUMENT NUMBER  *
* THAT IS REQUESTED.           *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS      *
*  WPAR2 = DELIMITER           *
*  BPAR2 = ARGUMENT INDEX      *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 148+                 *
* SIZE: 92 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STR     EQU   WPAR1      ; STRING ADDRESS
]DELIM   EQU   WPAR2      ; DELIMITER
]LEN     EQU   BPAR1      ; STRING LENGTH
]ARG     EQU   BPAR2      ; ARGUMENT NUMBER
]START   EQU   VARTAB     ; START POS OF ARGUMENT
]END     EQU   VARTAB+2   ; END POS OF ARGUMENT
]COUNT   EQU   VARTAB+4   ; ARGUMENT COUNTER
]XFLAG   EQU   VARTAB+6   ; LOOP EXIT FLAG
]FOUND   EQU   VARTAB+8   ; ARGUMENT FOUND FLAG
*
SUBTOK
         LDY   #0         ; {3C2B} CLEAR .Y REGISTER
         STY   ]COUNT     ; {4C3B} CLEAR COUNTER
         STY   ]XFLAG     ; {4C3B} CLEAR LOOP FLAG
         LDA   (]STR),Y   ; {5C2B} LOAD STRING LENGTH
         STA   ]LEN       ; {3C2B} AND STORE IN LENGTH VARIABLE
         STY   ]START     ; {4C3B} CLEAR START POS
         STY   ]END       ; {4C3B} CLEAR ENDING POS
         STY   ]FOUND     ; {4C3B} CLEAR FOUND FLAG
         TAX              ; {2C1B} CLEAR .X REGISTER
:_LP2
         INY              ; {2C1B} INCREASE INDEX
         LDA   (]STR),Y   ; {5C2B} LOAD CHARACTER FROM STRING
         CMP   ]DELIM     ; {3C2B} COMPARE TO DELIMITER
         BEQ   :CHECK     ; {3C2B} IF EQUAL, GOTO :CHECK
:RELOOP  CPY   ]LEN       ; {3C2B} ELSE, COMPARE .Y TO LENGTH
         BNE   :_LP2      ; {3C2B} IF NOT EQUAL, LOOP AGAIN
         LDX   #1         ; {3C2B} LOAD #1 IN .X
         STX   ]XFLAG     ; {4C3B} SET LOOP EXIT FLAG
:CHECK
         STY   ]END       ; {4C3B} STORE CUR INDEX TO END POS
         LDX   ]ARG       ; {3C2B} LOAD ARGUMENT NUMBER
         CPX   ]COUNT     ; {4C3B} COMPARE TO CURRENT COUNT
         BEQ   :COPY      ; {3C2B} IF EQUAL, PROCEED TO :COPY
         INC   ]COUNT     ; {5C2B} OTHERWISE, INCREASE COUNT
         STY   ]START     ; {4C3B} STORE CURRENT INDEX AS START
         JMP   :RELOOP    ; {3C3B} GOTO BEGINNING LOOP
:COPY
         LDY   ]START     ; {4C3B} LOAD STARTING POSITION IN .Y
         LDX   #255       ; {3C2B} LOAD -1 IN .X REGISTER
         LDA   ]XFLAG     ; {4C3B} LOAD LOOP EXIT FLAG
         CMP   #1         ; {3C2B} AND COMPARE TO #1
         BEQ   :CPLP      ; {3C2B} IF SET, GOTO COPY LOOP
         DEC   ]END       ; {5C2B} OTHERWISE, DECREASE END POS
:CPLP
         INY              ; {2C1B} INCREASE .Y INDEX
         INX              ; {2C1B} INCREASE .X INDEX
         LDA   (]STR),Y   ; {5C2B} LOAD CHARACTER FROM STRING
         STA   RETURN,X   ; {5C2B} STORE IN RETURN
         CPY   ]END       ; {4C3B} IF .Y INDEX != END POS
         BNE   :CPLP      ; {3C2B} THEN CONTINUE COPY LOOP
:SETLEN
         LDA   ]END       ; {4C3B} LOAD ENDING POS
         SEC              ; {2C1B} SET CARRY
         SBC   ]START     ; {4C3B} SUBTRACT STARTING POS
         STA   RETLEN     ; {4C3B} AND STORE IN RETLEN
:EXIT
         RTS              ; {6C1B}
