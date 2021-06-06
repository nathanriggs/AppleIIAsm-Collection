*
*``````````````````````````````*
* DIVDU8        (NATHAN RIGGS) *
*                              *
* DIVIDE WITH TWO 8-BIT VALUES *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = DIVIDEND            *
*  WPAR2 = DIVISOR             *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 61+                  *
* SIZE: 34 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]DVEND   EQU   ZPW1       ; DIVIDEND
]DVSOR   EQU   ZPW2       ; DIVISOR
*
DIVDU8
         STX   ]DVEND     ; {3C2B} .X HOLDS DIVIDEND
         STA   ]DVSOR     ; {3C2B} .A HOLDS DIVISOR
         LDA   #$00       ; {3C2B} CLEAR ACCUMULATOR
         LDX   #8         ; {3C2B} COUNTER
         ASL   ]DVSOR     ; {5C2B} MUL DIVISOR BY 2
:L1      ROL              ; {2C1B} (HIGH BYTE TOO)
         CMP   ]DVEND     ; {3C2B} COMPARE TO DIVIDEND
         BCC   :L2        ; {3C2B} IF NEXT BIT = 0, BRANCH :L2
         SBC   ]DVEND     ; {3C2B} OTHERWISE, SUBTRACT DIVIDEND
:L2      ROL   ]DVSOR     ; {5C2B} LEFT DIVISOR
         DEX              ; {2C1B} DECREMENT COUNTER
         BNE   :L1        ; {3C2B} IF > 0, LOOP
         TAX              ; {2C1B} REMAINDER IN .X
         LDA   #1         ; {3C2B}
         STA   RETLEN     ; {4C3B}
         LDA   ]DVSOR     ; {3C2B} RESULT IN .A
         STA   RETURN     ; {4C3B}
         RTS              ; {6C1B}
