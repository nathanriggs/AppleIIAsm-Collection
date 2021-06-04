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
* DATE:      11-MAR-2021       *
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
* CYCLES: 8+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIE80    MAC
         LDA   #21        ; {2C2B} CTRL-U CHARACTER
         JSR   COUT       ; {6+C3B} SEND TO SCREEN
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
* CYCLES: 8+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL80    MAC
         LDA   #18        ; {2C2B} CTRL-R CHARACTER
         JSR   COUT       ; {6+C3B} SEND TO SCREEN
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
* CYCLES: 8+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
COL40    MAC
         LDA   #17        ; {2C2B} CTRL-Q CHARACTER
         JSR   COUT       ; {6+C3B} SEND TO SCREEN
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
* CYCLES: 47+                  *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
TCTR     MAC
         LDA   ]1         ; {2C2B} LOAD STRING LENGTH
         STA   WPAR1      ; {3C2B} PASS VIA ZERO PAGE
         LDA   ]2         ; {2C2B} LOAD LINE LENGTH
         STA   WPAR1+1    ; {3C2B} PASS VIA ZERO PAGE
         JSR   TXTCENT    ; {37C19B} CALL TXTCENT SUBROUTINE
         <<<
