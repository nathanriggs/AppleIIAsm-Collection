*``````````````````````````````*
* MAC.REQUIRED                 *
*                              *
* MACROS USED FOR CORE UTILS   *
* AND LIBRARY ROUTINES. NOTE   *
* THAT NO OTHER LIBRARY WILL   *
* WORK PROPERLY WITHOUT SOME   *
* EXTREME ALTERATIONS WITHOUT  *
* THE INCULSION OF THIS MACRO  *
* FILE AND SUBROUTINES.        *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES NEEDED      *
*                              *
*  LIB.REQUIRED.ASM            *
*                              *
* MACROS INCLUDED:             *
*                              *
* _AXLIT : IS LITERAL? (REGS)  *
* _AXSTR : IS STRING? (REGS)   *
* _ISLIT : IS LITERAL? (STACK) *
* _ISSTR : IS STRING? (STACK)  *
* _MLIT  : IS LITERAL? (ZERO)  *
* _MSTR  : IS STRING? (ZERO)   *
* _PRN   : PRINT STRING        *
* _WAIT  : GET KEYPRESS        *
* BEEP   : BEEP FOR SOME TIME  *
* BCCL   : LONG ADDR BCC       *
* BCSL   : LONG ADDR BCS       *
* BEQL   : LONG ADDR BEQ       *
* BMIL   : LONG ADDR BMI       *
* BNEL   : LONG ADDR BNE       *
* BPLL   : LONG ADDR BPL       *
* BVCL   : LONG ADDR BVC       *
* BVSL   : LONG ADDR BVS       *
* CLRHI  : CLEAR HIGH BYTE     *
* DUMP   : DUMP MEMORY         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* _AXLIT                       *
*                              *
* CHECKS IF PARAMETER IS A     *
* LITERAL OR NOT, AND SETS THE *
* LOW AND HIGH IN .A AND .X.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*                              *
* CYCLES: 8, EITHER WAY        *
* BYTES: 6, EITHER WAY         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_AXLIT   MAC
         IF    #=]1       ;        IF ]1 IS A LITERAL
         LDX   ]1/$100    ; {4C3B} GET HIGH {NZ}
         LDA   ]1         ; {4C3B} GET LOW {NZ}
         ELSE             ;        OTHERWISE, ]1 IS AN ADDR
         LDX   ]1+1       ; {4C3B} SO GET HIGH VALUE {NZ}
         LDA   ]1         ; {4C3B} THEN LOW VALUE {NZ}
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _AXSTR                       *
*                              *
* CHECKS IF PARAMETER IS A     *
* STRING, AND IF SO PROVIDES   *
* AN ADDRESS FOR IT. IF NOT,   *
* CHECK IF IT'S A LITERAL, AND *
* STORE THE HI A LO BYTES IN   *
* .A AND .X.                   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*       OR STRING              *
*                              *
* CYCLES: 11                   *
* BYTES: 9 + STRING BYTES      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_AXSTR   MAC
         IF    "=]1 ;       .......IF ]1 IS A STRING
         JMP   __STRCNT2  ; {3C3B} SKIP STRING DEC
]STRTMP  STR   ]1         ; {0C1B+} STR DECLARATION
__STRCNT2                 ;        SKIP TO HERE
         LDX   #>]STRTMP  ; {4C3B} GET HIBYTE OF STRING {NZ}
         LDA   #<]STRTMP  ; {4C3B} GET LO BYTE {NZ}
         ELSE             ;        OTHERWISE, ]1 IS ADDRESS
         _AXLIT ]1        ; {8C6B} TEST OF LITERAL OR NOT
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _ISLIT                       *
*                              *
* CHECKS IF THE PARAMETER IS   *
* A LITERAL OR NOT, THEN       *
* PUSHES THE LO AND HI AS      *
* NEEDED.                      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*                              *
* CYCLES: 14                   *
* BYTES:  8                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_ISLIT   MAC
         IF    #=]1       ;        IF ]1 IS A LITERAL
         LDA   ]1/$100    ; {4C3B} GET HIGH BYTE {NZ}
         PHA              ; {3C1B} PUSH .A TO STACK
         LDA   ]1         ; {4C3B} GET LOW BYTE {NZ}
         PHA              ; {3C1B} PUSH .A TO STACK
         ELSE             ;        OTHERWISE, ]1 IS ADDRESS
         LDA   ]1+1       ; {4C3B} SO GET HIGH NIBBLE {NZ}
         PHA              ; {3C1B} PUSH .A TO STACK
         LDA   ]1         ; {4C3B} THEN GET LOW NIBBLE {NZ}
         PHA              ; {3C1B} AND PUSH TO STACK
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _ISSTR                       *
*                              *
* CHECKS IF PARAMETER IS A     *
* STRING, AND IF SO PROVIDE IT *
* WITH AN ADDRESS. IF NOT,     *
* CHECK IF IT'S A LITERAL AND  *
* PASS ACCORDINGLY.            *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*       OR STRING              *
*                              *
* CYCLES: 13 -OR- 8            *
* BYTES: 10+ -OR- 6            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_ISSTR   MAC
         IF    "=]1 ;............. IF ]1 IS A STRING
         JMP   __STRCONT  ; {3C3B} SKIP STRING DEC
]STRTMP  STR   ]1         ; {0C1+B} DECLARE STRING
__STRCONT
         LDA   #>]STRTMP  ; {2C2B} GET HI VAL {NZ}
         PHA              ; {3C1B} PUSH .A TO STACK
         LDA   #<]STRTMP  ; {2C2B} GET LO 2C,2B {NZ}
         PHA              ; {3C1B} PUSH .A TO STACK
         ELSE             ;        OTHERIWSE ]1 IS AN ADDRESS
         _ISLIT ]1        ; {8C6B} CHECK IF LITERAL
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _MLIT                        *
*                              *
* CHECKS IF PARAMETER IS A     *
* LITERAL OR NOT, AND SETS THE *
* LO AND HI IN THE SPECIFIED   *
* MEMORY ADDRESS.              *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*  ]2 = ZERO PAGE ADDRESS (2B) *
*                              *
* CYCLES: 16                   *
* BYTES:  12 (EITHER WAY)      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_MLIT    MAC
         IF    #=]1       ; .......IF ]1 IS A LITERAL
         LDA   ]1/$100    ; {4C3B} GET HI NIBBLE {NZ}
         STA   ]2+1       ; {4C3B} STORE IN ZP
         LDA   ]1         ; {4C3B} THEN GET LO {NZ}
         STA   ]2         ; {4C3B} STORE IN ZP
         ELSE             ;        OTHERIWSE ]1 IS ADDRESS
         LDA   ]1+1       ; {4C3B} SO GET HIGH NIB {NZ}
         STA   ]2+1       ; {4C3B} AND STORE IN ZP
         LDA   ]1         ; {4C3B} THEN GET LOW NIB {NZ}
         STA   ]2         ; {4C4B} AND STORE IN ZP
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _MSTR                        *
*                              *
* CHECKS IF PARAMETER IS A     *
* STRING, AND IF SO PROVIDE IT *
* WITH AN ADDRESS. IF NOT,     *
* CHECK IF IT'S A LITERAL AND  *
* PASS ACCORDINGLY.            *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*       OR STRING              *
*  ]2 = ZERO PAGE ADDRESS (2B) *
*                              *
* CYCLES: 15 -OR- 8            *
* BYTES: 14 +STRING BYTES OR 6 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_MSTR    MAC
         IF    "=]1 ;............. IF ]1 IS A STRING
         JMP   __STRCONT  ; {3C3B} SKIP STRING DEC
]STRTMP  STR   ]1         ; {OC1+B} DECLARE STRING
__STRCONT                 ;         CONTINUE
         LDA   #>]STRTMP  ; {2C2B} GET HI NIB OF ADDR {NZ}
         STA   ]2+1       ; {4C3B} STORE IN ZP
         LDA   #<]STRTMP  ; {2C2B} GET LOW NIB {NZ}
         STA   ]2         ; {4C3B} SPRE ON ZP
         ELSE             ;        OTHERWISE ]1 IS ADDRESS
         _MLIT ]1;]2      ; {8C6B} CHECK IF LITERAL
         FIN              ;        END IF
         <<<
