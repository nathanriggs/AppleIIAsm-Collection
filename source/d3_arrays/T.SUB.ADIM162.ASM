*
*``````````````````````````````*
* ADIM162       (NATHAN RIGGS) *
*                              *
* INITIALIZE A 1-DIMENSIONAL,  *
* 16-BIT ARRAY.                *
*                              *
*------------------------------*
* MULTIPLICATION ADAPTED FROM  *
* WHITE FLAME'S WORK ON        *
* CODEBASE64. LICENSE MAY VARY *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = 1ST DIM LENGTH      *
*  ZPW2  = 2ND DIM LENGTH      *
*  ZPW3  = ARRAY ADDRESS       *
*  ZPB1  = ELEMENT LENGTH      *
*  ZPB2  = FILL VALUE          *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 398+                 *
* SIZE: 226 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]AXSIZE  EQU   ZPW1       ; FIRST DIMENSION LENGTH
]AYSIZE  EQU   ZPW2       ; SECOND DIMENSION LENGTH
]ELEN    EQU   ZPB1       ; ELEMENT BYTE LENGTH
]FILL    EQU   ZPB2       ; FILL VALUE
]ADDR    EQU   ZPW3       ; ARRAY ADDRESS
]ADDR2   EQU   ZPW4       ; ZERO-PAGE WORKING SPACE
*
]PROD    EQU   VARTAB+8   ; PRODUCT
]AXBAK   EQU   ZPW5       ; X SIZE BACKUP
]AYBAK   EQU   ZPW6       ; Y SIZE BACKUP
]MLIER   EQU   VARTAB     ; MULTIPLIER
]MCAND   EQU   VARTAB+4   ; MULTIPLICAND
*
ADIM162
         LDA   ]AYSIZE    ; {3C2B}
         STA   ]AYBAK     ; {3C2B}
         STA   ]MCAND     ; {3C2B}
         LDA   ]AYSIZE+1  ; {3C2B}
         STA   ]AYBAK+1   ; {3C2B}
         STA   ]MCAND+1   ; {3C2B}
         LDA   ]AXSIZE    ; {3C2B}
         STA   ]AXBAK     ; {3C2B}
         STA   ]MLIER     ; {3C2B}
         LDA   ]AXSIZE+1  ; {3C2B}
         STA   ]AXBAK+1   ; {3C2B}
         STA   ]MLIER+1   ; {3C2B}
         LDA   ]ADDR      ; {3C2B} GET ARRAY ADDRESS
         STA   ]ADDR2     ; {3C2B} LOBYTE; PUT IN ZERO PAGE
         LDA   ]ADDR+1    ; {3C2B} GET ARRAY ADDRESS HIBYTE
         STA   ]ADDR2+1   ; {3C2B}
*
** MULTIPLY X AND Y
*
         LDA   #0         ; {2C2B} RESET HIBYTE,LOBYTE
         STA   ]PROD+2    ; {3C2B} CLEAR PRODUCT BYTE 3
         STA   ]PROD+3    ; {3C2B} CLEAR PRODUCT BYTE 4
         LDX   #$10       ; {2C2B} (#16)
:SHIFT_R
         LSR   ]MLIER+1   ; {6C2B} DIVIDE MLIER BY TWO
         ROR   ]MLIER     ; {6C2B} ADJUST LOBYTE
         BCC   :ROT_R     ; {3C2B} IF 0 IN CARRY, ROTATE MORE
         LDA   ]PROD+2    ; {3C2B} GET 3RD BYTE OF PRODUCT
         CLC              ; {2C1B}
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE 3RD BYTE
         LDA   ]PROD+3    ; {3C2B} LOAD 4TH BYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROT_R
         ROR              ; {6C2B} ROTATE PARTIAL PRODUCT
         STA   ]PROD+3    ; {3C2B} STORE IN HIBYTE
         ROR   ]PROD+2    ; {6C2B} ROTATE THIRD BYTE
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND BYTE
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREASE COUNTER
         BNE   :SHIFT_R   ; {3C2B} IF NOT ZERO, BACK TO SHIFTER
*
         LDA   ]ELEN      ; {3C2B} PUT ELEMENT LENGTH
         STA   ]MCAND     ; {3C2B} INTO MULTIPLICAND
         LDA   #0         ; {2C2B} CLEAR HIBYTE
         STA   ]MCAND+1   ; {3C2B}
         LDA   ]PROD      ; {3C2B} LOAD EARLIER PRODUCT
         STA   ]MLIER     ; {3C2B} STORE LOBYTE IN MULTIPLIER
         LDA   ]PROD+1    ; {3C2B} DO SAME FOR HIBYTE
         STA   ]MLIER+1   ; {3C2B}
