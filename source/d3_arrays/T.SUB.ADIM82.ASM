*
*``````````````````````````````*
* ADIM82        (NATHAN RIGGS) *
*                              *
* DECLARE THE DIMENSIONS OF A  *
* NEW 8-BIT, 2D ARRAY.         *
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
*  WPAR2 = 1ST DIM LENGTH      *
*  WPAR3 = 2ND DIM LENGTH      *
*  BPAR1 = FILL VALUE          *
*  BPAR2 = ELEMENT LENGTH      *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 309+                 *
* SIZE: 197 BYTES              *
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
         LDA   ]ESIZE     ; {2C2B} ELEMENT LENGTH
         STA   ]MCAND     ; {3C2B} AND STORE AS MULTIPLICAND
         LDA   ]AYSIZE    ; {2C2B} GET ARRAY Y SIZE
         STA   ]AYBAK     ; {3C2B} BACK IT UP
         LDA   ]AXSIZE    ; {2C2B}
         STA   ]AXBAK     ; {3C2B} AND BACK THAT UP TOO
         LDA   #0         ; {2C2B} CLEAR MCAND HIBYTE
         STA   ]MCAND+1   ; {3C2B}
*
** MULTIPLY X AND Y
*
         TAY              ; {2C1B} AND LOBYTE
         STY   SCRATCH    ; {3C2B}
         BEQ   :ENTLP     ; {3C2B} IF ZERO, SKIP TO LOOP
:DOADD
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   ]AXSIZE    ; {5C3B} ADD X LENGTH
         TAX              ; {2C1B} TEMPORARILY STORE IN .X
         TYA              ; {2C1B} TRANSFER HIBYTE TO .A
         ADC   SCRATCH    ; {5C3B} ADD HIBYTE
         TAY              ; {2C1B} STORE BACK IN .Y
         TXA              ; {2C1B} RELOAD LOBYTE INTO .A
:LP
         ASL   ]AXSIZE    ; {6C3B} MULTIPLY X LENGTH BY 2
         ROL   SCRATCH    ; {6C3B} ADJUST HIBYTE
:ENTLP
         LSR   ]AYSIZE    ; {6C3B} DIVIDE Y LENGTH BY 2
         BCS   :DOADD     ; {3C2B} IF >= LOBYTE IN .A,
         BNE   :LP        ; {3C2B} ADD AGAIN; OTHERWISE, LOOP
         STX   ]MLIER     ; {3C2B} STORE LOBYTE IN MULTIPLIER
         STY   ]MLIER+1   ; {3C2B} STORE HIBYTE IN MULTIPLIER
*
** NOW MULTIPLY BY LENGTH OF ELEMENTS
*
         LDA   #0         ; {2C2B} CLEAR PRODUCT LOBYTE
         STA   ]PROD      ; {3C2B}
         STA   ]PROD+1    ; {3C2B} CLEAR NEXT BYTE
         STA   ]PROD+2    ; {3C2B} CLEAR NEXT BYTE
         STA   ]PROD+3    ; {3C2B} CLEAR HIBYTE
         LDX   #$10       ; {2C2B} LOAD $10 IN .X (#16)
:SHIFTR  LSR   ]MLIER+1   ; {6C3B} DIVIDE MLIER BY TWO
         ROR   ]MLIER     ; {6C3B} ADJUST LOBYTE
         BCC   :ROTR      ; {3C2B} IF LESS THAN PRODUCT, ROTATE
         LDA   ]PROD+2    ; {2C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MCAND     ; {5C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE BACK INTO PRODUCT 3RD BYTE
         LDA   ]PROD+3    ; {2C2B} LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; {5C3B} ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C3B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C3B} ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; {6C3B} ROTATE PRODUCT 2ND BYTE
         ROR   ]PROD      ; {6C3B} ROTATE PRODUCT LOBYTE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :SHIFTR    ; {3C2B} IF NOT 0, BACK TO SHIFTER
