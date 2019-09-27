*
*``````````````````````````````*
* DEMO.CONVERT                 *
*                              *
* A DEMO OF THE CONVERSION     *
* MACROS.                      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      25-SEP-2019       *
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
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.CONVERT
         PUT   MIN.HOOKS.CONVERT
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]HOME    EQU   $FC58
]XCOUT   EQU   $FDF0
*
         JSR   ]HOME
         _PRN  "CONVERSION LIBRARY",8D
         _PRN  "==================",8D8D
         _PRN  "THIS DEMO SHOWCASES HOW TO USE",8D
         _PRN  "THE MACROS IN THE CONVERSION LIBRARY.",8D8D
         _PRN  "THESE MACROS ARE USED FOR CONVERTING",8D
         _PRN  "NUMBERS INTO STRINGS AND VICE VERSA",8D
         _PRN  "IN THREE NUMBERING SYSTEMS: ",8D
         _PRN  "DECIMAL, HEXADECIMAL, AND BINARY.",8D8D
         _WAIT
*
         JSR   ]HOME
         _PRN  "INTEGERS AND STRINGS",8D
         _PRN  "====================",8D8D
         _PRN  "TO CONVERT BETWEEN NUMERALS",8D
         _PRN  "AND THEIR INTEGER-BASED EQUIVALENTS.",8D
         _PRN  "TO CONVERT FROM A NUMBER TO AN INTEGER",8D
         _PRN  "STRING, YOU WOULD USE THE I2STR MACRO,",8D
         _PRN  "WHICH STANDS FOR 'INTEGER TO STRING.'",8D
         _PRN  "TO CONVERT AN INTEGER STRING TO ITS",8D
         _PRN  "NUMERICAL 16-BIT EQUIVALENT, YOU WOULD",8D
         _PRN  "USE THE STR2I MACRO--WHICH OF COURSE",8D
         _PRN  "STANDS FOR 'STRING TO INTEGER.",8D8D
         _PRN  "LET'S TEST THESE TO SEE HOW THEY WORK.",8D
         _WAIT
         JSR   ]HOME
         _PRN  "IN CONVERTING AN INTEGER TO A STRING,",8D
         _PRN  "YOU WOULD USE THE I2STR MACRO AS SUCH:",8D8D
         _PRN  "  I2STR #5309",8D8D
         _PRN  "WHICH WILL PRODUCE THE FOLLOWING STRING:",8D8D
         _WAIT
         I2STR #5309
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
         JSR   ]HOME
         _PRN  "THE STR2I MACRO DOES THE OPPOSITE:",8D
         _PRN  "IT TAKES AN INTEGER STRING AND",8D
         _PRN  "CONVERTS IT TO A NUMERIC VALUE. THUS:",8D8D
         _PRN  "  STR2I '255'",8D
         _PRN  "  DUMP #RETURN;#2",8D8D
         _PRN  "WILL RETURN:",8D8D
         STR2I "255"
         _WAIT
         DUMP  #RETURN;#2
         _WAIT
         JSR   ]HOME
         _PRN  "HEXADECIMAL TO STRING",8D
         _PRN  "=====================",8D8D
         _PRN  "TO CONVERT A HEX VALUE TO A",8D
         _PRN  "HEX STRING AND VICE VERSA, YOU",8D
         _PRN  "WOULD USE THE H2STR AND STR2H MACROS.",8D8D
         _PRN  "THE H2STR MACRO CONVERTS A HEX BYTE",8D
         _PRN  "TO ITS STRING EQUIVALENT, AS SUCH:",8D8D
         _PRN  "  H2STR #$FF",8D
         _PRN  "  LDA RETURN",8D
         _PRN  "  JSR ]XCOUT",8D8D
         _PRN  "RETURNS:",8D8D
         _WAIT
         H2STR #$FF
         LDA   RETURN
         JSR   ]XCOUT
         LDA   RETURN+1
         JSR   ]XCOUT
         _WAIT
         _PRN  " ",8D8D
         _PRN  "TO TURN A HEX STRING BACK",8D
         _PRN  "INTO ITS NUMERIC VALUE, YOU WOULD",8D
         _PRN  "THE STR2H MACRO AS SUCH:",8D8D
         _PRN  "  STR2H 'FF'",8D
         _PRN  "  DUMP #RETURN;#1",8D8D
         _PRN  "WHICH RETURNS:",8D8D
         _WAIT
         STR2H "FF"
         DUMP  #RETURN;#1
         _WAIT
*
         JSR   ]HOME
         _PRN  "BINARY STRING CONVERSION",8D
         _PRN  "========================",8D8D
         _PRN  "LASTLY, WE HAVE MACROS FOR THE",8D
         _PRN  "CONVERSION OF BINARY STRINGS TO THEIR",8D
         _PRN  "NUMERIC EQUIVELENT AND VICE VERSA:",8D
         _PRN  "STR2B AND B2STR.",8D8D
         _WAIT
         _PRN  "STR2B TAKES A STRING OF ZEROS AND",8D
         _PRN  "ONES AND CONVERTS THAT INTO ITS",8D
         _PRN  "NUMERIC VALUE, AS SUCH:",8D8D
         _PRN  "  STR2B '00110011'",8D
         _PRN  "  DUMP #RETURN;#1",8D8D
         _PRN  "WHICH RETURNS:",8D8D
         _WAIT
         STR2B "00110011"
         DUMP  #RETURN;#1
         _WAIT
         _PRN  "TO CONVERT A NUMERIC VALUE TO",8D
         _PRN  "A BINARY STRING, USE THE B2STR",8D
         _PRN  "MACRO AS SUCH:",8D8D
         _PRN  "  B2STR #$FF",8D8D
         _PRN  "WHICH RETURNS THE STRING:",8D8D
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
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
** STRING SUBROUTINES
*
         PUT   MIN.SUB.HEX2INTASC
         PUT   MIN.SUB.INTASC2HEX
         PUT   MIN.SUB.HEX2BINASC
         PUT   MIN.SUB.BINASC2HEX
         PUT   MIN.SUB.HEX2HEXASC
         PUT   MIN.SUB.HEXASC2HEX
*
