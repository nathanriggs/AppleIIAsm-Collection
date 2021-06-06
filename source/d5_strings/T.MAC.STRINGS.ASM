*``````````````````````````````*
* MAC.STRINGS                  *
*                              *
* THIS FILE CONTAINS ALL OF    *
* THE MACROS RELATED TO STRING *
* MANIPULATION.                *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.STRCAT.ASM               *
* SUB.STRCOMP.ASM              *
* SUB.STRTRIM.ASM              *
* SUB.STRUPPER.ASM             *
* SUB.STRLOWER.ASM             *
* SUB.STRREV.ASM               *
* SUB.STRCAP.ASM               *
*                              *
* LIST OF MACROS               *
*                              *
* SCMP : STRING COMPARE        *
* SCAT : STRING CONCATENATE    *
* STRIM: STRING TRIM           *
* SUP  : STRING UPPERCASE      *
* SLO  : STRING LOWERCASE      *
* SREV :  STRING REVERSE       *
* SCAP : STRING CAPITALIZATION *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SCMP          (NATHAN RIGGS) *
*                              *
* COMPARES TWO STRINGS AND     *
* CHANGES THE ZERO FLAG TO 1   *
* IF THE STRINGS ARE EQUAL. IF *
* UNEQUAL, THE MACRO THEN      *
* COMPARES THE LENGTHS; IF THE *
* FIRST IS LESS THAN SECOND,   *
* THE CARRY FLAG IS SET TO 0.  *
* OTHERWISE, IT IS SET TO 1.   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = 1ST STRING TO COMPARE  *
*  ]2 = 2ND STRING TO COMPARE  *
*                              *
* CYCLES: 110+                 *
* SIZE: 31 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCMP     MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         _MSTR ]2;ZPW2    ; {15C14B}
         JSR   STRCMP     ; {74C3B}
         <<<
*
*``````````````````````````````*
* SCAT          (NATHAN RIGGS) *
*                              *
* CONCATENATE TWO STRINGS      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FIRST STRING           *
*  ]2 = SECOND STRING          *
*                              *
* CYCLES: 170+                 *
* SIZE: 31 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCAT     MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         _MSTR ]2;ZPW2    ; {15C14B}
         JSR   STRCAT     ; {134C3B}
         <<<
*
*``````````````````````````````*
* STRIM         (NATHAN RIGGS) *
*                              *
* CONCATENATE TWO STRINGS      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = DELIMITER              *
*                              *
* CYCLES: 123+                 *
* SIZE: 22 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STRIM    MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         LDA   ]2         ; {4C3B}
         STA   ZPW2       ; {3C2B}
         JSR   STRTRIM    ; {101C3B}
         <<<
*
*``````````````````````````````*
* STRUP         (NATHAN RIGGS) *
*                              *
* CONVERTS A STRING TO ITS     *
* UPPERCASE EQUIVALENT.        *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*                              *
* CYCLES: 114+                 *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STRUP    MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         JSR   STRUPPER   ; {99C3B}
         <<<
*
*``````````````````````````````*
* STRLO         (NATHAN RIGGS) *
*                              *
* CONVERTS A STRING TO ITS     *
* LOWERCASE EQUIVALENT.        *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*                              *
* CYCLES: 113+                 *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STRLO    MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         JSR   STRLOWER   ; {98C3B}
         <<<
*
*``````````````````````````````*
* SCAP          (NATHAN RIGGS) *
*                              *
* CAPITALIZES THE APPROPRIATE  *
* CHARACTERS IN A LOWERCASE    *
* STRING.                      *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*                              *
* CYCLES: 192+                 *
* SIZE: 17 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCAP     MAC
         _MSTR ]1;ZPW1    ; {15C14B}
         JSR   STRCAP     ; {177C3B}
         <<<
*
*``````````````````````````````*
* SREV          (NATHAN RIGGS) *
*                              *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*                              *
* CYCLES: 70+                  *
* SIZE: 16 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SREV     MAC
         _MSTR ]1;ZPW1    ; {14C13B}
         JSR   STRREV     ; {56C3B}
         <<<
