*
*``````````````````````````````*
* THLINE        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR1+1 = X DESTINATION     *
*  BPAR1 = Y POSITION          *
*  BPAR2 = FILL CHARACTER      *
*                              *
* OUTPUT:  HORIZONTAL LINE TO  *
*          SCREEN              *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 81+                  *
* SIZE:   19 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; X POS ORIGIN
]X2      EQU   WPAR1+1    ; X POS DESTINATION
]Y1      EQU   BPAR1      ; Y POSITION
]F       EQU   BPAR2      ; FILL CHAR
*
THLINE
               LDA        ]Y1 ; {3C2B} LOAD ROW {NZ}
         LDY   ]X1        ; {3C2B} LOAD X START POS {NZ}
:LOOP
         JSR   GBCALC     ; {49C3B} GOSUB GBASCALC ROUTINE, {NZCV}
                          ; WHICH FINDS MEMLOC FOR
                          ; POSITION ON SCREEN
         LDA   ]F         ; {3C2B} LOAD FILL CHAR  {NZ}
         STA   (GBPSH),Y  ; {6C2B} PUSH ]F TO SCREEN MEM
         LDA   ]Y1        ; {3C2B} LOAD Y POSITION {NZ}
         INY              ; {2C1B} INCREASE X POS {NZ}
         CPY   ]X2        ; {3C2B} IF < X DEST THEN END {NZC}
         BNE   :LOOP      ; {3C2B} REPEAT UNTIL DONE
:EXIT
         RTS              ; {6C1B}
