*
*``````````````````````````````*
* ADIM161       (NATHAN RIGGS) *
*                              *
* INITIALIZE A 16BIT, 1D ARRAY *
*                              *
*------------------------------*
* MULTIPLICATION CODE ADAPTED  *
* FROM WHITE FLAME'S WORK ON   *
* CODEBASE64. LICENSE MAY VARY *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = ARRAY ADDRESS       *
*  ZPW2  = # OF ELEMENTS       *
*  ZPW3  = ELEMENT LENGTH      *
*  ZPB1  = FILL VALUE          *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 221+                 *
* SIZE: 130 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRD   EQU   ZPW1       ; ARRAY ADDRESS
]ASIZE   EQU   ZPW2       ; # OF ELEMENTS
]ESIZE   EQU   ZPW3       ; ELEMENT BYTE LENGTH
]FILL    EQU   ZPB1       ; FILL VALUE
*
]MSIZE   EQU   ZPW4       ; TOTAL ARRAY BYTES
]ASZBAK  EQU   ZPW5       ; BACKUP OF ELEMENT #
]ESZBAK  EQU   VARTAB     ; BACKUP
*
ADIM161
         LDA   ]ESIZE     ; {3C2B} ELEMENT SIZE
         STA   ]ESZBAK    ; {3C2B} ELEMENT LENGTH BACKUP
         LDA   ]ASIZE     ; {3C2B}
         STA   ]ASZBAK    ; {3C2B} ARRAY SIZE BACKUP
         LDA   ]ASIZE+1   ; {3C2B}
         STA   ]ASZBAK+1  ; {3C2B} BACKUP
         STA   ZPB4       ; {3C2B} HIBYTE FOR MULTIPLICATION
         LDA   ]ADDRD     ; {3C2B}
         STA   ZPW6       ; {3C2B}
         LDA   ]ADDRD+1   ; {3C2B}
         STA   ZPW6+1     ; {3C2B}
         LDY   #0         ; {2C2B} CLEAR INDEX
         LDA   #0         ; {2C2B} CLEAR ACCUMULATOR
         BEQ   :ENTLP     ; {3C2B} IF 0, SKIP TO LOOP
*
** MULTIPLY ARRAY SIZE BY ELEMENT SIZE
*
:DOADD
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]ASIZE     ; {4C3B} ADD ARRAY SIZE
         TAX              ; {2C1B} HOLD IN .X
         TYA              ; {2C1B} LOAD HIBYTE
         ADC   ZPB4       ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} HOLD IN .Y
         TXA              ; {2C1B} RELOAD LOBYTE
:LP
         ASL   ]ASIZE     ; {6C3B} MULTIPLY ARRAY SIZE BY 2
         ROL   ZPB4       ; {6C3B} ADJUST HIBYTE
:ENTLP
         LSR   ]ESIZE     ; {6C3B} DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A,
         BNE   :LP        ; {3C2B} ADD AGAIN--ELSE, LOOP
         CLC              ; {2C1B} CLEAR CARRY
         TXA              ; {2C1B} LOBYTE TO .A
         ADC   #3         ; {4C3B} ADD 2 FOR HEADER
         STA   ]MSIZE     ; {3C2B} STORE IN TOTAL LOBYTE
         TYA              ; {2C1B} HIBYTE TO .A
         ADC   #0         ; {4C3B} DO CARRY
         STA   ]MSIZE+1   ; {3C2B} STORE IN TOTAL HIBYTE
*
** CLEAR MEMORY BLOCKS
*
         LDA   ]FILL      ; {3C2B} GET FILL VALUE
         LDX   ]MSIZE+1   ; {3C2B} LOAD TOTAL SIZE LOBYTE
         BEQ   :PART      ; {3C2B} IF NO WHOLE PAGES, JUST PART
         LDY   #0         ; {2C2B} RESET INDEX
:FULL
         STA   (]ADDRD),Y ; {6C2B} COPY BYTE TO ADDRESS
         INY              ; {2C1B} NEXT BYTE
         BNE   :FULL      ; {3C2B} LOOP UNTIL PAGE DONE
         INC   ]ADDRD+1   ; {6C2B} GO TO NEXT PAGE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :FULL      ; {3C2B} LOOP IF PAGES LEFT
:PART
         LDX   ]MSIZE     ; {3C2B} PARTIAL PAGE BYTES
         BEQ   :MFEXIT    ; {3C2B} EXIT IF = 0
         LDY   #0         ; {2C2B} RESET INDEX
:PARTLP
         STA   (]ADDRD),Y ; {6C2B} STORE BYTE
         INY              ; {2C1B} INCREMENT INDEX
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :PARTLP    ; {3C2B} LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   ]ASZBAK    ; {3C2B} STORE ARRAY SIZE IN HEADER
         STA   (ZPW6),Y   ; {6C2B}
         INY              ; {2C1B} INCREASE INDEX
         LDA   ]ASZBAK+1  ; {3C2B} STORE ARRAY SIZE HIBYTE
         STA   (ZPW6),Y   ; {6C2B}
         INY              ; {2C1B} INCREMENT INDEX
         LDA   ]ESZBAK    ; {3C2B} STORE ELEMENT SIZE
         STA   (ZPW6),Y   ; {6C2B} IN HEADER
         LDX   ]ADDRD     ; {3C2B} .X HOLDS ARRAY ADDRESS LOBYTE
         LDY   ]ADDRD+1   ; {3C2B} .Y HOLDS HIBYTE
         LDA   ]MSIZE     ; {3C2B} STORE TOTAL ARRAY SIZE
         STA   RETURN     ; {3C2B} IN RETURN
         LDA   ]MSIZE+1   ; {3C2B}
         STA   RETURN+1   ; {3C2B}
         LDA   #2         ; {2C2B}
         STA   RETLEN     ; {3C2B} 2 BYTE LENGTH
         LDA   ]ASZBAK    ; {3C2B} .A HOLDS # OF ELEMENTS
         RTS              ; {6C1B}
