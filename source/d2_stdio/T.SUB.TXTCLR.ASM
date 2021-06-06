*
*``````````````````````````````*
* TXTCLR        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = FILL CHARACTER         *
*                              *
* OUTPUT:                      *
*                              *
*  FILLS THE SCREEN WITH THE   *
*  GIVEN CHARACTER. FILLS BY   *
*  SECTION TO AVOID CHANGING   *
*  SCREENHOLE VALUES.          *
*                              *
* DESTROYS: NZCIDV             *
*           ^^                 *
*                              *
* CYCLES: 42+                  *
* SIZE:   37 BYTES             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]F       EQU   ZPB1       ; FILL CHARACTER
*
TXTCLR
*
         STA   ]F         ; {4C3B} STORE FILL CHAR IN MEM
         LDY   #$78       ; {2C2B} LENGTH OF EACH SCREEN SECTION
:LP1
         STA   $400,Y     ; {5C3B} 1ST SECTION
         STA   $480,Y     ; {5C3B} 2ND SECTION
         STA   $500,Y     ; {5C3B} 3RD SECTION
         STA   $580,Y     ; {5C3B} 4TH SECTION
         CPY   #120       ; {2C2B} -- #80
         BPL   :NDB       ; {3C2B}
         STA   $600,Y     ; {5C3B} 5TH SECTION
         STA   $680,Y     ; {5C3B} 6TH SECTION
         STA   $700,Y     ; {5C3B} 7TH SECTION
         STA   $780,Y     ; {5C3B} 8TH SECTION
:NDB
         DEY              ; {2C1B} DECREASE BYTE COUNTER
         BPL   :LP1       ; {3C2B} IF POSITIVE, KEEP LOOPING
         RTS              ; {6C1B} RETURN TO CALLING ROUTINE
*
