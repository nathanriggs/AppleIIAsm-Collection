*
*``````````````````````````````*
* DEMO.STDIO                   *
*                              *
* A DEMO OF THE MACROS AND     *
* SUBROUTINES IN THE STDIO     *
* APPLEIIASM LIBRARY.          *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      11-MAR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.STDIO
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
*
         PUT   MIN.HEAD.STDIO.ASM
*
         USE   MIN.MAC.COUT.STDOUT.ASM
         USE   MIN.MAC.STDIN.ASM
         USE   MIN.MAC.SCRMEM.STDIO.ASM
         USE   MIN.MAC.MISC.STDIO.ASM
*
]HOME2   EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   ]HOME2     ; CLEAR SCREEN
*
*``````````````````````````````*
* OUTPUT MACRO EXAMPLES        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STDIO LIBRARY CONTAINS A NUMBER OF
** MACROS AND SUBROUTINES FOR OUTPUTTING
** CHARACTERS TO THE 40 COLUMN SCREEN.
** THESE ARE:
*
** - CPUT  : PUT CHARACTER INTO SCREEN MEMORY
** - CURB  : MOVE COUT CURSOR BACKWARDS
** - CURD  : MOVE COUT CURSOR DOWN
** - CURF  : MOVE COUT CURSOR FORWARDS
** - CURU  : MOVE COUT CURSOR UP
** - PRN   : PRINT A STRING OR TEXT LITERAL
** - SCPOS : SET CURSOR POSITION
** - SETCX : SET CURSOR X POSITION
** - SETCY : SET CURSOR Y POSITION
** - SPRN  : PRINT A PRECEDING LENGTH BYTE STRING
** - SPUT  : PUT STRING INTO SCREEN MEMORY
** - TCIRC : PUT TEXT CIRCLE INTO SCREEN MEMORY
** - TCLR  : FILL THE SCREEN MEMORY
** - TCTR  : CALCULATE CENTER POSITION
** - THLIN : PUT HORIZONTAL TEXT LINE TO SCREEN MEMORY
** - TMORE : WORD-WRAP AND PAUSE SCROLLING OF NULL-TERM STRING
** - TREC  : PUT UNFILLED RECTANGLE INTO SCREEN MEMORY
** - TRECF : PUT FILLED RECTANGLE INTO SCREEN MEMORY
** - TLINE : PLOT DIAGONAL LINE TO SCREEN MEMORY
** - TVLIN : PLOT VERTICAL LINE TO SCREEN MEMORY
*
*``````````````````````````````*
* CPUT MACRO                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE CPUT MACRO PLACES A CHARACTER PROVIDED
** IN THE PARAMETERS INTO SCREEN MEMORY,
** CALCULATING THE MEMORY ADDRESS IN REAL-TIME.
** THIS IS SIGNIFICANTLY FASTER THAN USING COUT
** SUBROUTINES, BUT THE OBVIOUS DOWNSIDE IS
** THAT COUT SUBROUTINES WILL NOT PLAY NICE
** WITH CPUT.
*
** USAGE:
*
         JSR   ]HOME2     ; FILL SCREEN NOT COVERED YET
         _PRN  "CPUT MACRO",8D
         _PRN  "==========",8D8D
         CPUT  #10;#10;#"C"
         CPUT  #11;#11;#"P"
         CPUT  #12;#12;#"U"
         CPUT  #13;#11;#"T"
         CPUT  #16;#10;#"W"
         CPUT  #17;#11;#"O"
         CPUT  #18;#12;#"O"
         CPUT  #19;#11;#"T"
         CPUT  #20;#10;#"!"
         _WAIT
*
*``````````````````````````````*
* CURB MACRO                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE CURB MACRO MOVES THE COUT CURSOR
** BACKWARDS BY THE GIVEN NUMBER OF SPACES.
*
** USAGE:
*
         JSR   ]HOME2
         _PRN  "CURB MACRO",8D
         _PRN  "==========",8D8D
         _PRN  "0123456789"
         _WAIT
         CURB  #3
         _PRN  "--",8D
         _WAIT
