*``````````````````````````````*
* LRPLOT        (NATHAN RIGGS) *
*                              *
* PLOTS A LOW RESOLUTION       *
* PIXEL AT THE GIVEN COLOR AND *
* COORDINATES.                 *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = COLOR               *
*  BPAR2 = X COORDINATE        *
*  BPAR3 = Y COORDINATE        *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 130+                 *
* SIZE: 95 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]COLOR   EQU   BPAR1      ; PLOT COLOR
]X       EQU   BPAR2      ; X COORDINATE
]Y       EQU   BPAR3      ; Y COORDINATE
]MASK    EQU   VARTAB     ; MASK FOR ISOLATING NIBBLE
]COLMASK EQU   VARTAB+2   ; COLOR MASK
]PAGEOFF EQU   VARTAB+4   ; PAGE OFFSET
*
LRPLOT
         STY   ]Y         ; {3C2B} Y POSITION PASSED IN .Y
         STX   ]X         ; {3C2B} X POSITION PASSED IN .X
         STA   ]COLOR     ; {3C2B} COLOR PASSED IN .A
         LDA   ]COLOR     ; {3C2B} TAKE THE COLOR SENT
         ASL              ; {2C1B} AND MOVE IT LEFT 4 BITS
         ASL              ; {2C1B} TO THE HIGH BYTE
         ASL              ; {2C1B}
         ASL              ; {2C1B}
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]COLOR     ; {3C2B} NOW ADD LOW BYTE BACK, MEANING
         STA   ]COLOR     ; {3C2B} THE COLOR WILL REPEAT NIBBLES
         LDA   LWP        ; {4C3B} TEST WHICH PAGE IS THE WORKING
         CMP   #2         ; {3C2B} PAGE--IF NOT #2, ASSUME PAGE 1
         BNE   :PG1       ; {3C2B}
         LDA   #4         ; {3C2B} ADD TO BASE TO PLOT TO PAGE 2
         STA   ]PAGEOFF   ; {4C3B} STORE AS PAGE OFFSET
         JMP   :CNT       ; {3C3B}
:PG1
         LDA   #0         ; {3C2B} PAGE 1 HAS NO OFFSET, SO #0
         STA   ]PAGEOFF   ; {4C3B}
:CNT
         LDA   ]Y         ; {3C2B} GET Y COORDINATE
         LSR              ; {2C1B} SHIFT BOTTOM BIT TO CARRY
         BCC   :EVEN      ; {3C2B} IF CARRY = 0, ROW IS EVEN
         LDX   #$F0       ; {3C2B} ELSE, IT IS ODD; SO MASK
                          ; THE LEFT NIBBLE
         BCS   :PLOT      ; {3C2B} IF CARRY SET, BR TO PLOTTING
:EVEN
         LDX   #$0F       ; {3C2B} EVEN, SO MASK LOW BYTE
:PLOT
         STX   ]MASK      ; {4C3B} STORE THE EVEN OR ODD MASK
         ASL              ; {2C1B} SHIFT CARRY BACK INTO BYTE
         TAY              ; {2C1B} HOLD VALUE INTO .Y
         LDA   LROFF,Y    ; {5C3B} GET LORES MEMORY ADDRESS
         CLC              ; {2C1B} CLEAR THE CARRY
         ADC   ]X         ; {3C2B} ADD THE X COORDINATE
         STA   GBASLO     ; {4C3B} STORE LOW BYTE FOR GBASCALC
         INY              ; {2C1B} INCREASE Y OFFSET
         LDA   LROFF,Y    ; {5C3B} GET LORESS MEMORY ADDRESS
         ADC   ]PAGEOFF   ; {4C3B} ADJUST FOR PAGE & CARRY HIGH
         STA   GBASHI     ; {4C3B} STORE HIGH BYTE FOR GBASCALC
         LDY   #0         ; {3C2B}
         LDA   ]MASK      ; {4C3B} RELOAD THE MASK
         EOR   #$FF       ; {2C2B} EXCLUSIVE OR THE MASK
         AND   (GBASLO),Y ; {6C2B} AND THE LOW FOR GBAS
         STA   ]COLMASK   ; {4C3B} STORE THE COLOR MASK
         LDA   ]COLOR     ; {3C2B} LOAD THE COLOR
         AND   ]MASK      ; {4C3B} AND THE MASK
         ORA   ]COLMASK   ; {4C3B} OR WITH THE COLOR MASK
         STA   (GBASLO),Y ; {6C2B} STORE INTO GBAS LOW BYTE
         RTS              ; {6C1B}
