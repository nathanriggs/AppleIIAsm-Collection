*``````````````````````````````*
* MAC.CONVERT                  *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* COMMON.LIB, AND CAN BE USED  *
* REGARDLESS OF WHETHER A      *
* SPECIFIC FUNCTION IS         *
* INCLUDED AS A PUT IN THE     *
* MAIN SOURCE.                 *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      25-SEP-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES NEEDED      *
*                              *
*  SUB.BINASC2HEX              *
*  SUB.HEX2BINASC              *
*  SUB.HEX2HEXASC              *
*  SUB.HEX2INTASC              *
*  SUB.HEXASC2HEX              *
*  SUB.INTASC2HEX              *
*                              *
* LIST OF MACROS               *
*                              *
* I2STR: INTEGER TO STRING     *
* STR2I: STRING TO INTEGER     *
* H2STR: HEXADECIMAL TO STRING *
* STR2H: STRING TO HEXADECIMAL *
* B2STR: BINARY TO STRING      *
* STR2B: STRING TO BINARY      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* I2STR                        *
*                              *
* CONVERTS A 16BIT INTEGER TO  *
* ITS STRING EQUIVALENT.       *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = VALUE TO CONVERT       *
*                              *
* SAMPLE USAGE:                *
*                              *
*  I2STR  #11111               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
I2STR    MAC
         STY   SCRATCH
         _MLIT ]1;WPAR1
         JSR   HEX2INTASC
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* STR2I                        *
*                              *
* CONVERTS A STRING TO A 16BIT *
* NUMBER EQUIVALENT.           *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = STRING OR ITS ADDRESS  *
*                              *
* SAMPLE USAGE:                *
*                              *
*  STR2I "1024"                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2I    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   INTASC2HEX
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* H2STR                        *
*                              *
* CONVERTS A HEX BYTE INTO AN  *
* EQUIVALENT STRING IN HEX.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = HEX VALUE TO CONVERT   *
*       OR THE ADDRESS         *
*                              *
* SAMPLE USAGE:                *
*                              *
*  H2STR #FF                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
H2STR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   HEX2HEXASC
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* STR2H                        *
*                              *
* CONVERTS A HEX STRING TO ITS *
* EQUIVALENT HEX BYTE.         *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = STRING OR ITS ADDRESS  *
*                              *
* SAMPLE USAGE:                *
*                              *
*  STR2H "FE"                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2H    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   HEXASC2HEX
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* B2STR                        *
*                              *
* CONVERTS A HEX VALUE TO ITS  *
* EQUIVALENT BINARY STRING.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = HEX VALUE OR ADDRESS   *
*                              *
* SAMPLE USAGE:                *
*                              *
*  B2STR #$FE                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
B2STR    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         JSR   HEX2BINASC
         LDY   SCRATCH
         <<<
*
*``````````````````````````````*
* STR2B                        *
*                              *
* CONVERTS A BINARY STRING TO  *
* EQUIVALENT HEX VALUE.        *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = STRING OR ITS ADDRESS  *
*                              *
* SAMPLE USAGE:                *
*                              *
*  STR2B "00110101"            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2B    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINASC2HEX
         LDY   SCRATCH
         <<<
