*
*``````````````````````````````*
* APUT161       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = ARRAY ADDRESS       *
*  WPAR3 = ELEMENT INDEX       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT LENGTH         *
*  .X = ARRAY ADDRESS LOBYTE   *
*  .Y = ARRAY ADDRESS HIBYTE   *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 181+                 *
* SIZE: 135 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   WPAR1
]ADDRD   EQU   WPAR2
]AIDX    EQU   WPAR3
*
]ESIZE   EQU   VARTAB     ; ELEMENT SIZE
]ESIZEB  EQU   VARTAB+1   ; ^BACKUP
]ASIZE   EQU   VARTAB+2   ; NUMBER OF ELEMENTS
]IDX     EQU   VARTAB+6   ; ANOTHER INDEX
*
APUT161
         LDA   ]AIDX
         STA   ]IDX
         LDA   ]AIDX+1
         STA   ]IDX+1
         STA   SCRATCH
         LDY   #0         ; RESET BYTE COUNTER
         LDA   (]ADDRD),Y ; GET NUMBER OF ELEMENTS
         STA   ]ASIZE     ; LOBYTE
         LDY   #1         ; INCREMENT INDEX
         LDA   (]ADDRD),Y ; GET NUMBER OF ELEMENTS
         STA   ]ASIZE+1   ; HIBYTE
         INY              ; INCREMENT INDEX
         LDA   (]ADDRD),Y ; GET ELEMENT LENGTH
         STA   ]ESIZE
         STA   ]ESIZEB    ; BACKUP
*
** MULTIPLY INDEX BY ELEMENT SIZE, THEN ADD 3
*
         LDY   #0         ; RESET LOBYTE
         LDA   #0         ; AND HIBYTE
         BEQ   :ENTLPA    ; SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY
         ADC   ]AIDX      ; ADD INDEX LOBYTE
         TAX              ; HOLD IN .X
         TYA              ; LOAD HIBYTE
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; HOLD BACK IN .Y
         TXA              ; RETURN LOBYTE TO .A
:LPA
         ASL   ]AIDX      ; MULTIPLY INDEX BY 2
         ROL   SCRATCH    ; ADJUST HIBYTE
:ENTLPA
         LSR   ]ESIZE     ; DIVIDE ELEM LENGTH BY 2
         BCS   :DOADD     ; IF 1 SHIFTED TO CARRY, ADD AGAIN
         BNE   :LPA       ; CONTINUE LOOP IF ZERO UNSET
         STX   ]IDX       ; LOBYTE IN .X
         STY   ]IDX+1     ; HIBYTE IN .Y
         CLC
         LDA   #3         ; ADD 3 TO LOBYTE
         ADC   ]IDX
         STA   ADDR2      ; STORE ON ZERO PAGE
         LDA   ]IDX+1     ; ADJUST HIBYTE
         ADC   #0
         STA   ADDR2+1
*
         CLC              ; CLEAR CARRY
         LDA   ADDR2      ; ADD ARRAY ADDRESS
         ADC   ]ADDRD     ; LOBYTE
         STA   ADDR2      ; ADD ARRAY ADDRESS
         LDA   ADDR2+1    ; HIBYTE
         ADC   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0
:LP
*
** OOPS; NEED TO CONVERT THIS TO 16 BITS
*
         LDA   (]ADDRS),Y ; GET BYTE FROM SOURCE
         STA   (ADDR2),Y  ; STORE IN ELEMENT
         INY              ; INCREMENT BYTE INDEX
         CPY   ]ESIZEB    ; IF INDEX != ELEMENT LENGTH
         BNE   :LP        ; KEEP LOOPING
         LDY   ADDR2+1    ; HIBYTE OF ELEMENT ADDRESS
         LDX   ADDR2      ; LOBYTE
         LDA   ]ESIZEB    ; .A = ELEMENT SIZE
         RTS