*
*``````````````````````````````*
* CURD MACRO                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE CURD MACRO MOVES THE COUT CURSOR
** DOWNWARDS BY THE GIVEN NUMBER OF SPACES.
*
** USAGE:
*
         JSR   ]HOME2
         _PRN  "CURD MACRO",8D
         _PRN  "==========",8D8D
         _PRN  "HA"
         CURD  #2
         _PRN  "HAA"
         CURD  #3
         _PRN  "HAAAA"
         CURD  #4
         _PRN  "HAAAAAAAA!"
         _WAIT
*
*``````````````````````````````*
* CURF                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE CURF MACRO MOVES THE COUT CURSOR
** FORWARD BY THE NUMBER OF GIVEN SPACES.
*
** USAGE:
*
         JSR   ]HOME2
         _PRN  "CURF MACRO",8D
         _PRN  "==========",8D8D
         _PRN  " ",8D8D8D
         _PRN  "HEEEEEE"
         CURF  #3
         _PRN  "HEEEE"
         CURF  #2
         _PRN  "HEE"
         CURF  #1
         _PRN  "HE!",8D8D
         _WAIT
*
*``````````````````````````````*
* CURU                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE CURU MACRO MOVES THE COUT CURSOR
** UP THE NUMBER OF GIVEN SPACES.
*
** USAGE:
*
         JSR   ]HOME2
         _PRN  "CURU MACRO",8D
         _PRN  "==========",8D8D8D8D8D8D8D8D8D8D8D8D8D8D
         _PRN  "HO"
         CURU  #2
         _PRN  "HO HO"
         CURU  #3
         _PRN  "HOOO HO HO"
         CURU  #4
         _PRN  "HOOOOO!"
         _WAIT
*
*``````````````````````````````*
* PRN                          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE PRN MACRO PRINTS A LITERAL STRING
** TO THE CURSOR POSITION, OR PRINTS A
** NULL-TERMINATED STRING AT A GIVEN ADDRESS.
** NOTE THAT A SEPARATE MACRO, SPRN, IS USED
** FOR PRINTING PRECEDING LENGTH-BYTE STRINGS.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "PRN MACRO",8D
         PRN   #ESGN
         PRN   " ",8D8D8D8D8D8D
         PRN   #MSG1
         _WAIT
*
*``````````````````````````````*
* SCPOS                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SCPOS MACRO POSITIONS THE COUT CURSOR
** AT THE GIVEN X,Y COORDINATES.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "SCPOS MACRO",8D
         PRN   "==========="
         SCPOS #15;#8
         PRN   "NEW CURSOR POSITION"
         _WAIT
*
*``````````````````````````````*
* SETCX                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SETCX MACRO SETS THE X POSITION
** OF THE CURSOR TO A GIVEN VALUE.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "SETCX MACRO",8D
         PRN   "==========="
         PRN   " ",8D8D8D8D
         SETCX #10
         PRN   "X POSITION HERE!"
         _WAIT
*
*``````````````````````````````*
* SETCY                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SETCY MACRO SETS THE Y-POSITION
** OF THE CURSOR TO A GIVEN VALUE.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "SETCY MACRO",8D
         PRN   "==========="
         SETCY #10
         PRN   "10 LINE DOWN FROM TOP!"
         _WAIT
*
*``````````````````````````````*
* SPRN                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SPRN MACRO PRINTS A REGULAR STRING
** THAT HAS A PRECEDING LENGTH-BYTE TO
** COUT. NOTE THAT THIS ONLY COVERS STRINGS
** LESS THAN 256 BYTES LONG.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "SPRN MACRO",8D
         PRN   "==========",8D8D8D
         SPRN  #STR1
         _WAIT
*
*``````````````````````````````*
* SPUT                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SPUT MACRO DIRECTLY PLOTS A STRING OF
** CHARACTERS TO THE SCREEN MEMORY. NOTE THAT
** THERE IS NO ERROR HANDLING, SO CARE MUST BE
** TAKEN TO NOT EXCEED THE SCREEN BOUNDARIES.
** THIS DOES NOT INTERACT WITH COUT.
*
** USAGE:
*
*
         JSR   ]HOME2
         PRN   "SPUT MACRO",8D
         PRN   "==========",8D8D
         SPUT  #10;#10;#STR1
         _WAIT
