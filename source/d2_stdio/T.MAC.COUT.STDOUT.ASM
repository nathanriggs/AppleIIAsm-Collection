*
*``````````````````````````````*
* MAC.COUT.STDOUT.ASM          *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* STANDARD INPUT AND OUTPUT.   *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINES FILES USED:      *
*                              *
*  SUB.XPRINT                  *
*  SUB.DPRINT                  *
*  SUB.PRNSTR                  *
*  SUB.TXTMORE                 *
*  SUB.TXTCENT                 *
*                              *
* LIST OF MACROS               *
*                              *
* PRN   : FLEXIBLE PRINT       *
* SPRN  : PRINT STRING         *
* SCPOS : SET CURS POS AT X,Y  *
* SETCX : SET CURSOR X         *
* SETCY : SET CURSOR Y         *
* CURF  : CURSOR FORWARD       *
* CURB  : CURSOR BACKWARD      *
* CURU  : CURSOR UP            *
* CURD  : CURSOR DOWN          *
* TMORE : TEXT MORE WRAPPER    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PRN                          *
*                              *
* PRINT A LITERAL STRING OR    *
* A NULL-TERMINATED STRING AT  *
* A GIVEN ADDRESS.             *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING OR ADDRESS      *
*                              *
* CYCLES: 159+ OR 127+         *
* BYTES: 2+ OR 15              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PRN      MAC
         IF    ",]1 ;     ; {0C0B}    IF PARAM IS A STRING
         JSR   XPRINT     ; {159C0B}  GOSUB TO STACK PRINT ROUTINE
         ASC   ]1         ; {0C1B}    PUT STRING HERE FOR STACK
         HEX   00         ; {0C1B}    PRINT TO ACCESS; TERMINATE
         ELSE             ; {0C0B}    OTHERWISE, PARAM IS AN ADDRESS
         _MLIT ]1;ZPW1    ; {16C12B}  SO PARSE ADDRESS FOR DIRECT OR
         JSR   DPRINT     ; {111C3B}  INDIRECT PASSING, THEN GOSUB
         FIN              ;           REGULAR PRINT ROUTINE
         <<<
*
*``````````````````````````````*
* SPRN                         *
*                              *
* PRINTS THE STRING LOCATED AT *
* THE SPECIFIED ADDRESS, WHICH *
* HAS A PRECEDING LENGTH BYTE. *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = STRING ADDRESS         *
*                              *
* CYCLES: 147+                 *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPRN     MAC
         _AXLIT ]1        ; {8C6B}   PARSE INTO REGISTERS
         JSR   PRNSTR     ; {139C3B} EXECUTE PRNSTR ROUTINE
         <<<
*
*``````````````````````````````*
* SCPOS                        *
*                              *
* SETS THE CURSOR POSITION.    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X POSITION             *
*  ]2 = Y POSITION             *
*                              *
* CYCLES: 20+                  *
* SIZE: 13 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCPOS    MAC
         LDX   ]1         ; {4C3B} HORIZONTAL POSITION
         STX   CURSH      ; {3C2B}
         LDX   ]2         ; {4C3B} VERTICAL POSITION
         STX   CURSV      ; {3C2B}
         JSR   VTAB       ; {6C3B} EXECUTE VTAB ROUTINE
         <<<
*
*``````````````````````````````*
* SETCX                        *
*                              *
* SETS THE CURSOR X POSITION.  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X POSITION             *
*                              *
* CYCLES: 13+                  *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SETCX    MAC
         LDX   ]1         ; {4C3B} GET HORIZONTAL POS
         STX   CURSH      ; {3C2B} AND STORE IN CURSH
         JSR   VTAB       ; {6C3B} CALL VTAB ROUTINE
         <<<
*
*``````````````````````````````*
* SETCY                        *
*                              *
* SET THE CURSOR Y POSITION.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = Y POSITION             *
*                              *
* CYCLES: 13+                  *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SETCY    MAC
         LDY   ]1         ; {4C3B} VERTICAL POSITION
         STY   CURSV      ; {3C2B} INTO CURSV LOCATION
         JSR   VTAB       ; {6C3B} CALL VTAB ROUTINE
         <<<
