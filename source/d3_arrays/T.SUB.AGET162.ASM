*
*``````````````````````````````*
* AGET162       (NATHAN RIGGS) *
*                              *
* GET A VALUE FROM AN ELEMENT  *
* IN A 2-DIMENSIONAL, 16-BIT   *
* ARRAY.                       *
*                              *
*------------------------------*
* MULTIPLICATION CODE ADAPTED  *
* FROM WHITE FLAME'S WORK ON   *
* CODEBASE64. LICENSE MAY VARY *
*------------------------------*
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  WPAR2 = 1ST DIM INDEX       *
*  WPAR3 = 2ND DIM INDEX       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 382+                 *
* SIZE: 224 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   WPAR1      ; ARRAY ADDRESS
]XIDX    EQU   WPAR2      ; FIRST DIMENSION LENGTH
]YIDX    EQU   WPAR3      ; SECOND DIMENSION LENGTH
*
]ESIZE   EQU   VARTAB     ; ELEMENT LENGTH
]MCAND   EQU   VARTAB+2   ; MULTIPLICAND
]MLIER   EQU   VARTAB+4   ; MULTIPLIER
]PROD    EQU   VARTAB+6   ; PRODUCT
]PBAK    EQU   VARTAB+10  ; ^BACKUP
]XLEN    EQU   VARTAB+12  ; X-DIM LENGTH
]YLEN    EQU   VARTAB+14  ; Y-DIM LENGTH
*
AGET162
         LDY   #4         ; {2C2B} READ BYTE 4 FROM HEADER
         LDA   (]ADDR),Y  ; {6C2B} TO GET ELEMENT SIZE
         STA   ]ESIZE     ; {3C2B}
         LDY   #0         ; {2C2B} READ BYTE 0 FROM HEADER
         LDA   (]ADDR),Y  ; {6C2B} TO GET X-DIM LENGTH LOBYTE
         STA   ]XLEN      ; {3C2B}
         LDY   #1         ; {2C2B} READ BYTE 1 FROM HEADER
         LDA   (]ADDR),Y  ; {6C2B} TO GET X-DIM LENGTH HIBYTE
         STA   ]XLEN+1    ; {3C2B}
         LDY   #2         ; {2C2B} READ BYTE 2 FROM HEADER
         LDA   (]ADDR),Y  ; {6C2B} TO GET Y-DIM LENGTH LOBYTE
         STA   ]YLEN      ; {3C2B}
         LDY   #3         ; {2C2B} READ BYTE 3 OF HEADER
         LDA   (]ADDR),Y  ; {6C2B} TO GET Y-DIM LENGTH HIBYTE
         STA   ]YLEN+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE INDEX
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   ]YIDX      ; {3C2B} PUT Y-INDEX INTO
         STA   ]MLIER     ; {3C2B} MULTIPLIER
         LDA   ]YIDX+1    ; {3C2B} ALSO HIBYTE
         STA   ]MLIER+1   ; {3C2B}
         LDA   ]YLEN      ; {3C2B} PUT Y-DIM LENGTH LOBYTE
         STA   ]MCAND     ; {3C2B} INTO MULTIPLICAND
         LDA   ]YLEN+1    ; {3C2B} ALSO HIBYTE
         STA   ]MCAND+1   ; {3C2B}
         LDA   #00        ; {2C2B} RESET
         STA   ]PROD      ; {3C2B} PRODUCT BYTES
         STA   ]PROD+1    ; {3C2B}
         STA   ]PROD+2    ; {3C2B}
         STA   ]PROD+3    ; {3C2B}
         LDX   #$10       ; {2C2B} LOAD #16 INTO X REGISTER
:SHIFT_R
         LSR   ]MLIER+1   ; {6C2B} DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; {6C2B} ADJUST HIBYTE
         BCC   :ROT_R     ; {3C2B} IF 0 PUT IN CARRY, ROTATE MORE
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND
         STA   ]PROD+2    ; {3C2B} STORE IN PRODUCT 3RD
         LDA   ]PROD+3    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAN HIBYTE
:ROT_R
         ROR              ; {6C2B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C2B} ROTATE 3RD BYTE
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND BYTE
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREASE X COUNTER
         BNE   :SHIFT_R   ; {3C2B} IF NOT ZERO, SHIFT AGAIN
