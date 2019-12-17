*
*``````````````````````````````*
* MAC.STDIO                    *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* STANDARD INPUT AND OUTPUT.   *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      07-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINES FILES USED:      *
*                              *
*  SUB.XPRINT                  *
*  SUB.DPRINT                  *
*  SUB.SINPUT                  *
*  SUB.GPBX                    *
*  SUB.TVLINE                  *
*  SUB.THLINE                  *
*  SUB.TRECTF                  *
*  SUB.TBLINE                  *
*  SUB.TCIRCLE                 *
*  SUB.TXTPUT                  *
*  SUB.PRNSTR                  *
*                              *
* LIST OF MACROS               *
*                              *
* PRN   : FLEXIBLE PRINT       *
* SPRN  : PRINT STRING         *
* INP   : STRING INPUT         *
* GKEY  : GET SINGLE KEY       *
* SCPOS : SET CURS POS AT X,Y  *
* SETCX : SET CURSOR X         *
* SETCY : SET CURSOR Y         *
* CURF  : CURSOR FORWARD       *
* CURB  : CURSOR BACKWARD      *
* CURU  : CURSOR UP            *
* CURD  : CURSOR DOWN          *
* RCPOS : READ CURSOR POSITION *
* PDL   : READ PADDLE STATE    *
* TLINE : DIAGONAL TEXT LINE   *
* TCIRC : TEXT CIRCLE          *
* PBX   : READ PDL BTN X       *
* TVLIN : TEXT VERTICAL LINE   *
* THLIN : TEXT HORIZ LINE      *
* TRECF : TEXT FILL RECTANGLE  *
* TPUT  : TEXT CHAR PLOT AT XY *
* COL40 : FORCE 40COL MODE     *
* COL80 : FORCE 80COL MODE     *
* DIE80 : KILL 80COL FIRMWARE  *
* MTXT0 : DISABLE MOUSETEXT    *
* MTXT1 : ENABLE MOUSETEXT     *
* WAIT  : WAIT FOR KEYPRESS    *
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
* SAMPLE USAGE:                *
*                              *
*  PRN "HELLO, WORLD!"         *
*  PRN #$300                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PRN      MAC
         IF    ",]1 ;       IF PARAM=STRING
         JSR   XPRINT     ; SPECIAL PRINT
         ASC   ]1         ; PUT STRING HERE
         HEX   00         ; STRING TERMINATE
         ELSE             ; ELSE, PARAM IS
                          ; MEMORY LOCATION
         _MLIT ]1         ; PARSE FOR LITERAL
         JSR   DPRINT     ; OR INDIRECT
         FIN
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
* SAMPLE USAGE                 *
*                              *
*  SPRN #$300                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPRN     MAC
         _AXLIT ]1
         JSR   PRNSTR
         <<<
*
*``````````````````````````````*
* INP                          *
*                              *
* INPUTS A STRING FROM KEYBRD  *
* AND STORES IT IN [RETURN]    *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* SAMPLE USAGE:                *
*                              *
*  INP                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
INP      MAC
         JSR   SINPUT
         <<<
