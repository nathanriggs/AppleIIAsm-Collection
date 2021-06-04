*
*``````````````````````````````*
* AGET81        (NATHAN RIGGS) *
*                              *
* RETRIEVE A VALUE AT A GIVEN  *
* ARRAY INDEX AND STORE IN     *
* RETURN AREA WITH APPROPRIATE *
* RETURN LENGTH (RETLEN).      *
*                              *
*------------------------------*
* 8-BIT MULTIPLICATION CODE    *
* ADAPTED FROM WHITE FLAME'S   *
* WORK ON CODEBASE63. LICENSE  *
* MAY VARY.                    *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  .A = ARRAY ADDRESS LOBYTE   *
*  .X = ARRAY ADDRESS HIBYTE   *
*  .Y = ARRAY ELEMENT INDEX    *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 176+                 *
* SIZE: 114 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]RES     EQU   VARTAB     ; MATH RESULTS
]IDX     EQU   VARTAB+2   ; ELEMENT INDEX
]ESIZE   EQU   VARTAB+4   ; ELEMENT SIZE
]ALEN    EQU   VARTAB+5   ; NUMBER OF ELEMENTS
*
AGET81
         STA   ADDR1      ; {3C2B} .A HOLDS ARRAY ADDRESS LOBYTE
         STX   ADDR1+1    ; {3C2B} .X HOLDS ADDRESS HIBYTE
         STY   ]IDX       ; {3C2B} .Y HOLDS THE INDEX
         LDA   #0         ; {2C2B} CLEAR INDEX HIBYTE
         STA   ]IDX+1     ; {3C2B}
         LDY   #1         ; {2C2B} GET ELEMENT SIZE FROM ARRAY
         LDA   (ADDR1),Y  ; {6C2B} HEADER
         STA   ]ESIZE     ; {3C2B}
         STA   RETLEN     ; {3C2B} STORE IN RETLEN
         DEY              ; {2C1B} MOVE TO BYTE 0 OF HEADER
         LDA   (ADDR1),Y  ; {6C2B} GET NUMBER OF ELEMENTS
         STA   ]ALEN      ; {3C2B} FROM THE ARRAY HEADER
*
** MULTIPLY INDEX BY ELEMENT SIZE, ADD 2
*
         TYA              ; {2C1B} Y ALREADY HOLDS ZERO
         STY   SCRATCH    ; {3C2B} RESET LO AND HI TO 0
         BEQ   :ENTLP     ; {3C2B} IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]IDX       ; {4C3B} ADD INDEX LOBYTE
         TAX              ; {2C1B} TEMPORARILY STORE IN .X
         TYA              ; {2C1B} TRANSFER HIBYTE TO .A
         ADC   SCRATCH    ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} STORE BACK INTO .Y
         TXA              ; {2C1B} RELOAD LOBYTE IN .A
:LP
         ASL   ]IDX       ; {6C3B} MULTIPLY INDEX BY TWO
         ROL   SCRATCH    ; {6C3B} ADJUST HIBYTE CARRY
:ENTLP
         LSR   ]ESIZE     ; {6C3B} DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP        ; {3C2B}
*
         STX   ]IDX       ; {3C2B} STORE LOBYTE
         STY   ]IDX+1     ; {3C2B} STORE HIBYTE
         CLC              ; {2C1B} CLEAR CARRY
         LDA   #2         ; {2C2B} ADD 2 BYTES TO INDEX
         ADC   ]IDX       ; {4C3B} TO ACCOUNT FOR ARRAY HEADER
         STA   ]RES       ; {3C2B} AND STORE IN RESULT
         LDA   #0         ; {2C2B} ACCOUNT FOR HIBYTE CARRY
         ADC   ]IDX+1     ; {4C3B}
         STA   ]RES+1     ; {3C2B}
*
** NOW ADD TO BASE ADDRESS TO GET ELEMENT ADDRESS
*
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   ]RES       ; {2C2B} LOAD RESULT FROM EARLIER
         ADC   ADDR1      ; {4C3B} ADD ARRAY ADDRESS LOBYTE
         STA   ]RES       ; {3C2B} STORE BACK IN RESULT
         LDA   ]RES+1     ; {2C2B} LOAD PRIOR RESULT HIBYTE
         ADC   ADDR1+1    ; {4C3B} ADD ARRAY ADDRESS HIBYTE
         STA   ]RES+1     ; {3C2B} STORE BACK IN RESULT HIBYTE
*
** NOW MOVE ELEMENT DATA TO RETURN LOCATION
*
         LDY   #0         ; {2C2B} RESENT INDEX
         LDA   ]RES       ; {2C2B} LOAD ADDRESS LOBYTE
         STA   ADDR1      ; {3C2B} PUT IN ZERO PAGE POINTER
         LDA   ]RES+1     ; {2C2B} GET RESULT HIBYTE
         STA   ADDR1+1    ; {3C2B} PUT IN ZERO PAGE POINTER
:LDLOOP
         LDA   (ADDR1),Y  ; {2C2B} LOAD BYTE FROM ELEMENT
         STA   RETURN,Y   ; {3C2B} STORE IN RETURN
         INY              ; {2C1B} INCREASE BYTE INDEX
         CPY   RETLEN     ; {4C2B} IF .Y <= ELEMENT SIZE
         BCC   :LDLOOP    ; {3C2B} CONTINUE LOOPING
         BEQ   :LDLOOP    ; {3C2B} KEEP LOOPING
*
         LDX   ]RES       ; {2C2B} RETURN ELEMENT ADDRESS
         LDY   ]RES+1     ; {2C2B} IN .X (LOBYTE) AND .Y (HI)
         LDA   RETLEN     ; {2C2B} RETURN ELEMENT LENGTH IN .A
         RTS              ; {6C1B}
