*
*``````````````````````````````*
* MAC.SCRMEM.STDIO.ASM         *
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
*  SUB.TVLINE                  *
*  SUB.THLINE                  *
*  SUB.TRECTF                  *
*  SUB.TBLINE                  *
*  SUB.TCIRCLE                 *
*  SUB.TXTPUT                  *
*  SUB.TXTCLR                  *
*  SUB.STRPUT                  *
*  SUB.TRECT                   *
*                              *
* LIST OF MACROS               *
*                              *
* RCPOS : READ CURSOR POSITION *
* TLINE : DIAGONAL TEXT LINE   *
* TCIRC : TEXT CIRCLE          *
* TVLIN : TEXT VERTICAL LINE   *
* THLIN : TEXT HORIZ LINE      *
* TRECF : TEXT FILL RECTANGLE  *
* CPUT  : TEXT CHAR PLOT AT XY *
* TCLR  : FILL SCREEN W/ CHAR  *
* TREC  : CREATE UNFILLED RECT *
* SPUT  : STRING PUT           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* RCPOS                        *
*                              *
* READ THE CHARACTER AT POS    *
* X,Y AND LOADS INTO ACCUM     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X POSITION             *
*  ]2 = Y POSITION             *
*                              *
* CYCLES: 10+                  *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RCPOS    MAC
         LDY   ]1         ; {2C2B} PUT ROW INTO .Y
         LDA   ]2         ; {2C2B} PUT COLUMN IN .A
         JSR   GBCALC     ; {????} GET MEM ADDRESS FOR COORDS
         LDA   (GBPSH),Y  ; {6C2B} GET CHARACTER FROM MEMORY
         <<<
*
*``````````````````````````````*
* TVLIN                        *
*                              *
* CREATE A VERTICAL LINE WITH  *
* A GIVEN TEXT FILL CHARACTER  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = START OF VERT LINE     *
*  ]2 = END OF VERT LINE       *
*  ]3 = X POSITION OF LINE     *
*  ]4 = FILL CHARACTER         *
*                              *
* CYCLES: 111+                 *
* SIZE: 23 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TVLIN    MAC
         LDA   ]1         ; {4C3B}   Y-COORDINATE ORIGIN
         STA   ZPW2       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   Y-COORDINATE DESTINATION
         STA   ZPW2+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   X-COORDINATE OF LINE
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   CHARACTER TO PLOT
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   TVLINE     ; {83C3B}  CALL TVLINE SUBROUTINE
         <<<
*
*``````````````````````````````*
* THLIN                        *
*                              *
* CREATE A HORIZONTAL LINE     *
* FROM A FILL CHARACTER.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = START OF HORIZ LINE    *
*  ]2 = END OF HORIZ LINE      *
*  ]3 = Y POSITION OF LINE     *
*  ]4 = FILL CHARACTER         *
*                              *
* CYCLES: 115+                 *
* SIZE: 23 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
THLIN    MAC
         LDA   ]1         ; {4C3B}   X-COORDINATE ORIGIN
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   X-COORDINATE DESTINATION
         STA   ZPW1+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   Y-COORDINATE OF LINE
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   CHARACTER TO FILL
         STA   ZPB2       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   THLINE     ; {87C3B}  CALL THLINE SUBROUTINE
         <<<
*
*``````````````````````````````*
* TRECF                        *
*                              *
* CREATE A RECTANGLE FILLED    *
* WITH A GIVEN TEXT CHARACTER  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = HORIZ START POSITION   *
*  ]2 = VERT START POSITION    *
*  ]3 = HORIZ END POSITION     *
*  ]4 = VERT END POSITION      *
*  ]5 = FILL CHARACTER         *
*                              *
* CYCLES: 168+                 *
* SIZE: 28 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TRECF    MAC
         LDA   ]1         ; {4C3B}   X-COORDINATE ORIGIN
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   Y-COORDINATE ORIGIN
         STA   ZPW2       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   X-COORDINATE DESTINATION
         STA   ZPW1+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   Y-COORDINATE DESTINATION
         STA   ZPW2+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]5         ; {4C3B}   CHARACTER TO PLOT
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   TRECTF     ; {133C3B} CALL TRECTF SUBROUTINE
         <<<
*
*``````````````````````````````*
* CPUT                         *
*                              *
* PLOT A SINGLE TEXT CHARACTER *
* DIRECTLY TO SCREEN MEMORY AT *
* A GIVEN X,Y POSITION.        *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X POSITION             *
*  ]2 = Y POSITION             *
*  ]3 = CHARACTER TO PLOT      *
*                              *
* CYCLES: 97+                  *
* SIZE: 12 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPUT     MAC
         LDX   ]1         ; {4C3B}   CARRY X-COORD IN .X
         LDY   ]2         ; {4C3B}   CARRY Y-COORD IN .Y
         LDA   ]3         ; {4C3B}   CARRY FILL CHAR IN .A
         JSR   TXTPUT     ; {85C3B}  CALL TXTPUT SUBROUTINE
         <<<
