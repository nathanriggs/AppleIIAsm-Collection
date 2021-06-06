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
* DATE:      04-JUN-2021       *
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
* SIZE: 3 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
INP      MAC
         JSR   SINPUT     ; {64C3B}
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
* CYCLES: 13+                  *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GKEY     MAC
         JSR   GETKEY     ; {6+C3B} MONITOR GET SUBROUTINE
         LDY   #0         ; {3C2B}
         STY   STROBE     ; {4C3B}  RESET KBD STROBE
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
* CYCLES: 10+                  *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PDL      MAC
         LDX   ]1         ; {4C3B}  READ PADDLE # ]1 (USUALLY 0)
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
* CYCLES: 13+                  *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PBX      MAC
         LDX   #1         ; {3C2B}
         LDA   ]1         ; {4C3B} IF BTN = PUSHED
         BMI   EXIT       ; {3C2B} IF HIBYTE SET, BUTTON PUSHED
         LDX   #0         ; {3C2B} OTHERWISE, BUTTON NOT PUSHED
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
* CYCLES: 13                   *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
WAIT     MAC
]WTLP    LDA   KYBD       ; {4C3B} READ KEYBOARD BUFFER
         BPL   ]WTLP      ; {3C2B} IF 0, KEEP LOOPING
         AND   #$7F       ; {2C2B} OTHERWISE, SET HI BIT
         STA   STROBE     ; {4C2B} CLEAR STROBE
         <<<
