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
* OUTPUT:                      *
*                              *
*  .A = ELEMENT SIZE           *
*  .X = ELEMENT ADDR LOBYTE    *
*  .Y = ELEMENT ADDR HIBYTE    *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 274                  *
* SIZE: 239 BYTES              *
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
         LDY   #0         ; RESET INDEX
         LDA   (]ADDRD),Y ; GET ARRAY X-LENGTH
         STA   ]XLEN
         LDY   #1         ; INCREMENT INDEX
         LDA   (]ADDRD),Y ; GET ARRAY Y-LENGTH
         STA   ]YLEN
         LDY   #2         ; INCREMENT INDEX
         LDA   (]ADDRD),Y ; GET ARRAY ELEMENT LENGTH
         STA   ]ESIZE
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
         TAX              ; STORE IN .X
         TYA              ; LOAD HIBYTE
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; STORE IN .Y
         TXA              ; RELOAD LOBYTE
:LP
         ASL   ]YIDX      ; MULTIPLY Y-INDEX BY 2
         ROL   SCRATCH    ; DEAL WITH HIBYTE
:ENTLP
         LSR   ]YLEN      ; DIVIDE Y-LENGTH BY 2
         BCS   :DOADD     ; IF >= LOBYTE, ADD AGAIN
         BNE   :LP        ; ELSE, LOOP
         STX   ]PBAK      ; STORE LOBYTE IN PRODUCT BACKUP
         STY   ]PBAK+1    ; STORE HIBYTE
         LDA   ]XIDX      ; PUT X-INDEX INTO MULTIPLIER
         STA   ]MLIER
         LDA   #0         ; RESET HIBYTE
         STA   ]MLIER+1   ; TRANSFER HIBYTE
         LDA   ]ESIZE     ; PUT ELEMENT LENGTH
         STA   ]MCAND     ; INTO MULTIPLICAND
         LDA   #0         ; RESET HIBYTE
         STA   ]MCAND+1
*
** NOW MULTIPLY XIDX BY ELEMENT LENGTH
*
         STA   ]PROD      ; RESET PRODUCT LOBYTE
         STA   ]PROD+1    ; RESET 2ND BYTE
         STA   ]PROD+2    ; RESET 3RD BYTE
         STA   ]PROD+3    ; RESET HIBYTE
         LDX   #$10       ; LOAD $10 INTO .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; DEAL WITH HIBYTE
         BCC   :ROTR      ; IF < RODUCT, ROTATE
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY FLAG
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE 3RD BYTE
         LDA   ]PROD+3    ; LOAD HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; ROTATE RODUCT 2ND
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREMENT COUNTER
         BNE   :SHIFTR    ; IF NOT 0, BACK TO SHIFTER
*
** NOW ADD PRODUCT TO REST
*
         LDA   ]PBAK      ; LOAD FIRST PRODUCT LOBYTE
         CLC              ; CLEAR CARRY FLAG
         ADC   ]PROD      ; ADD 2ND PRODUCT LOBYTE
         STA   ]PROD      ; STORE NEW PRODUCT LOBYTE
         LDA   ]PBAK+1    ; LOAD FIRST PRODUCT HIBYTE
         ADC   ]PROD+1    ; ADD 2ND HIBYTE
         STA   ]PROD+1    ; STORE HIBYTE
         LDA   ]PROD      ; LOAD NEW PRODUCT LOBYTE
         CLC              ; CLEAR CARRY FLAG
         ADC   #3         ; INCREASE BY 3
         STA   ]PROD      ; STORE IN LOBYTE
         LDA   ]PROD+1    ; APPLY CARRY TO HIBYTE
         ADC   #0
         STA   ]PROD+1
*
** ADD ARRAY ADDRESS TO GET INDEX
*
         CLC              ; CLEAR CARRY FLAG
         LDA   ]PROD      ; LOAD PRODUCT LOBYTE
         ADC   ]ADDRD     ; ADD ARRAY ADDRESS LOBYTE
         STA   ]PROD      ; STORE IN PRODUCT
         LDA   ]PROD+1    ; LOAD PRODUCT HIBYTE
         ADC   ]ADDRD+1   ; ADD ARRAYH ADDRESS HIBYTE
         STA   ]PROD+1    ; STORE HIBYTE
         LDX   ]PROD      ; PUT ELEMENT ADDRESS LOBYTE IN .X
         LDY   ]PROD+1    ; PUT HIBYTE IN Y
         STX   ADDR2      ; STORE IN ZERO PAGE
         STY   ADDR2+1
         LDY   #0         ; RESET INDEX
*
** COPY FROM SRC ADDR TO DEST ADDR
*
:CLP
         LDA   (]ADDRS),Y ; GET BYTE FROM SOURCE
         STA   (ADDR2),Y  ; STORE IN ELEMENT
         INY              ; INCREASE INDEX
         CPY   ]ESIZE     ; IF < ELEMENT SIZE,
         BNE   :CLP       ; CONTINUE COPYING
         LDX   ADDR2      ; PUT ELEMENT LOBYTE IN .X
         LDY   ADDR2+1    ; PUT HIBYTE IN .Y
         LDA   ]ESIZE     ; PUT ELEMENT SIZE IN .A
         RTS
