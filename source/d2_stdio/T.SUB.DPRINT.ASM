*
*``````````````````````````````*
* DPRINT        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS (2B) *
*                              *
* OUTPUT:                      *
*                              *
*  PRINT A ZERO-TERMINATED     *
*  STRING AT A GIVEN ADDRESS.  *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 111+                 *
* SIZE:   12 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ADDR1   EQU   WPAR1      ; INDIRECT ADDRESS IS PASSED HERE
*
DPRINT
*
         LDY   #$00       ; {2C2B} RESET COUNTER {NZ}
:LOOP
         LDA   (]ADDR1),Y ; {6C2B} GET NEXT CHARACTER IN STRING {NZ}
         BEQ   :EXIT      ; {3C2B} IF CHAR = $00 THEN EXIT
         JSR   COUT1      ; {89C2B} OTHERWISE, PRINT CHAR {NZCV}
         INY              ; {2C1B} INCREAS COUNTER {NZ}
         BNE   :LOOP      ; {3C2B} IF COUNTER < 256, LOOP
:EXIT
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE
