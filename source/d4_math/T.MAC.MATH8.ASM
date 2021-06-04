*

*``````````````````````````````*
* MAC.MATH8.ASM                *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      01-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.DIVDU8                   *
* SUB.MULTU8                   *
*                              *
* LIST OF MACROS               *
*                              *
* ADD8  : ADD 8BIT NUMBERS     *
* SUB8  : SUBTRACT 8BIT NUMS   *
* MUL8  : MULTIPLY 8BIT NUMS   *
* DIV8  : DIVIDE 8BIT NUMS     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* ADD8          (NATHAN RIGGS) *
*                              *
* DIRTY MACRO TO ADD TWO BYTES *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ADDEND 1               *
*  ]2 = ADDEND 2               *
*                              *
* CYCLES: 21                   *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ADD8     MAC
         LDA   #1         ; {3C2B}
         STA   RETLEN     ; {4C3B}
         LDA   ]1         ; {4C3B}
         CLC              ; {2C1B}
         ADC   ]2         ; {4C3B}
         STA   RETURN     ; {4C3B}
         <<<
*
*``````````````````````````````*
* SUB8          (NATHAN RIGGS) *
*                              *
* MACRO TO SUBTRACT TWO BYTES  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MINUEND                *
*  ]2 = SUBTRAHEND             *
*                              *
* CYCLES: 21                   *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SUB8     MAC
         LDA   #1         ; {3C2B}
         STA   RETLEN     ; {4C3B}
         LDA   ]1         ; {4C3B}
         SEC              ; {2C1B}
         SBC   ]2         ; {4C3B}
         STA   RETURN     ; {4C3B}
         <<<
*
*``````````````````````````````*
* MUL8          (NATHAN RIGGS) *
*                              *
* MULTIPLIES TWO 8BIT VALUES   *
* AND RETURNS A 16BIT RESULT   *
* IN .A,.X (LOW, HIGH).        *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MULTIPLICAND           *
*  ]2 = MULTIPLIER             *
*                              *
* CYCLES: 97+                  *
* BYTES: 56 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MUL8     MAC
         LDA   ]1         ; {4C3B}
         LDX   ]2         ; {4C3B}
         JSR   MULTU8     ; {89C50B}
         <<<
*
*``````````````````````````````*
* DIV8          (NATHAN RIGGS) *
*                              *
* DIVIDES ONE 8BIT NUMBER BY   *
* ANOTHER AND STORES THE       *
* QUOTIENT IN .A WITH THE      *
* REMAINDER IN .X.             *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = DIVIDEND               *
*  ]2 = DIVISOR                *
*                              *
* CYCLES: 75+                  *
* SIZE: 43 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIV8     MAC
         LDA   ]1         ; {4C3B}
         LDX   ]2         ; {4C3B}
         JSR   DIVDU8     ; {67C37B}
         <<<
*
