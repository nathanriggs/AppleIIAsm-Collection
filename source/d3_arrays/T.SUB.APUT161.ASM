*
*``````````````````````````````*
* APUT161       (NATHAN RIGGS) *
*                              *
*------------------------------*
* MULTIPLICATION CODE ADAPTED  *
* FROM WHITE FLAME'S WORK ON   *
* CODEBASE64. MICENSE MAY VARY *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = SOURCE ADDRESS      *
*  ZPW2  = ARRAY ADDRESS       *
*  ZPW3  = ELEMENT INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 184+                 *
* SIZE: 109 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   ZPW1       ; SOURCE ADDRESS
]ADDRD   EQU   ZPW2       ; ARRAY DESTINATION ADDRESS
]AIDX    EQU   ZPW3       ; ELEMENT INDEX
*
]ESIZE   EQU   ZPB1       ; ELEMENT SIZE
]ESIZEB  EQU   ZPB2       ; ^BACKUP
]ASIZE   EQU   VARTAB     ; NUMBER OF ELEMENTS
]IDX     EQU   VARTAB+2   ; ANOTHER INDEX
*
APUT161
         LDA   ]AIDX      ; {3C2B}
         STA   ]IDX       ; {3C2B}
         LDA   ]AIDX+1    ; {3C2B}
         STA   ]IDX+1     ; {3C2B}
         STA   ZPB4       ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE COUNTER
         LDA   (]ADDRD),Y ; {6C2B} GET NUMBER OF ELEMENTS
         STA   ]ASIZE     ; {3C2B} LOBYTE
         LDY   #1         ; {2C2B} INCREMENT INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET NUMBER OF ELEMENTS
         STA   ]ASIZE+1   ; {3C2B} HIBYTE
         INY              ; {2C1B} INCREMENT INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET ELEMENT LENGTH
         STA   ]ESIZE     ; {3C2B}
         STA   ]ESIZEB    ; {3C2B} BACKUP
*
** MULTIPLY INDEX BY ELEMENT SIZE, THEN ADD 3
*
         LDY   #0         ; {2C2B} RESET LOBYTE
         LDA   #0         ; {2C2B} AND HIBYTE
         BEQ   :ENTLPA    ; {3C2B} SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]AIDX      ; {4C3B} ADD INDEX LOBYTE
         TAX              ; {2C1B} HOLD IN .X
         TYA              ; {2C1B} LOAD HIBYTE
         ADC   ZPB4       ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} HOLD BACK IN .Y
         TXA              ; {2C1B} RETURN LOBYTE TO .A
:LPA
         ASL   ]AIDX      ; {6C2B} MULTIPLY INDEX BY 2
         ROL   ZPB4       ; {6C2B} ADJUST HIBYTE
:ENTLPA
         LSR   ]ESIZE     ; {6C2B} DIVIDE ELEM LENGTH BY 2
         BCS   :DOADD     ; {3C2B} IF 1 SHIFTED TO CARRY, ADD AGAIN
         BNE   :LPA       ; {3C2B} CONTINUE LOOP IF ZERO UNSET
         STX   ]IDX       ; {3C2B} LOBYTE IN .X
         STY   ]IDX+1     ; {3C2B} HIBYTE IN .Y
         CLC              ; {2C1B}
         LDA   #3         ; {2C2B} ADD 3 TO LOBYTE
         ADC   ]IDX       ; {4C3B}
         STA   ZPW6       ; {3C2B} STORE ON ZERO PAGE
         LDA   ]IDX+1     ; {3C2B} ADJUST HIBYTE
         ADC   #0         ; {4C3B}
         STA   ZPW6+1     ; {3C2B}
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ZPW6       ; {3C2B} ADD ARRAY ADDRESS
         ADC   ]ADDRD     ; {4C3B} LOBYTE
         STA   ZPW6       ; {3C2B} ADD ARRAY ADDRESS
         LDA   ZPW6+1     ; {3C2B} HIBYTE
         ADC   ]ADDRD+1   ; {4C3B}
         STA   ZPW6+1     ; {3C2B}
         LDY   #0         ; {2C2B}
:LP
*
** OOPS; NEED TO CONVERT THIS TO 16 BITS
*
         LDA   (]ADDRS),Y ; {6C2B} GET BYTE FROM SOURCE
         STA   (ZPW6),Y   ; {3C2B} STORE IN ELEMENT
         INY              ; {2C1B} INCREMENT BYTE INDEX
         CPY   ]ESIZEB    ; {4C3B} IF INDEX != ELEMENT LENGTH
         BNE   :LP        ; {3C2B} KEEP LOOPING
         LDY   ZPW6+1     ; {3C2B} HIBYTE OF ELEMENT ADDRESS
         LDX   ZPW6       ; {3C2B} LOBYTE
         LDA   ]ESIZEB    ; {3C2B} .A = ELEMENT SIZE
         RTS              ; {6C1B}
