*
*``````````````````````````````*
* HEAD.REQUIRED                *
*                              *
* THIS HEADER MUST BE THE      *
* INCLUDED BEFORE ANY OTHER    *
* CODE IN ORDER FOR THE PROPER *
* FUNCTIONING OF ANY LIBRARY.  *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SIZE: 305 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* CONSTANTS                    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ZERO PAGE WORD LOCATIONS
*
ZPW1     EQU   $06        ; AND $07
ZPW2     EQU   $08        ; AND $09
ZPW3     EQU   $EB        ; AND $EC
ZPW4     EQU   $ED        ; AND $EE
ZPW5     EQU   $FA        ; AND $FB
ZPW6     EQU   $FC        ; AND $FD
ZPWSYS   EQU   $FE        ; AND $FF
*
** ZERO PAGE BYTE LOCATIONS
*
ZPB1     EQU   $19        ; USED TO BACKUP .Y
ZPB2     EQU   $1E
ZPB3     EQU   $EF
ZPB4     EQU   $E3
*
REENTRY  EQU   $3D0
*
PROMPT   EQU   $33        ; DOS PROMPT CHARACTER
COLDENT  EQU   $03D3      ; COLD ENTRY TO DOS
SRESET   EQU   $03F2      ; SOFT RESET
PRNTAX   EQU   $F941      ; PRINT HEX VALS OF A,X REGISTERS
BELL     EQU   $FBE4      ; RING MY BELL
IOSAVE   EQU   $FF4A      ; SAVE CURRENT STATE OF REGISTERS
IOREST   EQU   $FF3F      ; RESTORE OLD STATE OF REGISTERS
*
BITON0   EQU   $01        ; FOR AND MASKING
BITON1   EQU   $02        ; TO CHECK IF BIT IS ON
BITON2   EQU   $04
BITON3   EQU   $08
BITON4   EQU   $10
BITON5   EQU   $20
BITON6   EQU   $40
BITON7   EQU   $80
*
*``````````````````````````````*
* DEDICATED MEMORY             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         JMP   _MAINSTART
*
** 16 BYTES FOR PASSING VARIABLES. THIS WOULD
** NORMALLY HAPPEN WITH ZERO PAGE LOCATIONS, AT
** LEAST IDEALLY, BUT SOMETIMES EXTRA SPACE MIGHT
** BE NECESSARY.
*
PASSTAB  DS    16
*
** 30 BYTES FOR DEDICATED VARIABLE STORAGE. AGAIN, NOT
** ALWAYS NEEDED SINCE MOST VARIABLES ARE HELD ON THE
** ZERO PAGE, BUT SOMETIMES NECESSARY.
*
VARTAB   DS    30
*
** 256 BYTES DEDICATED TO RETURN
** VALUES OF VARIABLE LENGTH; CAN BE
** MODIFIED TO SUIT SMALLER OR LARGER
** NEEDS.
*
RETLEN   DS    1          ; RETURN VALUE BYTE LENGTH
RETURN   DS    255
*
_MAINSTART
