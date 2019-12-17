*
*``````````````````````````````*
* DEMO.MATH                    *
*                              *
* A DEMO OF THE INTEGER MATH   *
* MACROS INCLUDED AS PART OF   *
* THE APPLEIIASM LIBRARY.      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      16-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.MATH
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         PUT   MIN.HOOKS.MATH
         USE   MIN.MAC.MATH
]HOME    EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   ]HOME
         _PRN  "INTEGER MATH DEMO",8D
         _PRN  "=================",8D8D
         _PRN  "THIS DISK CONTAINS MACROS AND",8D
         _PRN  "SUBROUTINES RELATED TO INTEGER",8D
         _PRN  "MATH (UNSIGNED ONLY, SO FAR), AS",8D
         _PRN  "WELL AS HOOKS TO USE THE STANDARD",8D
         _PRN  "APPLESOFT FLOATING-POINT ",8D
         _PRN  "SUBROUTINES.",8D8D
         _PRN  "THE FLOATING-POINT ROUTINES",8D
         _PRN  "ARE NOT COVERED HERE.",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "16-BIT INTEGER MATH",8D
         _PRN  "===================",8D8D
         _PRN  "ADD16, SUB16, MUL16, DIV16",8D8D
         _PRN  "THE 16-BIT INTEGER MATH MACROS",8D
         _PRN  "ARE USED TO CALCULATE UNSIGNED VALUES",8D
         _PRN  "BETWEEN 0 AND 65,025. THESE ARE TWO-",8D
         _PRN  "BYTE VALUES.",8D8D
         _PRN  "NOTE THAT BECAUSE OF INCREASED BYTE",8D
         _PRN  "AND CPU CYCLE EXPENSES, THESE SHOULD",8D
         _PRN  "ONLY BE USED IF 8-BIT CALCULATION ISN'T",8D
         _PRN  "ADEQUATE.",8D
         _WAIT
         JSR   ]HOME
         _PRN  "LET'S START WITH ADDING TWO 16-BIT",8D
         _PRN  "NUMBERS. THE ADD16 MACRO ACCEPTS TWO",8D
         _PRN  "16-BIT PARAMETERS, ADDS THEM TOGETHER,",8D
         _PRN  "AND THEN HOLDS THE VALUE IN RETURN,",8D
         _PRN  "WITH THE BYTE-LENGTH STORED IN RETLEN.",8D8D
         _PRN  "NOTE THAT THE SUM RETURNED IS ALSO A",8D
         _PRN  "16-BIT VALUE; THUS, A TOTAL SUM CAN BE",8D
         _PRN  "NO HIGHER THAN 65,025. THE SUM IS",8D
         _PRN  "ALSO RETURNED IN .A (LOW BYTE) AND",8D
         _PRN  ".X (HIGH BYTE) FOR FASTER REFERENCE.",8D8D
         _WAIT
         _PRN  "THUS, THE FOLLOWING CODE:",8D8D
         _PRN  "  ADD16 #10000;#20000",8D8D
         _PRN  "WILL RESULT IN:",8D8D
         _WAIT
         ADD16 #10000;#20000
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "16-BIT SUBTRACTION WORKS MUCH THE",8D
         _PRN  "SAME. THE DIFFERENCE IS STORED IN",8D
         _PRN  "RETURN AS WELL AS IN .A (LOW) AND",8D
         _PRN  ".X (HIGH), AND RETLEN CONTAINS",8D
         _PRN  "THE BYTE-LENGTH OF THE DIFFERENCE.",8D8D
         _PRN  "THUS, THE FOLLOWING CODE:",8D8D
         _PRN  "  SUB16 #20000;#10000",8D8D
         _PRN  "PRODUCES:",8D8D
         _WAIT
         SUB16 #20000;#10000
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "16-BIT MULTIPLICATION AGAIN WORKS",8D
         _PRN  "MUCH LIKE ADDITION AND SUBTRACTION,",8D
         _PRN  "EXCEPT THE ORDER OF THE PARAMETERS DOES",8D
         _PRN  "NOT MATTER.",8D8D
         _WAIT
         _PRN  "UNLIKE 16-BIT ADDITION AND 16-BIT",8D
         _PRN  "SUBTRACTION, THE MUL16 MACRO ",8D
         _PRN  "RETURNS A 32-BYTE VALUE (4 BYTES). NOTE",8D
         _PRN  "THAT IF EITHER OF THE PARAMETERS ARE",8D
         _PRN  "SIGNED, THE TWO HIGHEST BYTES WILL BE",8D
         _PRN  "WRONG.",8D8D
         _WAIT
         _PRN  "THUS, MULTIPLYING TWO NUMBERS IS AS",8D
         _PRN  "EASY TO ACCOMPLISH AS:",8D8D
         _PRN  "  MUL16 #300;#1000",8D8D
         _PRN  "WHICH OUTPUTS THE PRODUCT TO RETURN:",8D8D
         _WAIT
         MUL16 #300;#1000
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "FINALLY, THE DIV16 MACRO HANDLES ",8D
         _PRN  "16-BIT DIVISION, STORING THE RESULT",8D
         _PRN  "IN RETURN. THIS IS ALSO STORED IN",8D
         _PRN  ".A (LOW BYTE) AND .X (HIGH BYTE). THE ",8D
         _PRN  "REMAINDER OF THE OPERATION IS STORED",8D
         _PRN  "IN .Y.",8D8D
         _WAIT
         _PRN  "THUS:",8D8D
         _PRN  "  DIV16 #10000;#1000",8D8D
         _PRN  "WILL RETURN:",8D8D
         _WAIT
         DIV16 #10000;#1000
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "8-BIT INTEGER MATHEMATICS",8D
         _PRN  "=========================",8D8D
         _PRN  "8-BIT MATH MOSTLY WORKS THE SAME",8D
         _PRN  "AS 16-BIT MATH MACROS, BUT SINCE",8D
         _PRN  "8-BIT ADDITION AND SUBTRACTION ARE",8D
         _PRN  "MUCH SIMPLER IN 6502, THEY ARE ONLY",8D
         _PRN  "MACROS WITHOUT SUBROUTINES, AND ",8D
         _PRN  "STRICTLY USE THE REGISTERS FOR PASSING",8D
         _PRN  "DATA.",8D8D
         _PRN  "SINCE THEY ARE SO SIMILAR IN FORM",8D
         _PRN  "AND FUNCTION, WE WILL COVER THOSE",8D
         _PRN  "TOGETHER.",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "THE ADD8 AND SUB8 MACROS ADD AND",8D
         _PRN  "SUBTRACT 8-BIT VALUES, RESPECTIVELY.",8D
         _PRN  "THE RESULT OF BOTH OPERATIONS IS",8D
         _PRN  "STORED IN THE ACCUMULATOR. AS SUCH:",8D8D
         _WAIT
         _PRN  "  ADD8 #10;#20",8D8D
         _PRN  "WILL RETURN:",8D8D
         ADD8  #10;#20
         DUMP  #RETURN;RETLEN
         _PRN  "AND:",8D8D
         _WAIT
         _PRN  "  SUB8 #20;#10",8D8D
         _PRN  "WILL RETURN:",8D8D
         SUB8  #20;#10
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "THE DIV8 AND MUL8 MACROS WORK AS",8D
         _PRN  "EXPECTED: LIKE DIV16 AND MUL16, BUT",8D
         _PRN  "WORK ONLY WITH 8-BIT VALUES INSTEAD.",8D8D
         _PRN  "THUS:",8D8D
         _PRN  "  MUL8 #10;#10",8D8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         MUL8  #10;#10
         DUMP  #RETURN;RETLEN
         _WAIT
         _PRN  "AND:",8D8D
         _PRN  "  DIV8 #100;#10",8D8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         DIV8  #100;#10
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "PSEUDO-RANDOM NUMBERS",8D
         _PRN  "=====================",8D8D
         _PRN  "THERE ARE THREE MACROS DEDICATED TO",8D
         _PRN  "PSEUDO-RANDOM NUMBER GENERATION:",8D
         _PRN  "RND8, RND16, AND RAND. ",8D8D
         _WAIT
         _PRN  "RND8 RETURNS A PSEUDO-RANDOM BYTE IN",8D
         _PRN  ".A AND IN RETURN (0..255), WHEREAS",8D
         _PRN  "RND16 RETURNS A 16-BIT VALUE (2 BYTES)",8D
         _PRN  "IN RETURN AND IN .A (LOW BYTE) AND .X",8D
         _PRN  "(HIGH BYTE). LASTLY, THE RAND MACRO",8D
         _PRN  "RETURNS A BYTE VALUE BETWEEN A GIVEN ",8D
         _PRN  "LOW VALUE AND HIGH VALUE.",8D8D
         _WAIT
         _PRN  "RND8 AND RND16 DO NOT ACCEPT ANY",8D
         _PRN  "PARAMETERS; ONLY RAND ACCEPTS ANY INPUT",8D
         _PRN  "WHATSOEVER. THUS:",8D8D
         _WAIT
         _PRN  "  RAND #10;#20",8D8D
         _PRN  "RETURNS A NUMBER BETWEEN 10 AND 20:",8D8D
         RAND  #10;#20
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "16-BIT COMPARISON",8D
         _PRN  "=================",8D8D
         _PRN  "LASTLY, THE ODD MACRO OUT IN THIS",8D
         _PRN  "MACRO COLLECTION IS CMP16, WHICH",8D
         _PRN  "PERFORMS THE EQUIVALENT OF THE 6502",8D
         _PRN  "ASSEMBLY CMP COMMAND (COMPARE) BUT ON A",8D
         _PRN  "16-BIT VALUE. THIS IS ACHIEVED BY",8D
         _PRN  "SETTING FLAG BITS IN THE .P REGISTER",8D
         _PRN  "BASED ON WHETHER THE TWO VALUES ARE",8D
         _PRN  "EQUAL, OR ONE IS LESS THAN OR GREATER",8D
         _PRN  "THAN THE OTHER. ",8D8D
         _WAIT
         _PRN  "THE FOLLOWING FLAGS ARE SET BASED",8D
         _PRN  "ON THE RELATIONSHIP OF THE PARAMETERS:",8D8D
         _PRN  "UNSIGNED PARAMETERS:",8D8D
         _PRN  "  Z = 1 IF PARAMETERS ARE EQUAL",8D
         _PRN  "  C = 0 IF FIRST PARAMETER > SECOND",8D
         _PRN  "      1 IF FIRST PARAMETER <= SECOND",8D8D
         _WAIT
         _PRN  "SIGNED PARAMETERS:",8D8D
         _PRN  "  N = 1 IF FIRST PARAMETER > SECOND",8D
         _PRN  "      0 IF FIRST PARAMETER <= SECOND",8D
*
         _WAIT
         JSR   ]HOME
         _PRN  "WE ARE DONE HERE.",8D8D8D
         JMP   REENTRY
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
** 8-BIT MATH SUBROUTINES
*
         PUT   MIN.SUB.MULT8
         PUT   MIN.SUB.DIVD8
         PUT   MIN.SUB.RAND8
         PUT   MIN.SUB.RANDB
*
** 16-BIT MATH SUBROUTINES
*
         PUT   MIN.SUB.ADDIT16
         PUT   MIN.SUB.SUBT16
         PUT   MIN.SUB.COMP16
         PUT   MIN.SUB.MULT16
         PUT   MIN.SUB.DIVD16
         PUT   MIN.SUB.RAND16
*