*
** NOW MULTIPLY XIDX BY ELEMENT SIZE
*
         LDA   ]PROD      ; {3C2B} BACKUP PREVIOUS PRODUCT
         STA   ]PBAK      ; {3C2B} 1ST AND 2ND BYTES; THE
         LDA   ]PROD+1    ; {3C2B} 3RD AND 4TH ARE NOT USED
         STA   ]PBAK+1    ; {3C2B}
         LDA   ]XIDX      ; {3C2B} LOAD X-INDEX LOBYTE
         STA   ]MLIER     ; {3C2B} AND STORE IN MULTIPLIER
         LDA   ]XIDX+1    ; {3C2B} LOAD HIBYTE AND STORE
         STA   ]MLIER+1   ; {3C2B}
         LDA   ]ESIZE     ; {3C2B} LOAD ELEMENT SIZE AND
         STA   ]MCAND     ; {3C2B} STORE LOBYTE IN MULTIPLICAND
         LDA   #0         ; {2C2B} CLEAR MULTIPLICAND HIBYTE
         STA   ]MCAND+1   ; {3C2B}
*
         STA   ]PROD      ; {3C2B} CLEAR ALL PRODUCT BYTES
         STA   ]PROD+1    ; {3C2B}
         STA   ]PROD+2    ; {3C2B}
         STA   ]PROD+3;   ; {3C2B}
         LDX   #$10       ; {2C2B} LOAD #16 IN COUNTER
:SHIFTR  LSR   ]MLIER+1   ; {6C2B} DIVIDE MULTIPLIER HIBYTE BY 2
         ROR   ]MLIER     ; {6C2B} ADJUST LOBYTE
         BCC   :ROTR      ; {3C2B} IF 0 PUT IN CARRY, ROTATE
         LDA   ]PROD+2    ; {3C2B} LOAD PRODUCT 3RD BYTE
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MCAND     ; {4C3B} ADD MULTIPLICAND LOBYTE
         STA   ]PROD+2    ; {3C2B} STORE PRODUCT 3RD BYTE
         LDA   ]PROD+3    ; {3C2B} LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; {4C3B} ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; {6C2B} ROTATE .A RIGHT
         STA   ]PROD+3    ; {3C2B} STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; {6C2B} ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; {6C2B} ROTATE 2ND BYTE
         ROR   ]PROD      ; {6C2B} ROTATE LOBYTE
         DEX              ; {2C1B} DECREMENT X COUNTER
         BNE   :SHIFTR    ; {3C2B} IF != 0, SHIFT AGAIN
*
** NOW ADD X * ESIZE TO RUNNING PRODUCT
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} ADD PREVIOUS PRODUCT
         ADC   ]PBAK      ; {4C3B} LOBYTE TO CURRENT
         STA   ]PROD      ; {3C2B} AND STORE IN PRODUCT
         LDA   ]PROD+1    ; {3C2B} DO THE SAME WITH HIBYTES
         ADC   ]PBAK+1    ; {4C3B}
         STA   ]PROD+1    ; {3C2B}
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} ADD 5 BYTES TO PRODUCT
         ADC   #5         ; {4C3B} TO ACCOUNT FOR ARRAY HEADER
         STA   ]PROD      ; {3C2B}
         LDA   ]PROD+1    ; {3C2B}
         ADC   #0         ; {2C2B} ADJUST HIBYTE
         STA   ]PROD+1    ; {3C2B}
*
** NOW ADD BASE ADDRESS OF ARRAY TO GET
** THE ADDRESS OF THE INDEX VALUE
*
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]PROD      ; {3C2B} ADD PRODUCT TO ARRAY
         ADC   ]ADDR      ; {4C3B} ADDRESS, LOBYTES
         STA   ADDR2      ; {3C2B} STORE IN ZERO PAGE
         LDA   ]PROD+1    ; {3C2B} DO THE SAME WITH HIBYTES
         ADC   ]ADDR+1    ; {4C3B}
         STA   ADDR2+1    ; {3C2B}
         LDY   #0         ; {2C2B} RESET BYTE INDEX
*
** COPY FROM SRC ADDR TO DEST ADDR
*
:CLP
         LDA   (ADDR2),Y  ; {6C2B} LOAD BYTE FROM ELEMENT
         STA   RETURN,Y   ; {5C3B} AND STORE IN RETURN
         INY              ; {2C1B} INCREMENT BYTE COUNTER
         CPY   ]ESIZE     ; {4C3B} IF != ELEMENT LENGTH,
         BNE   :CLP       ; {3C2B} CONTINUE LOOPING
         LDA   ]ESIZE     ; {3C2B} .A = ELEMENT SIZE
         STA   RETLEN     ; {3C2B} ALSO IN RETLEN
         LDY   ADDR2+1    ; {3C2B} .Y = ELEMENT ADDRESS HIBYTE
         LDX   ADDR2      ; {3C2B} .X = ELEMENT ADDRESS LOBYTE
         RTS              ; {6C1B}
