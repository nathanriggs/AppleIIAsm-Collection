*
*``````````````````````````````*
* ADIM81        (NATHAN RIGGS) *
*                              *
* DECLARE THE DIMENSIONS OF A  *
* NEW 8BIT, 1D ARRAY.          *
*                              *
*------------------------------*
* 8-BIT MULTIPLICATION CODE    *
* ADAPTED FROM WHITE FLAME'S   *
* WORK ON CODEBASE64. LICENSE  *
* MAY VARY.                    *
*------------------------------*
*                              *
* INPUT                        *
*                              *
*  ZPW1  = ARRAY ADDRESS       *
*  ZPW2  = # OF ELEMENTS       *
*  ZPW3  = LENGTH OF ELEMENTS  *
*  ZPB1  = FILL VALUE          *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 194+                 *
* SIZE: 129 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   ZPW1       ; ARRAY ADDRESS
]ASIZE   EQU   ZPW2       ; NUMBER OF ELEMENTS
]ESIZE   EQU   ZPW3       ; ELEMENT SIZE, IN BYTES
]FILL    EQU   ZPB1       ; DEFAULT FILL VALUE
*
]MSIZE   EQU   ZPW4       ; TOTAL BYTES OF ARRAY
]ASZBAK  EQU   ZPW5       ; ARRAY SIZE BACKUP
]ESZBAK  EQU   ZPW6       ; ELEMENT SIZE BACKUP
*
ADIM81
         LDA   ]ESIZE     ; {2C2B} LOAD ELEMENT SIZE
         STA   ]ESZBAK    ; {3C2B} SAVE A BACKUP
         LDA   ]ASIZE     ; {2C2B} LOAD ARRAY SIZE
         STA   ]ASZBAK    ; {3C2B} SAVE A BACKUP
         LDA   #0         ; {2C2B} RESET .A
         STA   ]ASIZE+1   ; {3C2B} CLEAR ARRAY SIZE HIGH BYTE
         STA   ]ASZBAK+1  ; {3C2B} CLEAR ARRAY SIZE BACKUP HIGH BYTE
*
** MULTIPLY ARRAY SIZE BY ELEMENT SIZE
*
         LDY   #0         ; {2C2B} RESET HIBYTE FOR MULTIPLY
         TYA              ; {3C2B} RESET LOBYTE FOR MULTIPLY
         LDY   ]ASIZE+1   ; {2C2B}
         STY   ZPB4       ; {3C2B} SAVE HIBYTE IN ZPB4
         BEQ   :ENTLP     ; {3C2B} IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} ADD ASIZE TO LOBYTE
         ADC   ]ASIZE     ; {5C3B}
         TAX              ; {3C2B} TEMPORARILY STORE IN .X
         TYA              ; {3C2B} TRANSFER HIBYTE TO .A
         ADC   ZPB4       ; {5C3B} ADD HIBYTE
         TAY              ; {3C2B} STORE BACK IN .Y
         TXA              ; {3C2B} LOAD LOBYTE IN .A AGAIN
:LP                       ;        LOOP START
         ASL   ]ASIZE     ; {6C3B} MULTIPLY ASIZE BY 2
         ROL   ZPB4       ; {6C3B} MULTIPLY HIBYTE BY 2
:ENTLP
         LSR   ]ESIZE     ; {6C3B} DIVIDE ESIZE BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP        ; {3C2B} OTHERWISE, RELOOP
*
         STX   ]MSIZE     ; {3C2B} STORE LOBYTE
         STY   ]MSIZE+1   ; {3C2B} STORE HIBYTE
         LDA   ]MSIZE     ; {2C2B} NOW ADD TO BYTES
         CLC              ; {2C1B} TO MSIZE FOR ARRAY HEADER
         ADC   #2         ; {3C2B}
         STA   ]MSIZE     ; {3C2B} STORE LOBYTE
         LDA   ]MSIZE+1   ; {2C2B}
         ADC   #0         ; {3C2B} CARRY FOR HIBYTE
         STA   ]MSIZE+1   ; {3C2B}
*
** NOW CLEAR MEMORY BLOCKS
*
         LDA   ]FILL      ; {2C2B} GET FILL VALUE
         LDX   ]MSIZE+1   ; {2C2B} X = # O PAGES TO DO
         BEQ   :PART      ; {3C2B} BRANCH IF HIBYTE = 0
         LDY   #0         ; {2C2B} RESET INDEX
:FULL
         STA   (]ADDR),Y  ; {3C2B} FILL CURRENT BYTE
         INY              ; {2C1B} INCREMENT INDEX
         BNE   :FULL      ; {3C2B} LOOP UNTIL PAGE DONE
         INC   ]ADDR+1    ; {5C2B} GO TO NEXT PAGE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :FULL      ; {3C2B} LOOP IF PAGES LEFT
:PART
         LDX   ]MSIZE     ; {2C2B} PARTIAL PAGE BYTES
         BEQ   :MFEXIT    ; {3C2B} EXIT IF LOBYTE = 0
         LDY   #0         ; {2C2B} RESENT INDEX
:PARTLP
         STA   (]ADDR),Y  ; {3C2B} STORE VAL
         INY              ; {2C1B} INCREMENT INDEX
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :PARTLP    ; {3C2B} LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; {2C2B} STORE NUMBER OF ELEMENTS
         LDA   ]ASZBAK    ; {2C2B} INTO FIRST BYTE OF ARRAY
         STA   (]ADDR),Y  ; {6C2B}
         INY              ; {2C1B}
         LDA   ]ESZBAK    ; {2C2B} STORE ELEMENT SIZE INTO
         STA   (]ADDR),Y  ; {6C2B} SECOND BYTE OF ARRAY
         LDX   ]ADDR      ; {2C2B} GET LOBYTE OF ARRAY ADDRESS
         LDY   ]ADDR+1    ; {2C2B} AND HIBYTE TO RETURN IN .X, .Y
         LDA   ]ASZBAK    ; {2C2B} RETURN NUMBER OF ELEMENTS IN .A
         LDA   ]MSIZE     ; {2C2B} STORE TOTAL ARRAY SIZE
         STA   RETURN     ; {3C2B} IN RETURN
         LDA   ]MSIZE+1   ; {2C2B}
         STA   RETURN+1   ; {3C2B}
         LDA   #2         ; {2C2B} SET RETURN LENGTH TO
         STA   RETLEN     ; {3C2B} 2 BYTES
         RTS              ; {6C1B}
