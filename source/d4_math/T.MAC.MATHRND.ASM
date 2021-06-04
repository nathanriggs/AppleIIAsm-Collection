*
*``````````````````````````````*
* MAC.MATHEXT.ASM              *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      03-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* SUB.RAND16.ASM               *
* SUB.RAND8.ASM                *
* SUB.RANDB.ASM                *
* SUB.PERCT16.ASM              *
* SUB.GCFCT16.ASM              *
* SUB.LCMUL16.ASM              *
*                              *
* LIST OF MACROS               *
*                              *
* RAND  : GET RANDOM BETWEEN   *
* RND16 : RANDOM WORD          *
* RND8  : RANDOM BYTE          *
* RNDMZ : RANDOMIZE            *
* RNDEOR: SET PRNG SEED + EOR  *
* PCT   : GET PERCENTAGE       *
* GCF   : GREATEST COMMON      *
*         FACTOR               *
* LCM   : LEAST COMMON         *
*         MULTIPLE             *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* RAND          (NATHAN RIGGS) *
*                              *
* RETURNS A RANDOM NUMBER IN   *
* REGISTER .A THAT IS BETWEEN  *
* THE LOW AND HIGH BOUNDARIES  *
* PASSED IN THE PARAMETERS.    *
*                              *
* NOTE THAT THIS RETURNS A     *
* BYTE, AND THUS ONLY DEALS    *
* WITH VALUES BETWEEN 0..255.  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = LOW BOUNDARY           *
*  ]2 = HIGH BOUNDARY          *
*                              *
* CYCLES: 263+                 *
* SIZE: 171 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RAND     MAC
         LDA   ]1         ; {4C3B} LOW
         LDX   ]2         ; {4C3B} HIGH
         JSR   RANDB      ; {255C165B}
         <<<
*
*``````````````````````````````*
* RND8          (NATHAN RIGGS) *
*                              *
* RETURN AN 8-BIT PSEUDORANDOM *
* NUMBER.                      *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 51+                  *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RND8     MAC
         JSR   RAND8      ; {51C30B}
         <<<
*
*``````````````````````````````*
* RND16         (NATHAN RIGGS) *
*                              *
* RETURN A 16-BIT PSEUDORANDOM *
* NUMBER.                      *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 101+                 *
* SIZE: 63 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RND16    MAC
         JSR   RAND16     ; {101C63B}
         <<<
*
*``````````````````````````````*
* RNDMZ         (NATHAN RIGGS) *
*                              *
* ASSIGN A SEED VALUE FOR THE  *
* PSEUDORANDOM NUMBER          *
* GENERATOR AS WELL AS AN EOR  *
* "MAGIC NUMBER." NO MATTER    *
* THE EOR VALUE PROVIDED, A    *
* VALUE WILL BE TAKEN FROM A   *
* TABLE THAT ALLOWS FOR A FULL *
* 65536 NON-REPEATED NUMBERS.  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SEED VALUE             *
*  ]2 = EOR NUMBER REFERENCE   *
*                              *
* CYCLES: 56+                  *
* SIZE: 35 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RNDMZ    MAC
         LDA   ]1         ; {4C3B}
         STA   RNDL       ; {3C2B}
         LDA   ]1+1       ; {4C3B}
         STA   RNDH       ; {3C2B}
*
         LDA   ]2         ; {4C3B}
         LSR              ; {2C1B}
         LSR              ; {2C1B}
         TAY              ; {2C1B}
         LDA   #]MAGNUM   ; {3C2B}
         STA   ADDR1      ; {3C2B}
         LDA   #]MAGNUM/$100 ; {3C2B}
         STA   ADDR1+1    ; {3C2B}
         LDA   (ADDR1),Y  ; {5C2B}
         STA   ]MAGEOR    ; {4C3B}
         INY              ; {2C1B}
         LDA   (ADDR1),Y  ; {5C2B}
         STA   ]MAGEOR+1  ; {4C3B}
         <<<
*
*``````````````````````````````*
* RNDEOR        (NATHAN RIGGS) *
*                              *
* DIRECTLY DETERMINE THE PRNG  *
* SEED AND EOR VALUES.         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SEED VALUE             *
*  ]2 = EOR MAGIC NUMBER VALUE *
*                              *
* CYCLES: 30+                  *
* SIZE: 22 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
RNDEOR   MAC
         LDA   ]1         ; {4C3B}
         STA   RNDL       ; {3C2B}
         LDA   ]1+1       ; {4C3B}
         STA   RNDH       ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   ]MAGEOR    ; {4C3B}
         LDA   ]2+1       ; {4C3B}
         STA   ]MAGEOR+1  ; {4C3B}
         <<<
*
*``````````````````````````````*
* PCT           (NATHAN RIGGS) *
*                              *
* GET THE EQUIVALENT PERCENT   *
* VALUE OF A FRACTION.         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMERATOR              *
*  ]2 = DENOMINATOR            *
*                              *
* CYCLES:                      *
* SIZE:                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*
*``````````````````````````````*
* GCF           (NATHAN RIGGS) *
*                              *
* GET THE GREATEST COMMON      *
* FACTOR OF TWO NUMBERS.       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FIRST NUMBER           *
*  ]2 = SECOND NUMBER          *
*                              *
* CYCLES:                      *
* SIZE:                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*
*``````````````````````````````*
* LCM           (NATHAN RIGGS) *
*                              *
* GET THE LEAST COMMON         *
* MULTIPLE OF TWO NUMBERS.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = FIRST NUMBER           *
*  ]2 = SECOND NUMBER          *
*                              *
* CYCLES:                      *
* SIZE:                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
