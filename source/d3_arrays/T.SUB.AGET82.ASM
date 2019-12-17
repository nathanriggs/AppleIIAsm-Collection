*
*``````````````````````````````*
* AGET82        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  BPAR1 = 1ST DIM INDEX       *
*  BPAR2 = 2ND DIM INDEX       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT LENGTH         *
*  RETURN = ELEMENT DATA       *
*  RETLEN = ELEMENT LENGTH     *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 288+                 *
* SIZE: 243 BYTES              *
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
         LDY   #0         ; RESET INDEX
         LDA   (]ADDR),Y  ; GET X-LENGTH FROM ARRAY
         STA   ]XLEN
         LDY   #1         ; INCREMENT INDEX
         LDA   (]ADDR),Y  ; GET Y-LENGTH FROM ARRAY
         STA   ]YLEN
         LDY   #2         ; INCREMENT INDEX
         LDA   (]ADDR),Y  ; GET ELEMENT LENGTH FROM ARRAY
         STA   ]ELEN
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   #0         ; RESET LOBYTE
         TAY              ; RESET HIBYTE
         STY   SCRATCH    ; SAVE HIBYTE IN SCRATCH
         BEQ   :ENTLP     ; IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY FLAG
         ADC   ]YIDX      ; ADD Y-INDEX
         TAX              ; TEMPORARILY STORE IN .X
         TYA              ; LOAD HIBYTE TO .A
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; TRANSFER BACK INTO .Y
         TXA              ; RELOAD LOBYTE
:LP
         ASL   ]YIDX      ; MULTIPLY Y-INDEX BY 2
         ROL   SCRATCH    ; DEAL WITH HIBYTE
:ENTLP
         LSR   ]YLEN      ; DIVIDE Y-LENGTH BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A, ADD AGAIN
         BNE   :LP        ; ELSE, LOOP
         STX   ]PBAK      ; STORE LOBYTE IN PRODUCT BACKUP
         STY   ]PBAK+1    ; STORE HIBYTE
*
** NOW MULTIPLY LENGTH OF ELEMENTS BY XIDX
*
         LDA   ]XIDX      ; PUT X-INDEX INTO
         STA   ]MLIER     ; MULTIPLIER
         LDA   ]ELEN      ; ELEMENT LENGTH INTO
         STA   ]MCAND     ; MULTIPLICAND
         LDA   #0         ; RESET PRODUCT LOBYTE
         STA   ]MLIER+1   ; RESET MULTIPLIER HIBYTE
         STA   ]MCAND+1   ; RESET MULTIPLICAND HIBYTE
         STA   ]PROD
         STA   ]PROD+1    ; RESET PRODUCT 2ND BYTE
         STA   ]PROD+2    ; RESET PRODUCT 3RD BYTE
         STA   ]PROD+3    ; RESET PRODUCT HIBYTE
         LDX   #$10       ; LOAD $10 INTO .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROTR      ; IF < PRODUCT, ROTATE
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY FLAG
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE BACK INTO 3RD
         LDA   ]PROD+3    ; LOAD HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; ROTATE PRODUCT 2ND BYTE
         ROR   ]PROD      ; ROTATE PRODUCT LOBYTE
         DEX              ; DECREMENT COUNTER
         BNE   :SHIFTR    ; IF NOT 0, BACK TO SHIFTER
         LDA   ]PROD      ; LOAD PRODUCT LOBYTE
         CLC              ; CLEAR CARRY FLAG
         ADC   #3         ; INCREASE BY 3
         STA   ]PROD      ; STORE BACK INTO LOBYTE
         LDA   ]PROD+1    ; ACCOUNT FOR CARRIES
         ADC   #0
         STA   ]PROD+1
*
** NOW ADD THAT TO EARLIER CALC
*
         CLC              ; CLEAR CARRY FLAG
         LDA   ]PROD      ; LOAD PRODUCT LOBYTE
         ADC   ]PBAK      ; ADD PREVIOUS PRODUCT
         STA   ]PROD      ; STORE NEW PRODUCT LOBYTE
         LDA   ]PROD+1    ; LOAD PRODUCT HIBYTE
         ADC   ]PBAK+1    ; ADD PREV PRODUCT HIBYTE
         STA   ]PROD+1    ; STORE PRODUCT HIBYTE
*
** NOW ADD ARRAY ADDRESS TO GET INDEX ADDR
*
         CLC              ; CLEAR CARRY FLAG
         LDA   ]PROD      ; LOAD PRODUCT LOBYTE
         ADC   ]ADDR      ; ADD ARRAY ADDRESS LOBYTE
         STA   ]PROD      ; STORE BACK IN PRODUCT LOBYTE
         LDA   ]PROD+1    ; LOAD HIBYTE
         ADC   ]ADDR+1    ; ADD ADDRESS HIBYTE
         STA   ]PROD+1    ; STORE IN PRODUCT HIBYTE
*
         LDY   ]PROD      ; LOAD PRODUCT LOBYTE IN .Y
         LDX   ]PROD+1    ; LOAD HIBYTE IN .X FOR SOME REASON
         STY   ]ADDR      ; TRANSFER TO ZERO PAGE
         STX   ]ADDR+1
         LDY   #0         ; RESET INDEX
:RLP
         LDA   (]ADDR),Y  ; LOAD BYTE
         STA   RETURN,Y   ; STORE IN RETURN
         INY              ; INCREASE INDEX
         CPY   ]ELEN      ; IF INDEX != ELEMENT LENGTH
         BNE   :RLP       ; THEN KEEP COPYING
         LDA   ]ELEN      ; OTHERWISE, STORE ELEMENT LENGTH
         STA   RETLEN     ; INTO RETURN LENGTH
         LDA   RETLEN     ; AND IN .A
         LDX   ]ADDR      ; RETURN ARRAY ADDRESS LOBYTE IN .X
         LDY   ]ADDR+1    ; RETURN HIBYTE IN .Y
         RTS
