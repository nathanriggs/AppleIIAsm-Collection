*
*``````````````````````````````*
* MAC.M8BY.ASM                 *
*                              *
* THESE MACROS CONSIST OF 8BIT *
* DIVISION BY A CONSTANT       *
* ROUTINES. WHILE SOME OF      *
* THESE ARE TRIVIAL, MOST HAVE *
* BEEN TAKEN FROM THE WORK OF  *
* OMEGAMATRIX AS SHARED ON     *
* THE NESDEV FORUMS. AS SUCH,  *
* LICENSING MAY VARY; HOWEVER, *
* SINCE THEY WERE FREELY       *
* SHARED, IT SHOULD BE SAFELY  *
* ASSUMED THAT THEY ARE PUBLIC *
* DOMAIN.                      *
*                              *
* NOTE: THESE ARE ^HIGHLY^     *
* OPTIMIZED BY BRUTE FORCE ON  *
* A MODERN SYSTEM, AND SOME OF *
* THESE MAY EXPLOIT QUIRKS OF  *
* THE 6502. TO SUM THAT UP:    *
* THESE ARE NOT ROUTINES THAT  *
* ARE EASILY CUT THROUGH BY A  *
* NOVICE, EVEN THOUGH THEY     *
* LOOK SIMPLE ENOUGH.          *
*                              *
* AUTHOR:   THE INTERNET       *
* (COPIED FROM OMEGAMATRIX)    *
*                              *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* LIST OF MACROS               *
*                              *
*  D8BY2  : DIVIDE BY TWO      *
*  D8BY3  : DIVIDE BY THREE    *
*  D8BY4  : DIVIDE BY FOUR     *
*  D8BY5  : DIVIDE BY FIVE     *
*  D8BY6  : DIVIDE BY SIX      *
*  D8BY7  : DIVIDE BY SEVEN    *
*  D8BY8  : DIVIDE BY EIGHT    *
*  D8BY9  : DIVIDE BY NINE     *
*  D8BY10 : DIVIDE BY TEN      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* D8BY2         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY TWO   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 6                    *
* SIZE: 4 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY2    MAC
         LDA   ]1         ; {4C3B}
         LSR              ; {2C1B} SHIFT BITS RIGHT IN .A
                          ; TO DIVIDE BY TWO. ANSWER REMAINS
                          ; IN .A REGISTER
         <<<
*
*``````````````````````````````*
* D8BY3         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY THREE *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 29                   *
* SIZE: 19 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY3    MAC
         LDA   ]1         ; {4C3B}
         CLC              ; {2C2B} CLEAR THE CARRY
         STA   ZPB1       ; {3C2B} STORE ORIG NUM IN Z PAGE
         LSR              ; {2C1B} DIVIDE .A BY TWO
         ADC   #21        ; {2C2B} ADD 21 AS A CORRECTION
         LSR              ; {2C1B} DIVIDE .A BY TWO
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL VALUE TO NEW
         ROR              ; {2C1B} ROTATE A TO NEXT BIT
         LSR              ; {2C1B} SHIFT RIGHT TO DIVIDE BY 2
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL VALUE
         ROR              ; {2C1B} ROTATE .A TO NEXT BIT
         LSR              ; {2C1B} DIVIDE BY 2
         <<<
*
*``````````````````````````````*
* D8BY4         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY FOUR  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 8                    *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY4    MAC
         LDA   ]1         ; {4C3B}
         LSR              ; {2C1B} DIVIDE .A BY TWO
         LSR              ; {2C1B} DIVIDE .A BY TWO
         <<<
*
*``````````````````````````````*
* D8BY5         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY FIVE  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 34                   *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY5    MAC
         LDA   ]1         ; {4C3B}
         STA   ZPB1       ; {3C2B} STORE ORIG ON ZERO PAGE
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   #13        ; {2C2B} ADD 13 AS A CORRECTIVE
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL
         ROR              ; {2C1B} ROTATE BITS RIGHT
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL VALUE
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         <<<
*
*``````````````````````````````*
* D8BY6         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY SIX   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 36                   *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY6    MAC
         LDA   ]1         ; {4C3B}
         CLC              ; {2C1B}
         LSR              ; {2C1B} DIVIDE .A BY TWO
         STA   ZPB1       ; {3C2B} STORE IN ZERO PAGE
         LSR              ; {2C1B} DIVIDE AGAIN
         LSR              ; {2C1B} DIVIDE AGAIN
         ADC   ZPB1       ; {3C2B} ADD VALUE/2
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   ZPB1       ; {3C2B} ADD VALUE/2
         ROR              ; {2C1B} ROTATE RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   ZPB1       ; {3C2B} ADD VALUE/2
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         <<<
*
*``````````````````````````````*
* D8BY7         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY SEVEN *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 33                   *
* SIZE: 19 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY7    MAC
         LDA   ]1         ; {4C3B}
         CLC              ; {2C1B} CLEAR CARRY
         STA   ZPB1       ; {3C2B} STORE NUMBER IN ZERO PAGE
         LSR              ; {2C1B} DIVIDE .A BY TWO
         LSR              ; {2C1B} AGAIN
         LSR              ; {2C1B} AGAIN
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         <<<
*
*``````````````````````````````*
* D8BY8         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY EIGHT *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 10                   *
* SIZE: 6 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY8    MAC
         LDA   ]1         ; {4C3B}
         LSR              ; {2C1B} DIVIDE .A BY TWO (2)
         LSR              ; {2C1B} DIVIDE BY TWO (4)
         LSR              ; {2C1B} DIVIDE BY TWO (8)
         <<<
*
*``````````````````````````````*
* D8BY9         (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY NINE  *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 36                   *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY9    MAC
         LDA   ]1         ; {4C3B}
         CLC              ; {2C1B} CLEAR CARRY
         STA   ZPB1       ; {3C2B} STORE .A IN ZERO PAGE
         LSR              ; {2C1B} DIVIDE .A BY TWO
         LSR              ; {2C1B} AGAIN
         LSR              ; {2C1B} AGAIN
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER
         ROR              ; {2C1B} ROTATE BITS RIGHT
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER
         ROR              ; {2C1B} ROTATE BITS RIGHT
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL NUMBER
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         <<<
*
*``````````````````````````````*
* D8BY10        (NATHAN RIGGS) *
*                              *
* DIVIDE 8-BIT NUMBER BY TEN   *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = NUMBER TO DIVIDE       *
*                              *
* CYCLES: 36                   *
* SIZE: 21 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
D8BY10   MAC
         CLC              ; {2C1B} CLEAR CARRY
         LDA   ]1         ; {4C3B}
         LSR              ; {2C1B} DIVIDE .A BY TWO
         STA   ZPB1       ; {3C2B} STORE IN ZERO PAGE
         LSR              ; {2C1B} DIVIDE .A BY TWO
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL/2
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL/2
         ROR              ; {2C1B} ROTATE BITS RIGHT
         ADC   ZPB1       ; {3C2B} ADD ORIGINAL/2
         ROR              ; {2C1B} ROTATE BITS RIGHT
         LSR              ; {2C1B} DIVIDE BY TWO
         LSR              ; {2C1B} DIVIDE BY TWO
         <<<
