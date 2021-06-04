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
         DSK   DEMO.MATHBY
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
         USE   MIN.MAC.M8BY.ASM
         USE   MIN.MAC.M16BY.ASM
         USE   MIN.MAC.D8BY.ASM
]HOME2   EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   ]HOME2
*
** THIS DEMO SHOWS HOW TO USE THE QUICK
** MATH MACROS AVAILABLE FOR USE AS ALTERNATIVES
** TO THE NORMAL MATH ROUTINES. THESE MACROS
** DO NOT CALL ANY ROUTINES, AND ALL PASSING
** OF VARIABLES IS DONE VIA THE REGISTERS. THESE
** TEND TO BE QUICKER BECAUSE WE ARE MULTIPLYING
** AND DIVIDING BY CONSTANTS, THUS NOT REQUIRING
** THE USE OF LOOPING, CHECKING VALUES, ETC.
** EVERYTHING IS STRAIGHTFORWARDLY DEDICATED TO
** ONLY A SINGLE FUNCTION.
*
** WE SHALL START WITH 8-BIT MULTIPLICATION MACROS,
** FOLLOWED BY 16-BIT MULTIPLICATION, THEN 8-BIT
** DIVISION. CURRENTLY, NO 16-BIT DIVISION QUICK
** MATH ROUTINES EXIST, BECAUSE THE CYCLES SAVED IN
** COMPARISON TO THE BYTES USED WOULD PROBABLY BE
** MINIMAL.
*
*``````````````````````````````*
* 8-BIT QUICK MULTIPLICATION   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** STARTING WITH THE LOWEST NUMBER TO MULTIPLY BY,
** THE NUMBER TWO.
*
         JSR   ]HOME2
         _PRN  "8-BIT CONSTANT MATH MACROS",8D
         _PRN  "==========================",8D8D
         _PRN  "#5 * 2 = ",8D8D
         M8BY2 BIT8
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY3 BIT8
         STA   RETURN
         _PRN  "#5 * #3 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY4 BIT8
         STA   RETURN
         _PRN  "#5 * #4 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY5 BIT8
         STA   RETURN
         _PRN  "#5 * #5 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY6 BIT8
         STA   RETURN
         _PRN  "#5 * #6 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY7 BIT8
         STA   RETURN
         _PRN  "#5 * #7 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY8 BIT8
         STA   RETURN
         _PRN  "#5 * #8 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY9 BIT8
         STA   RETURN
         _PRN  "#5 * #9 = ",8D8D
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         M8BY10 BIT8
         STA   RETURN
         _PRN  "#5 * #10 = ",8D8D
         DUMP  #RETURN;#1
         _WAIT
*
*``````````````````````````````*
* 16-BIT CONST MULTIPLICATION  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** NOW WE WILL TEST THE 16-BIT MULTIPLY-BY-
** A-CONSTANT MACROS.
*
         JSR   ]HOME2
         _PRN  "16-BIT CONSTANT MULTIPLICATION",8D
         _PRN  "==============================",8D8D
*
         _PRN  "#500 * #2 = ",8D8D
         MBY2  BIT16
         STA   RETURN
         STX   RETURN+1
         DUMP  #RETURN;#2
         _WAIT
*
         _PRN  " ",8D8D
         MBY3  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #3 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY4  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #4 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY5  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #5 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY6  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #6 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY7  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #7 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY8  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #8 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY9  BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #9 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY10 BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #10 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
         _PRN  " ",8D8D
         MBY1H BIT16
         STA   RETURN
         STX   RETURN+1
         _PRN  "#500 * #100 = ",8D8D
         DUMP  #RETURN;#2
         _WAIT
         _PRN  " ",8D8D
*
*``````````````````````````````*
* 8BIT DIVISION BY CONSTANTS   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JSR   ]HOME2
         _PRN  "8-BIT DIVISION BY CONSTANTS",8D
         _PRN  "===========================",8D8D
*
         _PRN  "#100 / 2 = ",8D8D
         D8BY2 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 3 = ",8D8D
         D8BY3 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 4 = ",8D8D
         D8BY4 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 5 = ",8D8D
         D8BY5 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 6 = ",8D8D
         D8BY6 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 7 = ",8D8D
         D8BY7 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 8 = ",8D8D
         D8BY8 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
         _PRN  "#100 / 9 = ",8D8D
         D8BY9 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
*
*
         _PRN  "#100 / 10 = ",8D8D
         D8BY10 BIT82
         STA   RETURN
         DUMP  #RETURN;#1
         _PRN  " ",8D8D
         _WAIT
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
BIT8     HEX   05         ; #5
BIT82    HEX   64
BIT16    HEX   F401       ; #500