*
*``````````````````````````````*
* _PRN                         *
*                              *
* PRINT A STRING OR ADDRESS.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*       OR STRING              *
*                              *
* CYCLES: 161+                 *
* BYTES: 9+                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_PRN     MAC
         JSR   __P        ; {161C3B} PRINT THE STRING {NZCV}
         ASC   ]1         ; {0C1B+}  HOLD STRING HERE
         HEX   00         ; {0C1B}   KILL STRING PRINT
         <<<
*
*``````````````````````````````*
* _WAIT                        *
*                              *
* WAIT FOR A KEYPRESS.         *
*                              *
* NO PARAMETERS                *
*                              *
* CYCLES: 14+                  *
* BYTES : 10                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_WAIT    MAC
]LP      LDA   ]KYBD      ; {4C3B} CHECK FOR KEYPRESS {NZ}
         BPL   ]LP        ; {4C2B} IF NOT, KEEP LOOPING
         AND   #$7F       ; {2C2B} SET HIGH BIT {NZ}
         STA   ]STROBE    ; {4C3B} RESET KYBD STROBE
         <<<
*
*``````````````````````````````*
* BEEP                         *
*                              *
* RING THE STANDARD BELL.      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER OF RINGS        *
*                              *
* CYCLES: 102+                 *
* BYTES: 11                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BEEP     MAC
         LDX   ]1         ; {4C3B} LOAD BEEP LENGTH {NZ}
]LP1
         JSR   BELL       ; {90C3B} JSR TO BELL ROUTINE
         DEX              ; {2C1B}  DECREASE .X COUNTER {NZ}
         CPX   #0         ; {2C2B}  CMP .X TO ZERO {NZC}
         BNE   ]LP1       ; {4C2B}  IF !=, LOOP
         <<<
