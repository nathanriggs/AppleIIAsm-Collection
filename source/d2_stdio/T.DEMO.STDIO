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
* DATE:      07-JUL-2019       *
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
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.STDIO
         PUT   MIN.HOOKS.STDIO
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   HOME       ; CLEAR SCREEN
*
         PRN   "STDIO DEMO",8D
         PRN   "----------",8D8D
         PRN   "WELCOME! THIS IS A DEMO FOR",8D
         PRN   "THE STDIO LIBRARY MACROS AND ",8D
         PRN   "SUBROUTINES.",8D8D
         WAIT
         PRN   "OUR FIRST OBVIOUS MACRO USED",8D
         PRN   "IS PRN. THIS MACRO CAN PRINT A",8D
         PRN   "GIVEN STRING, OR PRINT THE STRING",8D
         PRN   "AT A GIVEN ADDRESS THAT IS REFERENCED",8D
         PRN   "EITHER DIRECTLY (#) OR INDIRECTLY.",8D
         PRN   "THEREFORE: ",8D8D
         WAIT
         PRN   "   PRN 'HELLO!'",8D8D
         PRN   "PRINTS HELLO, WHEREAS",8D8D
         PRN   "   PRN #STRING1",8D8D
         PRN   "PRINTS THE STRING LOCATED AT",8D
         PRN   "THAT EXACT ADDRESS."
         WAIT
         JSR   HOME
         PRN   "MEANWHILE,",8D8D
         PRN   "   PRN STRING2",8D8D
         PRN   "PRINTS THE STRING AT THE ADDRESS PASSED",8D
         PRN   "VIA THAT MEMORY LOCATION.",8D8D
         WAIT
         PRN   "IT IS IMPORTANT TO NOTE THAT",8D
         PRN   "WHENEVER THERE IS AN OPTION FOR",8D
         PRN   "EITHER A STRING OR A MEMORY ADDRESS,",8D
         PRN   "THIS IS HOW ALL SUBROUTINES WORK IN",8D
         PRN   "THIS LIBRARY. IN OTHER DEMOS, IT MAY",8D
         PRN   "BE ASSUMED THAT THE READER KNOWS THIS."
         WAIT
         JSR   HOME
         PRN   "OUR NEXT SUBROUTINE NEEDING ",8D
         PRN   "OUR ATTENTION IS CALLED BY THE",8D
         PRN   "COL40 MACRO. THIS FORCES USING",8D
         PRN   "40-COLUMN MODE, AND IS ESPECIALLY",8D
         PRN   "NECESSARY FOR ROUTINES THAT PRINT",8D
         PRN   "DIRECTLY TO SCREEN MEMORY INSTEAD",8D
         PRN   "OF USING COUT ROUTINES. SO,"8D8D
         PRN   "   COL40",8D8D
         PRN   "WILL PUT US IN 40-COLUMN MODE",8D
         PRN   "AFTER HITTING A KEY NOW."
         WAIT
         COL40
         JSR   HOME
         PRN   "YOU CAN ALSO FORCE 80-COLUMN MODE",8D
         PRN   "WITH THE COL80 MACRO, BUT BE",8D
         PRN   "AWARE THAT TRECF,TPUT,THLIN",8D
         PRN   "AND TVLIN WILL ONLY WORK",8D
         PRN   "AS INTENDED IN 40 COLUMNS.",8D8D
         PRN   "LET'S LOOK AT THESE MACROS NOW."
         WAIT
         JSR   HOME
         PRN   "ASCII DRAWING",8D
         PRN   "=============",8D8D
         PRN   "AT TIMES, YOU MAY NEED TO ",8D
         PRN   "PUT A BLOCK OF TEXT THAT CONSISTS",8D
         PRN   "OF A SINGLE CHARACTER AS QUICKLY",8D
         PRN   "AS POSSIBLE. CURRENTLY, THERE ARE",8D
         PRN   "FOUR MACROS DEDICATED TO JUST ",8D
         PRN   "THAT: THLIN, TVLIN, TRECF, AND TPUT.",8D8D
         WAIT
         PRN   "THE SIMPLEST OF THESE IS TPUT:",8D
         PRN   "IT OUTPUTS A SINGLE CHARACTER AT",8D
         PRN   "THE GIVEN XY COORDINATES. SO,",8D8D
         PRN   "   TPUT #38;#20;#'$'",8D8D
         PRN   "WILL PLACE THE '$' CHARACTER",8D
         PRN   "AT THE X-POSITION 38 AND Y-POSITION",8D
         PRN   "20. LET'S TRY THAT NOW...",8D8D
         WAIT
         TPUT  #38;#20;#"$"
         PRN   "SEE? RIGHT OVER HERE -->"
         WAIT
         JSR   HOME
         PRN   "NOT THAT THE CURSOR'S POSITION",8D
         PRN   "IS NOT DISTURBED BY TPUT; THIS",8D
         PRN   "IS DUE TO THE FACT THAT THE ROUTINE",8D
         PRN   "BYPASSES COUT AND INSTEAD DIRECTLY",8D
         PRN   "POKES THE CHARACTER INTO SCREEN MEMORY.",8D
         PRN   "THIS IS PRIMARILY FOR SPEED, BUT AGAIN",8D
         PRN   "KEEP IN MIND THAT THIS DOES NOT WORK",8D
         PRN   "CORRECTLY IN 80-COLUMN MODE.",8D8D
         WAIT
         PRN   "THLIN, TVLIN, AND TRECF OPERATE IN",8D
         PRN   "THE SAME WAY. LET'S LOOK AT THOSE NEXT."
         TPUT  #38;#12;#"K"
         TPUT  #38;#13;#"E"
         TPUT  #38;#14;#"E"
         TPUT  #38;#15;#"P"
         TPUT  #38;#17;#"G"
         TPUT  #38;#18;#"O"
         TPUT  #38;#19;#"I"
         TPUT  #38;#20;#"N"
         TPUT  #38;#21;#"G"
         WAIT
         JSR   HOME
         PRN   "THLIN AND TVLIN BOTH CREATE LINES",8D
         PRN   "FROM A SINGLE CHARACTER, HORIZONTALLY",8D
         PRN   "AND VERTICALLY RESPECTIVELY. THUS",8D8D
         PRN   "   THLIN #25;#35;#20;#'X'",8D8D
         WAIT
         THLIN #25;#35;#20;#"X"
         PRN   "CREATES A HORIZONTAL LINE FROM THE",8D
         PRN   "X-POSITION 25 TO 35 AT THE Y-POSITION",8D
         PRN   "OF 20 WITH THE CHARACTER 'X'. LIKEWISE,",8D8D
         PRN   "   TVLIN #10;#20;#35;#'Y'",8D8D
         WAIT
         TVLIN #10;#20;#35;#"Y"
         PRN   "CREATES A VERTICAL LINE FROM Y-POSITION",8D
         PRN   "10 TO 20 AT THE X-POSITION 35."
         WAIT
         JSR   HOME
         PRN   "NOTE THAT THE LAST POSITION GIVEN",8D
         PRN   "IS NOT ACTUALLY FILLED. THIS IS",8D
         PRN   "TO KEEP PLACEMENT MORE INTUITIVE.",8D
         PRN   "HOWEVER, WHEN TRYING TO ARRANGE LINES",8D
         PRN   "CONNECTED TOGETHER, YOU WILL HAVE TO",8D
         PRN   "ADJUST YOUR NUMBERS ACCORDINGLY. TO",8D
         PRN   "CREATE A BOX, FOR INSTANCE, YOU WOULD",8D
         PRN   "NEED TO WRITE:",8D8D
         PRN   "   THLIN #25;#35;#20;#'X'",8D
         PRN   "   TVLIN #10;#20;#34;#'X'",8D
         PRN   "   TVLIN #10;#20;#25;#'X'",8D
         PRN   "   THLIN #25;#35;#10;#'X'",8D8D
         WAIT
         THLIN #25;#35;#20;#"X"
         TVLIN #10;#20;#34;#"X"
         TVLIN #10;#20;#25;#"X"
         THLIN #25;#35;#10;#"X"
         PRN   "YAY!"