*
*``````````````````````````````*
* TLINE                        *
*                              *
* USE THE BRESSENHAM LINE      *
* ALGORITHM TO DRAW A LINE     *
* WITH A FILL CHARACTER.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X-ORIGIN               *
*  ]2 = Y-ORIGIN               *
*  ]3 = X-DESTINATION          *
*  ]4 = Y-DESTINATION          *
*  ]5 = FILL CHARACTER         *
*                              *
* CYCLES: 321+                 *
* SIZE: 28 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TLINE    MAC
         LDA   ]1         ; {4C3B}   LOAD X-ORIGIN
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   LOAD Y-ORIGIN
         STA   ZPW1+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   LOAD X-DESTINATION
         STA   ZPW2       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   LOAD Y-DESTINATION
         STA   ZPW2+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]5         ; {4C3B}   LOAD FILL CHARACTER
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   TBLINE     ; {286C3B} CALL TBLINE SUBROUTINE
         <<<
*
*``````````````````````````````*
* TCIRC                        *
*                              *
* USE THE BRESSENHAM CIRCLE    *
* ALGORITHM TO DRAW A CIRCLE   *
* WITH A FILL CHARACTER.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = CENTER X-LOCATION      *
*  ]2 = CENTER Y-LOCATION      *
*  ]3 = RADIUS                 *
*  ]4 = FILL CHARACTER         *
*                              *
* CYCLES: 635+                 *
* SIZE: 23 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCIRC    MAC
         LDA   ]1         ; {4C3B}   LOAD CENTER X-COORD
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   LOAD CENTER Y-COORD
         STA   ZPW2       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   LOAD RADIUS
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   LOAD FILL CHARACTER
         STA   ZPB2       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   TCIRCLE    ; {607C3B} CALL TCIRCLE SUBROUTINE
         <<<
*
*``````````````````````````````*
* TREC                         *
*                              *
* CREATE A RECTANGULAR BORDER  *
* ON THE SCREEN. NOTE THAT THE *
* INSIDE IS NOT FILLED WITH    *
* ANY CHARACTER, INCLUDING     *
* BLANK SPACES.                *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X ORIGIN               *
*  ]2 = Y ORIGIN               *
*  ]3 = X DESTINATION          *
*  ]4 = Y DESTINATION          *
*  ]5 = BORDER CHARACTER       *
*                              *
* CYCLES: 373+                 *
* SIZE: 28 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TREC     MAC
         LDA   ]1         ; {4C3B}   LOAD X-ORIGIN
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   LOAD Y-ORIGIN
         STA   ZPW1+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]3         ; {4C3B}   LOAD X-DESTINATION
         STA   ZPW2       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]4         ; {4C3B}   LOAD Y-DESTINATION
         STA   ZPW2+1     ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]5         ; {4C3B}   LOAD FILL CHARACTER
         STA   ZPB1       ; {3C2B}   PASS VIA ZERO PAGE
         JSR   TRECT      ; {338C3B} CALL TRECT SUBROUTINE
         <<<
*
*``````````````````````````````*
* SPUT                         *
*                              *
* THIS MACRO PLOTS A CHARACTER *
* TO THE SCREEN VIA DIRECT     *
* ACCESS TO SCREEN MEMORY.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = X COORDINATE           *
*  ]2 = Y COORDINATE           *
*  ]3 = ADDRESS OF STRING      *
*       TO PRINT ON SCREEN     *
*                              *
* CYCLES: 128+                 *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPUT     MAC
         LDA   ]1         ; {4C3B}   GET X COORDINATE
         STA   ZPW1       ; {3C2B}   PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B}   GET Y COORDINATE
         STA   ZPW1+1     ; {3C2B}   PASS VIA ZERO PAGE
         _MLIT ]3;ZPW2    ; {16C12B} PARSE STRING ADDRESS
         JSR   STRPUT     ; {98C3B}  CALL STRPUT SUBROUTINE
         <<<
*
*``````````````````````````````*
* TCLR                         *
*                              *
* THE TCLR MACRO FILLS (OR     *
* CLEARS) THE ENTIRE SCREEN    *
* WITH A GIVEN CHARACTER.      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FILL CHARACTER         *
*                              *
* CYCLES: 52+                  *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCLR     MAC
         LDA   ]1         ; {4C3B}   LOAD FILL CHARACTER
         JSR   TXTCLR     ; {48C3B}  CALL TXTCLR SUBROUTINE
         <<<
