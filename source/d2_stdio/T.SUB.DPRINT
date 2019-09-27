*
*``````````````````````````````*
* DPRINT        (NATHAN RIGGS) *
*                              *
* PRINT A ZERO-TERMINATED      *
* STRING AT A GIVEN ADDRESS.   *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS (2B) *
*                              *
* OUTPUT:                      *
*                              *
*  PRINT STRING TO SCREEN      *
*                              *
* DESTROYS: AXYNVBDIZCMS       *
*           ^^^^    ^ ^        *
*                              *
* CYCLES: 61+                  *
* SIZE:   27 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR1   EQU   WPAR1
*
DPRINT
*
         LDY   #$00       ; RESET COUNTER
:LOOP
         LDA   (]ADDR1),Y
         BEQ   :EXIT      ; IF CHAR = $00 THEN EXIT
         JSR   COUT1      ; OTHERWISE, PRINT CHAR
         INY              ; INCREAS COUNTER
         BNE   :LOOP      ; IF COUNTER < 256, LOOP
:EXIT
         RTS
