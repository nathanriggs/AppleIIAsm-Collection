*
*``````````````````````````````*
* TRECTF        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR1+1 = X DESTINATION     *
*  WPAR2 = Y ORIGIN            *
*  WPAR2+1 = Y DESTINATION     *
*  BPAR1 = FILL CHARACTER      *
*                              *
* OUTPUT                       *
*                              *
*  FILLED RECTANGLE TO SCREEN  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 69+                  *
* SIZE:   74 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; 1 BYTE
]X2      EQU   WPAR1+1    ; 1 BYTE
]Y1      EQU   WPAR2      ; 1 BYTE
]Y2      EQU   WPAR2+1    ; 1 BYTE
]F       EQU   BPAR1      ; 1 BYTE
*
]XC      EQU   VARTAB     ; 1 BYTE
]YC      EQU   VARTAB+1   ; 1 BYTE
*
TRECTF
         LDA   ]X1
         STA   ]XC
         LDA   ]Y1
         STA   ]YC
:LP1                      ; PRINT HORIZONTAL LINE
         LDA   ]YC
         LDY   ]XC
         JSR   GBCALC     ; GET SCREEN MEMORY ADDR
         LDA   ]F         ; OF CURRENT POSITION
         STA   (GBPSH),Y  ; PUT CHAR IN LOCATION
         LDA   ]YC
         INY              ; INCREASE XPOS
         STY   ]XC
         CPY   ]X2        ; IF XPOS < XMAX,
         BNE   :LP1       ; KEEP PRINTING LINE
*
         LDA   ]X1        ; OTHERWISE, RESET XPOS
         STA   ]XC
         INC   ]YC        ; AND INCREASE YPOS
         LDA   ]YC
         CMP   ]Y2        ; IF YPOS < YMAX
         BNE   :LP1       ; PRINT HORIZONTAL LINE
:EXIT
         RTS
