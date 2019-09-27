*
*``````````````````````````````*
* DIVD8         (NATHAN RIGGS) *
*                              *
* DIVIDE WITH TWO 8-BIT VALUES *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = DIVIDEND            *
*  WPAR2 = DIVISOR             *
*                              *
* OUTPUT:                      *
*                              *
*  .A = RESULT                 *
*  .X = REMAINDER              *
*  RETURN = RESULT             *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^ ^    ^^^         *
*                              *
* CYCLES: 58+                  *
* SIZE: 34 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]DVEND   EQU   WPAR1      ; DIVIDEND
]DVSOR   EQU   WPAR2      ; DIVISOR
*
DIVD8
         STX   ]DVEND     ; .X HOLDS DIVIDEND
         STA   ]DVSOR     ; .A HOLDS DIVISOR
         LDA   #$00       ; CLEAR ACCUMULATOR
         LDX   #8         ; COUNTER
         ASL   ]DVSOR     ; SHIFT LEFT DIVISOR
:L1      ROL              ; ROTATE LEFT .A
         CMP   ]DVEND     ; COMPARE TO DIVIDEND
         BCC   :L2        ; IF NEXT BIT = 0, BRANCH :L2
         SBC   ]DVEND     ; OTHERWISE, SUBTRACT DIVIDEND
:L2      ROL   ]DVSOR     ; ROTATE LEFT DIVISOR
         DEX              ; DECREMENT COUNTER
         BNE   :L1        ; IF > 0, LOOP
         TAX              ; REMAINDER IN .X
         LDA   #1
         STA   RETLEN
         LDA   ]DVSOR     ; RESULT IN .A
         STA   RETURN
         RTS
