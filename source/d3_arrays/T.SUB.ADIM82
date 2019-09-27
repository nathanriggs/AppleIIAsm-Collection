*
*``````````````````````````````*
* ADIM82        (NATHAN RIGGS) *
*                              *
* INITIALIZE AN 8BIT, 2D ARRAY *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  WPAR2 = 1ST DIM LENGTH      *
*  WPAR3 = 2ND DIM LENGTH      *
*  BPAR1 = FILL VALUE          *
*  BPAR2 = ELEMENT LENGTH      *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT SIZE           *
*  RETURN = TOTAL ARRAY SIZE   *
*  RETLEN = 4                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 282+                 *
* SIZE: 244 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   WPAR1      ; ARRAY ADDRESS
]AXSIZE  EQU   WPAR2      ; FIRST DIM # OF ELEMENTS
]AYSIZE  EQU   WPAR3      ; SECOND DIM # OF ELEMENTS
]FILL    EQU   BPAR1      ; FILL VALUE
]ESIZE   EQU   BPAR2      ; ELEMENT SIZE
*
]PROD    EQU   VARTAB     ; PRODUCT
]AXBAK   EQU   VARTAB+4   ; ARRAY X SIZE BACKUP
]AYBAK   EQU   VARTAB+5   ; ARRAY Y SIZE BACKUP
]MLIER   EQU   VARTAB+6   ; MULTIPLIER
]MCAND   EQU   VARTAB+8   ; MULTIPLICAND, ELEMENT SIZE
*
ADIM82
         LDA   ]ESIZE     ; ELEMENT LENGTH
         STA   ]MCAND     ; AND STORE AS MULTIPLICAND
         LDA   ]AYSIZE    ; GET ARRAY Y SIZE
         STA   ]AYBAK     ; BACK IT UP
         LDA   ]AXSIZE
         STA   ]AXBAK     ; AND BACK THAT UP TOO
         LDA   #0         ; CLEAR MCAND HIBYTE
         STA   ]MCAND+1
*
** MULTIPLY X AND Y
*
         TAY              ; AND LOBYTE
         STY   SCRATCH
         BEQ   :ENTLP     ; IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; CLEAR CARRY FLAG
         ADC   ]AXSIZE    ; ADD X LENGTH
         TAX              ; TEMPORARILY STORE IN .X
         TYA              ; TRANSFER HIBYTE TO .A
         ADC   SCRATCH    ; ADD HIBYTE
         TAY              ; STORE BACK IN .Y
         TXA              ; RELOAD LOBYTE INTO .A
:LP
         ASL   ]AXSIZE    ; MULTIPLY X LENGTH BY 2
         ROL   SCRATCH    ; ADJUST HIBYTE
:ENTLP
         LSR   ]AYSIZE    ; DIVIDE Y LENGTH BY 2
         BCS   :DOADD     ; IF >= LOBYTE IN .A,
         BNE   :LP        ; ADD AGAIN; OTHERWISE, LOOP
         STX   ]MLIER     ; STORE LOBYTE IN MULTIPLIER
         STY   ]MLIER+1   ; STORE HIBYTE IN MULTIPLIER
*
** NOW MULTIPLY BY LENGTH OF ELEMENTS
*
         LDA   #0         ; CLEAR PRODUCT LOBYTE
         STA   ]PROD
         STA   ]PROD+1    ; CLEAR NEXT BYTE
         STA   ]PROD+2    ; CLEAR NEXT BYTE
         STA   ]PROD+3    ; CLEAR HIBYTE
         LDX   #$10       ; LOAD $10 IN .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; DIVIDE MLIER BY TWO
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROTR      ; IF LESS THAN PRODUCT, ROTATE
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE BACK INTO PRODUCT 3RD BYTE
         LDA   ]PROD+3    ; LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; ROTATE PRODUCT 2ND BYTE
         ROR   ]PROD      ; ROTATE PRODUCT LOBYTE
         DEX              ; DECREMENT COUNTER
         BNE   :SHIFTR    ; IF NOT 0, BACK TO SHIFTER
*
         LDA   ]PROD      ; LOAD PRODUCT LOBYTE TO .A
         CLC              ; CLEAR CARRY FLAG
         ADC   #3         ; ADD 3
         STA   ]PROD      ; STORE BACK INTO PRODUCT LOBYTE
         LDA   ]PROD+1
         ADC   #0         ; INITIATE CARRY FOR 2ND BYTE
         STA   ]PROD+1
         LDA   ]PROD+2
         ADC   #0         ; AND THIRD BYTE
         STA   ]PROD+2
*
** NOW CLEAR MEMORY BLOCKS, WHOLE PAGES FIRST
*
         LDA   ]FILL      ; GET FILL VALUE
         LDX   ]PROD+1    ; LOAD SECOND BYTE OF PRODUCT
         BEQ   :PART      ; IF 0, THEN ONLY PARTIAL PAGE
         LDY   #0         ; CLEAR INDEX
:FULL
         STA   (]ADDR),Y  ; COPY FILL BYTE TO ADDRESS
         INY              ; INCREASE INDEX
         BNE   :FULL      ; IF NO OVERFLOW, KEEP FILL
         INC   ]ADDR+1    ; INCREASE ADDRESS HIBYTE
         DEX              ; DECREMENT COUNTER
         BNE   :FULL      ; LOOP UNTIL PAGES DONE
:PART
         LDX   ]PROD      ; LOAD PRODUCT LOBYTE TO X
         BEQ   :MFEXIT    ; IF ZERO, THEN WE'RE DONE
         LDY   #0         ; RESET INDEX
:PARTLP
         STA   (]ADDR),Y  ; STORE FILL BYTE
         INY              ; INCREASE INDEX
         DEX              ; DECREASE COUNTER
         BNE   :PARTLP    ; LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; RESET INDEX
         LDA   ]AXBAK     ; PUT X LENGTH INTO
         STA   (]ADDR),Y  ; FIRST BYTE OF ARRAY
         INY              ; INCREMENT INDEX
         LDA   ]AYBAK     ; PUT Y LENGTH INTO
         STA   (]ADDR),Y  ; SECOND BYTE OF ARRAY
         INY              ; INCREMENT INDEX
         LDA   ]MCAND     ; PUT ELEMENT SIZE
         STA   (]ADDR),Y  ; INTO 3RD BYTE OF ARRAY
         LDX   ]ADDR      ; RETURN ARRAY ADDR LOBYTE IN .X
         LDY   ]ADDR+1    ; RETURN ARRAY ADDR HIBYTE IN .Y
         LDA   ]PROD      ; STORE PRODUCT LOBYTE IN RETURN
         STA   RETURN
         LDA   ]PROD+1    ; STORE NEXT BYTE
         STA   RETURN+1
         LDA   ]PROD+2    ; NEXT BYTE
         STA   RETURN+2
         LDA   ]PROD+3    ; STORE HIBYTE
         STA   RETURN+3
         LDA   #4         ; SIZE OF RETURN
         STA   RETLEN     ; SPECIFY RETURN LENGTH
         LDA   ]MCAND     ; RETURN ELEMENT SIZE IN .A
         RTS
