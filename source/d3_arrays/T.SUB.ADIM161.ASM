*
*``````````````````````````````*
* ADIM161       (NATHAN RIGGS) *
*                              *
* INITIALIZE A 16BIT, 2D ARRAY *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  WPAR2 = # OF ELEMENTS       *
*  WPAR3 = ELEMENT LENGTH      *
*  BPAR1 = FILL VALUE          *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT SIZE           *
*  RETURN = TOTAL ARRAY SIZE   *
*  RETLEN = 2                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 172+                 *
* SIZE: 162 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRD   EQU   WPAR1
]ASIZE   EQU   WPAR2
]ESIZE   EQU   WPAR3
]FILL    EQU   BPAR1
*
]MSIZE   EQU   VARTAB     ; TOTAL ARRAY BYTES
]ASZBAK  EQU   VARTAB+4   ; BACKUP OF ELEMENT #
]ESZBAK  EQU   VARTAB+7   ; BACKUP
*
ADIM161
         LDA   ]ESIZE     ; ELEMENT SIZE
         STA   ]ESZBAK    ; ELEMENT LENGTH BACKUP
         LDA   ]ASIZE
         STA   ]ASZBAK    ; ARRAY SIZE BACKUP
         LDA   ]ASIZE+1
         STA   ]ASZBAK+1  ; BACKUP
         STA   SCRATCH    ; HIBYTE FOR MULTIPLICATION
         LDA   ]ADDRD
         STA   ADDR2
         LDA   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0         ; CLEAR INDEX
         LDA   #0         ; CLEAR ACCUMULATOR
         BEQ   :ENTLP     ; IF 0, SKIP TO LOOP
*
** MULTIPLY ARRAY SIZE BY ELEMENT SIZE
*
:DOADD
         CLC              ; CLEAR CARRY FLAG
         ADC   ]ASIZE     ; ADD ARRAY SIZE
         TAX              ; HOLD IN .X
         TYA              ; LOAD HIBYTE
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; HOLD IN .Y
         TXA              ; RELOAD LOBYTE
:LP
         ASL   ]ASIZE     ; MULTIPLY ARRAY SIZE BY 2
         ROL   SCRATCH    ; ADJUST HIBYTE
:ENTLP
         LSR   ]ESIZE     ; DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A,
         BNE   :LP        ; ADD AGAIN--ELSE, LOOP
         CLC              ; CLEAR CARRY
         TXA              ; LOBYTE TO .A
         ADC   #3         ; ADD 2 FOR HEADER
         STA   ]MSIZE     ; STORE IN TOTAL LOBYTE
         TYA              ; HIBYTE TO .A
         ADC   #0         ; DO CARRY
         STA   ]MSIZE+1   ; STORE IN TOTAL HIBYTE
*
** CLEAR MEMORY BLOCKS
*
         LDA   ]FILL      ; GET FILL VALUE
         LDX   ]MSIZE+1   ; LOAD TOTAL SIZE LOBYTE
         BEQ   :PART      ; IF NO WHOLE PAGES, JUST PART
         LDY   #0         ; RESET INDEX
:FULL
         STA   (]ADDRD),Y ; COPY BYTE TO ADDRESS
         INY              ; NEXT BYTE
         BNE   :FULL      ; LOOP UNTIL PAGE DONE
         INC   ]ADDRD+1   ; GO TO NEXT PAGE
         DEX              ; DECREMENT COUNTER
         BNE   :FULL      ; LOOP IF PAGES LEFT
:PART
         LDX   ]MSIZE     ; PARTIAL PAGE BYTES
         BEQ   :MFEXIT    ; EXIT IF = 0
         LDY   #0         ; RESET INDEX
:PARTLP
         STA   (]ADDRD),Y ; STORE BYTE
         INY              ; INCREMENT INDEX
         DEX              ; DECREMENT COUNTER
         BNE   :PARTLP    ; LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; RESET INDEX
         LDA   ]ASZBAK    ; STORE ARRAY SIZE IN HEADER
         STA   (ADDR2),Y
         INY              ; INCREASE INDEX
         LDA   ]ASZBAK+1  ; STORE ARRAY SIZE HIBYTE
         STA   (ADDR2),Y
         INY              ; INCREMENT INDEX
         LDA   ]ESZBAK    ; STORE ELEMENT SIZE
         STA   (ADDR2),Y  ; IN HEADER
         LDX   ]ADDRD     ; .X HOLDS ARRAY ADDRESS LOBYTE
         LDY   ]ADDRD+1   ; .Y HOLDS HIBYTE
         LDA   ]MSIZE     ; STORE TOTAL ARRAY SIZE
         STA   RETURN     ; IN RETURN
         LDA   ]MSIZE+1
         STA   RETURN+1
         LDA   #2
         STA   RETLEN     ; 2 BYTE LENGTH
         LDA   ]ASZBAK    ; .A HOLDS # OF ELEMENTS
         RTS
