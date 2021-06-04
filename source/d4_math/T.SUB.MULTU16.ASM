*
*``````````````````````````````*
* MULT16        (NATHAN RIGGS) *
*                              *
* MULTIPLY TWO 16-BIT VALUES.  *
* NOTE THAT THIS ONLY WORKS    *
* CORRECTLY WITH UNSIGNED      *
* VALUES. SIGNS MUST BE        *
* DETERMINED BEFOREHAND.       *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = MULTIPLICAND        *
*  WPAR2 = MULTIPLIER          *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 106+                 *
* SIZE: 64 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MCAND   EQU   WPAR1      ; MULTIPLICAND
]MLIER   EQU   WPAR2      ; MULTIPLIER
]HPROD   EQU   WPAR3      ; HIGH BYTES OF PRODUCT
*
MULTU16
         LDA   #0         ; {3C2B} ZERO OUT TOP TWO
         STA   ]HPROD     ; {4C3B} HIGH BYTES OF 32-BIT
         STA   ]HPROD+1   ; {4C3B} RESULT
         LDX   #17        ; {4C3B} # OF BITS IN MLIER PLUS 1
                          ; FOR LAST CARRY INTO PRODUCT
         CLC              ; {2C1B} CLEAR CARRY FOR 1ST TIME
                          ; THROUGH LOOP.
:MLP
*
** IF NEXT BIT = 1, HPROD += 1
*
         ROR   ]HPROD+1   ; {5C2B} SHIFT HIGHEST BYTE
         ROR   ]HPROD     ; {5C2B} SHIFT 2ND-HIGHEST
         ROR   ]MLIER+1   ; {5C2B} SHIFT 3RD-HIGHEST
         ROR   ]MLIER     ; {5C2B} SHIFT LOW BYTE
         BCC   :DX        ; {3C2B} BRANCH IF NEXT BIT = 0
         CLC              ; {2C1B} OTHERWISE NEXT BIT =1,
         LDA   ]MCAND     ; {3C2B} SO ADD MCAND TO PRODUCT
         ADC   ]HPROD     ; {3C2B}
         STA   ]HPROD     ; {3C2B} STORE NEW LOBYTE
         LDA   ]MCAND+1   ; {3C2B}
         ADC   ]HPROD+1   ; {3C2B}
         STA   ]HPROD+1   ; {3C2B} STORE NEW HIBYTE
:DX
         DEX              ; {2C1B} DECREASE COUNTER
         BNE   :MLP       ; {3C2B} DO MUL LOOP UNTIL .X = 0
*
** NOW STORE IN RETURN, WITH LOWEST TWO
** BYTES ALSO LEFT IN .A (LO) AND .X (HI)
*
         LDA   #4         ; {3C2B} LENGTH OF PRODUCT
         STA   RETLEN     ; {4C3B} STORED IN RETLEN
         LDA   ]HPROD+1   ; {3C2B}
         STA   RETURN+3   ; {4C3B}
         LDA   ]HPROD     ; {3C2B}
         STA   RETURN+2   ; {4C3B}
         LDX   ]MLIER+1   ; {3C2B}
         STX   RETURN+1   ; {4C3B}
         LDA   ]MLIER     ; {3C2B}
         STA   RETURN     ; {4C3B}
         RTS              ; {6C1B}
