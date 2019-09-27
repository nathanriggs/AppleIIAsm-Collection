*
*``````````````````````````````*
* APUT162       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = ARRAY ADDRESS       *
*  WPAR3 = 1ST DIM INDEX       *
*  ADDR1 = 2ND DIM INDEX       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT LENGTH         *
*  .X = ELEMENT ADDR  LOBYTE   *
*  .Y = ELEMENT ADDR  HIBYTE   *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 404+                 *
* SIZE: 273 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   WPAR1
]ADDRD   EQU   WPAR2
]XIDX    EQU   WPAR3
]YIDX    EQU   ADDR1
*
]ESIZE   EQU   VARTAB     ; ELEMENT LENGTH
]MCAND   EQU   VARTAB+6   ; MULTIPLICAND
]MLIER   EQU   VARTAB+8   ; MULTIPLIER
]PBAK    EQU   VARTAB+10  ; PRODUCT BACKUP
]XLEN    EQU   VARTAB+12  ; X-DIMENSION LENGTH
]YLEN    EQU   VARTAB+14  ; Y-DIMENSION LENGTH
]PROD    EQU   VARTAB+16  ; PRODUCT OF MULTIPLICATION
*
APUT162
         LDY   #4         ; LOAD BYTE 4 OF ARRAY
         LDA   (]ADDRD),Y ; HEADER TO GET ELEMENT LENGTH
         STA   ]ESIZE
         LDY   #0         ; LOAD BYTE 0 TO GET
         LDA   (]ADDRD),Y ; X-DIMENSION LENGTH LOBYTE
         STA   ]XLEN
         LDY   #1         ; LOAD BYTE 1 TO GET
         LDA   (]ADDRD),Y ; X-DIMENSION LENGTH HIBYTE
         STA   ]XLEN+1
         LDY   #2         ; LOAD BYTE 2 TO GET THE
         LDA   (]ADDRD),Y ; Y-DIMENSION LENGTH LOBYTE
         STA   ]YLEN
         LDY   #3         ; LOAD BYTE 3 TO GET THE
         LDA   (]ADDRD),Y ; Y-DIMENSION LENGTH HIBYTE
         STA   ]YLEN+1
         LDY   #0         ; RESET BYTE INDEX
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   ]YIDX      ; LOAD Y-INDEX LOBYTE
         STA   ]MLIER     ; PUT IN MULTIPLIER LOBYTE
         LDA   ]YIDX+1    ; DO SAME FOR HIBYTES
         STA   ]MLIER+1
         LDA   ]YLEN      ; PUT Y-DIM LENGTH LOBYTE
         STA   ]MCAND     ; INTO MULTIPLICAND
         LDA   ]YLEN+1    ; DO SAME FOR HIBYTE
         STA   ]MCAND+1
         LDA   #00        ; CLEAR PRODUCT BYTES
         STA   ]PROD
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       ; INIT COUNTER TO #16
:SHIFT_R
         LSR   ]MLIER+1   ; DIVIDE MULTIPLIER HIBYTE BY 2
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROT_R     ; IF 0 PUT IN CARRY, ROTATE PRODUCT
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE 3RD BYTE
         LDA   ]PROD+3    ; LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROT_R
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE 3RD BYTE
         ROR   ]PROD+1    ; ROTATE 2ND
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREASE X COUNTER
         BNE   :SHIFT_R   ; IF NOT ZERO, LOOP AGAIN
*
** NOW MULTIPLY XIDX BY ELEMENT SIZE
*
         LDA   ]PROD      ; BACKUP PREVIOUS
         STA   ]PBAK      ; PRODUCT FOR USE LATER
         LDA   ]PROD+1    ; DO SAME FOR HIBYTE
         STA   ]PBAK+1
         LDA   ]XIDX      ; PUT X-INDEX LOBYTE
         STA   ]MLIER     ; INTO MULTIPLIER
         LDA   ]XIDX+1    ; DO SAME FOR HIBYTE
         STA   ]MLIER+1
         LDA   ]ESIZE     ; PUT ELEMENT SIZE
         STA   ]MCAND     ; INTO MULTIPLICAND
         LDA   #0         ; CLEAR MULTIPLICAND HIBYTE
         STA   ]MCAND+1
*
         STA   ]PROD      ; CLEAR PRODUCT
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       ; INIT X COUNTER TO #16
:SHIFTR  LSR   ]MLIER+1   ; DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROTR      ; IF 0 PUT INTO CARRY, ROTATE PROD
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY
         ADC   ]MCAND     ; ADD MULTIPLICAND LOBYTE
         STA   ]PROD+2
         LDA   ]PROD+3    ; LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; HAD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE 3RD BYTE
         ROR   ]PROD+1    ; ROTATE 2ND BYTE
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREASE X COUNTER
         BNE   :SHIFTR    ; IF NOT 0, KEEP LOOPING
*
** NOW ADD X * ESIZE TO RUNNING PRODUCT
*
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; ADD CURRENT PRODUCT
         ADC   ]PBAK      ; TO PREVIOUS PRODUCT
         STA   ]PROD      ; AND STORE BACK IN PRODUCT
         LDA   ]PROD+1
         ADC   ]PBAK+1
         STA   ]PROD+1
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; INCREASE LOBYTE BY 5
         ADC   #5         ; TO ACCOUNT FOR ARRAY
         STA   ]PROD      ; HEADER
         LDA   ]PROD+1
         ADC   #0         ; ADJUST HIBYTE
         STA   ]PROD+1
*
** ADD ARRAY ADDRESS TO GET INDEX
*
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; ADD ARRAY ADDRESS
         ADC   ]ADDRD     ; TO PRODUCT TO GET
         STA   ADDR2      ; ELEMENT ADDRESS; STORE
         LDA   ]PROD+1    ; ADDRESS ON ZERO PAGE
         ADC   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0         ; RESET BYTE INDEX
:CLP
         LDA   (]ADDRS),Y ; LOAD BYTE FROM SOURCE
         STA   (ADDR2),Y  ; STORE AT ELEMENT ADDRESS
         INY              ; INCREASE BYTE INDEX
         CPY   ]ESIZE     ; IF != ELEMENT LENGTH, LOOP
         BNE   :CLP
         LDY   ADDR2+1    ; .Y = ELEMENT ADDRESS HIBYTE
         LDX   ADDR2      ; .X = ELEMENT ADDRESS LOBYTE
         LDA   ]ESIZE     ; .A = ELEMENT LENGTH
         RTS
