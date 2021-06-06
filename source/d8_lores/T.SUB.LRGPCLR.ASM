*``````````````````````````````*
* LRGPCLR       (NATHAN RIGGS) *
*                              *
* FILLS THE LORES SCREEN WITH  *
* THE SPECIFIED COLOR.         *
*                              *
* INPUT:                       *
*                              *
*  .A = BACKGROUND COLOR       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 137+                 *
* SIZE: 94 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]C       EQU   ZPB1       ; TEMPORARY COLOR STORAGE
*
LRGPCLR
         STA   ]C         ; {4C3B} STORE COLOR
         ASL              ; {2C1B} SHIFT LOW BYTE OF COLOR
         ASL              ; {2C1B} INTO THE HIGH BYTE, SINCE
         ASL              ; {2C1B} THE HIGH BYTE IS ALWAYS 0
         ASL              ; {2C1B}
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]C         ; {4C3B} ADD LOW BYTE TO NEW HIGH
         STA   ]C         ; {4C3B} SO IT'S A REPEATING NIBBLE
         LDY   #$78       ; {3C2B} BYTE LENGTH FOR EACH LINE
                          ; THIS ALLOWS FOR FILLING EVERY PIXEL
*
         LDX   LWP        ; {4C3B} CHECK WHICH PAGE TO CLEAR
         CPX   #2         ; {3C2B} IS IT PAGE 2?
         BEQ   :P2        ; {3C2B} IF SO, CLEAR PAGE 2
                          ; OTHERWISE, ASSUME PAGE 1
*
:LP1
         STA   $400,Y     ; {4C3B} PLOT FIRST SECTION
         STA   $480,Y     ; {4C3B} PLOT SECOND
         STA   $500,Y     ; {4C3B} THIRD
         STA   $580,Y     ; {4C3B} FOURTH
         CPY   #80        ; {3C2B}
         BPL   :NDB       ; {3C2B}
         STA   $600,Y     ; {4C3B} FIFTH
         STA   $680,Y     ; {4C3B} SIXTH
         STA   $700,Y     ; {4C3B} SEVENTH
         STA   $780,Y     ; {4C3B} EIGHTH
:NDB
         DEY              ; {2C1B} DECREASE OFFSET COUNTER
         BPL   :LP1       ; {3C2B} IF NOT NEGATIVE, KEEP LOOPING
         JMP   :EXIT      ; {3C3B}
*
:P2
         LDA   ]C         ; {4C3B}
         LDY   #$78       ; {3C2B}
:LP2
         STA   $800,Y     ; {4C3B} PLOT FIRST SECTION
         STA   $880,Y     ; {4C3B} PLOT SECOND
         STA   $900,Y     ; {4C3B} THIRD
         STA   $980,Y     ; {4C3B} FOURTH
         CPY   #80        ; {3C2B}
         BPL   :NDB2      ; {3C2B}
         STA   $0A00,Y    ; {4C3B} FIFTH
         STA   $0A80,Y    ; {4C3B} SIXTH
         STA   $0B00,Y    ; {4C3B} SEVENTH
         STA   $0B80,Y    ; {4C3B} EIGHTH
:NDB2
         DEY              ; {2C1B} DECREASE OFFSET COUNTER
         BPL   :LP2       ; {3C2B} IF NOT NEG, KEEP LOOPING
:EXIT
         RTS              ; {6C1B}
