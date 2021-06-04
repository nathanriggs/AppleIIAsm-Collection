*
*``````````````````````````````*
* APUT162       (NATHAN RIGGS) *
*                              *
* PLACE A VALUE HELD IN ONE    *
* ADDRESS INTO THE SPECIFIED   *
* ELEMENT IN A 16-BIT, TWO-    *
* DIMENSIONAL ARRAY.           *
*                              *
*------------------------------*
* MULTIPLICATION ADAPTED FROM  *
* WHITE FLAME'S WORK ON        *
* CODEBASE64. LICENSE MAY VARY *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = ARRAY ADDRESS       *
*  WPAR3 = 1ST DIM INDEX       *
*  ADDR1 = 2ND DIM INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 378+                 *
* SIZE: 220 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDRS   EQU   WPAR1      ; VALUE SOURCE ADDRESS
]ADDRD   EQU   WPAR2      ; ARRAY ADDRESS
]XIDX    EQU   WPAR3      ; FIRST DIMENSION INDEX
]YIDX    EQU   ADDR1      ; SECOND DIMENSION INDEX
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
         LDY   #4         ; {2C2B} LOAD BYTE 4 OF ARRAY
         LDA   (]ADDRD),Y ; {6C2B} HEADER TO GET ELEM LENGTH
         STA   ]ESIZE     ; {3C2B}
         LDY   #0         ; {2C2B} LOAD BYTE 0 TO GET
         LDA   (]ADDRD),Y ; {6C2B} X-DIMENSION LENGTH LOBYTE
         STA   ]XLEN      ; {3C2B}
         LDY   #1         ; {2C2B} LOAD BYTE 1 TO GET
         LDA   (]ADDRD),Y ; {6C2B} X-DIMENSION LENGTH HIBYTE
         STA   ]XLEN+1    ; {3C2B}
         LDY   #2         ; {2C2B} LOAD BYTE 2 TO GET THE
         LDA   (]ADDRD),Y ; {6C2B} Y-DIMENSION LENGTH LOBYTE
         STA   ]YLEN      ; {3C2B}
         LDY   #3         ; {2C2B} LOAD BYTE 3 TO GET THE
         LDA   (]ADDRD),Y ; {6C2B} Y-DIMENSION LENGTH HIBYTE
         STA   ]YLEN+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE INDEX
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   ]YIDX      ; {3C2B} LOAD Y-INDEX LOBYTE
         STA   ]MLIER     ; {3C2B} PUT IN MULTIPLIER LOBYTE
         LDA   ]YIDX+1    ; {3C2B} DO SAME FOR HIBYTES
         STA   ]MLIER+1   ; {3C2B}
         LDA   ]YLEN      ; {3C2B} PUT Y-DIM LENGTH LOBYTE
         STA   ]MCAND     ; {3C2B} INTO MULTIPLICAND
         LDA   ]YLEN+1    ; {3C2B} DO SAME FOR HIBYTE
         STA   ]MCAND+1   ; {3C2B}
         LDA   #00        ; {2C2B} CLEAR PRODUCT BYTES
         STA   ]PROD      ; {3C2B}
         STA   ]PROD+1    ; {3C2B}
         STA   ]PROD+2    ; {3C2B}
         STA   ]PROD+3    ; {3C2B}
         LDX   #$10       ; {2C2B} INIT COUNTER TO #16
:SHIFT_R
         LSR   ]MLIER+1   ; {6C2B} DIVIDE MULTIPLIER HIBYTE BY 2
         ROR   ]MLIER     ; {6C2B} ADJUST LOBYTE
         BCC   :ROT_R     ; {3C2B} IF 0 PUT IN CARRY, ROTATE PRODUCT
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE 3RD BYTE
         LDA   ]PROD+3    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROT_R
         ROR              ; {6C2B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C2B} ROTATE 3RD BYTE
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREASE X COUNTER
         BNE   :SHIFT_R   ; {3C2B} IF NOT ZERO, LOOP AGAIN