*
*``````````````````````````````*
* CLRHI                        *
*                              *
* CLEAR THE HIGH NIBBLE OF A   *
* BYTE IN .A REGISTER          *
*                              *
* CYCLES: 10                   *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CLRHI    MAC
*
         AND   #$F0       ; {2C2B} CLEAR 4 RIGHT BITS {NZ}
         LSR              ; {2C1B} MOVE BITS RIGHT {ZC,N=0}
         LSR              ; {2C1B} MOVE BITS RIGHT {ZC,N=0}
         LSR              ; {2C1B} MOVE BITS RIGHT {ZC,N=0}
         LSR              ; {2C1B} MOVE BITS RIGHT {ZC,N=0}
         <<<
*
*``````````````````````````````*
* DUMP                         *
*                              *
* DUMP THE HEX AT A GIVEN      *
* ADDRESS.                     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS (2B)    *
*  ]2 = LENGTH IN BYTES (1B)   *
*                              *
* CYCLES: 806+                 *
* BYTES: 12                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DUMP     MAC
         _AXLIT ]1        ; {8C6B}   CHECK LITERAL
         LDY   ]2         ; {4C3B}   LOAD .Y WITH LENGTH {NZ}
         JSR   __DUMP     ; {794C3B} DUMP CONTENTS
         <<<
*
*``````````````````````````````*
* GBIT                         *
*                              *
* GET BIT FROM REG / ADDR BYTE *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = BYTE TO GET BIT (1B)   *
*                              *
* CYCLES: 15                   *
* BYTES : 17                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GBIT     MAC
         LDA   ]1         ; {3B4C} BYTE TO CHECK {NZ}
         AND   ]2         ; {3B4C} MASK BIT # REQUESTED VIA HOOK {NZ}
         BEQ   ]ZERO      ; {2B2C} IF IT'S A MATCH, THEN 0
         LDA   #1         ; {2B2C} OTHERWISE, BIT IS 1 {NZ}
         JMP   ]EXIT      ; {3B3C} GOTO EXIT
]ZERO    LDA   #0         ; {2B2C} BIT IS 0 {NZ}
]EXIT    <<<
*
*``````````````````````````````*
* NEGA                         *
*                              *
* GET THE NEGATIVE EQUIVALENT  *
* OF A BYTE IN .A REGISTER.    *
*                              *
* CYCLES: 7                    *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
NEGA     MAC
         EOR   #$FF       ; {2C2B}
         CLC              ; {2C1B}
         ADC   #1         ; {3C2B}
         <<<
*
