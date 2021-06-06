*``````````````````````````````*
* HOOKS.LORES                  *
*                              *
* THIS FILE INCLUDES HOODS AND *
* A FEW SUBROUTINES AND TABLES *
* USED BY THE REST OF THE LOW  *
* RESOLUTION SUBROUTINES.      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      05-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* LICENSE:   APACHE 2.0        *
* OS:        DOS 3.3           *
*                              *
* SIZE: 169 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TEXTOFF  EQU   $C050      ; TURN ON GRAPHICS MODE
TEXTON   EQU   $C051      ; TURN ON TEXT MODE
MIXEDOFF EQU   $C052      ; SET FULLSCREEN MODE FOR GRAPHICS
MIXEDON  EQU   $C053      ; SET MIXED MODE FOR GRAPHICS
LORES    EQU   $C056      ; SOFT SWITCH FOR USING LORES GRAPHICS
HIRES    EQU   $C057      ; SOFT SWITCH TO SPECIFY HIRES GRAPHICS
VPG1     EQU   $C054      ; SET THE VIEWING PAGE TO PAGE 1
VPG2     EQU   $C055      ; SET THE VIEWING PAGE TO PAGE 2
LRGBCALC EQU   $F847      ; FOR CALCULATING LORES COORDINATES
GBASLO   EQU   $26        ; LOW BYTE OF A PIXEL ADDRESS
GBASHI   EQU   $27        ; HIGHT BYTE OF PIXEL ADDRESS
*
]BLACK   EQU   $00        ; LORES COLOR BLACK
]MAGENTA EQU   $01        ; LORES COLOR MAGENTA
]DBLUE   EQU   $02        ; LORES DARK BLUE
]PURPLE  EQU   $03        ; LORES COLOR PURPLE
]DGREEN  EQU   $04        ; LORES COLOR DARK GREEN
]GREY1   EQU   $05        ; LORES COLOR FIRST GREY SHADE
]MBLUE   EQU   $06        ; LORES COLOR MEDIUM BLUE
]LBLUE   EQU   $07        ; LORES COLOR LIGHT BLUE
]BROWN   EQU   $08        ; LORES COLOR BROWN
]ORANGE  EQU   $09        ; LORES COLOR ORANGE
]GREY2   EQU   $0A        ; LORES COLORE GREY SHADE 2
]PINK    EQU   $0B        ; LORES COLOR PINK
MGREEN   EQU   $0C        ; LORES COLOR MEDIUM GREEN
]YELLOW  EQU   $0D        ; LORES COLOR YELLOW
]AQUA    EQU   $0E        ; LORES COLOR AQUAMARINE
]WHITE   EQU   $0F        ; LORES COLOR WHITE
*
** THE LOCPLOT SUBROUTINE IS IN THE HOOKS FILE
** BECAUSE IT IS USED, IN SOME CAPACITY, BY THE
** REST OF THE LORES LIBRARY.
*
         JMP   ]EOF       {3C3B}
*
]LOCCOL  DS    1          ; {0C1B} LOCAL PLOT COLOR
]MASK    DS    2          ; {0C2B} MASK FOR ISOLATING NIBBLE
]COLMASK DS    2          ; {0C2B} COLOR MASK
]X       DS    1          ; {OC1B} X COORDINATE FOR PLOT
]Y       DS    1          ; {0C1B} Y COORDINATE FOR PLOT
]PAGEOFF DS    1          ; {0C1B} PAGE OFFSET
*
*``````````````````````````````*
* LOCPLOT                      *
*                              *
* PLOT AT A GIVEN X,Y POINT IN *
* A GIVEN COLOR.               *
*                              *
* INPUT                        *
*                              *
*  .X = X POSITION             *
*  .Y = Y POSITION             *
*  .A = COLOR CODE             *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 168+                 *
* SIZE: 109 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LOCPLOT
*
         STY   ]Y         ; {4C3B} Y POSITION PASSED IN .Y
         STX   ]X         ; {4C3B} X POSITION PASSED IN .X
         STA   ]LOCCOL    ; {4C3B} COLOR PASSED IN .A
         LDA   ]LOCCOL    ; {4C3B} TAKE THE COLOR SENT
         ASL              ; {2C1B} AND MOVE IT LEFT 4 BITS
         ASL              ; {2C1B} TO THE HIGH BYTE
         ASL              ; {2C1B}
         ASL              ; {2C1B}
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]LOCCOL    ; {4C3B} NOW ADD THE LOW BYTE, MEANING
         STA   ]LOCCOL    ; {4C3B} COLOR WILL BE REPEATING NIBBLES
         LDA   LWP        ; {4C3B} LOAD THE WORKING PAGE FLAG
         CMP   #2         ; {3C2B} IF WORKING PAGE IS NOT PAGE 2,
         BNE   :PG1       ; {3C2B} THEN ASSUME IT'S PAGE 1.
         LDA   #4         ; {3C2B} ELSE, SET OFFSET FOR PAGE 2
         STA   ]PAGEOFF   ; {4C3B} STORE IN THE PAGE OFFSET
         JMP   :CNT       ; {3C3B} SKIP TO CONTINUE ROUTINE
