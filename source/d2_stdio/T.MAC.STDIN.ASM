*
*``````````````````````````````*
* MAC.STDIN.ASM                *
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
* SUBROUTINES FILES USED:      *
*                              *
*  SUB.SINPUT                  *
*                              *
* LIST OF MACROS               *
*                              *
* INP   : STRING INPUT         *
* GKEY  : GET SINGLE KEY       *
* PDL   : READ PADDLE STATE    *
* PBX   : READ PDL BTN X       *
* WAIT  : WAIT FOR KEYPRESS    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* INP                          *
*                              *
* INPUTS A STRING FROM KEYBRD  *
* AND STORES IT IN [RETURN]    *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 64+                  *
* SIZE: 41 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
INP      MAC
         JSR   SINPUT     ; {64C41B}
         <<<
*
*``````````````````````````````*
* GKEY                         *
*                              *
* WAITS FOR USER TO PRESS A    *
* KEY, THEN STORES THAT IN .A  *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 11+                  *
* SIZE: 7 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GKEY     MAC
         JSR   GETKEY     ; {6+C3B} MONITOR GET SUBROUTINE
         LDY   #0         ; {2C2B}
         STY   STROBE     ; {3C2B} RESET KBD STROBE
         <<<
*
*``````````````````````````````*
* PDL                          *
*                              *
* SIMPLY READS STATE OF PADDLE *
* NUMBER [NUM] AND STORES IT   *
* IN THE Y REGISTER.           *
*                              *
* PARAMETERS                   *
*                              *
*   ]1 = PADDLE # TO READ      *
*                              *
* CYCLES: 8+                   *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PDL      MAC              ; GET PADDLE VALUE
         LDX   ]1         ; {2C2B} READ PADDLE # ]1 (USUALLY 0)
         JSR   PREAD      ; {6+C3B} PADDLE READING STORED IN Y
         <<<
*
*``````````````````````````````*
* PBX                          *
*                              *
* READ THE SPECIFIED PADDLE    *
* BUTTON.                      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = PADDLE BUTTON TO READ  *
*                              *
*  PB0: $C061   PB1: $C062     *
*  PB2: $C063   PB4: $C060     *
*                              *
* CYCLES: 8+                   *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PBX      MAC
         LDX   #1         ; {2C2B}
         LDA   ]1         ; {2C2B} IF BTN = PUSHED
         BMI   EXIT       ; {2C2B} IF HIBYTE SET, BUTTON PUSHED
         LDX   #0         ; {2C2B} OTHERWISE, BUTTON NOT PUSHED
EXIT
         <<<
*
*``````````````````````````````*
* WAIT                         *
*                              *
* WAIT FOR A KEYPRESS WITHOUT  *
* INTERFERING WITH COUT. KEY   *
* CODE IS STORED IN .A.        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 9                    *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
WAIT     MAC
]WTLP    LDA   KYBD       ; {2C2B} READ KEYBOARD BUFFER
         BPL   ]WTLP      ; {2C2B} IF 0, KEEP LOOPING
         AND   #$7F       ; {2C2B} OTHERWISE, SET HI BIT
         STA   STROBE     ; {3C2B} CLEAR STROBE
         <<<