*
** NOW MULTIPLY BY LENGTH OF ELEMENTS
*
         LDA   #0         ; {2C2B} CLEAR PRODUCT
         STA   ]PROD      ; {3C2B}
         STA   ]PROD+1    ; {3C2B}
         STA   ]PROD+2    ; {3C2B}
         STA   ]PROD+3    ; {3C2B}
         LDX   #$10       ; {2C2B}
:SHIFTR  LSR   ]MLIER+1   ; {6C2B} SHIFT BYTES LEFT (/2)
         ROR   ]MLIER     ; {6C2B} ADJUST LOBYTE
         BCC   :ROTR      ; {3C2B} IF CARRY = 0, ROTATE
         LDA   ]PROD+2    ; {3C2B} LOAD 3RD BYTE OF PRODUCT
         CLC              ; {2C1B}
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE IN 3RD BYTE
         LDA   ]PROD+3    ; {3C2B} LOAD HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C2B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} ROTATE 4TH
         ROR   ]PROD+2    ; {6C2B} ROTATE 3RD
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :SHIFTR    ; {3C2B}IF NOT 0, BACK TO SHIFTER
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} INCREASE BY 5
         ADC   #5         ; {2C2B}
         STA   ]PROD      ; {3C2B} SAVE LOBYTE
         LDA   ]PROD+1    ; {3C2B}
         ADC   #0         ; {2C2B}
         STA   ]PROD+1    ; {3C2B} SAVE HIBYTE
*
** NOW CLEAR MEMORY BLOCKS, WHOLE PAGES FIRST
*
         LDA   ]FILL      ; {3C2B} GET FILL VALUE
         LDX   ]PROD+1    ; {3C2B} LOAD PRODUCT 2ND BYTE
         BEQ   :PART      ; {3C2B} IF 0, THEN PARTIAL PAGE
         LDY   #0         ; {2C2B} CLEAR INDEX
:FULL
         STA   (]ADDR),Y  ; {6C2B} COPY FILL BYTE TO ADDRESS
         INY              ; {2C1B} INCREASE BYTE COUNTER
         BNE   :FULL      ; {3C2B} LOOP UNTIL PAGES DONE
         INC   ]ADDR+1    ; {6C2B} INCREASE HIBYTE
         DEX              ; {2C1B} DECREASE COUNTER
         BNE   :FULL      ; {3C2B} LOOP UNTIL PAGES DONE
*
** NOW DO REMAINING BYTES
*
:PART
         LDX   ]PROD      ; {3C2B} LOAD PRODUCT LOBYTE IN X
         BEQ   :MFEXIT    ; {3C2B} IF 0, THEN WE'RE DONE
         LDY   #0         ; {2C2B} CLEAR BYTE INDEX
:PARTLP
         STA   (]ADDR),Y  ; {6C2B} STORE FILL BYTE
         INY              ; {2C1B} INCREASE BYTE INDEX
         DEX              ; {2C1B} DECREASE COUNTER
         BNE   :PARTLP    ; {3C2B} LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; {2C2B} CLEAR BYTE INDEX
         LDA   ]AXBAK     ; {3C2B} LOAD ORIGINAL X LENGTH
         STA   (]ADDR2),Y ; {6C2B} STORE IN ARRAY HEADER
         INY              ; {2C1B} INCREASE BYTE COUNTER
         LDA   ]AXBAK+1   ; {3C2B} STORE HIBYTE
         STA   (]ADDR2),Y ; {6C2B}
         INY              ; {2C1B} INCREASE BYTE INDEX
         LDA   ]AYBAK     ; {3C2B} LOAD Y LENGTH LOBYTE
         STA   (]ADDR2),Y ; {6C2B} STORE IN ARRAY HEADER
         INY              ; {2C1B} INCREMENT BYTE INDEX
         LDA   ]AYBAK+1   ; {3C2B} STORE Y HIBYTE
         STA   (]ADDR2),Y ; {6C2B}
         INY              ; {2C1B} INCREMENT BYTE INDEX
         LDA   ]ELEN      ; {3C2B} STORE ELEMENT LENGTH
         STA   (]ADDR2),Y ; {6C2B}
*
         LDY   ]ADDR2     ; {3C2B} LOBYTE OF ARRAY ADDRESS
         LDX   ]ADDR2+1   ; {3C2B} ARRAY ADDRESS HIBYTE
         LDA   ]PROD      ; {3C2B} STORE TOTAL ARRAY SIZE
         STA   RETURN     ; {3C2B} IN BYTES IN RETURN
         LDA   ]PROD+1    ; {3C2B}
         STA   RETURN+1   ; {3C2B}
         LDA   ]PROD+2    ; {3C2B}
         STA   RETURN+2   ; {3C2B}
         LDA   ]PROD+3    ; {3C2B}
         STA   RETURN+3   ; {3C2B}
         LDA   #4         ; {2C2B} SIZE OF RETURN
         STA   RETLEN     ; {3C2B}
         RTS              ; {6C1B}
