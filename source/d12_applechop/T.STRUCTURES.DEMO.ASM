*
*``````````````````````````````*
*      -< COMMON DEMO )-       *
*                              *
*        VERSION 0.4.0         *
*                              *
*         28-APR-2019          *
*                              *
*       NATHAN D. RIGGS        *
*   NATHAN.RIGGS@OUTLOOK.COM   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   ONLY
         TR    ON
         DSK   STRUCTURES.DEMO
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.HOOKS.COMMON
         USE   MIN.MAC.COMMON
]HOME    EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]VAR1    EQU   VARTAB
]VAR2    EQU   VARTAB+1
]VAR3    EQU   VARTAB+2
]VAR4    EQU   VARTAB+3
*
         JSR   ]HOME
*
         LDA   #10
         STA   ]VAR1
         STA   ]VAR3
         LDA   #20
         STA   ]VAR2
         STA   ]VAR4
*
         IFJ   ]VAR1;=;]VAR2;V1E2
A1       IFJ   ]VAR1;=;]VAR3;V1E3
A2       IFJE  ]VAR2;=;]VAR3;V2E3;V2E4
*
         JMP   REENTRY
*
V1E2
         _PRN  "VAR1 = VAR2."
         JMP   A1
V1E3     _PRN  "VAR1 = VAR3",8D8D
         JMP   A2
V2E3
         _PRN  "VAR2 = VAR3.",8D8D
         JMP   A2
V2E4
         _PRN  "VAR2 = VAR4",8D8D
         JMP   REENTRY
*
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** BOTTOM INCLUDES
*
         PUT   MIN.LIB.REQUIRED
