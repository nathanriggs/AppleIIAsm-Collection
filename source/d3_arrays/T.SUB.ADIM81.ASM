*
*``````````````````````````````*
* ADIM81        (NATHAN RIGGS) *
*                              *
* INPUT                        *
*                              *
*  WPAR1 = ARRAY ADDRESS (2B)  *
*  WPAR2 = # OF ELEMENTS       *
*  WPAR3 = LENGTH OF ELEMENTS  *
*  BPAR1 = FILL VALUE          *
*                              *
* OUTPUT                       *
*                              *
*  RETURN = TOTAL BYTES USED   *
*  RETLEN = 2                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 176+                 *
* SIZE: 160 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   WPAR1
]ASIZE   EQU   WPAR2
]ESIZE   EQU   WPAR3
]FILL    EQU   BPAR1
*
]MSIZE   EQU   VARTAB     ; TOTAL BYTES OF ARRAY
]ASZBAK  EQU   VARTAB+4   ; ARRAY SIZE BACKUP
]ESZBAK  EQU   VARTAB+6   ; ELEMENT SIZE BACKUP
*
ADIM81
         LDA   ]ESIZE
         STA   ]ESZBAK
         LDA   ]ASIZE
         STA   ]ASZBAK
         LDA   #0
         STA   ]ASIZE+1
         STA   ]ASZBAK+1
*
** MULTIPLY ARRAY SIZE BY ELEMENT SIZE
*
         LDY   #0         ; RESET HIBYTE FOR MULTIPLY
         TYA              ; RESET LOBYTE FOR MULTIPLY
         LDY   ]ASIZE+1
         STY   SCRATCH    ; SAVE HIBYTE IN SCRATCH
         BEQ   :ENTLP     ; IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; ADD ASIZE TO LOBYTE
         ADC   ]ASIZE
         TAX              ; TEMPORARILY STORE IN .X
         TYA              ; TRANSFER HIBYTE TO .A
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; STORE BACK IN .Y
         TXA              ; LOAD LOBYTE IN .A AGAIN
:LP                       ; LOOP START
         ASL   ]ASIZE     ; MULTIPLY ASIZE BY 2
         ROL   SCRATCH    ; MULTIPLY HIBYTE BY 2
:ENTLP
         LSR   ]ESIZE     ; DIVIDE ESIZE BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP        ; OTHERWISE, RELOOP
*
         STX   ]MSIZE     ; STORE LOBYTE
         STY   ]MSIZE+1   ; STORE HIBYTE
         LDA   ]MSIZE     ; NOW ADD TO BYTES
         CLC              ; TO MSIZE FOR ARRAY HEADER
         ADC   #2
         STA   ]MSIZE     ; STORE LOBYTE
         LDA   ]MSIZE+1
         ADC   #0         ; CARRY FOR HIBYTE
         STA   ]MSIZE+1
*
** NOW CLEAR MEMORY BLOCKS
*
         LDA   ]FILL      ; GET FILL VALUE
         LDX   ]MSIZE+1   ; X = # O PAGES TO DO
         BEQ   :PART      ; BRANCH IF HIBYTE = 0
         LDY   #0         ; RESET INDEX
:FULL
         STA   (]ADDR),Y  ; FILL CURRENT BYTE
         INY              ; INCREMENT INDEX
         BNE   :FULL      ; LOOP UNTIL PAGE DONE
         INC   ]ADDR+1    ; GO TO NEXT PAGE
         DEX              ; DECREMENT COUNTER
         BNE   :FULL      ; LOOP IF PAGES LEFT
:PART
         LDX   ]MSIZE     ; PARTIAL PAGE BYTES
         BEQ   :MFEXIT    ; EXIT IF LOBYTE = 0
         LDY   #0         ; RESENT INDEX
:PARTLP
         STA   (]ADDR),Y  ; STORE VAL
         INY              ; INCREMENT INDEX
         DEX              ; DECREMENT COUNTER
         BNE   :PARTLP    ; LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; STORE NUMBER OF ELEMENTS
         LDA   ]ASZBAK    ; INTO FIRST BYTE OF ARRAY
         STA   (]ADDR),Y
         INY
         LDA   ]ESZBAK    ; STORE ELEMENT SIZE INTO
         STA   (]ADDR),Y  ; SECOND BYTE OF ARRAY
         LDX   ]ADDR      ; GET LOBYTE OF ARRAY ADDRESS
         LDY   ]ADDR+1    ; AND HIBYTE TO RETURN IN .X, .Y
         LDA   ]ASZBAK    ; RETURN NUMBER OF ELEMENTS IN .A
         LDA   ]MSIZE     ; STORE TOTAL ARRAY SIZE
         STA   RETURN     ; IN RETURN
         LDA   ]MSIZE+1
         STA   RETURN+1
         LDA   #2         ; SET RETURN LENGTH TO
         STA   RETLEN     ; 2 BYTES
         RTS
