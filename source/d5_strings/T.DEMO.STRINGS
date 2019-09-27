*
********************************
*                              *
*      -< STRINGS DEMO >-      *
*                              *
*       VERSION 00.03.00       *
*                              *
*         20-JAN-2019          *
*                              *
********************************
*                              *
*       NATHAN D. RIGGS        *
*   NATHAN.RIGGS@OUTLOOK.COM   *
*                              *
********************************
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.STRINGS
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (PUTS, MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.STRINGS
         PUT   MIN.HOOKS.STRINGS
]HOME    EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   ]HOME
         _PRN  "STRING MACROS AND SUBROUTINES",8D
         _PRN  "=============================",8D8D
         _PRN  "THIS DEMO ILLUSTRATES THE USAGE",8D
         _PRN  "OF MACROS RELATED TO STRING",8D
         _PRN  "MANIPULATION. CURRENTLY, THIS IS ",8D
         _PRN  "LIMITED TO 8-BIT STRINGS WITH",8D
         _PRN  "A PRECEDING LENGTH BYTE, BUT MAY",8D
         _PRN  "ENCOMPASS OTHER TYPES IN THE FUTURE.",8D8D
         _PRN  "THE FOLLOWING MACROS WILL BE COVERED:",8D8D
         _PRN  "  - SPRN",8D
         _PRN  "  - SCAT",8D
         _PRN  "  - SCPY",8D
         _PRN  "  - SDEL",8D
         _PRN  "  - SINS",8D
         _PRN  "  - SPOS",8D
         _PRN  "  - SCMP",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "THE FIRST AND EASIEST MACRO TO",8D
         _PRN  "USE AND EXPLAIN IS SPRN, WHICH ",8D
         _PRN  "STANDS FOR STRING PRINT. AS THE",8D
         _PRN  "NAME IMPLIES, THIS MACRO PRINTS",8D
         _PRN  "THE STRING AT A GIVEN ADDRESS USING",8D
         _PRN  "COUT. THUS:",8D8D
         _PRN  "  SPRN #STR1",8D8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         SPRN  #STR1
         _WAIT
         JSR   ]HOME
         _PRN  "THE NEXT MACRO, SCAT, IS USED",8D
         _PRN  "TO CONCATENATE ONE STRING TO",8D
         _PRN  "ANOTHER, STORING THE NEW STRING",8D
         _PRN  "IN RETURN. EITHER A LITERAL",8D
         _PRN  "STRING OR AN ADDRESS CAN BE USED",8D
         _PRN  "IN EACH PARAMETER. THUS:",8D8D
         _PRN  "  SCAT 'HELLO,';' WORLD!'",8D
         _PRN  "  SPRN #RETLEN",8D8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         SCAT  "HELLO,";" WORLD!"
         SPRN  #RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "THE NEXT MACRO IS SCPY, WHICH",8D
         _PRN  "STANDS FOR SUBSTRING COPY. THIS",8D
         _PRN  "MACRO COPIES A SUBSTRING FROM A",8D
         _PRN  "GIVEN STRING (LITERAL OR ADDRESS)",8D
         _PRN  "AT THE GIVEN INDEX AND LENGTH,",8D
         _PRN  "STORING IT IN RETURN. THUS:",8D8D
         _PRN  "  SCPY 'KILL ALL HUMANS';#1;#8",8D
         _PRN  "  SPRN #RETLEN",8D8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         SCPY  "KILL ALL HUMANS";#1;#8
         SPRN  #RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "THE NEXT MACRO, SDEL, DELETES",8D
         _PRN  "A SUBSTRING FROM A GIVEN STRING",8D
         _PRN  "AND RETURNS THE NEW STRING IN",8D
         _PRN  "RETURN. THUS:",8D8D
         _PRN  "  SDEL 'HELLO, WORLD!';#6;#8",8D
         _PRN  "  SPRN #RETLEN",8D8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         SDEL  "HELLO, WORLD!";#6;#8
         SPRN  #RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "THE SPOS MACRO LOOKS FOR A",8D
         _PRN  "GIVEN SUBSTRING WITHIN A GIVEN",8D
         _PRN  "STRING, RETURNING 0 IF NO MATCH ",8D
         _PRN  "IS FOUND OR RETURNING THE INDEX AT",8D
         _PRN  "WHICH THE SUBSTRING IS FOUND. THUS:",8D8D
         _PRN  "  SPOS 'I HATE CAPITALISM';'CAPITALISM'",8D
         _PRN  " ",8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         SPOS  "I HATE CAPITALISM";"CAPITALISM"
         DUMP  #RETURN;#1
         _WAIT
         JSR   ]HOME
         _PRN  "NEXT WE HAVE THE SINS MACRO, WHICH",8D
         _PRN  "STANDS FOR 'SUBSTRING INSERT.' THIS",8D
         _PRN  "MACRO INSERTS A SUBSTRING INTO A ",8D
         _PRN  "SOURCE STRING AT A GIVEN POSITION AND",8D
         _PRN  "PUTS THE NEW STRING IN RETURN. THUS:",8D8D
         _PRN  "  SINS 'I LOVE BABIES';' TO HATE';#7",8D8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         SINS  "I LOVE BABIES";" TO HATE";#7
         SPRN  #RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "LASTLY WE HAVE THE SCMP MACRO, WHICH",8D
         _PRN  "STANDS FOR 'STRING COMPARE.' THIS MACRO",8D
         _PRN  "COMPARES TWO STRINGS AND SETS STATUS",8D
         _PRN  "FLAGS ACCORDINGLY, MAINLY THE ZERO",8D
         _PRN  "FLAG AND THE CARRY FLAG.",8D8D
         _WAIT
         _PRN  "THE ZERO FLAG IS SET TO 0 IF THE",8D
         _PRN  "STRINGS ARE AN EXACT MATCH; OTHERWISE",8D
         _PRN  "THE ZERO FLAG IS SET TO 1. IF THE",8D
         _PRN  "STRINGS DON'T MATCH, THEY ARE TESTED",8D
         _PRN  "TO SEE IF THEY ARE THE SAME LENGTH.",8D
         _PRN  "IF THE FIRST STRING IS SMALLER, THEN",8D
         _PRN  "THE CARRY IS SET TO 0; IF IT IS ",8D
         _PRN  "EQUAL TO OR LARGER THAN THE 2ND, THEN",8D
         _PRN  "THE CARRY IS SET TO 1.",8D8D
         _WAIT
         _PRN  "THESE CAN BE TESTED BY USING",8D
         _PRN  "BRANCH INSTRUCTIONS LIKE BEQ FOR THE ",8D
         _PRN  "ZERO FLAG OR BCC FOR THE CARRY. THUS:",8D8D
         _WAIT
         _PRN  "  SCMP 'TEST';'TEST'",8D
         _PRN  "  BEQ  :NOMATCH",8D
         _PRN  "  _PRN 'THE STRINGS MATCH!'",8D
         _PRN  "  JMP :EXIT",8D
         _PRN  "  :NOMATCH",8D
         _PRN  "  _PRN 'STRINGS DO NOT MATCH!'",8D
         _PRN  "  :EXIT",8D8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         SCMP  "TEST";"TEST"
         BEQ   NOMATCH
         _PRN  "THE STRINGS MATCH!",8D8D
         JMP   EXIT1
NOMATCH
         _PRN  "THE STRINGS DO NOT MATCH!",8D8D
EXIT1
         _WAIT
         JSR   ]HOME
         _PRN  "FIN.",8D8D
*
         JMP   $3D0
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** BOTTOM INCLUDES
*
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
** STRING SUBROUTINES
*
         PUT   MIN.SUB.PRNSTR
         PUT   MIN.SUB.STRCAT
         PUT   MIN.SUB.STRCOMP
*
** SUBSTRING SUBROUTINES
*
         PUT   MIN.SUB.SUBCOPY
         PUT   MIN.SUB.SUBDEL
         PUT   MIN.SUB.SUBINS
         PUT   MIN.SUB.SUBPOS
*
STR1     STR   "TEST STRING 1"
STR2     STR   "TEST STRING 2"
SUB1     STR   "-SUBTEST1-"
STR3     STR   "TEST STRING 2"
SUB2     STR   "STRING"
