*
*``````````````````````````````*
* HRPLOT        (NATHAN RIGGS) *
*                              *
* PLOT A POINT ONT THE HIGH    *
* RESOLUTION SCREEN. THIS WILL *
* PLOT TO THE CURRENT WORKING  *
* PAGE.                        *
*                              *
* INPUT:                       *
*                              *
*  ADDR3 = X POSITION (2)      *
*  BPAR2 = Y POSITION          *
*  BPAR1 = COLOR               *
*                              *
*  DESTROY: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 323+                 *
* SIZE: 211 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]COLOR   EQU   BPAR1      ; HIRES COLOR CODE
]X       EQU   ADDR3      ; ORIGINAL X POSITION
]Y       EQU   BPAR2      ; ORIGINAL Y POSITION
]RESOFF  EQU   ADDR1      ; DIVISION RESULT OFFSET
]REMOFF  EQU   ADDR2      ; DIVISION REMAINDER OFFSET
]PIXEL   EQU   WPAR2      ; BYTE CONTAINING SINGLE PIXEL TO PLOT
]BYTE    EQU   WPAR2+1    ; BYTE LOCATION TO PLOT AT
]NEWB    EQU   BPAR3      ; NEW BYTE
*
HRPLOT
*
         STY   ]Y         ; {3C2B} Y POSITION HELD IN .Y
         STA   ]X         ; {3C2B} X POSITION LOW BYTE
         STX   ]X+1       ; {3C2B} X POSITION HIGH BYTE
         CLC              ; {2C1B}
         ADC   #<DB7RES   ; {4C3B} ADD DIVIDE BY 7 TABLE ADDRESS
         STA   ]RESOFF    ; {3C2B} STORE IN RESULT OFFSET
         LDA   ]X+1       ; {3C2B} LODA X POSITION HIGH BYTE
         ADC   #>DB7RES   ; {4C3B} ADD DIVIDE BY 7 TABLE ADDRESS
         STA   ]RESOFF+1  ; {3C2B} STORE IN RESULT OFFSET HIGH
*
         LDA   ]X         ; {3C2B} LOAD X POSITION
         CLC              ; {2C1B}
         ADC   #<DB7REM   ; {4C3B} ADD DIV BY 7 REM TABLE ADDR
         STA   ]REMOFF    ; {3C2B} STORE IN REMAINDER OFFSET LOW
         LDA   ]X+1       ; {3C2B} LOAD X POSITION HIGH BYTE
         ADC   #>DB7REM   ; {4C3B} ADD DIV BY 7 REM TABLE ADDR
         STA   ]REMOFF+1  ; {3C2B} STORE IN REMAINDER OFFSET HIGH
*
         LDY   #$00       ; {3C2B} RESET .Y INDEX TO ZERO
         LDA   (]RESOFF),Y ; {5C2B} LOAD DIV BY 7 RESULT
         STA   ]BYTE      ; {3C2B} STORE THE RESULT HERE
         LDA   (]REMOFF),Y ; {5C3B} NOW LOAD DIV BY 7 REMAINDER
         STA   ]PIXEL     ; {3C2B} AND STORE AS PIXEL POSITION
         LDA   ]COLOR     ; {3C2B} GET THE COLOR CODE
         CMP   #0         ; {3C2B} IS IT BLACK 1?
         BEQ   :BLACK     ; {3C2B} IF YES, THEN GOTO :BLACK
         CMP   #4         ; {3C2B} IS IT BLACK 2?
         BEQ   :BLACK     ; {3C2B} IF YES, THEN GOTO :BLACK
         JMP   :MASK      ; {3C3B} ELSE, JUMP TO :MASK
:BLACK
         LDA   ]PIXEL     ; {3C2B} LOAD PIXEL POSITION
         EOR   #$FF       ; {2C2B} INVERT BITS (0 = 1, 1 = 0)
         STA   ]PIXEL     ; {3C2B} STORE BACK INTO PIXEL POS
         HBGET ]BYTE;]Y   ; {49C30B} GET BYTE ALREADY AT DESTINATION
         AND   ]PIXEL     ; {3C2B} LOG AND BY PIXEL POSITION
         STA   ]NEWB      ; {3C2B} STORE IN NEW BYTE
         JMP   :TESTHI    ; {3C3B} JUMP TO TESTING HIGH BIT
*
:MASK    LDY   ]COLOR     ; {3C2B} LOAD COLOR CODE
         LDA   ]BYTE      ; {3C2B} LOAD BYTE TO CHECK EVEN OR ODD
         CLC              ; {2C1B}
         ROR              ; {2C2B} ROTATE LEFTMOST BIT INTO CARRY
         BCC   :EVEN      ; {3C2B} IF CARRY CLEAR, GOTO :EVEN
:ODD     LDA   CT_ODD,Y   ; {5C2B} IF NO,IT'S ODD--GET MASK FROM TABLE
         AND   ]PIXEL     ; {3C2B} LOGICAL AND IT WITH THE PIXEL POS
         STA   ]PIXEL     ; {3C2B} STORE BACK INTO PIXEL POS
         JMP   :PLOT      ; {3C3B} JUMP TO PLOTTING
:EVEN
         LDA   CT_EVEN,Y  ; {5C3B} READ COLOR MASK FROM TABLE
         AND   ]PIXEL     ; {3C2B} LOGICAL AND IT WITH PIXEL POS
         STA   ]PIXEL     ; {3C2B} STORE NEW PIXEL POS VALUE
:PLOT
         HBGET ]BYTE;]Y   ; {49C30B} GET THE BYTE CURRENTLY THERE
         ORA   ]PIXEL     ; {3C2B} LOGICAL OR IT WITH THE PIXEL
         STA   ]NEWB      ; {3C2B} STORE AS A NEW BYTE
:TESTHI  LDA   ]COLOR     ; {3C2B} LOAD COLOR TO TEST FOR HI BIT SET
         CMP   #4         ; {3C2B} IF COLOR < 4 THEN
         BCC   :PLOT2     ; {4C3B} SKIP TO ACTUAL PLOTTING
         LDA   ]NEWB      ; {3C2B} ELSE LOAD THE NEW BYTE
         ORA   #$80       ; {3C2B} AND TURN ON MOST SIGNIFICANT BIT
         STA   ]NEWB      ; {3C2B} AND STORE THE NEW BYTE AGAIN
:PLOT2
         HBSET ]BYTE;]Y;]NEWB ; {54C37B} NOW PLOT NEW BYTE TO MEMORY
         RTS              ; {6C1B}
