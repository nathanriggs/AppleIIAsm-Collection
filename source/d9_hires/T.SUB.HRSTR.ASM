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
*  ZPW1  = X POSITION (2)      *
*  ZPB1  = Y POSITION (1)      *
*  ZPW4  = STRING ADDRESS (2)  *
*  ZPB2  = CHARSET OFFSET (1)  *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 715+                 *
* SIZE: 639 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]STRX    EQU   ZPW1       ; {0C2B} X POSITION (0..39)
]STRY    EQU   ZPB1       ; {0C2B} Y POSITION (0..191)
]STR     EQU   ZPW2       ; {0C2B} STRING ADDRESS
]TBL     HEX   0000       ; {0C2B} CHAR TABLE ADDRESS
]ADDR    EQU   ZPW4       ; {0C2B} CHARACTER ADDRESS
]CHAR    HEX   0000       ; {0C2B} CHARACTGER OFFSET
]PRNBYTE HEX   0000       ; {0C2B} BYTE TO PLOT TO SCREEN
]STROFF  EQU   ZPB2       ; {0C1B} STRING OFFSET
]LEN     HEX   0000       ; {0C1B} STRING LENGTH
]XCOUNT  HEX   0000       ; {0C1B} STRING COUNTER
]BCOUNT  HEX   0000       ; {0C1B} BYTE COUNTER
]YSUM    HEX   0000       ; {0C1B} Y POSITION SUM
*
HRSTR
*
         LDA   #0         ; {3C2B}
         STA   ]LEN       ; {4C3B}
         STA   ]XCOUNT    ; {4C3B}
         STA   ]BCOUNT    ; {4C3B}
*
         LDY   #0         ; {3C2B}
         LDA   (]STR),Y   ; {5C3B}
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
         LDA   (]STR),Y   ; {5C3B} GET NEXT CHAR IN STRING
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
         LDY   #0         ; {3C2B} RESET BYTE COUNTER
         STY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B} LOAD BYTE TO PLOT
         STA   ]PRNBYTE   ; {4C3B}
         LDA   ]BCOUNT    ; {4C3B}
         CLC              ; {2C1B} NOW GET Y POS OFFSET
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B} PLOT BYTE
*
         INC   ]BCOUNT    ; {5C3B} INCREMENT BYTE COUNTER
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B} LOAD BYTE TO PRINT
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B} NOW GET Y OFFSET
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B} PLOT CHARACTER
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
         STA   ]PRNBYTE   ; {4C3B}
         TYA              ; {2C1B}
         CLC              ; {2C1B}
         ADC   ]STRY      ; {4C3B}
         STA   ]YSUM      ; {4C3B}
         HBSET ]STRX;]YSUM;]PRNBYTE ; {54C37B}
*
         INC   ]BCOUNT    ; {5C3B}
         LDY   ]BCOUNT    ; {4C3B}
         LDA   (]ADDR),Y  ; {5C3B}
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