*
*``````````````````````````````*
* GKEY                         *
*                              *
* WAITS FOR USER TO PRESS A    *
* KEY, THEN STORES THAT IN .A  *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* SAMPLE USAGE:                *
*                              *
*  GKEY                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GKEY     MAC
         JSR   GETKEY     ; MONITOR GET SUBROUTINE
         LDY   #0
         STY   STROBE     ; RESET KBD STROBE
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
* SAMPLE USAGE:                *
*                              *
*  SCPOS #10;#10               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCPOS    MAC
         LDX   ]1
         STX   CURSH      ; PUT X INTO HPOS
         LDX   ]2
         STX   CURSV      ; PUT Y INTO VPOS
         JSR   VTAB       ; EXECUTE VTAB MONITOR ROUTINE
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
* SAMPLE USAGE                 *
*                              *
*  SETCX #10                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SETCX    MAC
         LDX   ]1
         STX   CURSH      ; SET HORIZ POS
         JSR   VTAB       ; CALL VTAB MONITOR ROUTINE
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
*  SETCY #10                   *
*                              *
* SAMPLE USAGE: SETCY #10      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SETCY    MAC
         LDY   ]1
         STY   CURSV      ; SET VERTICAL POS
         JSR   VTAB       ; CALL VTAB MONITOR ROUTINE
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
* SAMPLE USAGE                 *
*                              *
*  CURF #10                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURF     MAC
         LDA   ]1         ; GET # TO ADD TO CURRENT
         CLC              ; POS; CLEAR CARRY
         ADC   CURSH      ; ADD CURSH
         STA   CURSH      ; STORE IN CURSH
         JSR   VTAB       ; MONITOR VTAB SUBROUTINE
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
* SAMPLE USAGE                 *
*                              *
*  CURB #10                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURB     MAC
         LDA   CURSH      ; GET CURRENT CURSOR HORIZ
         SEC              ; SET CARRY
         SBC   ]1         ; SUBTRACT GIVEN PARAM
         STA   CURSH      ; STORE BACK IN CURSH
         JSR   VTAB       ; VTAB MONITOR SUBROUTINE
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
* SAMPLE USAGE                 *
*                              *
*  CURU #10                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURU     MAC
         LDA   CURSV      ; GET CURRENT CURSOR VERT
         SEC              ; SET CARRY
         SBC   ]1         ; SUBTRACT GIVEN PARAM
         STA   CURSV      ; STORE BACK IN CURSV
         JSR   VTAB       ; VTAB MONITOR ROUTINE
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
* SAMPLE USAGE: CURD #10       *
*                              *
*  CURD #10                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CURD     MAC
         LDA   CURSV      ; GET CURRENT VERT POS
         CLC              ; CLEAR CARRY
         ADC   ]1         ; ADD GIVEN PARAMETER
         STA   CURSV      ; STORE BACK IN CURSV
         JSR   VTAB       ; VTAB MONITOR SUBROUTINE
         <<<
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
* SAMPLE USAGE                 *
*                              *
*  RCPOS #3;#9                 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RCPOS    MAC
         LDY   ]1         ; ROW
         LDA   ]2         ; COLUMN
         JSR   GBCALC     ; GET ADDR FOR SCREEN POS
         LDA   (GBPSH),Y  ; GET CHAR IN ADDRESS
         <<<
*
*``````````````````````````````*
* PDL                          *
*                              *
* SIMPLY READS STATE OF PADDLE *
* NUMBER [NUM] AND STORES IT   *
* IN THE Y REGISTER.           *
*                              *
* PARAMETERS                   *
*                              *
*   ]1 = PADDLE # TO READ      *
*                              *
* SAMPLE USAGE                 *
*                              *
*  PDL #0                      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PDL      MAC              ; GET PADDLE VALUE
         LDX   ]1         ; READ PADDLE # ]1 (USUALLY 0)
         JSR   PREAD      ; PADDLE READING STORED IN Y
         <<<
*
*``````````````````````````````*
* PBX                          *
*                              *
* READ THE SPECIFIED PADDLE    *
* BUTTON.                      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = PADDLE BUTTON TO READ  *
*                              *
*  PB0: $C061   PB1: $C062     *
*  PB2: $C063   PB4: $C060     *
*                              *
* SAMPLE USAGE:                *
*                              *
*  PBX PB0                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PBX      MAC
         LDX   #1
         LDA   ]1         ; IF BTN = PUSHED
         BMI   EXIT       ; IF HIBYTE SET, BUTTON PUSHED
         LDX   #0         ; OTHERWISE, BUTTON NOT PUSHED
