*
*``````````````````````````````*
* DEMO.DOSFM.ASM               *
*                              *
* A DEMO FILE FOR THE DOS      *
* FILE MANAGER MACROS.         *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      21-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   CATM
         OBJ   $BFE0
         ORG   $6000
*
TRKOFF   EQU   $1
SECOFF   EQU   $2
*
         JMP   _PASSVARS
CURTRK   DS    1
CURSEC   DS    2
*
_PASSVARS
*
*``````````````````````````````*
* TOP INCLUDES                 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         PUT   MIN.HEAD.DOS.ASM
         USE   MIN.MAC.DOSFM.ASM
*
]HOME    EQU   $FC58
]ZSLOT   EQU   $6
]ZDRIVE  EQU   $2
*
*``````````````````````````````*
* PROGRAM MAIN BODY            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         SRWTS #]ZSLOT;#]ZDRIVE;#0;#$11;#0;#$9000;#1
         GRWTS
         LDY   #TRKOFF
         LDA   $9000,Y
         STA   CURTRK
         LDY   #SECOFF
         LDA   $9000,Y
         STA   CURSEC
         SRWTS #]ZSLOT;#]ZDRIVE;#0;CURTRK;CURSEC;#$9000;#1
         GRWTS
         LDY   #255
LOOP1
         INY
         LDA   $900B,Y
         JSR   $FDF0
         CPY   #30
         BNE   LOOP1
EXIT
         JMP   $3D0
*
         PUT   MIN.SUB.FBLOAD.ASM
         PUT   SUB.FBSAVE.ASM
         PUT   MIN.LIB.REQUIRED.ASM
*
