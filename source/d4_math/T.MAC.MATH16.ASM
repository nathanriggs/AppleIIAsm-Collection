*
*``````````````````````````````*
* MAC.MATH16.ASM               *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.ADDIT16                  *
* SUB.COMP16                   *
* SUB.DIVDU16                  *
* SUB.MULTU16                  *
* SUB.SUBT16                   *
*                              *
* LIST OF MACROS               *
*                              *
* ADD16 : ADD 16BIT NUMBERS    *
* SUB16 : SUBTRACT 16BIT NUMS  *
* MUL16 : MULTIPLY 16BIT NUMS  *
* DIV16 : DIVIDE 16BIT NUMS    *
* CMP16 : COMPARE 16BIT NUMS   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* ADD16         (NATHAN RIGGS) *
*                              *
* ADD TWO 16BIT VALUES, STORE  *
* RESULT IN .A, .X (LOW, HIGH) *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ADDEND 1               *
*  ]2 = ADDEND 2               *
*                              *
* CYCLES: 78+                  *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ADD16    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         _MLIT ]2;ZPW2    ; {16C12B}
         JSR   ADDIT16    ; {46C27B}
         <<<
*
*``````````````````````````````*
* SUB16         (NATHAN RIGGS) *
*                              *
* SUBTRACTS ONE 16BIT INTEGER  *
* FROM ANOTHER, STORING THE    *
* RESULT IN .A, .X (LOW, HIGH) *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MINUEND                *
*  ]2 = SUBTRAHEND             *
*                              *
* CYCLES: 79+                  *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SUB16    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         _MLIT ]2;ZPW2    ; {16C12B}
         JSR   SUBT16     ; {47C27B}
         <<<
*
*``````````````````````````````*
* MUL16         (NATHAN RIGGS) *
*                              *
* MULTIPLIES TWO 16BIT NUMBERS *
* AND RETURNS THE PRODUCT IN   *
*.A, .X (LOW, HIGH).           *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MULTIPLICAND           *
*  ]2 = MULTIPLIER             *
*                              *
* CYCLES: 144+                 *
* SIZE: 91 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MUL16    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         _MLIT ]2;ZPW2    ; {16C12B}
         JSR   MULTU16    ; {112C67B}
         <<<
*
*``````````````````````````````*
* DIV16         (NATHAN RIGGS) *
*                              *
* DIVIDES ONE 16BIT NUMBER BY  *
* ANOTHER AND RETURNS THE      *
* RESULT IN .A, .X (LOW,HIGH). *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = DIVIDEND               *
*  ]2 = DIVISOR                *
*                              *
* CYCLES: 133+                 *
* SIZE: 81 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIV16    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         _MLIT ]2;ZPW2    ; {16C12B}
         JSR   DIVDU16    ; {101C57B} UNSIGNED
         FIN
         <<<
*
*``````````````````````````````*
* CMP16         (NATHAN RIGGS) *
*                              *
* COMPARES TWO 16BIT VALUES    *
* AND ALTERS THE P-REGISTER    *
* ACCORDINGLY (FLAGS).         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = WORD 1 TO COMPARE      *
*  ]2 = WORD 2 TO COMPARE      *
*                              *
* CYCLES: 100+                 *
* SIZE: 53 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CMP16    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         _MLIT ]2;ZPW2    ; {16C12B}
         JSR   COMP16     ; {59C29B}
         <<<
