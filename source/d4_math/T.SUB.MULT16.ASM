*
*``````````````````````````````*
* MULT16        (NATHAN RIGGS) *
*                              *
* MULTIPLY TWO 16-BIT VALUES.  *
* NOTE THAT THIS ONLY WORKS    *
* CORRECTLY WITH UNSIGNED      *
* VALUES.                      *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = MULTIPLICAND        *
*  WPAR2 = MULTIPLIER          *
*                              *
* OUTPUT:                      *
*                              *
*  RETURN = 32-BIT PRODUCT     *
*  RETLEN = 4 (BYTE LENGTH)    *
*  .A = LOWEST PRODUCT BYTE    *
*  .X = 2ND LOWEST BYTE (COPY) *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^ ^    ^^^         *
*                              *
* CYCLES: 101+                 *
* SIZE: 61 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MCAND   EQU   WPAR1      ; MULTIPLICAND
]MLIER   EQU   WPAR2      ; MULTIPLIER
]HPROD   EQU   WPAR3      ; HIGH BYTES OF PRODUCT
*
MULT16
         LDA   #0         ; ZERO OUT TOP TWO
         STA   ]HPROD     ; HIGH BYTES OF 32-BIT
         STA   ]HPROD+1   ; RESULT
         LDX   #17        ; # OF BITS IN MLIER PLUS 1
                          ; FOR LAST CARRY INTO PRODUCT
         CLC              ; CLEAR CARRY FOR 1ST TIME
                          ; THROUGH LOOP.
:MLP
*
** IF NEXT BIT = 1, HPROD += 1
*
         ROR   ]HPROD+1   ; SHIFT HIGHEST BYTE
         ROR   ]HPROD     ; SHIFT 2ND-HIGHEST
         ROR   ]MLIER+1   ; SHIFT 3RD-HIGHEST
         ROR   ]MLIER     ; SHIFT LOW BYTE
         BCC   :DX        ; BRANCH IF NEXT BIT = 0
         CLC              ; OTHERWISE NEXT BIT =1,
         LDA   ]MCAND     ; SO ADD MCAND TO PRODUCT
         ADC   ]HPROD
         STA   ]HPROD     ; STORE NEW LOBYTE
         LDA   ]MCAND+1
         ADC   ]HPROD+1
         STA   ]HPROD+1   ; STORE NEW HIBYTE
:DX
         DEX              ; DECREASE COUNTER
         BNE   :MLP       ; DO MUL LOOP UNTIL .X = 0
*
** NOW STORE IN RETURN, WITH LOWEST TWO
** BYTES ALSO LEFT IN .A (LO) AND .X (HI)
*
         LDA   #4         ; LENGTH OF PRODUCT
         STA   RETLEN     ; STORED IN RETLEN
         LDA   ]HPROD+1
         STA   RETURN+3
         LDA   ]HPROD
         STA   RETURN+2
         LDX   ]MLIER+1
         STX   RETURN+1
         LDA   ]MLIER
         STA   RETURN
         RTS
