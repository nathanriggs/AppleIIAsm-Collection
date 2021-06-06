*
*``````````````````````````````*
* DEMO.STRINGS.ASM             *
*                              *
* A DEMO OF THE VARIOUS MACROS *
* FOR STRING HANDLING.         *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.STRINGS
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (PUTS, MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED.ASM
         USE   MIN.MAC.REQUIRED.ASM
         USE   MIN.MAC.STRINGS.ASM
         PUT   MIN.HEAD.STRINGS.ASM
]HOME    EQU   $FC58
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* STRING MACROS                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THIS FILE CONTAINS MACRO DEMONSTRATIONS FOR THE
** STRING COLLECTION OF THE APPLEIIASM LIBRARY. NOTE
** THAT ANOTHER DEMO FILE EXISTS THAT IS DEDICATED TO
** MACROS THAT SPECIFICALLY DEAL WITH SUBSTRINGS,
** WHERAS THIS FILE DEMONSTRATES MACROS THAT WORK ON
** THE WHOLE STRING.
*
*``````````````````````````````*
* STRING REVERSE               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SREV MACRO SIMPLY ACCEPTS A STRING
** OR ITS ADDRESS AND REVERSES IT, HANDING
** BACK THE REVERSED STRING IN RETURN WITH
** ITS LENGTH IN RETLEN.
*
         JSR   ]HOME
         _PRN  "STRING REVERSAL",8D
         _PRN  "===============",8D8D
         LDA   #"-"
         JSR   $FDF0
         SREV  #S2
         _AXLIT #RETLEN
         JSR   _PS
         LDA   #"-"
         JSR   $FDF0
         _WAIT
*
*``````````````````````````````*
* STRING TRIMMING              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STRIM MACRO ACCEPTS A GIVEN TOKEN OR
** DELIMITER TO CHECK FOR AT THE BEGINNING OR
** END OF A STRING, THEN DELETES THEM FROM THE
** STRING IF THEY EXIST AT EITHER END.
*
         JSR   ]HOME
         _PRN  "STRING TRIMMING",8D
         _PRN  "===============",8D8D
         STRIM #S2;#" "
         _AXLIT #RETLEN
         JSR   _PS
         _WAIT
*
*``````````````````````````````*
* STRING UPPERCASE             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE STRUP MACRO ACCEPTS A STRING AND
** RETURNS ITS UPPERCASE EQUIVALENT.
*
         JSR   ]HOME
         _PRN  "STRING UPPERCASING",8D
         _PRN  "==================",8D8D
         STRUP #S6
         _AXLIT #RETLEN
         JSR   _PS
         _WAIT
*
*``````````````````````````````*
* STRING LOWERCASE             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SLO MACRO TAKES A STRING AND MAKES
** EVERY CHARACTER LOWERCASE, PASSING THE NEW
** STRING BACK IN RETURN WITH ITS LENGTH IN
** RETLEN. NOTE THAT *ALL* CHARACTERS ARE TURNED
** TO LOWERCASE THAT ARE ALREADY UPPERCASE, SO EVEN
** WORDS THAT SHOULD BE CAPITALIZED WILL BE
** IN LOWERCASE. YOU CAN REMEDY THIS, IF NEEDED, WITH
** THE SCAP MACRO.
*
         JSR   ]HOME
         _PRN  "STRING LOWERCASING",8D
         _PRN  "==================",8D8D
         STRLO #S1
         _AXLIT #RETLEN
         JSR   _PS
         _WAIT
*
*``````````````````````````````*
* STRING CAPITALIZATION        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SCAP MACRO ACCEPTS A STRING AND SCANS
** IT FOR WORDS THAT SHOULD BE CAPITALIZED,
** INCLUDING THE FIRST LETTER OF THE STRING.
** WHILE NOT ALL NEEDS ARE MET WITH THIS, AS
** IT ONLY CAPITALIZES BASED ON WHETHER A NEW
** SENTENCE IS STARTED, IT SHOULD SERVE MOST
** PURPOSES.
*
         JSR   ]HOME
         _PRN  "STRING CAPITALIZATION",8D
         _PRN  "=====================",8D8D
         SCAP  #S5
         _AXLIT #RETLEN
         JSR   _PS
         _WAIT