*
         LDA   ]PROD      ; {2C2B} LOAD PRODUCT LOBYTE TO .A
         CLC              ; {2C1B} CLEAR CARRY FLAG
         ADC   #3         ; {5C3B} ADD 3
         STA   ]PROD      ; {3C2B} STORE BACK INTO PRODUCT LOBYTE
         LDA   ]PROD+1    ; {2C2B}
         ADC   #0         ; {5C3B} INITIATE CARRY FOR 2ND BYTE
         STA   ]PROD+1    ; {3C2B}
         LDA   ]PROD+2    ; {2C2B}
         ADC   #0         ; {5C3B} AND THIRD BYTE
         STA   ]PROD+2    ; {3C2B}
*
** NOW CLEAR MEMORY BLOCKS, WHOLE PAGES FIRST
*
         LDA   ]FILL      ; {2C2B} GET FILL VALUE
         LDX   ]PROD+1    ; {2C2B} LOAD SECOND BYTE OF PRODUCT
         BEQ   :PART      ; {3C2B} IF 0, THEN ONLY PARTIAL PAGE
         LDY   #0         ; {2C2B} CLEAR INDEX
:FULL
         STA   (]ADDR),Y  ; {3C2B} COPY FILL BYTE TO ADDRESS
         INY              ; {2C1B} INCREASE INDEX
         BNE   :FULL      ; {3C2B} IF NO OVERFLOW, KEEP FILL
         INC   ]ADDR+1    ; {6C3B} INCREASE ADDRESS HIBYTE
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :FULL      ; {3C2B} LOOP UNTIL PAGES DONE
:PART
         LDX   ]PROD      ; {2C2B} LOAD PRODUCT LOBYTE TO X
         BEQ   :MFEXIT    ; {3C2B} IF ZERO, THEN WE'RE DONE
         LDY   #0         ; {2C2B} RESET INDEX
:PARTLP
         STA   (]ADDR),Y  ; {6C2B} STORE FILL BYTE
         INY              ; {2C1B} INCREASE INDEX
         DEX              ; {2C1B} DECREASE COUNTER
         BNE   :PARTLP    ; {3C2B} LOOP UNTIL DONE
:MFEXIT
         LDY   #0         ; {2C2B} RESET INDEX
         LDA   ]AXBAK     ; {2C2B} PUT X LENGTH INTO
         STA   (]ADDR),Y  ; {6C2B} FIRST BYTE OF ARRAY
         INY              ; {2C1B} INCREMENT INDEX
         LDA   ]AYBAK     ; {2C2B} PUT Y LENGTH INTO
         STA   (]ADDR),Y  ; {6C2B} SECOND BYTE OF ARRAY
         INY              ; {2C1B} INCREMENT INDEX
         LDA   ]MCAND     ; {2C2B} PUT ELEMENT SIZE
         STA   (]ADDR),Y  ; {6C2B} INTO 3RD BYTE OF ARRAY
         LDX   ]ADDR      ; {2C2B} RETURN ARRAY ADDR LOBYTE IN .X
         LDY   ]ADDR+1    ; {2C2B} RETURN ARRAY ADDR HIBYTE IN .Y
         LDA   ]PROD      ; {2C2B} STORE PRODUCT LOBYTE IN RETURN
         STA   RETURN     ; {3C2B}
         LDA   ]PROD+1    ; {2C2B} STORE NEXT BYTE
         STA   RETURN+1   ; {3C2B}
         LDA   ]PROD+2    ; {2C2B} NEXT BYTE
         STA   RETURN+2   ; {3C2B}
         LDA   ]PROD+3    ; {2C2B} STORE HIBYTE
         STA   RETURN+3   ; {3C2B}
         LDA   #4         ; {2C2B} SIZE OF RETURN
         STA   RETLEN     ; {3C2B} SPECIFY RETURN LENGTH
         LDA   ]MCAND     ; {2C2B} RETURN ELEMENT SIZE IN .A
         RTS              ; {6C3B}