:PG1
         LDA   #0         ; {3C2B} OTHERWISE, IT'S PAGE ONE
         STA   ]PAGEOFF   ; {4C3B} SO THERE IS NO PAGE OFFSET
:CNT
         LDA   #0         ; {3C2B}
         LDY   #0         ; {3C2B}
         LDX   #0         ; {3C2B}
         LDA   ]Y         ; {4C3B} GET Y COORDINATE
         LSR              ; {2C1B} SHIFT BOTTOM BIT TO CARRY
         BCC   :EVEN      ; {3C2B} IF CARRY = 0, THEN ROW IS EVEN
         LDX   #$F0       ; {3C2B} OTHERWISE, IT IS ODD; SO MASK
                          ; THE LEFT NIBBLE
         BCS   :LPLOT     ; {3C2B} IF CARRY SET, BR TO PLOTTING
:EVEN
         LDX   #$0F       ; {3C2B} EVEN, SO MASK LOW BYTE
:LPLOT
         STX   ]MASK      ; {3C2B} STORE THE EVEN OR ODD MASK
         ASL              ; {2C1B} SHIFT CARRY BACK INTO BYTE
         TAY              ; {2C1B} HOLD VALUE INTO .Y
         LDA   LROFF,Y    ; {5C3B} GET LORES MEMORY ADDRESS
         CLC              ; {2C1B} CLEAR THE CARRY
         ADC   ]X         ; {4C3B} ADD THE X COORDINATE
         STA   GBASLO     ; {4C3B} STORE LOW BYTE FOR GBASCALC
         INY              ; {2C1B} INCREASE Y OFFSET
         LDA   LROFF,Y    ; {5C3B} GET LORESS MEMORY ADDRESS
         ADC   ]PAGEOFF   ; {4C3B} ADJUST FOR PAGE AND CARRY HIGH
         STA   GBASHI     ; {4C3B} STORE HIGH BYTE FOR GBASCALC
         LDY   #0         ; {3C2B}
         LDA   ]MASK      ; {4C3B} RELOAD THE MASK
         EOR   #$FF       ; {2C2B} EXCLUSIVE OR THE MASK
         AND   (GBASLO),Y ; {6C2B} AND THE LOW FOR GBAS
         STA   ]COLMASK   ; {4C3B} STORE THE COLOR MASK
         LDA   ]LOCCOL    ; {4C3B} LOAD THE COLOR
         AND   ]MASK      ; {4C3B} AND THE MASK
         ORA   ]COLMASK   ; {4C3B} OR WITH THE COLOR MASK
         STA   (GBASLO),Y ; {6C2B} STORE INTO GBAS LOW BYTE
         RTS              ; {6C1B}
*
LWP      DS    1,1        ; {OC1B} BYTE TO DETERMIN WORK PAGE
*
** THE FOLLOWING TABLE HELPS WITH FASTER PLOTTING TO THE
** LOW RESOLUTION SCREEN.
*
LROFF    DW    $400,$480,$500,$580,$600,$680,$700,$780 ; {0C16B}
         DW    $428,$4A8,$528,$5A8,$628,$6A8,$728,$7A8 ; {0C16B}
         DW    $450,$4D0,$550,$5D0,$650,$6D0,$750,$7D0 ; {0C16B}
*
]EOF
