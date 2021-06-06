*
*``````````````````````````````*
* APUT81        (NATHAN RIGGS) *
*                              *
* PUT DATA FROM SRC LOCATION   *
* INTO 1D, 8BIT ARRAY AT THE   *
* SPECIFIED ELEMENT.           *
*                              *
*------------------------------*
* 8-BIT MULTIPLICATION CODE    *
* ADAPTED FROM WHITE FLAME'S   *
* WORK ON CODEBASE64. LICENSE  *
* MAY VARY.                    *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = SOURCE ADDRESS      *
*  ZPW2  = DESTINATION ADDRESS *
*  ZPB1  = ARRAY INDEX         *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 172+                 *
* SIZE: 100 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   ZPW1       ; SOURCE ADDRESS
]ADDRD   EQU   ZPW2       ; DESTINATION
]AIDX    EQU   ZPB1       ; ARRAY INDEX
]SCRATCH EQU   ZPW3       ; ZEROED HIBYTE
*
]ESIZE   EQU   ZPB2       ; ELEMENT SIZE
]ESIZEBK EQU   ZPB3       ; ^BACKUP
]ASIZE   EQU   ZPW4       ; # OF ELEMENTS
]IDX     EQU   ZPW5       ; INDEX
]RES     EQU   ZPW6       ; MULTIPLICATION RESULT
*
APUT81
         LDA   ]AIDX      ; {2C2B} STORE IN 2 LOCATIONS
         STA   ]IDX       ; {3C2B} FOR A BACKUP LATER
*
** MULTIPLY INDEX BY ELEM SIZE AND ADD 2
*
         LDY   #1         ; {2C2B} GET ELEMENT LENGTH FROM
         LDA   (]ADDRD),Y ; {6C2B} BYTE 1 OF ARRAY
         STA   ]ESIZE     ; {3C2B}
         STA   ]ESIZEBK   ; {3C2B}
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET NUMBER OF ELEMENTS
         STA   ]ASIZE     ; {3C2B} FROM ARRAY
         TYA              ; {2C1B} .A = 0
         STY   ]SCRATCH   ; {3C2B} LOBYTE = 0
         STY   ]SCRATCH+1 ; {3C2B} HIBYTE = 0
         BEQ   :ENTLPA    ; {3C2B} IF 0, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]AIDX      ; {4C2B} ADD INDEX LOBYTE
         TAX              ; {2C1B} TEMPORARILY STORE IN .X
         TYA              ; {2C1B} TRANSFER HIBYTE TO .A
         ADC   ]SCRATCH   ; {4C2B} ADD HIBYTE
         TAY              ; {2C1B} STORE BACK IN .Y
         TXA              ; {2C1B} RELOAD LOBYTE TO .A
:LPA
         ASL   ]AIDX      ; {6C3B} MUL INDEX BY TWO
         ROL   ]SCRATCH   ; {6C3B} ADJUST HIBYTE CARRY
:ENTLPA
         LSR   ]ESIZE     ; {6C3B} DIVIDE ELEMENT SIZE BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LPA       ; {3C2B}
         STX   ]IDX       ; {3C2B} STORE LOBYTE
         STY   ]IDX+1     ; {3C2B} STORE HIBYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   #2         ; {2C2B} ADD 2 BYTES TO INDEX
         ADC   ]IDX       ; {3C2B} TO ACCOUNT FOR HEADER
         STA   ]RES       ; {3C2B} STORE LOBYTE
         LDA   #0         ; {2C2B} ACCOUNT FOR HIBYTE CARRY
         ADC   ]IDX+1     ; {3C2B}
         STA   ]RES+1     ; {3C2B}
*
** ADD RESULT TO ARRAY ADDRESS TO GET ELEMENT ADDR
*
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   ]RES       ; {3C2B} LOAD RESULT FROM EARLIER
         ADC   ]ADDRD     ; {3C2B} ADD ARRAY ADDRESS LOBYTE
         STA   ]RES       ; {3C2B} STORE BACK IN RESULT
         LDA   ]RES+1     ; {3C2B} ADD ARRAY ADDRESS HIBYTE
         ADC   ]ADDRD+1   ; {3C2B}
         STA   ]RES+1     ; {3C2B} STORE HIBYTE
*
         STA   ]ADDRD+1   ; {3C2B} STORE IN ZERO PAGE HIBYTE
         LDA   ]RES       ; {3C2B} STORE LOBYTE TO ZERO PAGE
         STA   ]ADDRD     ; {3C2B}
*
** COPY FROM SRC ADDR3 TO ELEMENT LOCATION ADDR
*
:LP
         LDA   (]ADDRS),Y ; {6C2B} LOAD BYTE FROM SOURCE
         STA   (]ADDRD),Y ; {6C2B} STORE IN ELEMENT ADDRESS
         INY              ; {2C1B} INCREASE BYTE INDEX
         CPY   ]ESIZEBK   ; {4C3B} COMPARE TO ELEMENT SIZE
         BNE   :LP        ; {3C2B} IF !=, KEEP COPYING
*
         LDY   ]ADDRD+1   ; {3C2B} .Y = ELEMENT ADDRESS HIBYTE
         LDX   ]ADDRD     ; {3C2B} .X = LOBYTE
         LDA   ]ESIZE     ; {3C2B} .A = ELEMENT SIZE
         RTS              ; {6C1B}
