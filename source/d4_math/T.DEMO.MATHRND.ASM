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
* DATE:      02-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.MATHRND
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         PUT   MIN.HEAD.MATH.ASM
         USE   MIN.MAC.MATHRND.ASM
]HOME2   EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* PSEUDORANDOM NUMBER MACROS   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THERE ARE FIVE MACROS DEDICATED TO USING AND
** GENERATING PSEUDORANDOM NUMBERS. THE RND8
** MACRO AND THE RND16 MACRO GENERATE EITHER 8-BIT
** OR 16-BIT RANDOM NUMBERS, RESPECTIVELY, WHILE
** THE RAND MACRO GENERATES AN 8-BIT NUMBER BETWEEN
** A LOW AND A HIGH.
*
** IN ADDITION TO THESE ARE TWO OTHER IMPORTANT MACROS:
** THE RNDMZ MACRO AND THE RNDEOR MACRO. THESE ARE BOTH
** DEDICATED TO ALTERING THE SEED AND THE EOR VALUE
** FOR GENERATING PSEUDORANDOM NUMBERS, BUT THE RNDEOR
** ALLOWS YOU TO DIRECTLY SPECIFY THE SEED AND THE EOR
** VALUE WHEREAS THE RNDMZ MACRO ALLOWS YOU TO SET THE
** SEED DIRECTLY BUT NOT THE EOR VALUE. INSTEAD, THE
** VALUE PASSED FOR THE EOR ARGUMENT IS DIVIDED BY FOUR
** TO SET IT TO A NUMBER BETWEEN 0 AND 63, AND A FINAL
** EOR VALUE IS CHOSEN FROM A TABLE OF CONSTANTS THAT
** ENSURES MAXIMUM VARIABILITY (TO THE POINT OF BEING
** "UNNATURAL" RANDOMNESS).
*
** EITHER RNDMZ OR RNDEOR SHOULD BE EXECUTED BEFORE
** RND8, RND16, OR RAND ARE USED. OTHERWISE, THE SEED
** AND EOR VALUE WILL REVERT TO DEFAULT VALUES,
** POSSIBLY BECOMING HIGHLY PREDICTABLE BY SOMEONE
** LOOKING TO EXPLOIT SUCH SYSTEMS.
*
*``````````````````````````````*
* THE RNDEOR MACRO             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** AS NOTED ABOVE, THE RNDEOR MACRO ALLOWS YOU TO SET
** THE SEED AND EOR VALUE FOR THE PSEUDORANDOM NUMBER
** GENERATOR. THE SEED IS PROVIDED FIRST, FOLLOWED BY
** THE EOR "MAGIC NUMBER."
*
         JSR   ]HOME2
         _PRN  "THE RNDEOR MACRO",8D
         _PRN  "================",8D8D
         RNDEOR SEED1;NUM1
         _PRN  "SEED LOW AND HIGH NOW:",8D
         DUMP  #RNDL;#2
         _PRN  " ",8D8D
         _PRN  "AND THE MAGIC NUMBER IS:",8D
         DUMP  #]MAGEOR;#2
         _WAIT
*
*``````````````````````````````*
* THE RNDMZ MACRO              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** AS DESCRIBED ABOVE, THE RNDMZ (RANDOMIZE) MACRO
** SETS THE SEED OF THE PRNG TO A GIVEN VALUE, AND
** PULLS FROM A TABLE OF PRESET VALUES THE "MAGIC
** NUMBER" THAT IS USED TO EOR THE SEED. THE NUMBER
** PROVIDED AS ARGUMENT TWO SERVES AS AN INDEX.
*
         JSR   ]HOME2
         _PRN  "THE RNDMZ MACRO",8D
         _PRN  "===============",8D8D
         RNDMZ SEED2;NUM2
         _PRN  "THE NEW SEED IS: ",8D
         DUMP  #RNDL;#2
         _PRN  " ",8D8D
         _PRN  "AND THE NEW MAGIC NUMBER IS:",8D
         DUMP  #]MAGEOR;#2
         _WAIT
*
*``````````````````````````````*
* THE RND8 MACRO               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE RND8 MACRO RETURNS A PSEUDORANDOM NUMBER
** BETWEEN 0 AND 255 (THUS THE 8, FOR 8-BIT).
** THIS IS PASSED BACK VIA RETURN AND .A.
*
         JSR   ]HOME2
         _PRN  "THE RND8 MACRO",8D
         _PRN  "==============",8D8D
         _PRN  "SOME RANDOM NUMBERS:",8D8D
         RND8
         DUMP  #RETURN;#1
         _PRN  " "
         RND8
         DUMP  #RETURN;#1
         _PRN  " "
         RND8
         DUMP  #RETURN;#1
         _WAIT
*
*``````````````````````````````*
* THE RAND MACRO               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE RAND MACRO TAKES A LOW VALUE AND A
** HIGH VALUE AND PASSES BACK A RANDOM NUMBER
** BETWEEN THE TWO IN RETURN AND .A.
*
         JSR   ]HOME2
         _PRN  "THE RAND MACRO",8D
         _PRN  "==============",8D8D
         _PRN  "SOME RANDOM NUMBERS:",8D8D
         RAND  #1;#30
         DUMP  #RETURN;#1
         _PRN  " "
         RAND  #1;#30
         DUMP  #RETURN;#1
         _PRN  " "
         RAND  #1;#30
         DUMP  #RETURN;#1
         _WAIT
*
*``````````````````````````````*
* THE RND16 MACRO              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE RND16 MACRO WORKS THE SAME WAY AS
** THE RND8 MACRO, EXCEPT THAT IT PASSES BACK
** A 16-BIT RANDOM VALUE VIA RETURN AS WELL AS
** IN .A (LOW BYTE) AND .X (HIGH).
*
         JSR   ]HOME2
         _PRN  "THE RND16 MACRO",8D
         _PRN  "==============",8D8D
         _PRN  "SOME RANDOM NUMBERS:",8D8D
         RND16
         DUMP  #RETURN;#2
         _PRN  " "
         RND16
         DUMP  #RETURN;#2
         _PRN  " "
         RND16
         DUMP  #RETURN;#2
         _WAIT
*
         JSR   ]HOME2
         _PRN  "FIN!",8D8D8D
*
         JMP   REENTRY
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** BOTTOM INCLUDES
*
         PUT   MIN.LIB.REQUIRED.ASM
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
         PUT   MIN.SUB.RAND8.ASM
         PUT   MIN.SUB.RANDB.ASM
         PUT   MIN.SUB.RAND16.ASM
*
SEED1    DW    1000
NUM1     DW    666
SEED2    DW    2000
NUM2     DB    200
