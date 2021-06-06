*
*``````````````````````````````*
* HCLEAR                       *
*                              *
* FILLS THE HIRES WORKING PAGE *
* WITH THE SPECIFIED COLOR.    *
*                              *
* INPUT:                       *
*                              *
*  ZPB1  = COLOR               *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 83                   *
* SIZE: 49+                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HRLO    EQU   ZPW1       ; LOW BYTE OF WORKING SCREEN
]HRHI    EQU   ZPW1+1     ; HIGH BYTE OF WORKING SCREEN
]MAX     EQU   ZPW2       ; MAX LENGTH OF WORKING SCREEN
]COLOR   EQU   ZPB1       ; COLOR CODE
*
HCLEAR
         LDA   #$00       ; {3C2B} CLEAR OUT THE ACCUMULATOR
         STA   ]HRLO      ; {3C2B} CLEAR SCREEN MEM LOW BYTE
         LDA   #$20       ; {3C2B} LOAD #$20 AS HIGH BYTE
         CLC              ; {2C1B}
         ADC   HOFFSET    ; {4C3B} AND ADD HI BYTE OFFSET FOR PAGE
         STA   ]HRHI      ; {3C2B} AND STORE NEW HIGH BYTE
         LDA   HOFFSET    ; {4C3B} LOAD OFFSET AGAIN
         CLC              ; {2C1B}
         ADC   #$40       ; {3C2B} AND ADD 8K SCREEN LENGTH
         STA   ]MAX       ; {3C2B} TO STORE IN MAX
         LDX   ]COLOR     ; {3C2B} COLOR HELD IN .X
:CLR1    LDY   #$00       ; {3C2B} CLEAR THE .Y INDEX
:CLR2    LDA   CT_EVEN,X  ; {5C3B} GET COLOR MASK FOR EVEN BYTES
         STA   (]HRLO),Y  ; {5C3B} STORE IN SCREEN MEMORY
         INY              ; {2C1B} INCREASE .Y INDEX
         LDA   CT_ODD,X   ; {5C3B} GET COLOR MASK FOR ODD BYTES
         STA   (]HRLO),Y  ; {5C3B} STORE IN SCREEN MEMORY
         INY              ; {2C1B} INCREASE .Y INDEX
         BNE   :CLR2      ; {3C2B} IF .Y HASN'T FLIPPED YET
         INC   ]HRHI      ; {5C2B} THEN LOOP CLR2, ELSE INC HIGH
         LDA   ]HRHI      ; {3C2B}
         CMP   ]MAX       ; {3C2B} IS HIGH BYTE EQUAL TO MAX?
         BCC   :CLR1      ; {3C2B} IF NOT, LOOP CLR1
         RTS              ; {6C1B}
