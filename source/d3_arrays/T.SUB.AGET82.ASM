*
*``````````````````````````````*
* AGET82        (NATHAN RIGGS) *
*                              *
* RETRIEVE AN ELEMENT VALUE    *
* FROM AN 8-BIT, 2D ARRAY AND  *
* HOLD IT IN THE RETURN        *
* ADDRESS, WITH ITS LENGTH IN  *
* RETLEN.                      *
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
*  WPAR1 = ARRAY ADDRESS       *
*  BPAR1 = 1ST DIM INDEX       *
*  BPAR2 = 2ND DIM INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 306+                 *
* SIZE: 189 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   WPAR1      ; ARRAY ADDRESS
]XIDX    EQU   BPAR1      ; 1ST DIMENSION INDEX
]YIDX    EQU   BPAR2      ; 2ND DIMENSION INDEX
*
]XLEN    EQU   VARTAB+0   ; X DIMENSION LENGTH
]YLEN    EQU   VARTAB+2   ; Y DIMENSION LENGTH
]PROD    EQU   VARTAB+4   ; PRODUCT
]MLIER   EQU   VARTAB+8   ; MULTIPLIER
]MCAND   EQU   VARTAB+10  ; MULTIPLICAND
]ELEN    EQU   VARTAB+12  ; ELEMENT LENGTH
]PBAK    EQU   VARTAB+14  ; PRODUCT BACKUP
*
AGET82
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   (]ADDR),Y  ; {6C2B} GET X-LENGTH FROM ARRAY
         STA   ]XLEN      ; {3C2B}
         LDY   #1         ; {2C2B} INCREMENT INDEX
         LDA   (]ADDR),Y  ; {6C2B} GET Y-LENGTH FROM ARRAY
         STA   ]YLEN      ; {3C2B}
         LDY   #2         ; {2C2B} INCREMENT INDEX
         LDA   (]ADDR),Y  ; {6C2B} GET ELEMENT LENGTH FROM ARRAY
         STA   ]ELEN      ; {3C2B}
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
         TAX              ; {2C1B} TEMPORARILY STORE IN .X
         TYA              ; {2C1B} LOAD HIBYTE TO .A
         ADC   SCRATCH    ; {4C3B} ADD HIBYTE
         TAY              ; {2C1B} TRANSFER BACK INTO .Y
         TXA              ; {2C1B} RELOAD LOBYTE
:LP
         ASL   ]YIDX      ; {6C3B} MULTIPLY Y-INDEX BY 2
         ROL   SCRATCH    ; {6C3B} DEAL WITH HIBYTE
:ENTLP
         LSR   ]YLEN      ; {6C3B} DIVIDE Y-LENGTH BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP        ; {3C2B} ELSE, LOOP
         STX   ]PBAK      ; {3C2B} STORE LOBYTE IN PRODUCT BACKUP
         STY   ]PBAK+1    ; {3C2B} STORE HIBYTE
*
** NOW MULTIPLY LENGTH OF ELEMENTS BY XIDX
*
         LDA   ]XIDX      ; {3C2B} PUT X-INDEX INTO
         STA   ]MLIER     ; {3C2B} MULTIPLIER
         LDA   ]ELEN      ; {3C2B} ELEMENT LENGTH INTO
         STA   ]MCAND     ; {3C2B} MULTIPLICAND
         LDA   #0         ; {2C2B} RESET PRODUCT LOBYTE
         STA   ]MLIER+1   ; {3C2B} RESET MULTIPLIER HIBYTE
         STA   ]MCAND+1   ; {3C2B} RESET MULTIPLICAND HIBYTE
         STA   ]PROD      ; {3C2B}
         STA   ]PROD+1    ; {3C2B} RESET PRODUCT 2ND BYTE
         STA   ]PROD+2    ; {3C2B} RESET PRODUCT 3RD BYTE
         STA   ]PROD+3    ; {3C2B} RESET PRODUCT HIBYTE
         LDX   #$10       ; {2C2B} LOAD $10 INTO .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; {6C3B} DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; {6C3B} ADJUST LOBYTE
         BCC   :ROTR      ; {3C2B} IF < PRODUCT, ROTATE
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE BACK INTO 3RD
         LDA   ]PROD+3    ; {3C2B} LOAD HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C3B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C3B} ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; {6C3B} ROTATE PRODUCT 2ND BYTE
         ROR   ]PROD      ; {6C3B} ROTATE PRODUCT LOBYTE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :SHIFTR    ; {3C2B} IF NOT 0, BACK TO SHIFTER
         LDA   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   #3         ; {2C2B} INCREASE BY 3
         STA   ]PROD      ; {3C2B} STORE BACK INTO LOBYTE
         LDA   ]PROD+1    ; {3C2B} ACCOUNT FOR CARRIES
         ADC   #0         ; {2C2B}
         STA   ]PROD+1    ; {3C2B}
*
** NOW ADD THAT TO EARLIER CALC
*
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE
         ADC   ]PBAK      ; {4C3B} ADD PREVIOUS PRODUCT
         STA   ]PROD      ; {3C2B} STORE NEW PRODUCT LOBYTE
         LDA   ]PROD+1    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]PBAK+1    ; {4C3B} ADD PREV PRODUCT HIBYTE
         STA   ]PROD+1    ; {3C2B} STORE PRODUCT HIBYTE
*
** NOW ADD ARRAY ADDRESS TO GET INDEX ADDR
*
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE
         ADC   ]ADDR      ; {4C3B} ADD ARRAY ADDRESS LOBYTE
         STA   ]PROD      ; {3C2B} STORE BACK IN PRODUCT LOBYTE
         LDA   ]PROD+1    ; {3C2B} LOAD HIBYTE
         ADC   ]ADDR+1    ; {4C3B} ADD ADDRESS HIBYTE
         STA   ]PROD+1    ; {3C2B} STORE IN PRODUCT HIBYTE
*
         LDY   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE IN .Y
         LDX   ]PROD+1    ; {3C2B} LOAD HIBYTE IN .X FOR SOME REASON
         STY   ]ADDR      ; {3C2B} TRANSFER TO ZERO PAGE
         STX   ]ADDR+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET INDEX
:RLP
         LDA   (]ADDR),Y  ; {6C2B} LOAD BYTE
         STA   RETURN,Y   ; {3C2B} STORE IN RETURN
         INY              ; {2C1B} INCREASE INDEX
         CPY   ]ELEN      ; {4C3B} IF INDEX != ELEMENT LENGTH
         BNE   :RLP       ; {3C2B} THEN KEEP COPYING
         LDA   ]ELEN      ; {3C2B} OTHERWISE, STORE ELEMENT LENGTH
         STA   RETLEN     ; {3C2B} INTO RETURN LENGTH
         LDA   RETLEN     ; {3C2B} AND IN .A
         LDX   ]ADDR      ; {3C2B} RETURN ARRAY ADDRESS LOBYTE IN .X
         LDY   ]ADDR+1    ; {3C2B} RETURN HIBYTE IN .Y
         RTS              ; {6C1B}
