*
*``````````````````````````````*
* HOOKS.MATH                   *
*                              *
* THIS HOOKS FILE CONTAINS     *
* HOOKS TO VARIOUS ROUTINES    *
* RELATED TO MATHEMATICS. IN   *
* PARTICULAR, WOZNIAK'S        *
* FLOATING-POINT ALGORITHMS    *
* ARE POINTED TO HERE, IF      *
* INTEGER MATH IS NOT ENOUGH   *
* FOR THE TASK AT HAND.        *
*                              *
* NOTE THAT UNLESS ABSOLUTELY  *
* NECESSARY, YOU SHOULD USE    *
* THE INTEGER MATH ROUTINES,   *
* AS THEY ARE MUCH FASTER. IN  *
* THE FUTURE, FIXED-POINT MATH *
* MAY BE ADDED TO THE LIBRARY  *
* AS WELL.                     *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      15-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GETNUM   EQU   $FFA7      ; ASCII TO HEX IN 3E & 3F
RNDL     EQU   $4E        ; RANDOM NUMBER LOW
RNDH     EQU   $4F        ; RANDOM NUMBER HIGH
*
FAC      EQU   $9D        ; FLOATING POINT ACCUM
FSUB     EQU   $E7A7      ; FLOATING POINT SUBTRACT
FADD     EQU   $E7BE
FMULT    EQU   $E97F      ; FP MULTIPLY
FDIV     EQU   $EA66      ; FP DIVIDE
FMULTT   EQU   $E982
FDIVT    EQU   $EA69
FADDT    EQU   $E7C1
FSUBT    EQU   $E7AA
*
MOVFM    EQU   $EAF9      ; MOVE FAC > MEM
MOVMF    EQU   $EB2B      ; MOVE MEM > FAC
NORM     EQU   $E82E
CONUPK   EQU   $E9E3
*
FLOG     EQU   $E941      ; LOGARITHM
FSQR     EQU   $EE8D      ; SQUARE ROOT
FCOS     EQU   $EFEA      ; FP COSINE
FSIN     EQU   $EFF1      ; SINE
FTAN     EQU   $F03A      ; TANGENT
FATN     EQU   $F09E      ; ATANGENT
*
