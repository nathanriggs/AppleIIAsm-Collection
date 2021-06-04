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
* DATE:      11-MAR-2021       *
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
* CYCLES: 104+                 *
* SIZE: 45 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TVLIN    MAC
         LDA   ]1         ; {2C2B} Y-COORDINATE ORIGIN
         STA   WPAR2      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} Y-COORDINATE DESTINATION
         STA   WPAR2+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} X-COORDINATE OF LINE
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {3C2B} CHARACTER TO PLOT
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         JSR   TVLINE     ; {83C29B} CALL TVLINE SUBROUTINE
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
* CYCLES: 107+                 *
* SIZE: 38 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
THLIN    MAC
         LDA   ]1         ; {2C2B} X-COORDINATE ORIGIN
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} X-COORDINATE DESTINATION
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} Y-COORDINATE OF LINE
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {2C2B} CHARACTER TO FILL
         STA   BPAR2      ; {3C2B} PASS VIA ZERO PAGE
         JSR   THLINE     ; {87C22B} CALL THLINE SUBROUTINE
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
* CYCLES: 157+                 *
* SIZE: 77 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TRECF    MAC
         LDA   ]1         ; {2C2B} X-COORDINATE ORIGIN
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} Y-COORDINATE ORIGIN
         STA   WPAR2      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} X-COORDINATE DESTINATION
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {2C2B} Y-COORDINATE DESTINATION
         STA   WPAR2+1    ; {2C2B} PASS VIA ZERO PAGE
         LDA   ]5         ; {2C2B} CHARACTER TO PLOT
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         JSR   TRECTF     ; {133C57B} CALL TRECTF SUBROUTINE
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
* CYCLES: 91+                  *
* SIZE: 31 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPUT     MAC
         LDX   ]1         ; {2C2B} CARRY X-COORD IN .X
         LDY   ]2         ; {2C2B} CARRY Y-COORD IN .Y
         LDA   ]3         ; {2C2B} CARRY FILL CHAR IN .A
         JSR   TXTPUT     ; {85C25B} CALL TXTPUT SUBROUTINE
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
* CYCLES: 411+                 *
* SIZE: 187 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TLINE    MAC
         LDA   ]1         ; {2C2B} LOAD X-ORIGIN
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} LOAD Y-ORIGIN
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} LOAD X-DESTINATION
         STA   WPAR2      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {2C2B} LOAD Y-DESTINATION
         STA   WPAR2+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]5         ; {2C2B} LOAD FILL CHARACTER
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         JSR   TBLINE     ; {286C167B} CALL TBLINE SUBROUTINE
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
* CYCLES: 627+                 *
* SIZE: 290 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCIRC    MAC
         LDA   ]1         ; {2C2B} LOAD CENTER X-COORD
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} LOAD CENTER Y-COORD
         STA   WPAR2      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} LOAD RADIUS
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {2C2B} LOAD FILL CHARACTER
         STA   BPAR2      ; {3C2B} PASS VIA ZERO PAGE
         JSR   TCIRCLE    ; {607C374B} CALL TCIRCLE SUBROUTINE
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
* CYCLES: 362+                 *
* SIZE: 115 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TREC     MAC
         LDA   ]1         ; {2C2B} LOAD X-ORIGIN
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} LOAD Y-ORIGIN
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]3         ; {2C2B} LOAD X-DESTINATION
         STA   WPAR2      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]4         ; {2C2B} LOAD Y-DESTINATION
         STA   WPAR2+1    ; {2C2B} PASS VIA ZERO PAGE
         LDA   ]5         ; {2C2B} LOAD FILL CHARACTER
         STA   BPAR1      ; {3C2B} PASS VIA ZERO PAGE
         JSR   TRECT      ; {338C95B} CALL TRECT SUBROUTINE
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
* CYCLES: 124+                 *
* SIZE: 50 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPUT     MAC
         LDA   ]1         ; {2C2B} GET X COORDINATE
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} GET Y COORDINATE
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         _MLIT ]3;WPAR2   ; {16C12B} PARSE STRING ADDRESS
         JSR   STRPUT     ; {98C30B} CALL STRPUT SUBROUTINE
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
* CYCLES: 50+                  *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCLR     MAC
         LDA   ]1         ; {2C2B} LOAD FILL CHARACTER
         JSR   TXTCLR     ; {48C40B} CALL TXTCLR SUBROUTINE
         <<<
