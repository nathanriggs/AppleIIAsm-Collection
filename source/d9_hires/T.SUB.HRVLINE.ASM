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
*  ZPW5  = Y ORIGIN (1)        *
*  ZPW5+1  = Y DESTINATION (1) *
*  ZPW6  = X POSITION (2)      *
*  ZPB1  = COLOR               *
*                              *
* CYCLES: 406+                 *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]Y1      EQU   ZPW5       ; Y ORIGIN
]Y2      EQU   ZPW5+1     ; Y DESTINATION
]X       EQU   ZPW6       ; X POSITION (ROW)
]COLOR   EQU   ZPB1       ; COLOR CODE
*
HRVLINE
:LOOP
         HPLOT ]X;]Y1;]COLOR ; {348C14B} PLOT CURRENT POINT
         INC   ]Y1        ;    {5C3B} INCREASE Y POSITION
         LDY   ]Y1        ;    {4C3B}
         CPY   ]Y2        ;    {4C3B} IF Y ORIGIN != DESTINATION
         BNE   :LOOP      ;    {3C2B} CONTINUE LOOPING
:EXIT
         RTS              ; {6C1B}