*
** NOW MULTIPLY XIDX BY ELEMENT SIZE
*
         LDA   ]PROD      ; {3C2B} BACKUP PREVIOUS
         STA   ]PBAK      ; {3C2B} PRODUCT FOR USE LATER
         LDA   ]PROD+1    ; {3C2B} DO SAME FOR HIBYTE
         STA   ]PBAK+1    ; {3C2B}
         LDA   ]XIDX      ; {3C2B} PUT X-INDEX LOBYTE
         STA   ]MLIER     ; {3C2B} INTO MULTIPLIER
         LDA   ]XIDX+1    ; {3C2B} DO SAME FOR HIBYTE
         STA   ]MLIER+1   ; {3C2B}
         LDA   ]ESIZE     ; {3C2B} PUT ELEMENT SIZE
         STA   ]MCAND     ; {3C2B} INTO MULTIPLICAND
         LDA   #0         ; {2C2B} CLEAR MULTIPLICAND HIBYTE
         STA   ]MCAND+1   ; {3C2B}
*
         STA   ]PROD      ; {3C2B} CLEAR PRODUCT
         STA   ]PROD+1    ; {3C2B}
         STA   ]PROD+2    ; {3C2B}
         STA   ]PROD+3    ; {3C2B}
         LDX   #$10       ; {2C2B} INIT X COUNTER TO #16
:SHIFTR  LSR   ]MLIER+1   ; {6C2B} DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; {6C2B} ADJUST LOBYTE
         BCC   :ROTR      ; {3C2B} IF 0 PUT INTO CARRY, ROTATE PROD
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND LOBYTE
         STA   ]PROD+2    ; {3C2B}
         LDA   ]PROD+3    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; {4C3B} HAD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C2B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C2B} ROTATE 3RD BYTE
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND BYTE
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREASE X COUNTER
         BNE   :SHIFTR    ; {3C2B} IF NOT 0, KEEP LOOPING
*
** NOW ADD X * ESIZE TO RUNNING PRODUCT
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} ADD CURRENT PRODUCT
         ADC   ]PBAK      ; {4C3B} TO PREVIOUS PRODUCT
         STA   ]PROD      ; {3C2B} AND STORE BACK IN PRODUCT
         LDA   ]PROD+1    ; {3C2B}
         ADC   ]PBAK+1    ; {4C3B}
         STA   ]PROD+1    ; {3C2B}
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} INCREASE LOBYTE BY 5
         ADC   #5         ; {2C2B} TO ACCOUNT FOR ARRAY
         STA   ]PROD      ; {3C2B} HEADER
         LDA   ]PROD+1    ; {3C2B}
         ADC   #0         ; {2C2B} ADJUST HIBYTE
         STA   ]PROD+1    ; {3C2B}
*
** ADD ARRAY ADDRESS TO GET INDEX
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} ADD ARRAY ADDRESS
         ADC   ]ADDRD     ; {4C3B} TO PRODUCT TO GET
         STA   ADDR2      ; {3C2B} ELEMENT ADDRESS; STORE
         LDA   ]PROD+1    ; {3C2B} ADDRESS ON ZERO PAGE
         ADC   ]ADDRD+1   ; {4C3B}
         STA   ADDR2+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE INDEX
:CLP
         LDA   (]ADDRS),Y ; {6C2B} LOAD BYTE FROM SOURCE
         STA   (ADDR2),Y  ; {6C2B} STORE AT ELEMENT ADDRESS
         INY              ; {2C1B} INCREASE BYTE INDEX
         CPY   ]ESIZE     ; {4C3B} IF != ELEMENT LENGTH, LOOP
         BNE   :CLP       ; {3C2B}
         LDY   ADDR2+1    ; {3C2B} .Y = ELEMENT ADDRESS HIBYTE
         LDX   ADDR2      ; {3C2B} .X = ELEMENT ADDRESS LOBYTE
         LDA   ]ESIZE     ; {3C2B} .A = ELEMENT LENGTH
         RTS              ; {6C1B}
