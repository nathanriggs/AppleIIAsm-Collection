*
*``````````````````````````````*
* APUT82        (NATHAN RIGGS) *
*                              *
* PUT DATA FROM SOURCE INTO    *
* A 2D, 8BIT ARRAY ELEMENT.    *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = ARRAY ADDRESS       *
*  BPAR1 = 1ST DIM INDEX       *
*  BPAR2 = 2ND DIM INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 302+                 *
* SIZE: 188 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   WPAR1      ; SOURCE ADDRESS
]ADDRD   EQU   WPAR2      ; ARRAY ADDRESS
]XIDX    EQU   BPAR1      ; X INDEX
]YIDX    EQU   BPAR2      ; Y INDEX
*
]ESIZE   EQU   VARTAB     ; ELEMENT LENGTH
]MCAND   EQU   VARTAB+1   ; MULTIPLICAND
]MLIER   EQU   VARTAB+3   ; MULTIPLIER
]PROD    EQU   VARTAB+5   ; PRODUCT
]XLEN    EQU   VARTAB+9   ; ARRAY X-LENGTH
]YLEN    EQU   VARTAB+13  ; ARRAY Y-LENGTH
]PBAK    EQU   VARTAB+15  ; PRODUCT BACKUP
*
APUT82
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET ARRAY X-LENGTH
         STA   ]XLEN      ; {3C2B}
         LDY   #1         ; {2C2B} INCREMENT INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET ARRAY Y-LENGTH
         STA   ]YLEN      ; {3C2B}
         LDY   #2         ; {2C2B} INCREMENT INDEX
         LDA   (]ADDRD),Y ; {6C2B} GET ARRAY ELEMENT LENGTH
         STA   ]ESIZE     ; {3C2B}
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   #0         ; {2C2B} RESET LOBYTE
         TAY              ; {2C1B} RESET HIBYTE
         STY   SCRATCH    ; {3C2B} SAVE HIBYTE IN SCRATCH
         BEQ   :ENTLP     ; {3C2B} IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]YIDX      ; {4C3B} ADD Y-INDEX
         TAX              ; {2C1B} STORE IN .X
         TYA              ; {2C1B} LOAD HIBYTE
         ADC   SCRATCH    ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} STORE IN .Y
         TXA              ; {2C1B} RELOAD LOBYTE
:LP
         ASL   ]YIDX      ; {6C3B} MULTIPLY Y-INDEX BY 2
         ROL   SCRATCH    ; {6C3B} DEAL WITH HIBYTE
:ENTLP
         LSR   ]YLEN      ; {6C3B} DIVIDE Y-LENGTH BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE, ADD AGAIN
         BNE   :LP        ; {3C2B} ELSE, LOOP
         STX   ]PBAK      ; {3C2B} STORE LOBYTE IN PRODUCT BACKUP
         STY   ]PBAK+1    ; {3C2B} STORE HIBYTE
         LDA   ]XIDX      ; {3C2B} PUT X-INDEX INTO MULTIPLIER
         STA   ]MLIER     ; {3C2B}
         LDA   #0         ; {2C2B} RESET HIBYTE
         STA   ]MLIER+1   ; {3C2B} TRANSFER HIBYTE
         LDA   ]ESIZE     ; {3C2B} PUT ELEMENT LENGTH
         STA   ]MCAND     ; {3C2B} INTO MULTIPLICAND
         LDA   #0         ; {2C2B} RESET HIBYTE
         STA   ]MCAND+1   ; {3C2B}
*
** NOW MULTIPLY XIDX BY ELEMENT LENGTH
*
         STA   ]PROD      ; {3C2B} RESET PRODUCT LOBYTE
         STA   ]PROD+1    ; {3C2B} RESET 2ND BYTE
         STA   ]PROD+2    ; {3C2B} RESET 3RD BYTE
         STA   ]PROD+3    ; {3C2B} RESET HIBYTE
         LDX   #$10       ; {2C2B} LOAD $10 INTO .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; {6C3B} DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; {6C3B} DEAL WITH HIBYTE
         BCC   :ROTR      ; {3C2B} IF < RODUCT, ROTATE
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE 3RD BYTE
         LDA   ]PROD+3    ; {3C2B} LOAD HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C3B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C3B} ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; {6C3B} ROTATE RODUCT 2ND
         ROR   ]PROD      ; {6C3B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :SHIFTR    ; {3C2B} IF NOT 0, BACK TO SHIFTER
*
** NOW ADD PRODUCT TO REST
*
         LDA   ]PBAK      ; {3C2B} LOAD FIRST PRODUCT LOBYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]PROD      ; {4C3B} ADD 2ND PRODUCT LOBYTE
         STA   ]PROD      ; {3C2B} STORE NEW PRODUCT LOBYTE
         LDA   ]PBAK+1    ; {3C2B} LOAD FIRST PRODUCT HIBYTE
         ADC   ]PROD+1    ; {4C3B} ADD 2ND HIBYTE
         STA   ]PROD+1    ; {3C2B} STORE HIBYTE
         LDA   ]PROD      ; {3C2B} LOAD NEW PRODUCT LOBYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   #3         ; {4C3B} INCREASE BY 3
         STA   ]PROD      ; {3C2B} STORE IN LOBYTE
         LDA   ]PROD+1    ; {3C2B} APPLY CARRY TO HIBYTE
         ADC   #0         ; {2C2B}
         STA   ]PROD+1    ; {3C2B}
*
** ADD ARRAY ADDRESS TO GET INDEX
*
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE
         ADC   ]ADDRD     ; {4C3B} ADD ARRAY ADDRESS LOBYTE
         STA   ]PROD      ; {3C2B} STORE IN PRODUCT
         LDA   ]PROD+1    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]ADDRD+1   ; {4C3B} ADD ARRAYH ADDRESS HIBYTE
         STA   ]PROD+1    ; {3C2B} STORE HIBYTE
         LDX   ]PROD      ; {3C2B} PUT ELEMENT ADDRESS LOBYTE IN .X
         LDY   ]PROD+1    ; {3C2B} PUT HIBYTE IN Y
         STX   ADDR2      ; {3C2B} STORE IN ZERO PAGE
         STY   ADDR2+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET INDEX
*
** COPY FROM SRC ADDR TO DEST ADDR
*
:CLP
         LDA   (]ADDRS),Y ; {6C2B} GET BYTE FROM SOURCE
         STA   (ADDR2),Y  ; {3C2B} STORE IN ELEMENT
         INY              ; {2C1B} INCREASE INDEX
         CPY   ]ESIZE     ; {4C3B} IF < ELEMENT SIZE,
         BNE   :CLP       ; {3C2B} CONTINUE COPYING
         LDX   ADDR2      ; {3C2B} PUT ELEMENT LOBYTE IN .X
         LDY   ADDR2+1    ; {3C2B} PUT HIBYTE IN .Y
         LDA   ]ESIZE     ; {3C2B} PUT ELEMENT SIZE IN .A
         RTS              ; {6C1B}
