*
*``````````````````````````````*
* MULT8         (NATHAN RIGGS) *
*                              *
* MULTIPLY TWO 8-BIT NUMBERS.  *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = MULTIPLIER          *
*  WPAR2 = MULTIPLICAND        *
*                              *
* OUTPUT:                      *
*                              *
*  .A = PRODUCT LOW BYTE       *
*  .X = PRODUCT HIGH BYTE      *
*  RETURN = PRODUCT (2 BYTES)  *
*  RETLEN = 2                  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^    ^^^         *
*                              *
* CYCLES: 81+                  *
* SIZE: 47 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MUL1    EQU   WPAR1
]MUL2    EQU   WPAR2
*
MULT8
         STA   ]MUL1
         STX   ]MUL2
         LDA   #0         ; CLEAR REGISTERS
         TAY
         TAX
         STA   ]MUL1+1    ; CLEAR HIBYTE
         BEQ   :GOLOOP
:DOADD
         CLC              ; CLEAR CARRY
         ADC   ]MUL1      ; ADD MULTIPLIER
         TAX              ; HOLD IN .Y
         TYA              ; XFER .X TO .A
         ADC   ]MUL1+1    ; ADD MULTIPLIER HIBYTE
         TAY              ; HOLD BACK IN .X
         TXA              ; MOVE LOBYTE INTO .A
:LP
         ASL   ]MUL1      ; SHIFT LEFT
         ROL   ]MUL1+1    ; ROLL HIBYTE
:GOLOOP
         LSR   ]MUL2      ; SHIFT MULTIPLIER
         BCS   :DOADD     ; IF 1 SHIFTED INTO CARRY, ADD AGAIN
         BNE   :LP        ; OTHERWISE, LOP
         LDA   #2         ; 16-BIT LENGTH, 2 BYTES
         STA   RETLEN     ; FOR RETURN LENGTH
         STX   RETURN     ; STORE LOBYTE
         STY   RETURN+1   ; STORE HIBYTE
         TXA              ; LOBYTE TO .A
         LDX   RETURN+1   ; HIBYTE TO .X
         RTS
