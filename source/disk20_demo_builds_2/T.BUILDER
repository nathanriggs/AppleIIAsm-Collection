********************************
*                              *
* APLLEASM BUILDER UTILITY     *
*-                            -*
* COPIES DESIRED SUBROUTINES   *
* FROM ENTIRE LIBRARY ONTO A   *
* DESTINATION DISK, WITH SOME  *
* CUSTOMIZATION (LIKE WHETHER  *
* TO USE MINIFIED VERSIONS),   *
* AND THEN CREATES A CUSTOM    *
* TEMPLATE FILE FOR THE NEW    *
* PROJECT.                     *
*                              *
********************************
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         DSK   BUILDER
         TR    ON
         OBJ   $BFE0
         ORG   $6000
*
********************************
*                              *
* HEADER, HOOKS AND MACROS     *
*                              *
********************************
*
         LST   OFF
         PUT   MIN.VARS.REQUIRED
         USE   MIN.MAC.REQUIRED
         PUT   MIN.HOOKS.REQUIRED
         PUT   MIN.HOOKS.ARRAYS
         PUT   MIN.HOOKS.FILEIO
         PUT   MIN.HOOKS.STDIO
         PUT   MIN.HOOKS.STRINGS
         USE   MIN.MAC.ARRAYS
         USE   MIN.MAC.CONVERT
         USE   MIN.MAC.FILEIO
         USE   MIN.MAC.STDIO
         USE   MIN.MAC.STRINGS
         USE   MAC.MENU
         USE   MAC.BUILDER
         LST   ON
*
********************************
*                              *
* CONSTANT DECLARATIONS        *
*                              *
********************************
*
_OBJ     EQU   $BFE0
*
********************************
*                              *
* MAIN PROGRAM LOOP            *
*                              *
********************************
*
MAIN
         JSR   INIT
         JSR   TITLE
         JMP   M_OPTIONS
*JSR SELECT
*JSR TEMPLATE
*JSR BUILD
*
         JMP   REENTRY
*
********************************
*                              *
* INIT SUBROUTINE              *
*                              *
********************************
*
INIT
*
         AMODE
         LDA   #0
         STA   CNT
         COL40
         RTS
*
********************************
*                              *
* TITLE SUBROUTINE             *
*                              *
********************************
*
TITLE
*
         JSR   HOME
         SCPOS #13;#3
         PRN   "APPLE][ ASM"
         SCPOS #14;#5
         PRN   "BAREBONES"
         SCPOS #1;#7
         PRN   #TNAME
         SCPOS #1;#8
         PRN   #TNAME2
         SCPOS #1;#9
         PRN   #TNAME3
         SCPOS #1;#10
         PRN   #TNAME4
         SCPOS #1;#11
         PRN   #TNAME5
         SCPOS #9;#14
         PRN   "BY NATHAN RIGGS, 2019",8D8D
         SCPOS #5;#17
         PRN   "(D)ESCRIPTION    (I)NSTRUCTIONS"
         SCPOS #5;#18
         PRN   "(S)ETTINGS       (B)UILD",8D8D
*
         RTS
*
********************************
*                              *
* M_OPTIONS SUBROUTINE         *
*                              *
********************************
*
M_OPTIONS
*
:WLP
         WAIT
         CMP   #$44       ; "D"
         BEQ   :DESCRIBE
         CMP   #$49       ; "I"
         BEQ   :INSTRUCT
         CMP   #$53       ; "S"
         BEQ   :GOSETTINGS
         CMP   #$42       ; "B"
         BEQ   :GOBUILD
         CMP   #'Q'
         BEQ   :GOQUIT
         JMP   :WLP
:GOSETTINGS
         JMP   :SETTINGS
:GOBUILD
         JMP   :BUILD
:GOQUIT
         JMP   :QUIT
:DESCRIBE
         PLA
         PLA
         PUP   #5;#2;#30;#20;"T.DESC";#MAIN
         JMP   MAIN
:INSTRUCT
         PLA
         PLA
         PUP   #5;#2;#30;#20;"T.BLD.INSTRUCT";#MAIN
         JMP   MAIN
:SETTINGS
*MEND #SETMEN;#MAIN
         MNSNM "SETTINGS MENU"
         MNSLN #$09
         MNSLW #20
         MNSOW #10
         MNSBK #27        ; ESCAPE KEY
         MNSHK #2;#MAIN
         MNGHK #2
         MNSOP #1;"#ZERO#ONE#TWO#THREE"
         MNGST #1;#1
         SPRN  #RETURN
         WAIT
:BUILD
         JMP   MAIN
:QUIT
         JMP   REENTRY
*
********************************
*                              *
* VARIABLES                    *
*                              *
********************************
*
CNT      DS    2          ; TEMP COUNTER
PNAME    DS    30         ; PROJECT NAME
PADDR    DS    2          ; PROJECT OBJ ADDRESS
MINTOG   DS    1          ; MINIFIED TOGGLE FLAG
*
** LIBRARY FLAGS
*
** 1 = ALL (INVERTED SPACE)
** 2 = PARTIAL (*)
** 3 = NONE (BLANK SPACE)
*
STDIOF   DS    2          ; STDIO FLAG
COMMONF  DS    1          ; COMMON FLAG
ARRAYSF  DS    1          ; ARRAYS FLAG
MATHF    DS    1          ; MATH FLAG
STRINGSF DS    1          ; STRINGS FLAG
FILEIOF  DS    1          ; FILEIO FLAG
CONVERTF DS    1          ; CONVERSION FLAG
*
TNAME    ASC   "I--\  I   I I I     I--\  I---- I--\",00
TNAME2   ASC   "I   ) I   I I I     I   I I     I   )",00
TNAME3   ASC   "I--<  I   I I I     I   I I--   I--/",00
TNAME4   ASC   "I   ) I   I I I     I   I I     I  \",00
TNAME5   ASC   "I--/   ---  I I---- I--/  I---- I   \",00
*
********************************
*                              *
* BUILDER SPECIFIC SUBROUTINES *
*                              *
********************************
*
         PUT   LIB.MENU
         PUT   SUB.FPOP
*
********************************
*                              *
*  LOW-LEVEL ROUTINES          *
*                              *
********************************
*
         LST   OFF
*
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINES
*
** ARRAYS
*
         PUT   MIN.SUB.ADIM81
*PUT MIN.SUB.ADIM82
         PUT   MIN.SUB.AGET81
*PUT MIN.SUB.AGET82
         PUT   MIN.SUB.APUT81
*PUT MIN.SUB.APUT82
*
** STDIO
*
         PUT   MIN.SUB.CURSORUDBF
         PUT   MIN.SUB.DPRINT
         PUT   MIN.SUB.SINPUT
         PUT   MIN.SUB.TFILLA
         PUT   MIN.SUB.THLINE
         PUT   MIN.SUB.TVLINE
         PUT   MIN.SUB.TXTPUT
         PUT   MIN.SUB.XPRINT
*
** FILEIO
*
         PUT   MIN.SUB.FPSTR
         PUT   MIN.SUB.FPRINT
         PUT   MIN.SUB.FINPUT
         PUT   MIN.SUB.DOSCMD
         PUT   MIN.SUB.BINSAVE
         PUT   MIN.SUB.BINLOAD
*
** STRINGS
*
         PUT   MIN.SUB.STRCAT
         PUT   MIN.SUB.STRCOMP
         PUT   MIN.SUB.SUBCOPY
         PUT   MIN.SUB.SUBDEL
         PUT   MIN.SUB.SUBINS
         PUT   MIN.SUB.SUBPOS
         PUT   MIN.SUB.PRNSTR
*
         LST   ON