*
********************************
*
         WAIT
         JSR   HOME
         PRN   "THE TLINE MACRO DRAWS A LINE FROM",8D
         PRN   "X1,Y1 TO X2,Y2 WITH A FILL CHARACTER.",8D
         PRN   "USE TVLIN OR THLINE IF YOU ARE",8D
         PRN   "DRAWING HORIZONTAL OR VERTICAL LINES,",8D
         PRN   "AS THESE USE FEWER CYCLES.",8D8D
         PRN   "  TLINE #20;#12;#30;#22;#'*'",8D
         PRN   "  TLINE #30;#22;#10;#15;#'*'",8D
         PRN   "  TLINE #10;#15;#30;#15;'*'",8D
         PRN   "  TLINE #30;#15;#10;#22;#'*'",8D
         PRN   "  TLINE #10;#22;#20;#12;#'*'",8D8D
         PRN   "WILL OUTPUT:"
         WAIT
         TLINE #20;#12;#30;#22;#"*"
         TLINE #30;#22;#10;#15;#"*"
         TLINE #10;#15;#30;#15;#"*"
         TLINE #30;#15;#10;#22;#"*"
         TLINE #10;#22;#20;#12;#"*"
         WAIT
         JSR   HOME
         PRN   "YOU CAN ALSO CREATE CIRCLES WITH",8D
         PRN   "THE TCIRC MACRO. IN THE PARAMS,",8D
         PRN   "YOU SPECIFY THE X POSITION OF THE",8D
         PRN   "CENTER, THE Y POSITION OF IT, ",8D
         PRN   " THE CIRCLE'S RADIUS, AND THE ",8D
         PRN   "FILL CHAR OF THE CIRCLE'S OUTLINE.",8D
         PRN   "THUS:",8D8D
         PRN   "TCIRC #30;#14;#7;#'*'",8D
         PRN   "TCIRC #30;#14;#6;#'.'",8D
         PRN   "TCIRC #30;#14;#5;#'#'",8D
         PRN   "TCIRC #30;#14;#4;#':'",8D
         PRN   "TCIRC #30;#14;#3;#'@'",8D
         PRN   "TCIRC #30;#14;#2;#'+'",8D8D
         PRN   "WILL PRODUCE:"
         WAIT
         TCIRC #30;#14;#7;#"*"
         TCIRC #30;#14;#6;#"."
         TCIRC #30;#14;#5;#"#"
         TCIRC #30;#14;#4;#":"
         TCIRC #30;#14;#3;#"@"
         TCIRC #30;#14;#2;#"+"
         WAIT
         JSR   HOME
         PRN   "THE LAST OF THESE KIND OF MACROS",8D
         PRN   "IS TRECF, WHICH CREATES A FILLED",8D
         PRN   "BOX. THIS CAN BE ESPECIALLY USEFUL",8D
         PRN   "FOR CREATING A SEMBLANCE OF 'WINDOWS'",8D
         PRN   "ON THE TEXT SCREEN. SO:",8D8D
         PRN   "   TRECF #10;#10;#20;#20;#'#'",8D8D
         PRN   "WILL RESULT IN:",8D8D
         WAIT
         TRECF #10;#10;#20;#20;#"#"
         PRN   "W00T!"
         WAIT
         JSR   HOME
         PRN   "CURSOR POSITIONING",8D
         PRN   "==================",8D8D
         PRN   "THE REST OF THESE ROUTINES",8D
         PRN   "USE COUT1 FOUR CONVENIENCE AND",8D
         PRN   "SAVING A FEW BYTES HERE AND THERE.",8D
         PRN   "THIS MEANS, AMONG OTHER THINGS, THAT",8D
         PRN   "THE SYSTEM MONITOR KEEPS TRACK",8D
         PRN   "OF OUR CURSOR POSITION, AND WE CAN",8D
         PRN   "CALL ITS ROUTINES TO ALTER SAID",8D
         PRN   "POSITION. THIS IS ACHIEVED WITH THE",8D
         PRN   "FOLLOWING MACROS, WHICH WE WILL EXPLORE",8D
         PRN   "NEXT:",8D8D
         PRN   "   SETCX   SETCY",8D
         PRN   "   SCPOS   RCPOS",8D
         PRN   "   CURF    CURB",8D
         PRN   "   CURU    CURD"
         WAIT
         JSR   HOME
         PRN   "SETCX AND SETCY SIMPLY SET THE X",8D
         PRN   "AND Y POSITIONS OF THE CURSOR,",8D
         PRN   "RESPECTIVELY. SO:",8D8D
         PRN   "   SETCX #20",8D8D
         WAIT
         SETCX #20
         PRN   "SETS THE CURSOR'S",8D
         PRN   "X-POSITION TO 20, WHEREAS",8D8D
         PRN   "   SETCY #20",8D8D
         WAIT
         SETCY #20
         PRN   "SET'S THE Y-POSITION TO 20."
         WAIT
         JSR   HOME
         PRN   "YOU CAN SET THESE COORDINATES",8D
         PRN   "AT ONCE WITH THE SCPOS MACRO. SO:",8D8D
         PRN   "   SCPOS #8;#10"
         WAIT
         SCPOS #8;#10
         PRN   "SETS THE CURSOR AT X POSITION",8D
         PRN   "OF 8 AND A Y POSITION OF 10.",8D8D
         WAIT
         PRN   "YOU CAN ALSO READ THE CHARACTER",8D
         PRN   "AT A GIVEN POSITION WITH THE ",8D
         PRN   "RCPOS MACRO. THUS,",8D8D
         PRN   "   RCPOS #8;#10 "
         WAIT
         PRN   "RETURNS: "
         RCPOS #8;#10
         JSR   COUT1
         WAIT
         JSR   HOME
         PRN   "THE LAST OF THE CURSOR POSITIONING",8D
         PRN   "MACROS ARE CURF, CURB, CURD AND CURU.",8D
         PRN   "THESE ALL MOVE THE CURSOR RELATIVE",8D
         PRN   "TO ITS CURRENT POSITION. CURF MOVES",8D
         PRN   "IT FORWARD BY THE SPECIFIED AMOUNT,",8D
         PRN   "CURB MOVES BACKWARDS, CURD MOVES",8D
         PRN   "DOWN AND CURU MOVES UP. THUS:",8D8D
         PRN   "   CURF #5 ",8D8D
         PRN   "MOVES THE CURSOR "
         WAIT
         CURF  #5
         PRN   "FORWARD BY FIVE.",8D8D
         PRN   "THE OTHER MACROS USE THE SAME",8D
         PRN   "SYNTAX."
         WAIT
         JSR   HOME
         PRN   "MOUSETEXT",8D
         PRN   "=========",8D8D
         PRN   "ON CAPABLE SYSTEMS, MOUSETEXT",8D
         PRN   "CAN BE TURNED ON WITH THE",8D
         PRN   "MTXT1 MACRO AND TURNED OFF WITH",8D
         PRN   "THE MTXT0 MACRO. SINCE THIS",8D
         PRN   "WON'T HAVE A DEMO OF IT HERE."
         WAIT
         JSR   HOME
         PRN   "INPUT MACROS",8D
         PRN   "============",8D8D
         PRN   "CURRENTLY, THIS STDIO LIBRARY",8D
         PRN   "CONTAINS FIVE MACROS FOR USER",8D
         PRN   "INPUT. THEY ARE AS FOLLOWS:",8D8D
         PRN   "   INP   STRING INPUT",8D
         PRN   "   GKEY  CHARACTER INPUT",8D
         PRN   "   PDL   PADDLE INPUT",8D
         PRN   "   PBX   PADDLE BUTTON INPUT",8D
         PRN   "   WAIT  CHARACTER INPUT, NO MONITOR"
         WAIT
         JSR   HOME
         PRN   "WE HAVE ALREADY MADE SUBSTANTIAL",8D
         PRN   "USE OF THE WAIT MACRO--THAT'S ",8D
         PRN   "WHAT IS CALLED EVERY TIME THIS",8D
         PRN   "DEMO PAUSES. ONCE A KEY IS PRESSED,",8D
         PRN   "THE ASCII CODE FOR IT IS STORED",8D
         PRN   "IN THE .A REGISTER. THIS MACRO",8D
         PRN   "ACCEPTS NO PARAMETERS.",8D8D
         PRN   "A SPECIAL FEATURE OF THE WAIT",8D
         PRN   "MACRO IS THAT IT DOES NOT USE THE",8D
         PRN   "TYPICAL MONITOR ROUTINES FOR INPUT,",8D
         PRN   "AND READS THE KEYBOARD DIRECTLY,",8D
         PRN   "ALLOWING US TO NOT HAVE A CURSOR ON",8D
         PRN   "THE SCREEN, AMONG OTHER BENEFITS.",8D
         PRN   "THIS IS IN CONTRAST TO GKEY, WHICH",8D
         PRN   "USES THE MONITOR ROUTINE TO ACHIEVE",8D
         PRN   "THE SAME RESULT: "
         GKEY
         JSR   HOME
         PRN   "THE INP MACRO SIMILARLY USES THE",8D
         PRN   "MONITOR'S INPUT ROUTINE. THIS MEANS",8D
         PRN   "THAT IT SUFFERS THE SAME PROBLEMS",8D
         PRN   "AS DOES APPLESOFT BASIC'S INPUT",8D
         PRN   "COMMAND: COMMAS AND SPECIAL CHARACTERS",8D
         PRN   "COMPLICATE MATTERS. IN FUTURE PATCHES,",8D
         PRN   "AN ALTERNATE NON-MONITOR ROUTINE",8D
         PRN   "WILL BECOME AVAILABLE.",8D8D
         PRN   "TYPE SOMETHING AND PRESS RETURN:",8D
         INP
         PRN   " ",8D
         PRN   "YOU CAN THEN PRINT THE STRING TO ",8D
         PRN   "SCREEN USING THE SPRN MACRO:",8D8D
         PRN   "YOU TYPED:"
         SPRN  #RETURN
         WAIT
         JSR   HOME
         PRN   "PADDLE BUTTONS CAN BE READ VIA",8D
         PRN   "THE PBX MACRO. THE SYNAX IS AS",8D
         PRN   "FOLLOWS:",8D8D
         PRN   "   PBX [BUTTON ADDRESS]",8D8D
         WAIT
         PRN   "THE HOOKS.STDIO FILE CONTAINS THE",8D
         PRN   "ADDRESSES FOR THE FOR PADDLE BUTTONS,",8D
         PRN   "CONVENIENTLY CALLED PB0, PB1, PB2, ",8D
         PRN   "AND PB3. THUS:",8D8D
         WAIT
         PRN   "   PBX #PB0",8D8D
         PRN   "CHECKS IF PADDLE BUTTON 0 IS PRESSED,",8D
         PRN   "AND RETURNS 1 IN THE .A REGISTER IF SO.",8D
         PRN   "OTHERWISE, A ZERO IS RETURNED.",8D8D
         WAIT
         PRN   "SINCE THIS REQUIRES SPECIAL HARDWARE,",8D
         PRN   "WE WON'T BE USING THE MACRO HERE. NOTE",8D
         PRN   "THAT ON A ][E, //C, AND ][GS, THE OPEN",8D
         PRN   "APPLE KEY IS MAPPED TO BUTTON ZERO."
         WAIT
         JSR   HOME
         PRN   "LASTLY, THE PREAD MACRO READS THE STATE",8D
         PRN   "OF THE GIVEN PADDLE'S POTENTIOMETER.",8D
         PRN   "A VALUE OF 0-255 IS RETURNED IN THE .Y",8D
         PRN   "REGISTER. SO:",8D8D
         WAIT
         PRN   "   PREAD #0",8D8D
         PRN   "WILL READ THE STATE OF PADDLE 0, WHICH",8D
         PRN   "IS THE MOST COMMON TO READ. AGAIN,",8D
         PRN   "DUE TO A NEED FOR SPECIAL HARDWARE, WE",8D
         PRN   "WON'T BE ILLUSTRATING IT HERE."
         WAIT
         JSR   HOME
         PRN   " ",8D
         PRN   "THAT'S ALL, FOLKS!",8D8D
*
         JMP   REENTRY
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
*  STDIO SUBROUTINES
*
         PUT   MIN.SUB.XPRINT
         PUT   MIN.SUB.DPRINT
         PUT   MIN.SUB.THLINE
         PUT   MIN.SUB.TVLINE
         PUT   MIN.SUB.TRECTF
         PUT   MIN.SUB.TXTPUT
         PUT   MIN.SUB.TBLINE
         PUT   MIN.SUB.TCIRCLE
         PUT   MIN.SUB.SINPUT
         PUT   MIN.SUB.PRNSTR
*
