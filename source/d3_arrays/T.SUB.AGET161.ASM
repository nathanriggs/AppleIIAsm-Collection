*
*``````````````````````````````*
* AGET161       (NATHAN RIGGS) *
*                              *
* GET DATA IN ARRAY ELEMENT    *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  WPAR2 = ELEMENT INDEX       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT LENGTH         *
*  .X = ELEMENT ADDR  LOBYTE   *
*  .Y = ELEMENT ADDR  HIBYTE   *
*  RETURN = ELEMENT DATA       *
*  RETLEN = ELEMENT LENGTH     *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 126                  *
* SIZE: 135 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]AIDX    EQU   WPAR2
]ADDR    EQU   WPAR1
*
]ESIZE   EQU   VARTAB     ; ELEMENT LENGTH
]ESIZEB  EQU   VARTAB+1   ; ^BACKUP
]ASIZE   EQU   VARTAB+2   ; NUMBER OF ELEMENTS
]IDX     EQU   VARTAB+6   ; INDEX BACKUP
*
AGET161
         LDA   ]AIDX
         STA   ]IDX
         LDA   ]AIDX+1    ; GET INDEX HIBYTE
         STA   ]AIDX+1
         STA   SCRATCH
         LDY   #0         ; RESET INDEX
         LDA   (]ADDR),Y  ; GET NUMBER OF
         STA   ]ASIZE     ; ARRAY ELEMENTS
         LDY   #1         ; GET HIBYTE OF
         LDA   (]ADDR),Y  ; # OF ARRAY ELEMENTS
         STA   ]ASIZE+1
         INY              ; INCREASE BYTE INDEX
         LDA   (]ADDR),Y  ; GET ELEMENT LENGTH
         STA   ]ESIZE
         STA   ]ESIZEB
*
** MULTIPLY INDEX BY ELEMENT SIZE, ADD 3
*
         LDY   #0         ; RESET .Y AND .A
         LDA   #0
         BEQ   :ENTLPA    ; IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY
         ADC   ]AIDX      ; ADD INDEX TO .A
         TAX              ; HOLD IN .X
         TYA              ; LOAD HIBYTE
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; HOLD IN .Y
         TXA              ; RELOAD LOBYTE
:LPA
         ASL   ]AIDX      ; MULTIPLY INDEX BY 2
         ROL   SCRATCH    ; ADJUST HIBYTE
:ENTLPA
         LSR   ]ESIZE     ; DIVIDE ELEMENT LENGTH BY 2
         BCS   :DOADD     ; IF BIT 1 SHIFTED IN CARRY, ADD MORE
         BNE   :LPA       ; CONTINUE LOOPING IF ZERO FLAG UNSET
         STX   ]IDX       ; STORE LOBYTE
         STY   ]IDX+1     ; STORE HIBYTE
         LDA   #3         ; ADD 3 TO INDEX LOBYTE
         CLC              ; CLEAR CARRY
         ADC   ]IDX
         STA   ADDR2      ; STORE ON ZERO PAGE
         LDA   ]IDX+1     ; ADJUST HIBYTE
         ADC   #0
         STA   ADDR2+1
*
         LDA   ADDR2      ; ADD ARRAY ADDRESS
         CLC
         ADC   ]ADDR      ; LOBYTE
         STA   ADDR2
         LDA   ADDR2+1    ; HIBYTE
         ADC   ]ADDR+1
         STA   ADDR2+1
         LDY   #0         ; RESET BYTE INDEX
:LP
         LDA   (ADDR2),Y  ; GET BYTE FROM ELEMENT
         STA   RETURN,Y   ; PUT INTO RETURN
         INY              ; INCREASE BYTE INDEX
         CPY   ]ESIZEB    ; IF INDEX != ELEMENT LENGTH
         BNE   :LP        ; CONTINUE LOOP
         LDA   ]ESIZEB    ; .A = ELEMENT SIZE
         STA   RETLEN     ; STORE IN RETLEN
         LDY   ADDR2+1    ; .Y = ELEMENT ADDRESS HIBYTE
         LDX   ADDR2      ; .X = ELEMENT ADDRESS LOBYTE
         RTS
