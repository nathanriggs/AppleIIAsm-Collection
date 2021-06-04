*
*``````````````````````````````*
* HRVLINE                      *
*                              *
* CREATE A VERTICAL LINE ON    *
* THE WORKING HIRES PAGE AT    *
* THE GIVEN COORDINATES AND    *
* COLOR.                       *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = Y ORIGIN (1)        *
*  WPAR1+1 = Y DESTINATION (1) *
*  WPAR2 = X POSITION (2)      *
*  BPAR2 = COLOR               *
*                              *
* CYCLES: 406+                 *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]Y1      HEX   00         ; Y ORIGIN
]Y2      HEX   00         ; Y DESTINATION
]X       HEX   0000       ; X POSITION (ROW)
]COLOR   HEX   00         ; COLOR CODE
*
HRVLINE
         LDA   WPAR1      ; {3C2B} STORE Y ORIGIN
         STA   ]Y1        ; {4C3B}
         LDA   WPAR1+1    ; {3C2B} STORE Y DESTINATION
         STA   ]Y2        ; {4C3B}
         LDA   WPAR2      ; {3C2B} STORE X POSITION
         STA   ]X         ; {4C3B}
         LDA   WPAR2+1    ; {3C2B} STORE X POS HIGH BYTE
         STA   ]X+1       ; {4C3B}
         LDA   BPAR2      ; {3C2B} STORE COLOR
         STA   ]COLOR     ; {4C3B}
:LOOP
         HPLOT ]X;]Y1;]COLOR ; {348C14B} PLOT CURRENT POINT
         INC   ]Y1        ;    {5C3B} INCREASE Y POSITION
         LDY   ]Y1        ;    {4C3B}
         CPY   ]Y2        ;    {4C3B} IF Y ORIGIN != DESTINATION
         BNE   :LOOP      ;    {3C2B} CONTINUE LOOPING
:EXIT
         RTS              ; {6C1B}
