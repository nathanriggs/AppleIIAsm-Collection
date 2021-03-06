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
* DATE:      29-NOV-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES NEEDED      *
*                              *
*  LIB.REQUIRED                *
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
* BCCL   : LONG ADDR BCC       *
* BCSL   : LONG ADDR BCS       *
* BEEP   : BEEP FOR SOME TIME  *
* BEQL   : LONG ADDR BEQ       *
* BMIL   : LONG ADDR BMI       *
* BNEL   : LONG ADDR BNE       *
* BPLL   : LONG ADDR BPL       *
* BVCL   : LONG ADDR BVC       *
* BVSL   : LONG ADDR BVS       *
* CBRA   : BRANCH ALWAYS 65C02 *
* CPHX   : FAKE 65C02 PUSH X   *
* CPHY   : FAKE 65C02 PUSH Y   *
* CPLX   : FAKE 65C02 PULL X   *
* CPLY   : FAKE 65C02 PULL Y   *
* CSTZ   : FAKE 65C02 STORE Z  *
* CTXY   : TRANSFER .X TO .Y   *
* CTYX   : TRANSFER .Y TO .X   *
* CLRHI  : CLEAR HIGH BYTE     *
* DELAY  : DELAY SET MLSECONDS *
* DUMP   : DUMP MEMORY         *
* ERRH   : SET ERROR ROUTINE   *
* GBIT   : GET BIT FROM BYTE   *
* GRET   : GET RETURN          *
* MFILL  : FILL MEMORY BLOCK   *
* MOV    : MOVE SRC TO DEST    *
* MOVB   : MOVE MEMORY BLOCK   *
* MSWAP  : SWAP MEMORY BLOCKS  *
* PEEK   : LOAD .A FROM ADDR   *
* POKE   : STORE ADDR VAL IN A *
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
*  ]1 = MEMORY ADDRESS BYTE    *
*                              *
* CYCLES: 8, EITHER WAY        *
* BYTES: 6, EITHER WAY         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_AXLIT   MAC              ; CHECK IF LITERAL
         IF    #=]1       ; IF ]1 IS A LITERAL
         LDX   ]1/$100    ; ++<4C3B> GET HIGH
         LDA   ]1         ; ++<4C3B> GET LOW
         ELSE             ; OTHERWISE, ]1 IS AN ADDR
         LDX   ]1+1       ; ++<4C3B> SO GET HIGH VALUE
         LDA   ]1         ; ++<4C3B> THEN LOW VALUE
         FIN              ; END IF
         <<<              ; END MACRO
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
*  ]1 = MEMORY ADDRESS BYTE    *
*       OR STRING              *
*                              *
* CYCLES: 11                   *
* BYTES: 9 + STRING BYTES      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_AXSTR   MAC              ; CHECK IF STRING
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCNT2  ; ++<3C3B> SKIP STRING DEC
]STRTMP  STR   ]1         ; ++<0C1B+> STR DECLARATION
__STRCNT2                 ; SKIP TO HERE
         LDX   #>]STRTMP  ; ++<4C3B> GET HIBYTE OF STRING
         LDA   #<]STRTMP  ; ++<4C3B> GET LO BYTE
         ELSE             ; OTHERWISE, ]1 IS ADDRESS
         _AXLIT ]1        ; ++<(8C6B)> TEST OF LITERAL OR NOT
         FIN              ; END IF
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
*  ]1 = MEMORY ADDRESS BYTE    *
*                              *
* CYCLES: 14                   *
* BYTES:  8                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_ISLIT   MAC              ; CHECK IF LITERAL
         IF    #=]1       ; IF ]1 IS A LITERAL
         LDA   ]1/$100    ; ++<4C3B> GET HIGH BYTE
         PHA              ; ++<3C1B> PUSH .A TO STACK
         LDA   ]1         ; ++<4C3B> GET LOW BYTE
         PHA              ; ++<3C1B> PUSH .A TO STACK
         ELSE             ; OTHERWISE, ]1 IS ADDRESS
         LDA   ]1+1       ; ++<4C3B> SO GET HIGH NIBBLE
         PHA              ; ++<3C1B> PUSH .A TO STACK
         LDA   ]1         ; ++<4C3B> THEN GET LOW NIBBLE
         PHA              ; ++<3C1B> AND PUSH TO STACK
         FIN              ; END IF
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
*  ]1 = MEMORY ADDRESS BYTE    *
*       OR STRING              *
*                              *
* CYCLES: 13 -OR- 8            *
* BYTES: 10+ -OR- 6            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_ISSTR   MAC              ; CHECK IF STRING
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCONT  ; ++<3C3B> KIP STRING DEC
]STRTMP  STR   ]1         ; ++<0C1+B> DECLARE STRING
__STRCONT
         LDA   #>]STRTMP  ; ++<2C2B> GET HI VAL
         PHA              ; ++<3C1B> PUSH .A TO STACK
         LDA   #<]STRTMP  ; ++<2C2B> GET LO 2C,2B
         PHA              ; ++<3C1B> PUSH .A TO STACK
         ELSE             ; OTHERIWSE ]1 IS AN ADDRESS
         _ISLIT ]1        ; ++<[8C6B]> CHECK IF LITERAL
         FIN              ; END IF
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
*  ]1 = MEMORY ADDRESS BYTE    *
*  ]2 = ZERO PAGE ADDRESS      *
*                              *
* CYCLES: 16                   *
* BYTES:  12 (EITHER WAY)      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_MLIT    MAC              ; CHECK IF LITERAL
         IF    #=]1       ; IF ]1 IS A LITERAL
         LDA   ]1/$100    ; ++<4C3B> GET HI NIBBLE
         STA   ]2+1       ; ++<4C3B> STORE IN ZP
         LDA   ]1         ; ++<4C3B> THEN GET LO
         STA   ]2         ; ++<4C3B> STORE IN ZP
         ELSE             ; OTHERIWSE ]1 IS ADDRESS
         LDA   ]1+1       ; ++<4C3B> SO GET HIGH NIB
         STA   ]2+1       ; ++<4C3B> AND STORE IN ZP
         LDA   ]1         ; ++<4C3B> THEN GET LOW NIB
         STA   ]2         ; ++<4C4B> AND STORE IN ZP
         FIN              ; END IF
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
*  ]1 = MEMORY ADDRESS BYTE    *
*       OR STRING              *
*  ]2 = ZERO PAGE ADDRESS      *
*                              *
* CYCLES: 15 -OR- 8            *
* BYTES: 14 +STRING BYTES OR 6 *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_MSTR    MAC              ; CHECK IF STRING
         IF    "=]1 ;...... IF ]1 IS A STRING
         JMP   __STRCONT  ; ++<3C3B> SKIP STRING DEC
]STRTMP  STR   ]1         ; ++<OC1+B> DECLARE STRING
__STRCONT                 ; CONTINUE
         LDA   #>]STRTMP  ; ++<2C2B> GET HI NIB OF ADDR
         STA   ]2+1       ; ++<4C3B> STORE IN ZP
         LDA   #<]STRTMP  ; ++<2C2B> GET LOW NIB
         STA   ]2         ; ++<4C3B> SPRE ON ZP
         ELSE             ; OTHERWISE ]1 IS ADDRESS
         _ISLIT ]1        ; ++<[8C6B]> CHECK IF LITERAL
         FIN              ; END IF
         <<<              ; END MACRO