*
*``````````````````````````````*
* TCIRC                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TCIRC MACRO DRAWS A CIRCLE WITH
** THE FILL CHARACTER SPECIFIED ONTO THE
** SCREEN MEMORY. THIS MACRO PLOTS DIRECTLY
** TO MEMORY, AND THEREFORE IS NOT SUBJECT TO
** THE WHIMS OF COUT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TCIRC MACRO",8D
         PRN   "===========",8D8D
         TCIRC #19;#10;#9;#"X"
         TCIRC #19;#10;#7;#"+"
         TCIRC #19;#10;#4;#"-"
         TCIRC #19;#10;#2;#"^"
         TCIRC #19;#10;#1;#"."
         _WAIT
*
*``````````````````````````````*
* TCLR                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TCLR MACRO FILLS THE SCREEN MEMORY
** WITH A GIVEN CHARACTER VALUE. THE DATA
** STORED IN THE "SCREEN HOLES" IS KEPT
** INTACT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TCLR MACRO",8D
         PRN   "==========",8D
         _WAIT
         TCLR  #"@"
         _WAIT
         TCLR  #"%"
         _WAIT
         TCLR  #"$"
         _WAIT
         TCLR  #"&"
         _WAIT
         TCLR  #"!"
         _WAIT
         TCLR  #":"
         _WAIT
         TCLR  #"'"
         _WAIT
         TCLR  #"`"
         _WAIT
         TCLR  #","
         _WAIT
         TCLR  #"."
         _WAIT
*
*``````````````````````````````*
* TCTR                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TCTR MACRO CALCULATES THE X POSITION
** OF A STRING IN RELATION TO THE AVAILABLE
** LINE LENGTH TO CENTER THE STRING ON THE
** LINE. THE X POSITION IS PASSED BACK VIA
** THE [RETURN] LOCATION.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TCTR MACRO",8D
         PRN   "==========",8D8D
         SETCY #12
         TCTR  CTRSTR;#40
         SETCX RETURN
         SPRN  #CTRSTR
         _WAIT
*
*``````````````````````````````*
* THLIN                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE THLIN MACRO DRAWS A HORIZONTAL LINE
** ON TO SCREEN MEMORY WITH THE GIVEN
** CHARACTER. THIS DOES NOT INTERACT WITH
** COUT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "THLIN MACRO",8D
         PRN   "===========",8D8D
         THLIN #5;#35;#6;#"@"
         THLIN #5;#35;#8;#"#"
         THLIN #5;#35;#10;#"$"
         THLIN #5;#35;#12;#"%"
         THLIN #5;#35;#14;#":"
         _WAIT
*
*``````````````````````````````*
* TMORE                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TMORE MACRO SCROLLS A ZERO-TERMINATING STRING
** ON THE SCREEN, WORD-WRAPPING EACH LINE AS IT GOES.
** THE FIRST PARAMETER IS THE STRING ADDRESS, OR AN
** INDIRECT ADDRESS. THE SECOND PARAMETER IS THE
** DESIRED MAXIMUM LINE LENGTH, AND THE THIRD PARAMETER
** IS THE NUMBER OF LINES TO PRINT BEFORE PAUSING
** THE SCROLL UNTIL A KEY IS PRESSED.
*
** IF THE THIRD PARAMETER (SCROLL) IS #0, THEN SCROLLING
** IS PAUSED ANY TIME A RETURN CHARACTER IS FOUND (8D).
** YOU CAN THEN HAVE IT SCROLL A PARAGRAPH AT A TIME BY
** HAVING A LINE WITH A SPACE FOLLOWED BY #$8D.
*
** USAGE:
*
         JSR   ]HOME2
         TMORE #LONGSTR;#39;#15
         _WAIT
*
*``````````````````````````````*
* TREC                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TREC MACRO CREATES A RECTANGULAR
** BORDER IN SCREEN MEMORY, INDEPENDENT OF
** THE STATE OF COUT. NOTE THAT THIS DOES
** NOT FILL IN THE EMPTY SPACE INSIDE OF THE
** RECTANGULAR BORDER.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TREC MACRO",8D
         PRN   "==========",8D8D
         TREC  #5;#6;#35;#17;#"@"
         TREC  #7;#8;#33;#15;#"#"
         _WAIT
