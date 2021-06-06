*
*``````````````````````````````*
* AGET161       (NATHAN RIGGS) *
*                              *
* GET DATA IN 16-BIT, 2D ARRAY *
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
*  ZPW2  = ELEMENT INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 185+                 *
* SIZE: 113 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]AIDX    EQU   ZPW2       ; ELEMENT INDEX
]ADDR    EQU   ZPW1       ; ARRAY ADDRESS
*
]ESIZE   EQU   ZPB1       ; ELEMENT LENGTH
]ESIZEB  EQU   ZPB2       ; ^BACKUP
]ASIZE   EQU   ZPW3       ; NUMBER OF ELEMENTS
]IDX     EQU   ZPW4       ; INDEX BACKUP
*
AGET161
         LDA   ]AIDX      ; {3C2B}
         STA   ]IDX       ; {3C2B}
         LDA   ]AIDX+1    ; {3C2B} GET INDEX HIBYTE
         STA   ]AIDX+1    ; {3C2B}
         STA   ZPB3       ; {3C2B}
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   (]ADDR),Y  ; {6C2B} GET NUMBER OF
         STA   ]ASIZE     ; {3C2B} ARRAY ELEMENTS
         LDY   #1         ; {2C2B} GET HIBYTE OF
         LDA   (]ADDR),Y  ; {6C2B} # OF ARRAY ELEMENTS
         STA   ]ASIZE+1   ; {3C2B}
         INY              ; {2C1B} INCREASE BYTE INDEX
         LDA   (]ADDR),Y  ; {6C2B} GET ELEMENT LENGTH
         STA   ]ESIZE     ; {3C2B}
         STA   ]ESIZEB    ; {3C2B}
*
** MULTIPLY INDEX BY ELEMENT SIZE, ADD 3
*
         LDY   #0         ; {2C2B} RESET .Y AND .A
         LDA   #0         ; {2C2B}
         BEQ   :ENTLPA    ; {3C2B} IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]AIDX      ; {4C3B} ADD INDEX TO .A
         TAX              ; {2C1B} HOLD IN .X
         TYA              ; {2C1B} LOAD HIBYTE
         ADC   ZPB3       ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} HOLD IN .Y
         TXA              ; {2C1B} RELOAD LOBYTE
:LPA
         ASL   ]AIDX      ; {6C3B} MULTIPLY INDEX BY 2
         ROL   ZPB3       ; {6C3B} ADJUST HIBYTE
:ENTLPA
         LSR   ]ESIZE     ; {6C3B} DIVIDE ELEMENT LENGTH BY 2
         BCS   :DOADD     ; {3C2B} IF BIT1 SHIFTED IN CARRY +MORE
         BNE   :LPA       ; {3C2B} CONTINUE LOOPING IF Z FLAG UNSET
         STX   ]IDX       ; {3C2B} STORE LOBYTE
         STY   ]IDX+1     ; {3C2B} STORE HIBYTE
         LDA   #3         ; {2C2B} ADD 3 TO INDEX LOBYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]IDX       ; {4C3B}
         STA   ZPW5       ; {3C2B} STORE ON ZERO PAGE
         LDA   ]IDX+1     ; {3C2B} ADJUST HIBYTE
         ADC   #0         ; {2C2B}
         STA   ZPW5+1     ; {3C2B}
*
         LDA   ZPW5       ; {3C2B} ADD ARRAY ADDRESS
         CLC              ; {2C1B}
         ADC   ]ADDR      ; {4C3B} LOBYTE
         STA   ZPW5       ; {3C2B}
         LDA   ZPW5+1     ; {3C2B} HIBYTE
         ADC   ]ADDR+1    ; {4C3B}
         STA   ZPW5+1     ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE INDEX
:LP
         LDA   (ZPW5),Y   ; {6C2B} GET BYTE FROM ELEMENT
         STA   RETURN,Y   ; {3C2B} PUT INTO RETURN
         INY              ; {2C1B} INCREASE BYTE INDEX
         CPY   ]ESIZEB    ; {4C3B} IF INDEX != ELEMENT LENGTH
         BNE   :LP        ; {3C2B} CONTINUE LOOP
         LDA   ]ESIZEB    ; {3C2B} .A = ELEMENT SIZE
         STA   RETLEN     ; {3C2B} STORE IN RETLEN
         LDY   ZPW5+1     ; {3C2B} .Y = ELEMENT ADDRESS HIBYTE
         LDX   ZPW5       ; {3C2B} .X = ELEMENT ADDRESS LOBYTE
         RTS              ; {6C1B}
