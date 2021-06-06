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
*  ZPW5  = X ORIGIN            *
*  ZPW6  = X DESTINATION (2)   *
*  PASSTAB = Y POSITION (1)    *
*  PASSTAB+2 = COLOR (1)       *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 442+                 *
* SIZE: 78 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]X1      EQU   ZPW5       ; X ORIGIN
]X2      EQU   ZPW6       ; X DESTINATION
]Y       EQU   PASSTAB    ; Y POSITION (COLUMN)
]COLOR   EQU   PASSTAB+2  ; COLOR CODE
*
HRHLINE
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