*
*``````````````````````````````*
* STRING CONCATENATION         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SCAT MACRO CONCATENATES (OR JOINS)
** ONE STRING TO ANOTHER AND PASSES THE NEW
** STRING BACK IN RETURN, WITH THE NEW LENGTH
** HELD IN RETLEN.
*
         JSR   ]HOME
         _PRN  "STRING CONCATENATION",8D
         _PRN  "====================",8D8D
         SCAT #S3;#S4
         _AXLIT #RETLEN
         JSR   _PS
         _WAIT
*
*``````````````````````````````*
* STRING COMPARISON            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** THE SCMP MACRO COMPARES ONE STRING TO ANOTHER,
** RETURNING THE COMPARISON RESULTS VIA THE STATUS
** REGISTER AS FOLLOWS:
*
** Z = 1 IF STRINGS MATCH
** Z = 0 IF STRINGS DON'T MATCH
** C = 0 IF 1ST STRING < 2ND STRING LENGTH
** C = 1 IF IST STRING >= 2ND STRING LENGTH
*
** NOTE THAT THIS MIRRORS, IN WAYS, HOW THE CMP
** INSTRUCTION WORKS.
*
         JSR   ]HOME
         _PRN  "STRING COMPARISON",8D
         _PRN  "=================",8D8D
         SCMP  #S1;#S2
         BCC   :ALTB
         BCS   :AGTEB
:ALTB
         _PRN  "STRING 1 IS LESS THAN STRING 2.",8D8D
         JMP   :_END
:AGTEB
         _PRN  "STRING 1 IS GREATER THAN OR EQUAL TO",8D
         _PRN  "STRING 2.",8D8D
:_END
         _WAIT
*
         JSR   ]HOME
         _PRN  "FIN!",8D8D
*
*
*
         JMP   $3D0
*
** THE FOLLOWING SUBROUTINE IS A COPY OF THE STDIO
** LIBRARY'S PRNSTR SUBROUTINE, WHICH IS USED TO
** PRINT STRINGS WITH A PRECEDING LENGTH-BYTE. THIS
** IS USED FOR SHOWING THE OUTPUT OF THE VARIOUS
** STRING MACROS.
*
]STRLEN  HEX   0000
]COUT1   EQU   $FDF0
_PS
         STA   ZPWSYS
         STX   ZPWSYS+1
         LDY   #0
         LDA   (ZPWSYS),Y
         STA   ]STRLEN
:_LP
         INY
         LDA   (ZPWSYS),Y
         JSR   ]COUT1
         CPY   ]STRLEN
         BNE   :_LP
         LDA   ]STRLEN
         RTS
*
S1       STR   "ONE RING TO RULE THEM ALL"
S2       STR   " ONE RING TO FIND THEM "
S3       STR   " ONE RING TO BRING THEM ALL"
S4       STR   "AND IN THE DARKNESS BIND THEM "
S5       STR   "this is a test? a test. a test! a test."
S6       STR   "this is a test."
S7       STR   "ZERO ONE TWO THREE FOUR FIVE SIX"
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
** STRING SUBROUTINES
*
         PUT   MIN.SUB.STRCAT.ASM
         PUT   MIN.SUB.STRCOMP.ASM
         PUT   MIN.SUB.STRTRIM.ASM
         PUT   MIN.SUB.STRUPPER.ASM
         PUT   MIN.SUB.STRCAP.ASM
         PUT   MIN.SUB.STRLOWER.ASM
         PUT   MIN.SUB.STRREV.ASM
