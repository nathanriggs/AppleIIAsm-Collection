*
*``````````````````````````````*
* AGET162       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = ARRAY ADDRESS       *
*  WPAR2 = 1ST DIM INDEX       *
*  WPAR3 = 2ND DIM INDEX       *
*                              *
* OUTPUT:                      *
*                              *
*  .A = ELEMENT LENGTH         *
*  RETURN: ELEMENT DATA        *
*  RETLEN: ELEMENT LENGTH      *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 410+                 *
* SIZE: 277 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR    EQU   WPAR1
]XIDX    EQU   WPAR2
]YIDX    EQU   WPAR3
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
         LDY   #4         ; READ BYTE 4 FROM HEADER
         LDA   (]ADDR),Y  ; TO GET ELEMENT SIZE
         STA   ]ESIZE
         LDY   #0         ; READ BYTE 0 FROM HEADER
         LDA   (]ADDR),Y  ; TO GET X-DIM LENGTH LOBYTE
         STA   ]XLEN
         LDY   #1         ; READ BYTE 1 FROM HEADER
         LDA   (]ADDR),Y  ; TO GET X-DIM LENGTH HIBYTE
         STA   ]XLEN+1
         LDY   #2         ; READ BYTE 2 FROM HEADER
         LDA   (]ADDR),Y  ; TO GET Y-DIM LENGTH LOBYTE
         STA   ]YLEN
         LDY   #3         ; READ BYTE 3 OF HEADER
         LDA   (]ADDR),Y  ; TO GET Y-DIM LENGTH HIBYTE
         STA   ]YLEN+1
         LDY   #0         ; RESET BYTE INDEX
*
** MULTIPLY Y-INDEX BY Y-LENGTH
*
         LDA   ]YIDX      ; PUT Y-INDEX INTO
         STA   ]MLIER     ; MULTIPLIER
         LDA   ]YIDX+1    ; ALSO HIBYTE
         STA   ]MLIER+1
         LDA   ]YLEN      ; PUT Y-DIM LENGTH LOBYTE
         STA   ]MCAND     ; INTO MULTIPLICAND
         LDA   ]YLEN+1    ; ALSO HIBYTE
         STA   ]MCAND+1
         LDA   #00        ; RESET
         STA   ]PROD      ; PRODUCT BYTES
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       ; LOAD #16 INTO X REGISTER
:SHIFT_R
         LSR   ]MLIER+1   ; DIVIDE MULTIPLIER BY 2
         ROR   ]MLIER     ; ADJUST HIBYTE
         BCC   :ROT_R     ; IF 0 PUT INTO CARRY, ROTATE MORE
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY
         ADC   ]MCAND     ; ADD MULTIPLICAND
         STA   ]PROD+2    ; STORE IN PRODUCT 3RD
         LDA   ]PROD+3    ; LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAN HIBYTE
:ROT_R
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE 3RD BYTE
         ROR   ]PROD+1    ; ROTATE 2ND BYTE
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREASE X COUNTER
         BNE   :SHIFT_R   ; IF NOT ZERO, SHIFT AGAIN
*
** NOW MULTIPLY XIDX BY ELEMENT SIZE
*
         LDA   ]PROD      ; BACKUP PREVIOUS PRODUCT
         STA   ]PBAK      ; 1ST AND 2ND BYTES; THE
         LDA   ]PROD+1    ; 3RD AND 4TH ARE NOT USED
         STA   ]PBAK+1
         LDA   ]XIDX      ; LOAD X-INDEX LOBYTE
         STA   ]MLIER     ; AND STORE IN MULTIPLIER
         LDA   ]XIDX+1    ; LOAD HIBYTE AND STORE
         STA   ]MLIER+1
         LDA   ]ESIZE     ; LOAD ELEMENT SIZE AND
         STA   ]MCAND     ; STORE LOBYTE IN MULTIPLICAND
         LDA   #0         ; CLEAR MULTIPLICAND HIBYTE
         STA   ]MCAND+1
*
         STA   ]PROD      ; CLEAR ALL PRODUCT BYTES
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       ; LOAD #16 IN COUNTER
:SHIFTR  LSR   ]MLIER+1   ; DIVIDE MULTIPLIER HIBYTE BY 2
         ROR   ]MLIER     ; ADJUST LOBYTE
         BCC   :ROTR      ; IF 0 PUT IN CARRY, ROTATE
         LDA   ]PROD+2    ; LOAD PRODUCT 3RD BYTE
         CLC              ; CLEAR CARRY
         ADC   ]MCAND     ; ADD MULTIPLICAND LOBYTE
         STA   ]PROD+2    ; STORE PRODUCT 3RD BYTE
         LDA   ]PROD+3    ; LOAD PRODUCT HIBYTE
         ADC   ]MCAND+1   ; ADD MULTIPLICAND HIBYTE
:ROTR
         ROR              ; ROTATE .A RIGHT
         STA   ]PROD+3    ; STORE IN PRODUCT HIBYTE
         ROR   ]PROD+2    ; ROTATE PRODUCT 3RD BYTE
         ROR   ]PROD+1    ; ROTATE 2ND BYTE
         ROR   ]PROD      ; ROTATE LOBYTE
         DEX              ; DECREMENT X COUNTER
         BNE   :SHIFTR    ; IF != 0, SHIFT AGAIN
*
** NOW ADD X * ESIZE TO RUNNING PRODUCT
*
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; ADD PREVIOUS PRODUCT
         ADC   ]PBAK      ; LOBYTE TO CURRENT
         STA   ]PROD      ; AND STORE IN PRODUCT
         LDA   ]PROD+1    ; DO THE SAME WITH HIBYTES
         ADC   ]PBAK+1
         STA   ]PROD+1
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; ADD 5 BYTES TO PRODUCT
         ADC   #5         ; TO ACCOUNT FOR ARRAY HEADER
         STA   ]PROD
         LDA   ]PROD+1
         ADC   #0         ; ADJUST HIBYTE
         STA   ]PROD+1
*
** NOW ADD BASE ADDRESS OF ARRAY TO GET
** THE ADDRESS OF THE INDEX VALUE
*
         CLC              ; CLEAR CARRY
         LDA   ]PROD      ; ADD PRODUCT TO ARRAY
         ADC   ]ADDR      ; ADDRESS, LOBYTES
         STA   ADDR2      ; STORE IN ZERO PAGE
         LDA   ]PROD+1    ; DO THE SAME WITH HIBYTES
         ADC   ]ADDR+1
         STA   ADDR2+1
         LDY   #0         ; RESET BYTE INDEX
*
** COPY FROM SRC ADDR TO DEST ADDR
*
:CLP
         LDA   (ADDR2),Y  ; LOAD BYTE FROM ELEMENT
         STA   RETURN,Y   ; AND STORE IN RETURN
         INY              ; INCREMENT BYTE COUNTER
         CPY   ]ESIZE     ; IF != ELEMENT LENGTH,
         BNE   :CLP       ; CONTINUE LOOPING
         LDA   ]ESIZE     ; .A = ELEMENT SIZE
         STA   RETLEN     ; ALSO IN RETLEN
         LDY   ADDR2+1    ; .Y = ELEMENT ADDRESS HIBYTE
         LDX   ADDR2      ; .X = ELEMENT ADDRESS LOBYTE
         RTS
