*
*``````````````````````````````*
* ADIM162       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = 1ST DIM LENGTH      *
*  WPAR2 = 2ND DIM LENGTH      *
*  WPAR3 = ARRAY ADDRESS       *
*  BPAR1 = ELEMENT LENGTH      *
*  BPAR2 = FILL VALUE          *
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
* CYCLES: 426+                 *
* SIZE: 312 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]AXSIZE  EQU   WPAR1
]AYSIZE  EQU   WPAR2
]ELEN    EQU   BPAR1
]FILL    EQU   BPAR2
]ADDR    EQU   WPAR3
]ADDR2   EQU   ADDR1
*
]PROD    EQU   VARTAB     ; PRODUCT
]AXBAK   EQU   VARTAB+4   ; X SIZE BACKUP
]AYBAK   EQU   VARTAB+6   ; Y SIZE BACKUP
]MLIER   EQU   VARTAB+8   ; MULTIPLIER
]MCAND   EQU   VARTAB+10  ; MULTIPLICAND
*
ADIM162
         LDA   ]AYSIZE
         STA   ]AYBAK
         STA   ]MCAND
         LDA   ]AYSIZE+1
         STA   ]AYBAK+1
         STA   ]MCAND+1
         LDA   ]AXSIZE
         STA   ]AXBAK
         STA   ]MLIER
         LDA   ]AXSIZE+1
         STA   ]AXBAK+1
         STA   ]MLIER+1
         LDA   ]ADDR      ; GET ARRAY ADDRESS
         STA   ]ADDR2     ; LOBYTE; PUT IN ZERO PAGE
         LDA   ]ADDR+1    ; GET ARRAY ADDRESS HIBYTE
         STA   ]ADDR2+1
*
** MULTIPLY X AND Y
*
         LDA   #0         ; RESET HIBYTE,LOBYTE
         STA   ]PROD+2    ; CLEAR PRODUCT BYTE 3
         STA   ]PROD+3    ; CLEAR PRODUCT BYTE 4
         LDX   #$10       ; (#16)
:SHIFT_R
         LSR   ]MLIER+1   ; DIVIDE MLIER BY TWO
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROT_R     ; IF 0 IN CARRY, ROTATE MORE
         LDA   ]PROD+2    ; GET 3RD BYTE OF PRODUCT
         CLC
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE 3RD BYTE
         LDA   ]PROD+3    ; LOAD 4TH BYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROT_R
         ROR              ; ROTATE PARTIAL PRODUCT
         STA   ]PROD+3    ; STORE IN HIBYTE
         ROR   ]PROD+2    ; ROTATE THIRD BYTE
         ROR   ]PROD+1    ; ROTATE 2ND BYTE
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREASE COUNTER
         BNE   :SHIFT_R   ; IF NOT ZERO, BACK TO SHIFTER
*
         LDA   ]ELEN      ; PUT ELEMENT LENGTH
         STA   ]MCAND     ; INTO MULTIPLICAND
         LDA   #0         ; CLEAR HIBYTE
         STA   ]MCAND+1   ;
         LDA   ]PROD      ; LOAD EARLIER PRODUCT
         STA   ]MLIER     ; STORE LOBYTE IN MULTIPLIER
         LDA   ]PROD+1    ; DO SAME FOR HIBYTE
         STA   ]MLIER+1
*
** NOW MULTIPLY BY LENGTH OF ELEMENTS
*
         LDA   #0         ; CLEAR PRODUCT
         STA   ]PROD
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10
:SHIFTR  LSR   ]MLIER+1   ; SHIFT BYTES LEFT (/2)
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROTR      ; IF CARRY = 0, ROTATE
         LDA   ]PROD+2    ; LOAD 3RD BYTE OF PRODUCT
         CLC
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE IN 3RD BYTE
         LDA   ]PROD+3    ; LOAD HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; ROTATE 4TH
         ROR   ]PROD+2    ; ROTATE 3RD
         ROR   ]PROD+1    ; ROTATE 2ND
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREMENT COUNTER
         BNE   :SHIFTR    ; IF NOT 0, BACK TO SHIFTER
*
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; INCREASE BY 5
         ADC   #5
         STA   ]PROD      ; SAVE LOBYTE
         LDA   ]PROD+1
         ADC   #0
         STA   ]PROD+1    ; SAVE HIBYTE
*
** NOW CLEAR MEMORY BLOCKS, WHOLE PAGES FIRST
*
         LDA   ]FILL      ; GET FILL VALUE
         LDX   ]PROD+1    ; LOAD PRODUCT 2ND BYTE
         BEQ   :PART      ; IF 0, THEN PARTIAL PAGE
         LDY   #0         ; CLEAR INDEX
:FULL
         STA   (]ADDR),Y  ; COPY FILL BYTE TO ADDRESS
         INY              ; INCREASE BYTE COUNTER
         BNE   :FULL      ; LOOP UNTIL PAGES DONE
         INC   ]ADDR+1    ; INCREASE HIBYTE
         DEX              ; DECREASE COUNTER
         BNE   :FULL      ; LOOP UNTIL PAGES DONE
*
** NOW DO REMAINING BYTES
*
:PART
         LDX   ]PROD      ; LOAD PRODUCT LOBYTE IN X
         BEQ   :MFEXIT    ; IF 0, THEN WE'RE DONE
         LDY   #0         ; CLEAR BYTE INDEX
:PARTLP
         STA   (]ADDR),Y  ; STORE FILL BYTE
         INY              ; INCREASE BYTE INDEX
         DEX              ; DECREASE COUNTER
         BNE   :PARTLP    ; LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; CLEAR BYTE INDEX
         LDA   ]AXBAK     ; LOAD ORIGINAL X LENGTH
         STA   (]ADDR2),Y ; STORE IN ARRAY HEADER
         INY              ; INCREASE BYTE COUNTER
         LDA   ]AXBAK+1   ; STORE HIBYTE
         STA   (]ADDR2),Y
         INY              ; INCREASE BYTE INDEX
         LDA   ]AYBAK     ; LOAD Y LENGTH LOBYTE
         STA   (]ADDR2),Y ; STORE IN ARRAY HEADER
         INY              ; INCREMENT BYTE INDEX
         LDA   ]AYBAK+1   ; STORE Y HIBYTE
         STA   (]ADDR2),Y
         INY              ; INCREMENT BYTE INDEX
         LDA   ]ELEN      ; STORE ELEMENT LENGTH
         STA   (]ADDR2),Y
*
         LDY   ]ADDR2     ; LOBYTE OF ARRAY ADDRESS
         LDX   ]ADDR2+1   ; ARRAY ADDRESS HIBYTE
         LDA   ]PROD      ; STORE TOTAL ARRAY SIZE
         STA   RETURN     ; IN BYTES IN RETURN
         LDA   ]PROD+1
         STA   RETURN+1
         LDA   ]PROD+2
         STA   RETURN+2
         LDA   ]PROD+3
         STA   RETURN+3
         LDA   #4         ; SIZE OF RETURN
         STA   RETLEN
         RTS