*
*``````````````````````````````*
* _PRN                         *
*                              *
* PRINT A STRING OR ADDRESS.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS BYTE    *
*       OR STRING              *
*                              *
* CYCLES: 161+                 *
* BYTES: 9+                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
_PRN     MAC              ; PRINT STRING
         STY   SCRATCH    ; ++<3C2B> PRESERVE .Y
         JSR   __P        ; ++<6C3B[155C+]> PRINT THE STRING
         ASC   ]1         ; ++<0C1B+> HOLD STRING HERE
         HEX   00         ; ++<0C1B> KILL STRING PRINT
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
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
_WAIT    MAC              ; WAIT FOR KEYPRESS
]LP      LDA   ]KYBD      ; ++<4C3B> CHECK FOR KEYPRESS
         BPL   ]LP        ; ++<4C2B> IF NOT, KEEP LOOPING
         AND   #$7F       ; ++<2C2B> SET HIGH BIT
         STA   ]STROBE    ; ++<4C3B> RESET KYBD STROBE
         <<<              ; END MACRO
*
*``````````````````````````````*
* BCCL                         *
*                              *
* BCC TO A FAR AWAY ADDRESS    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ADDR TO BRANCH TO      *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BCCL     MAC              ; LONG BCC
         BCC   ]TOBCC     ; ++<4C2B> IF CARRY CLEAR, BRANCH
]NOBCC   JMP   ]EXIT      ; ++<3C3B> OTHER, RETURN
]TOBCC   JMP   ]1         ; ++<3C3B> JMP TO BCC BRANCH LOC
]EXIT                     ; CARRY WASN'T CLEAR
         <<<              ; END MACRO