*
*``````````````````````````````*
* TRECF                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TRECF MACRO WRITES A FILLED
** RECTANGLE TO THE SCREEN MEMORY SPACE.
** THIS DOES NOT INTERACT WITH COUT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TRECF MACRO",8D
         PRN   "===========",8D8D
         TRECF #5;#5;#14;#14;#"+"
         TRECF #16;#5;#25;#14;#":"
         _WAIT
*
*``````````````````````````````*
* TLINE                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TLINE MACRO CREATES A DIAGONAL
** LINE STARTING AT AN ORIGIN X,Y
** POSITION TO A DESTINATION X,Y COORDINATE.
** THIS PRINTS DIRECTLY TO SCREEN MEMORY,
** AND DOES NOT INTERACT WITH COUT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TLINE MACRO",8D
         PRN   "===========",8D8D
         TLINE #5;#5;#15;#10;#"@"
         TLINE #5;#10;#15;#5;#"#"
         _WAIT
*
*``````````````````````````````*
* TVLIN                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE TVLIN MACRO CREATES A VERTICAL LINE
** IN SCREEN MEMORY WITH THE GIVEN CHARACTER.
** THIS DOES NOT INTERACT WITH COUT.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "TVLIN MACRO",8D
         PRN   "===========",8D8D
         TVLIN #5;#15;#19;#"#"
         _WAIT
*
*``````````````````````````````*
* INPUT MACRO EXAMPLES         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STDIO LIBRARY INCLUDES MACROS
** AND SUBROUTINES DEDICATED TO RETRIEVING
** INPUT DATA FROM THE KEYBOARD, FROM
** THE SCREEN MEMORY, AND FROM THE
** PADDLE.
*
** - GKEY   : GET KEY FROM KEYBOARD INPUT
** - INP    : INPUT A STRING FROM KEYBOARD
** - PBX    : INPUT FROM PADDLE BUTTONS
** - PDL    : INPUT FROM PADDLE WHEELS
** - RCPOS  : GET VALUE FROM SCREEN POSITION
** - WAIT   : WAIT FOR A KEYBOARD KEY PRESS
*
*``````````````````````````````*
* GKEY                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE GKEY MACRO WAITS FOR THE USER
** TO PRESS A KEY ON THE KEYBOARD, THEN
** RETURNS THE VALUE RECEIVED IN .A.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "GKEY MACRO",8D
         PRN   "==========",8D8D
         GKEY
         JSR   COUT
         _WAIT
*
*``````````````````````````````*
* INP                          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE INP MACRO INPUTS A STRING OF
** TEXT FROM THE USER VIA THE KEYBOARD,
** ENDING WHEN THE RETURN KEY IS PRESSED. THE
** STRING IS THEN STORED IN [RETURN], WITH
** ITS LENGTH IN THE PRECEDING BYTE KNOWN
** AS [RETLEN].
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "INP MACRO",8D
         PRN   "=========",8D8D8D
         INP
         PRN   " ",8D8D8D
         SPRN  #RETLEN
         _WAIT
*
*``````````````````````````````*
* PBX                          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE PBX MACRO READS THE STATE OF
** THE SPECIFIED PADDLE BUTTON. FOR THE
** SAKE OF EASE, THE BUTTONS HAVE BEEN
** GIVEN ALIASES OF PB0 - PB1, WITH THE
** CORRESPONDING VALUES:
*
** - PB0 = $C061
** - PB1 = $CO62
** - PB2 = $CO63
** - PB3 = $CO60
*
** NOTE THAT THE OPEN AND CLOSED APPLE KEYS
** CAN BE READ AS PADDLE BUTTONS, SO A PADDLE
** IS NOT NECESSARY FOR THE FOLLOWING EXAMPLE.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "PBX MACRO",8D
         PRN   "=========",8D8D
         LDX   #1
:MLP1
         PBX   PB0
         CPX   #1
         BNE   :MLP1
         PRN   "PB0 PRESSED!",8D8D
         _WAIT
