*
*``````````````````````````````*
* AGET81        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = ARRAY ADDRESS LOBYTE   *
*  .X = ARRAY ADDRESS HIBYTE   *
*  .Y = ARRAY ELEMENT INDEX    *
*                              *
* OUTPUT:                      *
*                              *
*  .A = LENGTH OF ELEMENT      *
*  RETURN = ELEMENT VALUE      *
*  RETLEN = ELEMENT LENGTH     *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 134                  *
* SIZE: 134 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]RES     EQU   VARTAB     ; MATH RESULTS
]IDX     EQU   VARTAB+2   ; ELEMENT INDEX
]ESIZE   EQU   VARTAB+4   ; ELEMENT SIZE
]ALEN    EQU   VARTAB+5   ; NUMBER OF ELEMENTS
*
AGET81
         STA   ADDR1      ; .A HOLDS ARRAY ADDRESS LOBYTE
         STX   ADDR1+1    ; .X HOLDS ADDRESS HIBYTE
         STY   ]IDX       ; .Y HOLDS THE INDEX
         LDA   #0         ; CLEAR INDEX HIBYTE
         STA   ]IDX+1
         LDY   #1         ; GET ELEMENT SIZE FROM ARRAY
         LDA   (ADDR1),Y  ; HEADER
         STA   ]ESIZE
         STA   RETLEN     ; STORE IN RETLEN
         DEY              ; MOVE TO BYTE 0 OF HEADER
         LDA   (ADDR1),Y  ; GET NUMBER OF ELEMENTS
         STA   ]ALEN      ; FROM THE ARRAY HEADER
*
** MULTIPLY INDEX BY ELEMENT SIZE, ADD 2
*
         TYA              ; Y ALREADY HOLDS ZERO
         STY   SCRATCH    ; RESET LO AND HI TO 0
         BEQ   :ENTLP     ; IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY FLAG
         ADC   ]IDX       ; ADD INDEX LOBYTE
         TAX              ; TEMPORARILY STORE IN .X
         TYA              ; TRANSFER HIBYTE TO .A
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; STORE BACK INTO .Y
         TXA              ; RELOAD LOBYTE IN .A
:LP
         ASL   ]IDX       ; MULTIPLY INDEX BY TWO
         ROL   SCRATCH    ; ADJUST HIBYTE CARRY
:ENTLP
         LSR   ]ESIZE     ; DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP
*
         STX   ]IDX       ; STORE LOBYTE
         STY   ]IDX+1     ; STORE HIBYTE
         CLC              ; CLEAR CARRY
         LDA   #2         ; ADD 2 BYTES TO INDEX
         ADC   ]IDX       ; TO ACCOUNT FOR ARRAY HEADER
         STA   ]RES       ; AND STORE IN RESULT
         LDA   #0         ; ACCOUNT FOR HIBYTE CARRY
         ADC   ]IDX+1
         STA   ]RES+1
*
** NOW ADD TO BASE ADDRESS TO GET ELEMENT ADDRESS
*
         CLC              ; CLEAR CARRY FLAG
         LDA   ]RES       ; LOAD RESULT FROM EARLIER
         ADC   ADDR1      ; ADD ARRAY ADDRESS LOBYTE
         STA   ]RES       ; STORE BACK IN RESULT
         LDA   ]RES+1     ; LOAD PRIOR RESULT HIBYTE
         ADC   ADDR1+1    ; ADD ARRAY ADDRESS HIBYTE
         STA   ]RES+1     ; STORE BACK IN RESULT HIBYTE
*
** NOW MOVE ELEMENT DATA TO RETURN LOCATION
*
         LDY   #0         ; RESENT INDEX
         LDA   ]RES       ; LOAD ADDRESS LOBYTE
         STA   ADDR1      ; PUT IN ZERO PAGE POINTER
         LDA   ]RES+1     ; GET RESULT HIBYTE
         STA   ADDR1+1    ; PUT IN ZERO PAGE POINTER
:LDLOOP
         LDA   (ADDR1),Y  ; LOAD BYTE FROM ELEMENT
         STA   RETURN,Y   ; STORE IN RETURN
         INY              ; INCREASE BYTE INDEX
         CPY   RETLEN     ; IF .Y <= ELEMENT SIZE
         BCC   :LDLOOP    ; CONTINUE LOOPING
         BEQ   :LDLOOP    ; KEEP LOOPING
*
         LDX   ]RES       ; RETURN ELEMENT ADDRESS
         LDY   ]RES+1     ; IN .X (LOBYTE) AND .Y (HI)
         LDA   RETLEN     ; RETURN ELEMENT LENGTH IN .A
         RTS