*
*``````````````````````````````*
* BCSL                         *
*                              *
* BCS TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BCSL     MAC              ; LONG LCS
         BCS   ]TOBCS     ; ++<4C2B> IF CARRY SET, THEN BRANCH
]NOBCS   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, DON'T BRANCH
]TOBCS   JMP   ]1         ; ++<3C3B> JMP TO BRANCH
]EXIT                     ; EXIT LABEL
         <<<              ; END MACRO
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
* CYCLES: 108+                 *
* BYTES: 15                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BEEP     MAC              ; ROUTINE BEEP
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y REGISTER
         LDX   ]1         ; ++<4C3B> LOAD BEEP LENGTH
]LP1
         JSR   BELL       ; ++<6C3B[84C]> JSR TO BELL ROUTINE
         DEX              ; ++<2C1B> DECREASE .X COUNTER
         CPX   #0         ; ++<2C2B> CMP .X TO ZERO
         BNE   ]LP1       ; ++<4C2B> IF !=, LOP
         LDY   SCRATCH    ; ++<3C2B> OTHERWISE, RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* BEQL                         *
*                              *
* BEQ TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BEQL     MAC              ; LONG BEQ
         BEQ   ]TOBEQ     ; ++<4C2B> IF CMP EQUAL OR 0, BRANCH
]NOBEQ   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBEQ   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH
]EXIT                     ; EXIT LABEL
         <<<              ; END MACRO
*
*``````````````````````````````*
* BNEL                         *
*                              *
* BNE TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BNEL     MAC              ; LONG BNE
         BNE   ]TOBNE     ; ++<4C2B> IF CMP != OR !=0, BRANCH
]NOBNE   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBNE   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH ADDR
]EXIT                     ; QUITTING LABEL
         <<<              ; END MACRO
*
*``````````````````````````````*
* BMIL                         *
*                              *
* BMI TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BMIL     MAC              ; LONG BMI
         BMI   ]TOBMI     ; ++<4C2B> IF NEGATIVE SET, BRANCH
]NOBMI   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBMI   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH ADDRESS
]EXIT                     ; QUIT LABEL
         <<<              ; END MACRO
*
*``````````````````````````````*
* BPLL                         *
*                              *
* BPL TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BPLL     MAC              ; LONG BPL
         BPL   ]TOBPL     ; ++<4C2B> IF NOT NEGATIVE, BRANCH
]NOBPL   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBPL   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH ADDRESS
]EXIT                     ; QUIT
         <<<              ; END MACRO
*
*
*``````````````````````````````*
* BVCL                         *
*                              *
* BVC TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BVCL     MAC              ; LONG BVC
         BVC   ]TOBVC     ; ++<4C2B> IF OVERFLOW CLEAR, BRANCH
]NOBVC   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBVC   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH ADDRESS
]EXIT                     ; QUIT
         <<<              ; END MACRO
*
*``````````````````````````````*
* BVSL                         *
*                              *
* BVS TO A FAR AWAY ADDRESS    *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
BVSL     MAC              ; LONG BVS
         BVS   ]TOBVS     ; ++<4C2B> OF OVERFLOW SET, BRANCH
]NOBVS   JMP   ]EXIT      ; ++<3C3B> OTHERWISE, SKIP BRANCH
]TOBVS   JMP   ]1         ; ++<3C3B> JUMP TO BRANCH ADDRESS
]EXIT                     ; QUIT
         <<<              ; END MACRO
