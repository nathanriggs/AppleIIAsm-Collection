         USE   MIN.MAC.REQUIRED
         PUT   MIN.HEAD.REQUIRED
         PUT   HOOKS.LORES
         CYC   ON
*``````````````````````````````*
* LRGFCLR       (NATHAN RIGGS) *
*                              *
* FILLS THE LORES SCREEN WITH  *
* THE SPECIFIED COLOR.         *
*                              *
* INPUT:                       *
*                              *
*  .A = BACKGROUND COLOR       *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 135                  *
* SIZE: 308 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]C       EQU   VARTAB     ; TEMPORARY COLOR STORAGE
*
LRGFCLR
         STA   ]C         ; STORE COLOR
         ASL              ; SHIFT LOW BYTE OF COLOR
         ASL              ; INTO THE HIGH BYTE, SINCE
         ASL              ; THE HIGH BYTE IS ALWAYS 0
         ASL
         CLC              ; CLEAR CARRY
         ADC   ]C         ; NOW ADD LOW BYTE TO THE NEW HIGH
         STA   ]C         ; SO THAT IT IS A REPEATING NIBBLE
         LDY   #$78       ; BYTE LENGTH FOR EACH LINE
                          ; THIS ALLOWS FOR FILLING EVERY PIXEL
         LDX   LWP        ; CHECK WHICH PAGE TO CLEAR
         CPX   #2         ; IS IT PAGE 2?
         BEQ   :P2        ; IF SO, CLEAR PAGE 2
                          ; PTHERWISE, ASSUME PAGE 1
:LP1
         STA   $400,Y     ; PLOT FIRST SECTION
         STA   $480,Y     ; PLOT SECOND
         STA   $500,Y     ; THIRD
         STA   $580,Y     ; FOURTH
         STA   $600,Y     ; FIFTH
         STA   $680,Y     ; SIXTH
         STA   $700,Y     ; SEVENTH
         STA   $780,Y     ; EIGHTH
         DEY              ; DECREASE OFFSET COUNTER
         BPL   :LP1       ; IF NOT NEGATIVE, KEEP LOOPING
         JMP   :EXIT
:P2
         LDA   ]C
         LDY   #$78
:LP2
         STA   $800,Y     ; PLOT FIRST SECTION
         STA   $880,Y     ; PLOT SECOND
         STA   $900,Y     ; THIRD
         STA   $980,Y     ; FOURTH
         STA   $0A00,Y    ; FIFTH
         STA   $0A80,Y    ; SIXTH
         STA   $0B00,Y    ; SEVENTH
         STA   $0B80,Y    ; EIGHTH
         DEY              ; DECREASE OFFSET COUNTER
         BPL   :LP2       ; IF NOT NEGATIVE, KEEP LOOPING
:EXIT
         RTS
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
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 74                   *
* SIZE: 49 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]C       EQU   VARTAB     ; TEMPORARY COLOR STORAGE
*
LRGPCLR
         STA   ]C         ; STORE COLOR
         ASL              ; SHIFT LOW BYTE OF COLOR
         ASL              ; INTO THE HIGH BYTE, SINCE
         ASL              ; THE HIGH BYTE IS ALWAYS 0
         ASL
         CLC              ; CLEAR CARRY
         ADC   ]C         ; NOW ADD LOW BYTE TO THE NEW HIGH
         STA   ]C         ; SO THAT IT IS A REPEATING NIBBLE
         LDY   #$78       ; BYTE LENGTH FOR EACH LINE
                          ; THIS ALLOWS FOR FILLING EVERY PIXEL
*
         LDX   LWP        ; CHECK WHICH PAGE TO CLEAR
         CPX   #2         ; IS IT PAGE 2?
         BEQ   :P2        ; IF SO, CLEAR PAGE 2
                          ; PTHERWISE, ASSUME PAGE 1
*
:LP1
         STA   $400,Y     ; PLOT FIRST SECTION
         STA   $480,Y     ; PLOT SECOND
         STA   $500,Y     ; THIRD
         STA   $580,Y     ; FOURTH
         CPY   #80
         BPL   :NDB
         STA   $600,Y     ; FIFTH
         STA   $680,Y     ; SIXTH
         STA   $700,Y     ; SEVENTH
         STA   $780,Y     ; EIGHTH
:NDB
         DEY              ; DECREASE OFFSET COUNTER
         BPL   :LP1       ; IF NOT NEGATIVE, KEEP LOOPING
         JMP   :EXIT
*
:P2
*_PRN "PAGE 2"
         LDA   ]C
         LDY   #$78
:LP2
         STA   $800,Y     ; PLOT FIRST SECTION
         STA   $880,Y     ; PLOT SECOND
         STA   $900,Y     ; THIRD
         STA   $980,Y     ; FOURTH
         CPY   #80
         BPL   :NDB2
         STA   $0A00,Y    ; FIFTH
         STA   $0A80,Y    ; SIXTH
         STA   $0B00,Y    ; SEVENTH
         STA   $0B80,Y    ; EIGHTH
:NDB2
         DEY              ; DECREASE OFFSET COUNTER
         BPL   :LP2       ; IF NOT NEGATIVE, KEEP LOOPING
:EXIT
         RTS
