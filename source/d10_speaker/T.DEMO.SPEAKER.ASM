*
*``````````````````````````````*
* DEMO.LORES                   *
*                              *
* A DEMO OF THE MACROS AND     *
* SUBROUTINES FOR USING LORES  *
* GRAPHICS.                    *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      03-OCT-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.SPEAKER
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (PUTS, MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MAC.SPEAKER
         PUT   HOOKS.SPEAKER
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         LDY   #1
         STY   ]O
:RPT
         PTONE #OCT1_C;#WHOLE;]O
         _PRN  "C;WHOLE",8D8D
         _WAIT
         PTONE #OCT1_D;#WHOLE;]O
         _PRN  "D WHOLE",8D8D
         _WAIT
         PTONE #OCT1_E;#WHOLE;]O
         _PRN  "E WHOLE",8D8D
         _WAIT
         PTONE #OCT1_F;#WHOLE;]O
         _PRN  "F WHOLE",8D8D
         _WAIT
         PTONE #OCT1_G;#WHOLE;]O
         _PRN  "G WHOLE",8D8D
         _WAIT
         PTONE #OCT1_A;#WHOLE;]O
         _PRN  "A WHOLE",8D8D
         _WAIT
         PTONE #OCT1_B;#WHOLE;]O
         _PRN  "B WHOLE",8D8D
         _WAIT
*
         INC   ]O
         LDA   ]O
         CMP   #5
         BEQ   :EXIT
         JMP   :RPT
*
:EXIT
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
         PUT   SUB.PLAYTONE
*
]O       DB    #5
