*
*``````````````````````````````*
* HEAD.HIRES.ASM               *
*                              *
* THIS IS THE HEADER FILE FOR  *
* HIRES SUBROUTINES AND        *
* MACROS. THIS HEADER IS       *
* REQUIRED TO INCLUDE FOR ALL  *
* HIRES COLLECTION FUNCTIONS.  *
*                              *
* AUTHOR:     NATHAN RIGGS     *
* CONTACT:    NATHAN.RIGGS@    *
*             OUTLOOK.COM      *
*                              *
* DATE:       05-JUN-2021      *
* ASSEMBLER:  MERLIN 8 PRO     *
* OS:         DOS 3.3          *
*                              *
* SIZE: 16 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HGR      EQU   $F3E2      ; APPLESOFT HGR SUBROUTINE
AHCOLOR  EQU   $F6F0      ; APPLESOFT COLOR SET SUBROUTINE
AHPLOT   EQU   $F457      ; APPLESOFT PLOTTING SUBROUTINE
AHPOSN   EQU   $F411      ; APPLESOFT POSITION SUBROUTINE
AHLIN    EQU   $F53A      ; APPLESOFT LINE PLOT SUBROUTINE
AHGBAS   EQU   $26        ; APPLESOFT GET HIRES LOCATION
AHPAG    EQU   $E6        ; APPLESOFT SET PAGE
AHNDX    EQU   $E5
AHBIT    EQU   $30
AROT     EQU   $F9        ; APPLESOFT ROTATION VALUE
ASCALE   EQU   $E7        ; APPLESOFT SCALE VALUE
ASHNUM   EQU   $F730      ; APPLESOFT SHAPE NUMBER
ADRAW    EQU   $F605      ; APPLESOFT SHAPE DRAW SUBROUTINE
AXDRAW   EQU   $F661      ; APPLESOFT SHAPE XDRAW SUBROUTINE
*
GRAPHICS EQU   $C050      ; GRAPHICS SOFT SWITCH
HIRES    EQU   $C057      ; HIRES SOFT SWITCH
HPAGE1   EQU   $C054      ; PAGE 1 SOFT SWITCH
HMIXOFF  EQU   $C052      ; MIXED MODE OFF SOFT SWITCH
HPAGE2   EQU   $C055      ; PAGE 2 SOFT SWITCH
HMIXON   EQU   $C053      ; MIXED MODE ON SOFT SWITCH
HTEXTM   EQU   $C051      ; TEXT MODE SOFT SWITCH
IIESET   EQU   $A0        ; START OF CHARACTERS ON THE IIE
LOWSET   EQU   $80        ; OFFSET TO LOWERCASE FOR OLDER SYSTEMS
*
         JMP   _HRSKIP
*
** THESE ARE MASK VALUES FOR THE EVEN AND ODD
** BYTE LOCATIONS OF THE HIRES SCREEN
*
CT_EVEN  HEX   00         ; {0C1B} BLACK 1
         HEX   2A         ; {0C1B} GREEN
         HEX   55         ; {0C1B} VIOLET
         HEX   7F         ; {0C1B} WHITE 1
         HEX   80         ; {0C1B} BLACK 2
         HEX   AA         ; {0C1B} ORANGE
         HEX   D5         ; {OC1B} BLUE
         HEX   FF         ; {0C1B} WHITE 2
CT_ODD   HEX   00         ; {0C1B} BLACK 1
         HEX   55         ; {0C1B} GREEN
         HEX   2A         ; {0C1B} VIOLET
         HEX   7F         ; {0C1B} WHITE 1
         HEX   80         ; {0C1B} BLACK 2
         HEX   D5         ; {0C1B} ORANGE
         HEX   AA         ; {0C1B} BLUE
         HEX   FF         ; {0C1B} WHITE 2
*
** HIRES COLOR CODES
*
HBLACK1  EQU   $00
HGREEN   EQU   $01
HPURPLE  EQU   $02
HWHITE1  EQU   $03
HBLACK2  EQU   $04
HORANGE  EQU   $05
HBLUE    EQU   $06
HWHITE2  EQU   $07
*
HOFFSET  DS    1,0        ; WORKING PAGE OFFSET
*
*``````````````````````````````*
* _HPLOT                       *
*                              *
* THIS WILL BE ADDED IN THE    *
* FUTURE ONCE THE PLOTTING     *
* SUBROUTINE IS OPTIMIZED.     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*
_HRSKIP
*