*
*``````````````````````````````*
* PDL                          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE PDL MACRO READS THE PADDLE WHEEL
** AND RETURNS THE VALUE READ FROM IT
** IN .Y. SINCE WE WON'T ASSUME THE USER
** HAS A PADDLE HERE, A WORKING EXAMPLE
** WILL NOT BE GIVEN. HOWEVER, THE MACRO
** ACCEPTS A SINGLE PARAMETER THAT DENOTES
** THE PADDLE NUMBER TO READ, AS SUCH:
*
** PDL  #0
*
*``````````````````````````````*
* RCPOS                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE RCPOS MACRO READS A GIVEN ROW
** AND COLUMN OF THE SCREEN AND RETURNS
** THE CHARACTER VALUE IN .A.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "RCPOS MACRO",8D
         PRN   "===========",8D8D
         RCPOS #0;#0
         JSR   COUT
         _WAIT
*
*``````````````````````````````*
* WAIT                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE WAIT MACRO IS FUNCTIONALLY
** EQUIVALENT TO THE GKEY MACRO, BUT
** DOES NOT RELY ON THE GETKEY SUBROUTINE.
*
** USAGE:
*
         JSR   ]HOME2
         PRN   "WAIT MACRO",8D
         PRN   "==========",8D8D
         WAIT
         JSR   COUT
         WAIT
*
*``````````````````````````````*
* OTHER STDIO MACROS           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STDIO LIBRARY CONTAINS A FEW
** MACROS THAT CANNOT BE EASILY CATEGORIZED
** TOGETHER, AND THUS ARE THROWN INTO A
** MISCELLANEOUS SECTION HERE. THE MACROS
** ARE:
*
** - COL40 : SET SCREEN TO 40-COLUMN MODE
** - COL80 : SET SCREEN TO 80-COLUMN MODE
** - DIE80 : KILL 80-COLUMN MODE, FORCING 40
*
*``````````````````````````````*
* COL40                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE COL40 MACRO TURNS ON 40-COLUMN
** MODE. OBVIOUSLY, THIS ONLY HAS A
** NOTICEABLE EFFECT IF THE USER IS
** ALREADY IN 80-COLUMN MODE.
*
** USAGE:
*
         COL40
*
*``````````````````````````````*
* COL80                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE COL80 MACRO TURNS ON 80-COLUMN
** MODE.
*
         JSR   ]HOME2
         COL80
         PRN   "80 COLUMNS!"
         WAIT
*
*``````````````````````````````*
* DIE80                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE DIE80 MACRO KILLS 80-COLUMN
** MODE, RETURNING TO 40-COLUMN MODE
** BY DEFAULT.
*
** USAGE:
*
         JSR   ]HOME2
         DIE80
         PRN   "BACK TO 40 COLUMNS!"
*
         JMP   REENTRY
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.LIB.REQUIRED.ASM
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
*  STDIO SUBROUTINES
*
         PUT   MIN.SUB.XPRINT.ASM
         PUT   MIN.SUB.DPRINT.ASM
         PUT   MIN.SUB.THLINE.ASM
         PUT   MIN.SUB.TVLINE.ASM
         PUT   MIN.SUB.TRECTF.ASM
         PUT   MIN.SUB.TXTPUT.ASM
         PUT   MIN.SUB.TBLINE.ASM
         PUT   MIN.SUB.TCIRCLE.ASM
         PUT   MIN.SUB.PRNSTR.ASM
         PUT   MIN.SUB.TXTMORE.ASM
         PUT   MIN.SUB.TXTCENT.ASM
         PUT   MIN.SUB.STRPUT.ASM
         PUT   MIN.SUB.TRECT.ASM
         PUT   MIN.SUB.TXTCLR.ASM
         PUT   MIN.SUB.SINPUT.ASM
*
ESGN     ASC   "========="
         HEX   00
MSG1     ASC   "THIS IS A MESSAGE."
         HEX   00
STR1     STR   "THIS IS A STRING."
CTRSTR   STR   "CENTERED STRING."
LONGSTR  ASC   "ONE TWO THREE FOUR FIVE SIX SEVEN "
         ASC   "EIGHT NINE TEN ELEVEN TWELVE THIRTEEN "
         ASC   "FOURTEEN FIFTEEN SIXTEEN SEVENTEEN "
         HEX   8D
         ASC   "EIGHTEEN NINETEEN TWENTY TWENTY-ONE "
         ASC   "TWENTY-TWO TWENTY-THREE TWENTY-FOUR "
         ASC   "25 26 27 28 29 30 31 32 33 34 35 36 37 "
         ASC   "38 39 40"
         HEX   00