*
*``````````````````````````````*
* CBRA                         *
*                              *
* 65C02 BRA FAKE INSTRUCTION   *
*                              *
* CYCLES: 7                    *
* BYTES: 8                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CBRA     MAC              ; BRANCH ALWAYS
         JMP   ]1
         <<<
*
*``````````````````````````````*
* CPHX                         *
*                              *
* FAKE 65C02 PUSH .X TO STACK  *
*                              *
* CYCLES: 11                   *
* BYTES: 6                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPHX     MAC              ; PUSH .X TO STACK
         STA   SCRATCH    ; ++<3C2B> BACKUP .A CONTENTS
         TXA              ; ++<2C1B> TRANSFER .X TO .A
         PHA              ; ++<3C1B> PUSH .A
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A CONTENTS
         <<<              ; END MACRO
*
*``````````````````````````````*
* CPHY                         *
*                              *
* FAKE 65C02 PUSH .Y TO STACK  *
*                              *
* CYCLES: 12                   *
* BYTES: 6                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPHY     MAC              ; PUSH .Y TO STACK
         STA   SCRATCH    ; ++<3C2B> BACKUP .A
         TYA              ; ++<2C1B> TRANSFER .Y TO .A
         PHA              ; ++<3C1B> PUSH .A TO STACK
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A CONTENTS
         <<<              ; END MACRO
*
*``````````````````````````````*
* CPLX                         *
*                              *
* FAKE 65C02 PULL .X TO STACK  *
*                              *
* CYCLES: 11                   *
* BYTES: 6                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPLX     MAC              ; PULL FROM STACT TO .X
         STA   SCRATCH    ; ++<3C2B> BACKUP .A
         PLA              ; ++<3C1B> PULL FROM STACK INTO .A
         TAX              ; ++<2C1B> TRANSFER .A TO .X
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A CONTENTS
         <<<              ; END MACRO
*
*``````````````````````````````*
* CPLY                         *
*                              *
* FAKE 65C02 PULL .Y FROM STAK *
*                              *
* CYCLES: 11                   *
* BYTES: 7                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CPLY     MAC              ; PULL FROM STACK INTO .Y
         STA   SCRATCH    ; ++<3C2B> BACKUP .A
         PLA              ; ++<3C1B> PULL FROM STACK TO .A
         TAY              ; ++<2C2B> TRANSFER A TO .Y
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A
         <<<              ; END MACRO
*
*``````````````````````````````*
* CTXY                         *
*                              *
* TRANSFER X TO Y (FAKE 65C02) *
*                              *
* CYCLES: 10                   *
* BYTES: 6                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CTXY     MAC              ; TRANSFER X TO Y
         STA   SCRATCH    ; ++<3C2B> BACKUP .A
         TXA              ; ++<2C1B> TRANSFER .X TO .A
         TAY              ; ++<2C1B> TRNSFER .A TO .Y
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A
         <<<              ; END MACRO
*
*``````````````````````````````*
* CTYX                         *
*                              *
* TRANSFER Y TO X (FAKE 65C02) *
*                              *
* CYCLES: 10                   *
* BYTE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CTYX     MAC              ; TRANSFER .Y TO .X
         STA   SCRATCH    ; ++<3C2B> BACKUP .A
         TYA              ; ++<2C1B> TRANSFER .Y TO .A
         TAX              ; ++<2C1B> TRANSFER .A TO .X
         LDA   SCRATCH    ; ++<3C2B> RESTORE .A
         <<<              ; END MACRO
*
*``````````````````````````````*
* CLRHI                        *
*                              *
* CLEAR THE HIGH NIBBLE OF A   *
* BYTE IN **.A**.              *
*                              *
* CYCLES: 16                   *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
CLRHI    MAC
*
         AND   #$F0       ; CLEAR 4 RIGHT BITS
         LSR              ; MOVE BITS RIGHT
         LSR              ; MOVE BITS RIGHT
         LSR              ; MOVE BITS RIGHT
         LSR              ; MOVE BITS RIGHT
         <<<
