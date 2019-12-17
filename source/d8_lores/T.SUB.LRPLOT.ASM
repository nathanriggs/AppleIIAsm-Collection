*``````````````````````````````*
* LRPLOT        (NATHAN RIGGS) *
*                              *
* PLOTS A LOEW RESOLUTION      *
* PIXEL AT THE CIVEN COLOR AND *
* COORDINATES.                 *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = COLOR               *
*  BPAR2 = X COORDINATE        *
*  BPAR3 = Y COORDINATE        *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 295+                 *
* SIZE: 102 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*
]COLOR   EQU   BPAR1      ; PLOT COLOR
]X       EQU   BPAR2      ; X COORDINATE
]Y       EQU   BPAR3      ; Y COORDINATE
]MASK    EQU   VARTAB     ; MASK FOR ISOLATING NIBBLE
]COLMASK EQU   VARTAB+2   ; COLOR MASK
]PAGEOFF EQU   VARTAB+4   ; PAGE OFFSET
*
LRPLOT
*
         STY   ]Y         ; Y POSITION PASSED IN .Y
         STX   ]X         ; X POSITION PASSED IN .X
         STA   ]COLOR     ; COLOR PASSED IN .A
         LDA   ]COLOR     ; TAKE THE COLOR SENT
         ASL              ; AND MOVE IT LEFT 4 BITS
         ASL              ; TO THE HIGH BYTE
         ASL
         ASL
         CLC              ; CLEAR CARRY
         ADC   ]COLOR     ; NOW ADD THE LOW BYTE BACK, MEANING
         STA   ]COLOR     ; THAT THE COLOR WILL BE REPEATING NIBBLES
         LDA   LWP        ; NOW TEST WHICH PAGE IS THE WORKING
         CMP   #2         ; PAGE; IF NOT #2, THEN ASSUME PAGE 1
         BNE   :PG1
         LDA   #4         ; ADD TO BASE TO PLOT TO PAGE 2
         STA   ]PAGEOFF   ; STORE AS PAGE OFFSET
         JMP   :CNT
:PG1
         LDA   #0         ; PAGE 1 HAS NO OFFEST, SO JUST 0
         STA   ]PAGEOFF
:CNT
         LDA   ]Y         ; GET Y COORDINATE
         LSR              ; SHIFT BOTTOM BIT TO CARRY
                          ; BUT WHY?
         BCC   :EVEN      ; IF CARRY = 0, THEN ROW IS EVEN
         LDX   #$F0       ; OTHERWISE, IT IS ODD; SO MASK
                          ; THE LEFT NIBBLE
         BCS   :PLOT      ; IF CARRY IS SET, BRANCH TO PLOTTING
:EVEN
         LDX   #$0F       ; EVEN, SO MASK LOW BYTE
:PLOT
         STX   ]MASK      ; STORE THE EVEN OR ODD MASK
         ASL              ; SHIFT CARRY BACK INTO BYTE
         TAY              ; HOLD VALUE INTO .Y
         LDA   LROFF,Y    ; GET LORES MEMORY ADDRESS
         CLC              ; CLEAR THE CARRY
         ADC   ]X         ; ADD THE X COORDINATE
         STA   GBASLO     ; STORE LOW BYTE FOR GBASCALC
         INY              ; INCREASE Y OFFSET
         LDA   LROFF,Y ; GET LORESS MEMORY ADDRESS
         ADC   ]PAGEOFF    ; ADJUST FOR PAGE AND CARRY HIGH
         STA   GBASHI     ; STORE HIGH BYTE FOR GBASCALC
         LDY   #0
         LDA   ]MASK      ; RELOAD THE MASK
         EOR   #$FF       ; EXCLUSIVE OR THE MASK
         AND   (GBASLO),Y ; AND THE LOW FOR GBAS
         STA   ]COLMASK   ; STORE THE COLOR MASK
         LDA   ]COLOR     ; LOAD THE COLOR
         AND   ]MASK      ; AND THE MASK
         ORA   ]COLMASK   ; OR WITH THE COLOR MASK
         STA   (GBASLO),Y ; STORE INTO GBAS LOW BYTE
         RTS
