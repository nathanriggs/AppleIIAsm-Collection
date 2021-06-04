*
*``````````````````````````````*
* HRSTR                        *
*                              *
* PRINT A STRING OF CHARACTERS *
* TO THE CURRENT WORKING PAGE  *
* OF THE HIRES SCREEN.         *
*                              *
* INPUT:                       *
*                              *
*  ADDR3 = X POSITION (2)      *
*  BPAR4 = Y POSITION (1)      *
*  WPAR3 = STRING ADDRESS (2)  *
*  BPAR3 = CHARSET OFFSET (1)  *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 715+                 *
* SIZE: 639 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRX    HEX   0000       ; {0C2B} X POSITION (0..39)
]STRY    HEX   0000       ; {0C2B} Y POSITION (0..191)
]STR     HEX   0000       ; {0C2B} STRING ADDRESS
]TBL     HEX   0000       ; {0C2B} CHAR TABLE ADDRESS
]ADDR    HEX   0000       ; {0C2B} CHARACTER ADDRESS
]CHAR    HEX   0000       ; {0C2B} CHARACTGER OFFSET
]PRNBYTE HEX   0000       ; {0C2B} BYTE TO PLOT TO SCREEN
]STROFF  HEX   00         ; {0C1B} STRING OFFSET
]LEN     HEX   00         ; {0C1B} STRING LENGTH
]XCOUNT  HEX   00         ; {0C1B} STRING COUNTER
]BCOUNT  HEX   00         ; {0C1B} BYTE COUNTER
]YSUM    HEX   00         ; {0C1B} Y POSITION SUM
*
HRSTR
*
         LDA   ADDR3      ; {3C2B} X POSITION LOW BYTE
         STA   ]STRX      ; {4C3B}
         LDA   ADDR3+1    ; {3C2B} X POSITION HIGH BYTE
         STA   ]STRX+1    ; {4C3B}
         LDA   BPAR4      ; {3C2B} Y POSITION
         STA   ]STRY      ; {4C3B}
         LDA   #0         ; {3C2B} Y POS HIGH BYTE
         STA   ]STRY+1    ; {4C3B}
         LDA   WPAR3      ; {3C2B} STRING ADDRESS LOW
         STA   ]STR       ; {4C3B}
         LDA   WPAR3+1    ; {3C2B} STRING ADDRESS HIGH
         STA   ]STR+1     ; {4C3B}
         LDA   BPAR3      ; {3C2B} STRING OFFSET
         STA   ]STROFF    ; {4C3B}
*
         LDA   #0         ; {3C2B}
         STA   ]LEN       ; {4C3B}
         STA   ]XCOUNT    ; {4C3B}
         STA   ]BCOUNT    ; {4C3B}
*
         LDA   ]STR       ; {4C3B} ; GETE STRING LENGTH
         STA   ADDR3      ; {3C2B}
         LDA   ]STR+1     ; {4C3B}
         STA   ADDR3+1    ; {3C2B}
         LDY   #0         ; {3C2B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]LEN       ; {4C3B}
*
:LOOP
         LDA   ]LEN       ; {4C3B} IF LEN = XCOUNT, EXIT
         CMP   ]XCOUNT    ; {4C3B}
         BEQ   :EXIT      ; {3C2B}
         JMP   :CONT      ; {3C3B}
:EXIT    JMP   :HRSTREXIT ; {3C3B}
:CONT
         INC   ]XCOUNT    ; {5C3B} INCREMENT STRING CHAR POS
         LDY   ]XCOUNT    ; {4C3B}
         LDA   ]STR       ; {4C3B}
         STA   ADDR3      ; {3C2B}
         LDA   ]STR+1     ; {4C3B}
         STA   ADDR3+1    ; {3C2B}
         LDA   (ADDR3),Y  ; {5C3B} GET NEXT CHAR IN STRING
         SEC              ; {2C1B}
         SBC   ]STROFF    ; {4C3B} SUBTRACT OFFSET, NORMALLY #$A0
         STA   ]CHAR      ; {4C3B} STORE CHARACTER OFFSET
         LDA   #0         ; {3C2B}
         STA   ]CHAR+1    ; {4C3B}
*
         ASL   ]CHAR      ; {6C3B} MULTIPLY CHAR OFFSET BY 8
         ROL   ]CHAR+1    ; {6C3B} TO GET OFFSET IN BYTES
         ASL   ]CHAR      ; {6C3B}
         ROL   ]CHAR+1    ; {6C3B}
         ASL   ]CHAR      ; {6C3B}
         ROL   ]CHAR+1    ; {6C3B}
*
         LDA   ]CHAR      ; {4C3B} ADD TABLE ADDRESS TO
         CLC              ; {2C1B} CHAR OFFSET AND STORE AS
         ADC   #<HRCTBL   ; {4C3B} NEW ADDRESS. THIS IS THE
         STA   ]ADDR      ; {4C3B} ADDRESS OF THE INDIVIDUAL
         LDA   ]CHAR+1    ; {4C3B} CHARACTER IN THE TABLE
         ADC   #>HRCTBL   ; {4C3B}
         STA   ]ADDR+1    ; {4C3B}
*
         LDA   ]ADDR      ; {4C3B}
         STA   ADDR3      ; {3C2B}
         LDA   ]ADDR+1    ; {4C3B}
         STA   ADDR3+1    ; {3C2B}
*
         LDY   #0         ; {3C2B} RESET BYTE COUNTER
         STY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B} LOAD BYTE TO PLOT
         STA   ]PRNBYTE   ; {4C3B}
         LDA   ]BCOUNT    ; {4C3B}
         CLC              ; {2C1B} NOW GET Y POS OFFSET
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B} PLOT BYTE
*
         INC   ]BCOUNT    ; {5C3B} INCREMENT BYTE COUNTER
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B} LOAD BYTE TO PRINT
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B} NOW GET Y OFFSET
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B} PLOT CHARACTER
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (ADDR3),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]STRX      ; {5C3B}
         JMP   :LOOP      ; {3C3B}
*
:HRSTREXIT
         RTS              ; {6C1B}