*
*``````````````````````````````*
* DELAY                        *
*                              *
* DELAY FOR PASSED MILLISECS   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUM OF MILLISECONDS    *
*                              *
* CYCLES: 58+                  *
* BYTES: 10                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DELAY    MAC              ; DELAY FOR MILLISECONDS
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y
         LDY   ]1         ; ++<4C3B> # OF MILLISECONDS
         JSR   DELAYMS    ; ++<6C3B[39C]> DELAY SUBROUTINE
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* DUMP                         *
*                              *
* DUMP THE HEX AT A GIVEN      *
* ADDRESS.                     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS BYTE    *
*  ]2 = LENGTH IN BYTES        *
*                              *
* CYCLES: 811+                 *
* BYTES: 16                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DUMP     MAC              ; DUMP MEMORY CONTENTS
         _AXLIT ]1        ; ++<[8C,6B]> CHECK LITERAL
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y
         LDY   ]2         ; ++<4C3B> LOAD .Y WITH LENGTH
         JSR   __DUMP     ; ++<6C3B[787C]) DUMP CONTENTS
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* GBIT                         *
*                              *
* GET BIT FROM REG / ADDR BYTE *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = BYTE TO GET BIT FROM   *
*                              *
* CYCLES: 14                   *
* BYTES : 15                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GBIT     MAC              ; GET A SINGLE BIT FROM BYTE
         LDA   ]1         ; ++<3B4C> BYTE TO CHECK
         AND   ]2         ; ++<3B4C> MASK BIT # REQUESTED VIA HOOK
         BEQ   ]ZERO      ; ++<2B2C> IF IT'S A MATCH, THEN 0
         LDA   #1         ; ++<2B2C> OTHERWISE, BIT IS 1
         JMP   ]EXIT      ; ++<3B3C> GOTO EXIT
]ZERO    LDA   #0         ; ++<2B2C> BIT IS 0
]EXIT    <<<
*
*``````````````````````````````*
* ERRH                         *
*                              *
* SET THE ERROR HANDLING HOOK  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS BYTE    *
*                              *
* CYCLES: 73                   *
* BYTES : 7                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ERRH     MAC              ; SET ERROR HANDLE
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y
         _AXLIT           ; ++<[8C6B]> CHECK IF LITERAL
         JSR   __ERRH     ; ++<6C3B[53C]> RUN ERROR HANDLE SET
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* GRET                         *
*                              *
* COPY THE VALUE IN RETURN AND *
* PLACE IT IN GIVEN ADDRESS.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = MEMORY ADDRESS BYTE    *
*                              *
* CYCLES: 45+                  *
* BYTES : 11                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GRET     MAC              ; GET RETURN VALUE
         STY   SCRATCH    ; ++<3C2B> BACKUP .y
         _AXLIT ]1        ; ++<8C6B> CHECK LITERAL
         STA   ADDR1      ; ++<3C2B> LOBYTE PASSED IN .A
         STX   ADDR1+1    ; ++<3C2B> HIBYTE PASSED IN .X
         LDY   #255       ; ++<2C2B> RESET COUNTER
]LP
         INY              ; ++<2C1B> INCREASE COUNTER
         LDA   RETURN,Y   ; ++<5C3B> LOAD BYTE IN RETURN AT
         STA   (ADDR1),Y  ; ++<6C2B> COUNTER OFFSET; STORE AT
         CPY   RETLEN     ; ++<4C3B> NEW LOCATION
         BNE   ]LP        ; ++<4C2B> IF COUNTER < RETLEN, LOOP
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* MFILL                        *
*                              *
* FILL BLOCK OF MEMORY WITH    *
* SPECIFIED VALUE.             *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STARTING ADDRESS       *
*  ]2 = LENGTH IN BYTES        *
*  ]3 = FILL VALUE             *
*                              *
* CYCLES: 110+                 *
* BYTES: 36                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MFILL    MAC              ; MEMORY FILL
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y REGISTER
         _MLIT ]1;WPAR1   ; ++<[16C12B]> CHECK LITERAL OF ]1
         _MLIT ]2;WPAR2   ; ++<[16C12B]> CHECK LITERAL OF ]2
         LDA   ]3         ; ++<4C3B> FILL VALUE
         STA   BPAR1      ; ++<3C2B> STORED IN BPAR1
         JSR   MEMFILL    ; ++<6C3B[59+]> GOSUB ROUTINE
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
*
*``````````````````````````````*
* MOV                          *
*                              *
* COPY SOURCE TO DESTINATION   *
* ADDRESS OR REGISTER.         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADD OR REGISTER *
*  ]2 = DESTINATION ADDR / REG *
*                              *
* CYCLES: 267+                 *
* BYTES: 48                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MOV      MAC              ; MEMORY MOVE
         IF    A=]1       ; .A REGISTER SOURCE
         IF    X=]2
         TAX
         ELSE
         IF    Y=]2
         TAY
         ELSE
         STA   ]2
         FIN
         FIN
         FIN
         IF    $=]1
         IF    A=]2
         LDA   ]1
         ELSE
         IF    X=]2
         LDX   ]1
         ELSE
         IF    Y=]2
         LDY   ]1
         ELSE
         STY   SCRATCH
         LDY   ]1
         STY   ]2
         LDY   SCRATCH
         FIN
         FIN
         FIN
         FIN
]EXIT    <<<              ; END MACRO
*
*``````````````````````````````*
* MOVB                         *
*                              *
* MOVE A BLOCK OF MEMORY FROM  *
* A SOURCE TO DESTINATION.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = DESTINATION ADDRESS    *
*  ]3 = NUMBER OF BYTES        *
*                              *
* CYCLES: 267+                 *
* BYTES: 48                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MOVB     MAC              ; MEMORY MOVE
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y
         _MLIT ]1;WPAR1   ; ++<[16C12B]> CHECK 1ST ADDR AS LITERAL
         _MLIT ]2;WPAR2   ; ++<[16C12B]> CHECK 2ND ADDR AS LITERAL
         _MLIT ]3;WPAR3   ; ++<[16C12B]> CHECK 3RD AS LITERAL
         JSR   MEMMOVE    ; ++<6C3B[207C+]> GOSUB ROUTINE
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MACRO
*
*``````````````````````````````*
* MSWAP                        *
*                              *
* SWAPS THE VALUES STORED IN   *
* ONE LOCATION WITH ANOTHER    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FIRST ADDRESS          *
*  ]2 = SECOND ADDRESS         *
*  ]3 = LENGTH IN BYTES (BYTE) *
*                              *
* CYCLES: 98+                  *
* BYTES: 36                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
MSWAP    MAC              ; MEMORY SWAP
         STY   SCRATCH    ; ++<3C2B> BACKUP .Y
         _MLIT ]2;WPAR2   ; ++<[16C12B]> TEST AS LITERAL
         _MLIT ]1;WPAR1   ; ++<[16C12B]> TEST AS LITERAL
         LDA   ]3         ; ++<4C3B>
         STA   BPAR1      ; ++<3C2B> STORE LENGTH IN BYTES
         JSR   MEMSWAP    ; ++<6C3B[46+]> GOSUB ROUTINE
         LDY   SCRATCH    ; ++<3C2B> RESTORE .Y
         <<<              ; END MAC
*
*``````````````````````````````*
* PEEK                         *
*                              *
* LOAD .A WITH VALUE AT ADDR   *
*                              *
* CYCLES: 4                    *
* BYTES: 3                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PEEK     MAC              ; PUT VALUE INTO .A
         LDA   ]1         ; ++<4C3B> LOAD ADDR AL IN .A
         <<<              ; END MACRO
*
*``````````````````````````````*
* POKE                         *
*                              *
* STORE VALUE AT ADDRESS       *
*                              *
* CYCLES: 4                    *
* BYTES: 3                     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
POKE     MAC              ; STORE .A INTO MEM LOC
         STA   ]1         ; ++<4C3B> STORE MEM VAL IN .A
         <<<              ; END MACRO
*
