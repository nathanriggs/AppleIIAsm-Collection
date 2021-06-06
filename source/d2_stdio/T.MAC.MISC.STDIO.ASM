*
*``````````````````````````````*
* MAC.MISC.STDIO.ASM           *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* STANDARD INPUT AND OUTPUT.   *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* REQUIRED SUBROUTINES         *
*                              *
*  SUB.TXTCENT.ASM             *
*                              *
* LIST OF MACROS               *
*                              *
* COL40 : FORCE 40COL MODE     *
* COL80 : FORCE 80COL MODE     *
* DIE80 : KILL 80COL FIRMWARE  *
* TCTR : CALCULATE TEXT CENTER *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DIE80                        *
*                              *
* SEND CTRL-U TO COUT, FORCING *
* 40 COLUMN MODE.              *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 9+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIE80    MAC
         LDA   #21        ; {3C2B} CTRL-U CHARACTER
         JSR   COUT       ; {6C3B} SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* COL80                        *
*                              *
* FORCE 80-COLUMN MODE.        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 9+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL80    MAC
         LDA   #18        ; {3C2B} CTRL-R CHARACTER
         JSR   COUT       ; {6C3B} SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* COL40                        *
*                              *
* FORCE 40-COLUMN MODE         *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 9+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL40    MAC
         LDA   #17        ; {3C2B} CTRL-Q CHARACTER
         JSR   COUT       ; {6C3B} SEND TO SCREEN
         <<<
*
*``````````````````````````````*
* TCTR                         *
*                              *
* THE TCTR MACRO TAKES A LINE  *
* LENGTH AND A SMALLER STRING  *
* LENGTH, THEN CALCULATES THE  *
* STARTING POSITION OF THE     *
* STRING IN THE LINE SO THAT   *
* IT CAN BE CENTERED.          *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING LENGTH          *
*  ]2 = LINE LENGTH            *
*                              *
* CYCLES: 51+                  *
* SIZE: 13 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCTR     MAC
         LDA   ]1         ; {4C3B} LOAD STRING LENGTH
         STA   ZPW1       ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {4C3B} LOAD LINE LENGTH
         STA   ZPW1+1     ; {3C2B} PASS VIA ZERO PAGE
         JSR   TXTCENT    ; {37C3B} CALL TXTCENT SUBROUTINE
         <<<
