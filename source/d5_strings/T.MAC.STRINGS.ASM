*``````````````````````````````*
* MAC.STRINGS                  *
*                              *
* THIS FILE CONTAINS ALL OF    *
* THE MACROS RELATED TO STRING *
* MANIPULATION.                *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      17-SEP-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.PRNSTR                   *
* SUB.STRCAT                   *
* SUB.STRCOMP                  *
* SUB.SUBCOPY                  *
* SUB.SUBDEL                   *
* SUB.SUBINS                   *
* SUB.SUBPOS                   *
*                              *
* LIST OF MACROS               *
*                              *
* SCMP : STRING COMPARE        *
* SCAT : STRING CONCATENATE    *
* SPRN : PRINT STRING          *
* SPOS : FIND SUBSTRING POS    *
* SCOP : SUBSTRING COPY        *
* SDEL : SUBSTRING DELETE      *
* SINS : SUNBSTRING INSERT     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SCMP          (NATHAN RIGGS) *
*                              *
* COMPARES TWO STRINGS AND     *
* CHANGES THE ZERO FLAG TO 1   *
* IF THE STRINGS ARE EQUAL. IF *
* UNEQUAL, THE MACRO THEN      *
* COMPARES THE LENGTHS; IF THE *
* FIRST IS LESS THAN SECOND,   *
* THE CARRY FLAG IS SET TO 0.  *
* OTHERWISE, IT IS SET TO 1.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = 1ST STRING TO COMPARE  *
*  ]2 = 2ND STRING TO COMPARE  *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SCMP "TEST";"TEST"          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCMP     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         _MSTR ]2;WPAR2
         JSR   STRCMP
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SCAT          (NATHAN RIGGS) *
*                              *
* CONCATENATE TWO STRINGS      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FIRST STRING           *
*  ]2 = SECOND STRING          *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SCAT "I AM";" TIRED"        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCAT     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         _MSTR ]2;WPAR2
         JSR   STRCAT
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SPRN :          PRINT STRING *
*                              *
* PRINT A STRING TO THE SCREEN *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING TO PRINT        *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SPRN "TESTING"              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPRN     MAC
         STY   SCRATCH
         _AXLIT ]1
         JSR   PRNSTR
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SPOS          (NATHAN RIGGS) *
*                              *
* FIND THE POSITION OF A SUB-  *
* STRING IN A GIVEN STRING.    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING              *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SPOS "A TEST";"TEST"        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPOS     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR2
         _MSTR ]2;WPAR1
         JSR   SUBPOS
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SCPY          (NATHAN RIGGS) *
*                              *
* COPY SUBSTRING FROM STRING   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING INDEX        *
*  ]3 = SUBSTRING LENGTH       *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SCPY "HELLO WORLD";#7;#5    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCPY     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         LDA   ]2
         STA   BPAR2
         LDA   ]3
         STA   BPAR1
         JSR   SUBCOPY
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SDEL          (NATHAN RIGGS) *
*                              *
* DELETE SUBSTRING FROM STRING *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING INDEX        *
*  ]3 = SUBSTRING LENGTH       *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SUBDEL "12345";#2;#2        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SDEL     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         LDA   ]2
         STA   BPAR2
         LDA   ]3
         STA   BPAR1
         JSR   SUBDEL
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* SINS          (NATHAN RIGGS) *
*                              *
* INSERT SUBSTRING INTO STRING *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = SUBSTRING ADDRESS      *
*  ]3 = SUBSTRING INDEX        *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SINS "1245";"3";#3          *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SINS     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR2
         _MSTR ]2;WPAR1
         LDA   ]3
         STA   BPAR1
         JSR   SUBINS
         LDY   SCRATCH
         <<<
