*
*``````````````````````````````*
* HRHLINE                      *
*                              *
* CREATE A HORIZONTAL LINE ON  *
* THE HIRES WORKING PAGE AT    *
* THE GIVEN COORDINATES AND    *
* COLOR.                       *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = X ORIGIN            *
*  WPAR2 = X DESTINATION (2)   *
*  BPAR1 = Y POSITION (1)      *
*  BPAR2 = COLOR (1)           *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 442+                 *
* SIZE: 78 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      HEX   0000       ; X ORIGIN
]X2      HEX   0000       ; X DESTINATION
]Y       HEX   00         ; Y POSITION (COLUMN)
]COLOR   HEX   00         ; COLOR CODE
*
HRHLINE
         LDA   WPAR1      ; {3C2B} SAVE X ORIGIN LOW BYTE
         STA   ]X1        ; {4C3B}
         LDA   WPAR1+1    ; {3C2B} SAVE X DESTINATION HIGH BYTE
         STA   ]X1+1      ; {4C3B}
         LDA   WPAR2      ; {3C2B} SAVE X DESTINATION LOW BYTE
         STA   ]X2        ; {4C3B}
         LDA   WPAR2+1    ; {3C2B} SAVE X DESTINATION HIGH BYTE
         STA   ]X2+1      ; {4C3B}
         LDA   BPAR1      ; {3C2B} SAVE Y POSITION
         STA   ]Y         ; {4C3B}
         LDA   BPAR2      ; {3C2B} SAVE COLOR
         STA   ]COLOR     ; {4C3B}
*
:LOOP
         HPLOT ]X1;]Y;]COLOR ; {348C14B} PLOT POINT ON LINE
         LDA   ]X1        ;    {4C3B} LOAD X ORIGIN
         CLC              ;    {2C1B}
         ADC   #1         ;    {3C2B} ADD 1 TO LOW BYTE
         STA   ]X1        ;    {4C3B} STORE BACK INTO LOW BYTE
         LDA   ]X1+1      ;    {4C3B} LOAD THE HIGH BYTE
         ADC   #0         ;    {3C2B} ADJUST FOR CARRY
         STA   ]X1+1      ;    {4C3B} STORE BACK INTO HIGH BYTE
         LDY   ]X1        ;    {4C3B} LOAD CURRENT POSITION
         CPY   ]X2        ;    {4C3B} COMPARE IT TO DESTINATION
         BNE   :LOOP      ;    {3C2B} IF !=, THEN LOOP AGAIN
         LDY   ]X1+1      ;    {4C3B} ELSE LOAD HIGH BYTE
         CPY   ]X2+1      ;    {4C3B} AND COMPARE TO DESTINATION
         BNE   :LOOP      ;    {3C2B} IF !=, KEEP LOOPING
:EXIT
         RTS              ; {6C1B}
