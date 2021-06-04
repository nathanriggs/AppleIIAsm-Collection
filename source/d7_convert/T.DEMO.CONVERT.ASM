*
*``````````````````````````````*
* DEMO.CONVERT.ASM             *
*                              *
* A DEMO OF THE CONVERSION     *
* MACROS.                      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      13-MAY-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.CONVERT
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (PUTS, MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         USE   MIN.MAC.CONVERT.ASM
         PUT   MIN.HEAD.CONVERT.ASM
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HOME    EQU   $FC58
]XCOUT   EQU   $FDF0
*
*``````````````````````````````*
* INTEGER TO STRING            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE I2STR MACRO, WHICH STANDS FOR INTEGER TO STRING,
** CONVERTS A NUMERIC VALUE INTO ITS INTEGER STRING
** EQUIVALENT. THIS STRING IS THEN STORED IN RETURN.
*
         JSR   ]HOME
         _PRN  "I2STR MACRO",8D
         _PRN  "===========",8D8D
         I2STR #5309
         _PRN  "I2STR #5309 = "
         _WAIT
         LDA   RETURN
         JSR   ]XCOUT
         LDA   RETURN+1
         JSR   ]XCOUT
         LDA   RETURN+2
         JSR   ]XCOUT
         LDA   RETURN+3
         JSR   ]XCOUT
         _WAIT
*
*``````````````````````````````*
* STRING TO INTEGER            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STR2I (STRING TO INTEGER) MACRO TAKES A STRING
** THAT REPRESENTS AN INTEGER AND RETURNS ITS EQUIVALENT
** NUMERIC VALUE.
*
         JSR   ]HOME
         _PRN  "THE STR2I MACRO",8D
         _PRN  "===============",8D8D
         _PRN  "STR2I '255' = "
         STR2I "255"
         _WAIT
         DUMP  #RETURN;#2
         _WAIT
*
*``````````````````````````````*
* HEXADECIMAL TO STRING        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE H2STR (HEXADECIMAL TO STRING) MACRO CONVERTS
** A HEXADECIMAL VALUE TO ITS STRING EQUIVALENT.
*
         JSR   ]HOME
         _PRN  "HEXADECIMAL TO STRING",8D
         _PRN  "=====================",8D8D
         _PRN  "H2STR #$FF = "
         _WAIT
         H2STR #$FF
         LDA   RETURN
         JSR   ]XCOUT
         LDA   RETURN+1
         JSR   ]XCOUT
         _WAIT
*
*``````````````````````````````*
* STRING TO HEXADECIMAL        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STR2H (STRING TO HEXADECIMAL) MACRO CONVERTS
** A STRING INTO ITS HEXADECIMAL EQUIVALENT.
*
         JSR   ]HOME
         _PRN  "STRING TO HEXADECIMAL",8D
         _PRN  "=====================",8D8D
         _PRN  "STR2H 'FF' = "
         _WAIT
         STR2H "FF"
         DUMP  #RETURN;#1
         _WAIT
*
*``````````````````````````````*
* STRING TO BINARY             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STR2B (STRING TO BINARY) MACRO CONVERTS A
** STRING OF ONES AND ZEROES TO ITS EQUIVALENT
** NUMERIC VALUE.
*
         JSR   ]HOME
         _PRN  "BINARY TO STRING",8D
         _PRN  "================",8D8D
         _PRN  "STR2B '00110011' ="
         _WAIT
         STR2B #BIN
         DUMP  #RETURN;#1
         _WAIT
*
*``````````````````````````````*
* BINARY TO STRING             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE B2STR (BINARY TO STRING) MACRO CONVERTS A
** NUMERIC VALUE INTO AN EQUIVALENT STRING IN BINARY
** FORM.
*
         JSR   ]HOME
         _PRN  "BINARY TO STRING",8D
         _PRN  "===============",8D8D
         _PRN  "B2STR #$FF = "
         _WAIT
         B2STR #$FF
         LDA   RETURN
         JSR   ]XCOUT
         LDA   RETURN+1
         JSR   ]XCOUT
         LDA   RETURN+2
         JSR   ]XCOUT
         LDA   RETURN+3
         JSR   ]XCOUT
         LDA   RETURN+4
         JSR   ]XCOUT
         LDA   RETURN+5
         JSR   ]XCOUT
         LDA   RETURN+6
         JSR   ]XCOUT
         LDA   RETURN+7
         JSR   ]XCOUT
         _WAIT
*
         JSR   ]HOME
         _PRN  "FIN.",8D8D8D
*
         JMP   REENTRY
*
*``````````````````````````````*
*        BOTTOM INCLUDES       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** BOTTOM INCLUDES
*
         PUT   MIN.LIB.REQUIRED.ASM
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
         PUT   MIN.SUB.HEX2INTASC.ASM
         PUT   MIN.SUB.INTASC2HEX.ASM
         PUT   MIN.SUB.HEX2BINASC.ASM
         PUT   MIN.SUB.BINASC2HEX.ASM
         PUT   MIN.SUB.HEX2HEXASC.ASM
         PUT   MIN.SUB.HEXASC2HEX.ASM
*
BIN      STR   "00110011"