EXIT
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
* SAMPLE USAGE                 *
*                              *
*  TVLIN #0;#10;#3;#$18        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TVLIN    MAC
         LDA   ]1         ; Y START
         STA   WPAR2
         LDA   ]2         ; Y END
         STA   WPAR2+1
         LDA   ]3         ; X POSITION
         STA   WPAR1
         LDA   ]4         ; CHARACTER
         STA   BPAR1
         JSR   TVLINE
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
* SAMPLE USAGE                 *
*                              *
*  THLIN #0;#10;#12;#$18       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
THLIN    MAC
         LDA   ]1         ; X START
         STA   WPAR1
         LDA   ]2         ; X END
         STA   WPAR1+1
         LDA   ]3         ; Y POS
         STA   BPAR1
         LDA   ]4         ; FILL CHAR
         STA   BPAR2
         JSR   THLINE
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
* SAMPLE USAGE                 *
*                              *
*  TRECF #0;#10;#0;#10;#'X'    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TRECF    MAC
         LDA   ]1         ; LEFT BOUNDARY
         STA   WPAR1
         LDA   ]2         ; TOP BOUNDARY
         STA   WPAR2
         LDA   ]3         ; RIGHT BOUNDARY
         STA   WPAR1+1
         LDA   ]4         ; BOTTOM BOUNDARY
         STA   WPAR2+1
         LDA   ]5         ; FILL CHAR
         STA   BPAR1
         JSR   TRECTF
         <<<
*
*``````````````````````````````*
* TPUT    TEXT CHARACTER PLOT  *
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
* SAMPLE USAGE                 *
*                              *
*  TPUT #10;#10;#AA            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TPUT     MAC
         LDX   ]1         ; XPOS INTO .X
         LDY   ]2         ; YPOS INTO .Y
         LDA   ]3         ; FILL IN .A
         JSR   TXTPUT
         <<<
*
*``````````````````````````````*
* DIE80                        *
*                              *
* SEND CTRL-U TO COUT, FORCING *
* 40 COLUMN MODE.              *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*  DIE80                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIE80    MAC
         LDA   #21        ; CTRL-U CHARACTER
         JSR   COUT       ; SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* COL80                        *
*                              *
* FORCE 80-COLUMN MODE.        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*  COL80                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL80    MAC
         LDA   #18        ; CTRL-R CHARACTER
         JSR   COUT       ; SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* COL40                        *
*                              *
* FORCE 40-COLUMN MODE         *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*   COL40                      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL40    MAC
         LDA   #17        ; CTRL-Q CHARACTER
         JSR   COUT       ; SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* MTXT0                        *
*                              *
* DISABLE MOUSETEXT, IF IT IS  *
* ENABLED.                     *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*  MTXT0                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MTXT0    MAC
         LDA   #24        ; CTRL-X
         JSR   COUT       ; SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* MTXT1                        *
*                              *
* ENABLE MOUSETEXT IF IT IS    *
* AVAILABLE.                   *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*  MTXT1                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MTXT1    MAC
         LDA   #27        ; CTRL-[
         JSR   COUT       ; SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* WAIT                         *
*                              *
* WAIT FOR A KEYPRESS WITHOUT  *
* INTERFERING WITH COUT. KEY   *
* CODE IS STORED IN .A.        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* USAGE                        *
*                              *
*  WAIT                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
WAIT     MAC
]WTLP    LDA   KYBD       ; READ KEYBOARD BUFFER
         BPL   ]WTLP      ; IF 0, KEEP LOOPING
         AND   #$7F       ; OTHERWISE, SET HI BIT
         STA   STROBE     ; CLEAR STROBE
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
*                              *
* USAGE                        *
*                              *
*  TLINE #0;#0;#23;#39         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TLINE    MAC
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   WPAR2
         LDA   ]4
         STA   WPAR2+1
         LDA   ]5
         STA   BPAR1
         JSR   TBLINE
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
* USAGE                        *
*                              *
*  TCIRC #19;#11;#10;#"*"      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCIRC    MAC
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR2
         LDA   ]3
         STA   BPAR1
         LDA   ]4
         STA   BPAR2
         JSR   TCIRCLE
         <<<
