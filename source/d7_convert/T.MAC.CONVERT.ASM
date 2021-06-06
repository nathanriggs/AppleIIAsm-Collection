*``````````````````````````````*
* MAC.CONVERT.ASM              *
*                              *
* THIS COLLECTION HOLDS MACROS *
* USED FOR CONVERTING VARIABLE *
* TYPES.                       *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      05-JUN-2021       *
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
* CYCLES: 290+                 *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
I2STR    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         JSR   HEX2INTASC ; {274C3B}
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
* CYCLES: 415+                 *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2I    MAC
         _MSTR ]1;ZPW1    ; {16C12B}
         JSR   INTASC2HEX ; {399C3B}
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
* CYCLES: 97+                  *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
H2STR    MAC
         LDA   ]1         ; {4C3B}
         JSR   HEX2HEXASC ; {93C3B}
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
* CYCLES: 116+                 *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2H    MAC
         _MSTR ]1;ZPW1    ; {16C12B}
         JSR   HEXASC2HEX ; {100C3B}
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
* CYCLES: 262+                 *
* SIZE: 8 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
B2STR    MAC
         LDA   ]1         ; {4C3B}
         STA   ZPB1       ; {3C2B}
         JSR   HEX2BINASC ; {255C3B}
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
* CYCLES: 501+                 *
* SIZE: 15 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STR2B    MAC
         _MSTR ]1;ZPW1    ; {16C12B}
         JSR   BINASC2HEX ; {485C3B}
         <<<