*
*``````````````````````````````*
* CURF                         *
*                              *
* MOVE CURSOR FORWARD A NUMBER *
* OF SPACES.                   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = # OF SPACES TO MOVE    *
*                              *
* CYCLES: 18+                  *
* SIZE: 11 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURF     MAC
         LDA   ]1         ; {4C3B} SPACES TO ADD TO
         CLC              ; {2C1B} CURRENT POSITION
         ADC   CURSH      ; {3C2B} ADD CURRENT POSITION
         STA   CURSH      ; {3C2B} STORE NEW IN CURSH
         JSR   VTAB       ; {6C3B} CALL VTAB ROUTINE
         <<<
*
*``````````````````````````````*
* CURB                         *
*                              *
* MOVE THE CURSOR BACKWARD BY  *
* A NUMBER OF SPACES.          *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = # OF SPACES TO MOVE    *
*                              *
* CYCLES: 17+                  *
* SIZE: 10 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURB     MAC
         LDA   CURSH      ; {3C2B} GET CURRENT CURSOR XPOS
         SEC              ; {2C1B} SET CARRY
         SBC   ]1         ; {3C2B} SUBTRACT # OF SPACES PASSED
         STA   CURSH      ; {3C2B} AND STORE BACK IN CURSH
         JSR   VTAB       ; {6C3B} EXEC VTAB SUBROUTINE
         <<<
*
*``````````````````````````````*
* CURU                         *
*                              *
* MOVE CURSOR UP BY A NUMBER   *
* OF SPACES.                   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = # OF SPACES TO GO UP   *
*                              *
* CYCLES: 17+                  *
* SIZE: 10 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURU     MAC
         LDA   CURSV      ; {3C2B} GET CURRENT YPOS
         SEC              ; {2C1B} SET CARRY
         SBC   ]1         ; {3C2B} SUBTRACT GIVEN PARAM
         STA   CURSV      ; {3C2B} AND STORE BACK IN CURSV
         JSR   VTAB       ; {6C3B} VTAB MONITOR ROUTINE
         <<<
*
*``````````````````````````````*
* CURD                         *
*                              *
* MOVE THE CURSOR DOWN BY A    *
* NUMBER OF SPACES.            *
*                              *
* PARAMETERS                   *
*                              *
*   ]1 = # OF SPACES TO MOVE   *
*                              *
* CYCLES: 17+                  *
* SIZE: 10 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURD     MAC
         LDA   CURSV      ; {3C2B} GET CURRENT YPOS
         CLC              ; {2C1B} CLEAR CARRY
         ADC   ]1         ; {3C2B} ADD GIVEN PARAMETER
         STA   CURSV      ; {3C2B} STORE BACK IN CURSV
         JSR   VTAB       ; {6C3B} EXEC VTAB SUBROUTINE
         <<<
*
*``````````````````````````````*
* TMORE                        *
*                              *
* SCROLL THROUGH A ZERO-       *
* TERMINATED STRING ON THE     *
* SCREEN, PAUSING EVERY GIVEN  *
* INTERVAL _OR_ PAUSING EVERY  *
* TIME A NEWLINE CHARACTER IS  *
* ENCOUNTERED.                 *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = LINE MAXIMUM LENGTH    *
*  ]3 = LINE PAUSE INTERVAL,   *
*       EVERY NEWLINE IF = 0   *
*                              *
* CYCLES: 496+                 *
* SIZE: 22 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TMORE    MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE ADDR TO ZERO PAGE
         LDA   ]2         ; {4C3B}  LOAD MAX LENGTH
         STA   ZPW2       ; {3C2B}  STORE IN ZERO PAGE
         LDA   ]3         ; {4C3B}  LOAD LINE INTERVAL
         STA   ZPB1       ; {3C2B}  STORE IN ZERO PAGE
         JSR   TXTMORE    ; {466C0B} CALL TXTMORE SUBROUTINE
         <<<
