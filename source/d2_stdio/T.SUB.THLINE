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
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^^  ^^^         *
*                              *
* CYCLES: 90+                  *
* SIZE:   47 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; 1 BYTE
]X2      EQU   WPAR1+1    ; 1 BYTE
]Y1      EQU   BPAR1      ; 1 BYTE
]F       EQU   BPAR2      ; 1 BYTE
*
THLINE
         LDA   ]Y1        ; LOAD ROW
         LDY   ]X1        ; LOAD X START POS
:LOOP
         JSR   GBCALC     ; GOSUB GBASCALC ROUTINE,
                          ; WHICH FINDS MEMLOC FOR
                          ; POSITION ON SCREEN
         LDA   ]F
         STA   (GBPSH),Y  ; PUSH ]F TO SCREEN MEM
         LDA   ]Y1
         INY              ; INCREASE X POS
         CPY   ]X2        ; IF LESS THAN X END POS
         BNE   :LOOP      ; REPEAT UNTIL DONE
:EXIT
         RTS
