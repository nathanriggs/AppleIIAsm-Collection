*
*``````````````````````````````*
* TVLINE        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*    ]X1 STORED AT WPAR1       *
*    ]Y1 STORED AT WPAR2       *
*    ]Y2 STORED AT WPAR2+1     *
*    ]F STORED AT BPAR1        *
*                              *
* OUTPUT: VERT LINE TO SCREEN  *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 33+                  *
* SIZE:   34 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   WPAR1      ; 1 BYTE
]Y1      EQU   WPAR2      ; 1 BYTE
]Y2      EQU   WPAR2+1    ; 1 BYTE
]F       EQU   BPAR1      ; 1 BYTE
*
TVLINE
*
         LDA   ]Y1
         LDY   ]X1
:LOOP
         JSR   GBCALC     ; GET POS SCREEN ADDRESS
         LDA   ]F
         STA   (GBPSH),Y  ; PLOT TO SCREEN MEMORY
         INC   ]Y1
         LDA   ]Y1
         CMP   ]Y2        ; IF Y1 < Y2
         BNE   :LOOP      ; LOOP; ELSE, CONTINUE
:EXIT
         RTS
