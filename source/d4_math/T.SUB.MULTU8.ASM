*
*``````````````````````````````*
* MULTU8        (NATHAN RIGGS) *
*                              *
* MULTIPLY TWO 8-BIT NUMBERS.  *
*                              *
* INPUT:                       *
*                              *
*  ZPW1  = MULTIPLIER          *
*  ZPW2  = MULTIPLICAND        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 83+                  *
* SIZE: 47 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]MUL1    EQU   ZPW1       ; MULTIPLIER
]MUL2    EQU   ZPW2       ; MULTIPLICAND
*
MULTU8
         STA   ]MUL1      ; {3C2B}
         STX   ]MUL2      ; {3C2B}
         LDA   #0         ; {3C2B} CLEAR REGISTERS
         TAY              ; {2C1B}
         TAX              ; {2C1B}
         STA   ]MUL1+1    ; {3C2B} CLEAR HIBYTE
         BEQ   :GOLOOP    ; {3C2B}
:DOADD
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]MUL1      ; {3C2B} ADD MULTIPLIER
         TAX              ; {2C1B} HOLD IN .Y
         TYA              ; {2C1B} XFER .X TO .A
         ADC   ]MUL1+1    ; {3C2B} ADD MULTIPLIER HIBYTE
         TAY              ; {2C1B} HOLD BACK IN .X
         TXA              ; {2C1B} MOVE LOBYTE INTO .A
:LP
         ASL   ]MUL1      ; {5C2B} SHIFT LEFT
         ROL   ]MUL1+1    ; {5C2B} ROLL HIBYTE
:GOLOOP
         LSR   ]MUL2      ; {5C2B} SHIFT MULTIPLIER
         BCS   :DOADD     ; {3C2B} IF SHIFTED IN CARRY ADD AGAIN
         BNE   :LP        ; {3C2B} OTHERWISE, LOOP
         LDA   #2         ; {3C2B} 16-BIT LENGTH, 2 BYTES
         STA   RETLEN     ; {4C3B} FOR RETURN LENGTH
         STX   RETURN     ; {4C3B} STORE LOBYTE
         STY   RETURN+1   ; {4C3B} STORE HIBYTE
         TXA              ; {2C1B} LOBYTE TO .A
         LDX   RETURN+1   ; {4C3B} HIBYTE TO .X
         RTS              ; {6C1B}
