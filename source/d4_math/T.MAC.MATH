*
*``````````````````````````````*
* MAC.MATH                     *
*                              *
* THIS FILE CONTAINS ALL OF    *
* THE INTEGER MATH MACROS.     *
* GIVEN THAT THERE HAVE BEEN   *
* 50 YEARS OF OPTIMIZATIONS    *
* FOR 6502 MATH SUBROUTINES,   *
* I WON'T BE REINVENTING THE   *
* WHEEL TOO MUCH HERE. CREDIT  *
* FOR INSPIRATION (OR JUST     *
* PLAIN COPYING) IS GIVEN IN   *
* THE SUBROUTINE FILES.        *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      15-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.ADDIT16                  *
* SUB.COMP16                   *
* SUB.DIVD16                   *
* SUB.DIVD8                    *
* SUB.MULT16                   *
* SUB.MULT8                    *
* SUB.RAND16                   *
* SUB.RAND8                    *
* SUB.RANDB                    *
* SUB.SUBT16                   *
*                              *
* LIST OF MACROS               *
*                              *
* ADD8  : ADD 8BIT NUMBERS     *
* SUB8  : SUBTRACT 8BIT NUMS   *
* ADD16 : ADD 16BIT NUMBERS    *
* SUB16 : SUBTRACT 16BIT NUMS  *
* MUL16 : MULTIPLY 16BIT NUMS  *
* DIV16 : DIVIDE 16BIT NUMS    *
* RNDB  : GET RANDOM BETWEEN   *
* CMP16 : COMPARE 16BIT NUMS   *
* MUL8  : MULTIPLY 8BIT NUMS   *
* DIV8  : DIVIDE 8BIT NUMS     *
* RND16 : RANDOM WORD          *
* RND8  : RANDOM BYTE          *
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
* SAMPLE USAGE                 *
*                              *
*  ADD8 #3;#4                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ADD8     MAC
         LDA   #1
         STA   RETLEN
         LDA   ]1
         CLC
         ADC   ]2
         STA   RETURN
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
* SAMPLE USAGE                 *
*                              *
*  SUB8 #4;#3                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SUB8     MAC
         LDA   #1
         STA   RETLEN
         LDA   ]1
         SEC
         SBC   ]2
         STA   RETURN
         <<<
*
*``````````````````````````````*
* ADD16         (NATHAN RIGGS) *
*                              *
* ADD TWO 16BIT VALUES, STORE  *
* RESULT IN Y, X (LOW, HIGH)   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ADDEND 1               *
*  ]2 = ADDEND 2               *
*                              *
* SAMPLE USAGE                 *
*                              *
*  ADD16 #3000;#4000           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ADD16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   ADDIT16
         <<<
*
*``````````````````````````````*
* SUB16         (NATHAN RIGGS) *
*                              *
* SUBTRACTS ONE 16BIT INTEGER  *
* FROM ANOTHER, STORING THE    *
* RESULT IN Y,X (LOW, HIGH)    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MINUEND                *
*  ]2 = SUBTRAHEND             *
*                              *
* SAMPLE USAGE                 *
*                              *
*  SUB16 #2000;#1500           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SUB16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   SUBT16
         <<<
*
*``````````````````````````````*
* MUL16         (NATHAN RIGGS) *
*                              *
* MULTIPLIES TWO 16BIT NUMBERS *
* AND RETURNS THE PRODUCT IN   *
* Y,X (LOW, HIGH).             *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MULTIPLICAND           *
*  ]2 = MULTIPLIER             *
*                              *
* SAMPLE USAGE                 *
*                              *
*  MUL16 #400;#500             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MUL16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   MULT16
         <<<
*
*``````````````````````````````*
* DIV16         (NATHAN RIGGS) *
*                              *
* DIVIDES ONE 16BIT NUMBER BY  *
* ANOTHER AND RETURNS THE      *
* RESULT IN Y,X (LOW,HIGH).    *
*                              *
* IF THE THIRD PARAMETER IS    *
* PASSED WITH A S, VALUES WILL *
* BE TREATED AS SIGNED; IF     *
* NOT, VALUES WILL BE TREATED  *
* AS UNSIGNED.                 *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = DIVIDEND               *
*  ]2 = DIVISOR                *
*                              *
* SAMPLE USAGE                 *
*                              *
*  DIV16 #3000;#300            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIV16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   DIVD16     ; UNSIGNED
         FIN
         <<<
*
*``````````````````````````````*
* RAND          (NATHAN RIGGS) *
*                              *
* RETURNS A RANDOM NUMBER IN   *
* REGISTER A THAT IS BETWEEN   *
* THE LOW AND HIGH BOUNDARIES  *
* PASSED IN THE PARAMETERS.    *
*                              *
* NOTE THAT THIS RETURNS A     *
* BYTE, AND THUS ONLY DEALS    *
* WITH VALUES BETWEEN 0..255.  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = LOW BOUNDARY           *
*  ]2 = HIGH BOUNDARY          *
*                              *
* SAMPLE USAGE                 *
*                              *
*  RNDB #50;#100               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RAND     MAC
         LDA   ]1         ; LOW
         LDX   ]2         ; HIGH
         JSR   RANDB
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
* SAMPLE USAGE                 *
*                              *
*  CMP16 #1023;#3021           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CMP16    MAC
         _MLIT ]1;WPAR1
         _MLIT ]2;WPAR2
         JSR   COMP16
         <<<
*
*``````````````````````````````*
* MUL8          (NATHAN RIGGS) *
*                              *
* MULTIPLIES TWO 8BIT VALUES   *
* AND RETURNS A 16BIT RESULT   *
* IN Y,X (LOW, HIGH).          *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MULTIPLICAND           *
*  ]2 = MULTIPLIER             *
*                              *
* SAMPLE USAGE                 *
*                              *
*  MUL8 #10;#20                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MUL8     MAC
         LDA   ]1
         LDX   ]2
         JSR   MULT8
         <<<
*
*``````````````````````````````*
* DIV8          (NATHAN RIGGS) *
*                              *
* DIVIDES ONE 8BIT NUMBER BY   *
* ANOTHER AND STORES THE       *
* QUOTIENT IN A WITH THE       *
* REMAINDER IN X.              *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = DIVIDEND               *
*  ]2 = DIVISOR                *
*                              *
* SAMPLE USAGE                 *
*                              *
*  DIV8 #100;#10               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIV8     MAC
         LDA   ]1
         LDX   ]2
         JSR   DIVD8
         <<<
*
*``````````````````````````````*
* RND16         (NATHAN RIGGS) *
*                              *
* RETURN A 16-BIT PSEUDORANDOM *
* NUMBER.                      *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* SAMPLE USAGE                 *
*                              *
*  RND16                       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RND16    MAC
         JSR   RAND16
         <<<
*
*``````````````````````````````*
* RND8          (NATHAN RIGGS) *
*                              *
* RETURN AN 8-BIT PSEUDORANDOM *
* NUMBER.                      *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* SAMPLE USAGE                 *
*                              *
*  RND8                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RND8     MAC
         JSR   RAND8
         <<<
*
