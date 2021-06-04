*``````````````````````````````*
* MAC.SUBSTRINGS.ASM           *
*                              *
* THIS FILE CONTAINS ALL OF    *
* THE MACROS RELATED TO        *
* SUBSTRING MANIPULATION.      *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      12-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.SUBCOPY.ASM              *
* SUB.SUBDEL.ASM               *
* SUB.SUBINS.ASM               *
* SUB.SUBPOS.ASM               *
* SUB.SUBCHARCNT.ASM           *
* SUB.SUBTOK.ASM               *
*                              *
* LIST OF MACROS               *
*                              *
* SPOS : FIND SUBSTRING POS    *
* SCOP : SUBSTRING COPY        *
* SDEL : SUBSTRING DELETE      *
* SINS : SUBSTRING INSERT      *
* STOK : TOKENIZED SUBSTRING   *
* SCNT : CHARACTER COUNT       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* SPOS          (NATHAN RIGGS) *
*                              *
* FIND THE POSITION OF A SUB-  *
* STRING IN A GIVEN STRING.    *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING              *
*                              *
* CYCLES: 205+                 *
* SIZE: 136 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SPOS     MAC
         _MSTR ]1;WPAR2   ; {14C13B}
         _MSTR ]2;WPAR1   ; {14C13B}
         JSR   SUBPOS     ; {177C110B}
         <<<
*
*``````````````````````````````*
* SCPY          (NATHAN RIGGS) *
*                              *
* COPY SUBSTRING FROM STRING   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING INDEX        *
*  ]3 = SUBSTRING LENGTH       *
*                              *
* CYCLES: 91+                  *
* SIZE: 71 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCPY     MAC
         _MSTR ]1;WPAR1   ; {14C13B}
         LDA   ]2         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         JSR   SUBCOPY    ; {63C48B}
         <<<
*
*``````````````````````````````*
* SDEL          (NATHAN RIGGS) *
*                              *
* DELETE SUBSTRING FROM STRING *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE STRING          *
*  ]2 = SUBSTRING INDEX        *
*  ]3 = SUBSTRING LENGTH       *
*                              *
* CYCLES: 135+                 *
* SIZE: 79 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SDEL     MAC
         _MSTR ]1;WPAR1   ; {14C13B}
         LDA   ]2         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         JSR   SUBDEL     ; {107C56B}
         <<<
*
*``````````````````````````````*
* SINS          (NATHAN RIGGS) *
*                              *
* INSERT SUBSTRING INTO STRING *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = SUBSTRING ADDRESS      *
*  ]3 = SUBSTRING INDEX        *
*                              *
* CYCLES: 177+                 *
* SIZE: 111 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SINS     MAC
         _MSTR ]1;WPAR2   ; {14C13B}
         _MSTR ]2;WPAR1   ; {14C13B}
         LDA   ]3         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         JSR   SUBINS     ; {142C82B}
         <<<
*
*``````````````````````````````*
* STOK          (NATHAN RIGGS) *
*                              *
* THIS MACRO FINDS AN ARGUMENT *
* WITHIN A STRING THAT IS      *
* SEPARATED BY TOKENS AT A     *
* GIVEN INDEX.                 *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = DELIMITER / TOKEN      *
*  ]3 = ARGUMENT NUMBER        *
*                              *
* CYCLES: 182+                 *
* SIZE: 118 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
STOK     MAC
         _MLIT ]1;WPAR1   ; {14C13B}
         LDA   ]2         ; {4C3B}
         STA   WPAR2      ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         JSR   SUBTOK     ; {154C95B}
         <<<
*
*``````````````````````````````*
* SCNT          (NATHAN RIGGS) *
*                              *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = STRING ADDRESS         *
*  ]2 = DELIMITER / TOKEN      *
*                              *
* CYCLES: 88+                  *
* SIZE: 57 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
SCNT     MAC
         _MSTR ]1;WPAR1   ; {14C13B}
         LDA   ]2         ; {4C3B}
         STA   WPAR2      ; {3C2B}
         JSR   SUBCHARCNT ; {67C39B}
         <<<
