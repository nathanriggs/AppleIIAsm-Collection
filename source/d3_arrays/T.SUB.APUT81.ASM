*
*``````````````````````````````*
* APUT81        (NATHAN RIGGS) *
*                              *
* PUT DATA FROM SRC LOCATION   *
* INTO 1D, 8BIT ARRAY AT THE   *
* SPECIFIED ELEMENT.           *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = DESTINATION ADDRESS *
*  BPAR1 = ARRAY INDEX         *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT SIZE           *
*  .X = ELEMENT ADDRESS LOBYTE *
*  .Y = ELEMENT ADDRESS HIBYTE *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 170+                 *
* SIZE: 145 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   WPAR1      ; SOURCE ADDRESS
]ADDRD   EQU   WPAR2      ; DESTINATION
]AIDX    EQU   BPAR1      ; ARRAY INDEX
]SCRATCH EQU   ADDR1      ; ZEROED HIBYTE
*
]ESIZE   EQU   VARTAB     ; ELEMENT SIZE
]ESIZEBK EQU   VARTAB+1   ; ^BACKUP
]ASIZE   EQU   VARTAB+2   ; # OF ELEMENTS
]IDX     EQU   VARTAB+5   ; INDEX
]RES     EQU   VARTAB+7   ; MULTIPLICATION RESULT
*
APUT81
         LDA   ]AIDX      ; STORE IN 2 LOCATIONS
         STA   ]IDX       ; FOR A BACKUP LATER
*
** MULTIPLY INDEX BY ELEM SIZE AND ADD 2
*
         LDY   #1         ; GET ELEMENT LENGTH FROM
         LDA   (]ADDRD),Y ; BYTE 1 OF ARRAY
         STA   ]ESIZE
         STA   ]ESIZEBK
         LDY   #0         ; RESET INDEX
         LDA   (]ADDRD),Y ; GET NUMBER OF ELEMENTS
         STA   ]ASIZE     ; FROM ARRAY
         TYA              ; .A = 0
         STY   ]SCRATCH   ; LOBYTE = 0
         STY   ]SCRATCH+1 ; HIBYTE = 0
         BEQ   :ENTLPA    ; IF 0, SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY FLAG
         ADC   ]AIDX      ; ADD INDEX LOBYTE
         TAX              ; TEMPORARILY STORE IN .X
         TYA              ; TRANSFER HIBYTE TO .A
         ADC   ]SCRATCH   ; ADD HIBYTE
         TAY              ; STORE BACK IN .Y
         TXA              ; RELOAD LOBYTE TO .A
:LPA
         ASL   ]AIDX      ; MUL INDEX BY TWO
         ROL   ]SCRATCH   ; ADJUST HIBYTE CARRY
:ENTLPA
         LSR   ]ESIZE     ; DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LPA
         STX   ]IDX       ; STORE LOBYTE
         STY   ]IDX+1     ; STORE HIBYTE
         CLC              ; CLEAR CARRY FLAG
         LDA   #2         ; ADD 2 BYTES TO INDEX
         ADC   ]IDX       ; TO ACCOUNT FOR HEADER
         STA   ]RES       ; STORE LOBYTE
         LDA   #0         ; ACCOUNT FOR HIBYTE CARRY
         ADC   ]IDX+1
         STA   ]RES+1
*
** ADD RESULT TO ARRAY ADDRESS TO GET ELEMENT ADDR
*
         CLC              ; CLEAR CARRY FLAG
         LDA   ]RES       ; LOAD RESULT FROM EARLIER
         ADC   ]ADDRD     ; ADD ARRAY ADDRESS LOBYTE
         STA   ]RES       ; STORE BACK IN RESULT
         LDA   ]RES+1     ; ADD ARRAY ADDRESS HIBYTE
         ADC   ]ADDRD+1   ;
         STA   ]RES+1     ; STORE HIBYTE
*
         STA   ]ADDRD+1   ; STORE IN ZERO PAGE HIBYTE
         LDA   ]RES       ; STORE LOBYTE TO ZERO PAGE
         STA   ]ADDRD
*
** COPY FROM SRC ADDR3 TO ELEMENT LOCATION ADDR
*
:LP
         LDA   (]ADDRS),Y ; LOAD BYTE FROM SOURCE
         STA   (]ADDRD),Y ; STORE IN ELEMENT ADDRESS
         INY              ; INCREASE BYTE INDEX
         CPY   ]ESIZEBK   ; COMPARE TO ELEMENT SIZE
         BNE   :LP        ; IF !=, KEEP COPYING
*
         LDY   ]ADDRD+1   ; .Y = ELEMENT ADDRESS HIBYTE
         LDX   ]ADDRD     ; .X = LOBYTE
         LDA   ]ESIZE     ; .A = ELEMENT SIZE
         RTS
