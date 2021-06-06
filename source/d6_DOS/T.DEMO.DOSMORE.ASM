*
*``````````````````````````````*
* DEMO.DOSMORE.ASM             *
*                              *
* A DEMO FILE FOR VARIOUS DOS  *
* MACROS AND SUBROUTINES.      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      05-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.DOSMORE
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
* TOP INCLUDES                 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         USE   MIN.MAC.DOSREQ.ASM
         USE   MIN.MAC.DOSMORE.ASM
         PUT   MIN.HEAD.DOS.ASM
]HOME    EQU   $FC58
*
*``````````````````````````````*
* PROGRAM MAIN BODY            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* MISC. DOS MACROS             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DVER                         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE DVER MACRO TESTS WHICH DOS VERSION IS
** BEING USED. IT RETURNS #2 FOR DOS 3.2 AND #3
** FOR DOS 3.X.
*
         JSR   ]HOME
         _PRN  "DOS VERSION MACRO (DVER)",8D
         _PRN  "========================",8D8D
         DVER
         CMP   #3
         BEQ   THREE
         _PRN  "USING DOS 2.X",8D
         JMP   NEXT1
THREE    _PRN  "USING DOS 3.X",8D
NEXT1
         _WAIT
*
*``````````````````````````````*
* THE DOSIN MACRO              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE DOSIN MACRO CHECK WHETHER DOS IS LOADED.
** THIS IS NECESSARY TO CHECK BEFORE TRYING TO
** USE THE DOS FILE MANAGER OR THE RWTS ROUTINES.
*
         JSR   ]HOME
         _PRN  "THE DOSIN MACRO",8D
         _PRN  "===============",8D8D
         DOSIN
         BCC   NODOS
         _PRN  "DOS IS CURRENTLY LOADED."
         JMP   NEXT2
NODOS    _PRN  "DOS IS NOT LOADED."
NEXT2
         _WAIT
*
*``````````````````````````````*
* THE ABAS MACRO               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE ABAS MACRO TESTS WHICH VERSION OF
** BASIC IS LOADED: INTEGER OR APPLESOFT.
** IF APPLESOFT IS LOADED, THEN THE CARRY IS
** RETURNED AS TRUE; IF INTEGER BASIC IS LOADED,
** THEN THE CARRY IS RETURNED CLEAR.
*
         JSR   ]HOME
         _PRN  "THE ABAS MACRO",8D
         _PRN  "==============",8D8D
         ABAS
         BCC   INTBAS
         _PRN  "APPLESOFT IS LOADED."
         JMP   NEXT3
INTBAS   _PRN  "INTEGER BASIC IS LOADED."
NEXT3    _WAIT
*
*``````````````````````````````*
* THE IBEX MACRO               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE IBEX MACRO TESTS WHETHER INTEGER BASIC
** IS RUNNING. THE CARRY IS RETURNED AS TRUE IF SO,
** AND CLEAR IF NOT. NOTE THAT YOU SHOULD TEST IF
** INTEGER BASIC IS LOADED BEFOREHAND; OTHERWISE,
** A FALSE POSITIVE MAY RESULT.
*
         JSR   ]HOME
         _PRN  "THE IBEX MACRO",8D
         _PRN  "==============",8D8D
         IBEX
         BCC   INTNORUN
         _PRN  "INTEGER BASIC IS RUNNING."
         JMP   NEXT4
INTNORUN _PRN  "INTEGER BASIC IS NOT RUNNING."
NEXT4    _WAIT
*
*``````````````````````````````*
* THE ABEX MACRO               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE ABEX MACRO TESTS WHETHER AN APPLESOFT
** PROGRAM IS CURRENTLY RUNNING.
*
         JSR   ]HOME
         _PRN  "THE ABEX MACRO",8D
         _PRN  "==============",8D8D
         ABEX
         BCC   NOAPP
         _PRN  "APPLESOFT PROGRAM IS RUNNING."
         JMP   NEXT5
NOAPP    _PRN  "APPLESOFT PROGRAM IS NOT RUNNING."
NEXT5    _WAIT
*
         JSR   ]HOME
         _PRN  "FIN!",8D8D
*
EXIT
         JMP   $3D0
*
         PUT   MIN.LIB.REQUIRED.ASM
*
