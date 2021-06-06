*
*``````````````````````````````*
* MAC.HIRES.ASM                *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* HIGH RESOLUTION GRAPHICS.    *
* FOR THE TIME BEING, THIS IS  *
* REQUIRED FOR MOST OF THE     *
* SUBROUTINES INCLUDED IN THE  *
* HIGH RESOLUTION COLLECTION.  *
*                              *
* AUTHOR:     NATHAN RIGGS     *
* CONTACT:    NATHAN.RIGGS@    *
*             OUTLOOK.COM      *
*                              *
* DATE:       05-JUN-2001      *
* ASSEMBLER:  MERLIN 8 PRO     *
* OS:         DOS 3.3          *
*                              *
* SUBROUTINE FILES NEEDED      *
*                              *
*  SUB.HRPLOT.ASM              *
*  SUB.HRCLEAR.ASM             *
*  SUB.HRBLINE.ASM             *
*  SUB.HRHLINE.ASM             *
*  SUB.HRVLINE.ASM             *
*  SUB.HRSTR.ASM               *
*  TBL.DB7.ASM                 *
*  TBL.HIRES.ASM               *
*  TBL.HRCHAR.ASM              *
*                              *
* LIST OF MACROS               *
*                              *
*  HBSET: SET HIRES BYTE       *
*  HBGET: GET HIRES BYTE       *
*  HVIEWPG: SET VIEWING PAGE   *
*  HWORKPG: SET WORKING PAGE   *
*  HPLOT  : PLOT HIRES POINT   *
*  HCLR   : FILL SCREEN COLOR  *
*  HLINE  : HORIZONTAL LINE    *
*  VLIN   : VERTICAL LINE      *
*  LINE   : ARBITRARY LINE     *
*  HCHAR  : PLOT HIRES CHAR    *
*  HSTR   : PLOT HIRES STRING  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* HBSET                        *
*                              *
* SET A BYTE ON THE HIRES PAGE *
* AT THE GIVEN X AND Y COORDS. *
* SINCE THIS IS IN BYTES AND   *
* NOT PIXELS, X IS BETWEEN 0   *
* AND 39 WHILE Y IS BETWEEN 0  *
* AND 191. THIS IS MOST USEFUL *
* FOR PLOTTING TILES IN GAMES, *
* ETC., AS IT IS MUCH FASTER   *
* THAN THE STANDARD PLOT       *
* THANKS TO HOW THE HIRES      *
* SCREEN FUNCTIONS.            *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X POSITION             *
*  ]2 = Y POSITION             *
*  ]3 = BYTE VALUE             *
*                              *
* CYCLES: 54                   *
* SIZE: 37 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HBSET    MAC
         LDY   ]1         ; {4C3B} HORIZONTAL BYTE NUMBER
         LDX   ]2         ; {4C3B} VERTICAL LINE NUMBER
         LDA   HGRHI,X    ; {5C3B} GET LINE ADDRESS
         STA   ZPWSYS+1   ; {4C3B}
         LDA   HGRLO,X    ; {5C3B}
         STA   ZPWSYS     ; {3C2B}
         LDA   HOFFSET    ; {4C3B} IS THERE A PAGE OFFSET?
         CMP   #0         ; {3C2B} NO, SO SKIP TO PLOT
         BEQ   ]BLOT      ; {3C2B}
         CLC              ; {2C1B} ELSE ADD PAGE OFFSET
         ADC   ZPWSYS+1   ; {4C3B}
         STA   ZPWSYS+1   ; {4C3B}
]BLOT
         LDA   ]3         ; {4C3B}
         STA   (ZPWSYS),Y ; {5C3B} PLOT TO MEMORY
         <<<
*
*``````````````````````````````*
* HBGET                        *
*                              *
* GET A BYTE FROM THE HIRES    *
* WORKING PAGE.                *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X POSITION             *
*  ]2 = Y POSITION             *
*                              *
* CYCLES: 49                   *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HBGET    MAC
         LDY   ]1         ; {4C3B} HORIZONTAL BYTE NUMBER
         LDX   ]2         ; {4C3B} VERTICAL LINE NUMBER
         LDA   HGRHI,X    ; {5C3B} GET LINE ADDRESS
         STA   ZPWSYS+1   ; {4C3B}
         LDA   HGRLO,X    ; {5C3B}
         STA   ZPWSYS     ; {4C3B}
         LDA   HOFFSET    ; {4C3B} IS THERE A PAGE OFFSET?
         CMP   #0         ; {3C2B} NO, SO SKIP TO GET BYTE
         BEQ   ]BGET      ; {3C2B} ELSE ADD OFFSET FIRST
         CLC              ; {2C1B}
         ADC   ZPWSYS+1   ; {3C2B}
         STA   ZPWSYS+1   ; {3C2B}
]BGET
         LDA   (ZPWSYS),Y ; {5C3B} RETURN BYTE IN .A
         <<<
*
*``````````````````````````````*
* HVIEWPG                      *
*                              *
* SET THE VIEWING HIRES PAGE.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = PAGE NUMBER (1 OR 2)   *
*                              *
* CYCLES: 19                   *
* SIZE: 14 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HVIEWPG  MAC
         LDA   ]1         ; {4C3B} GET PAGE NUMBER
         CMP   #1         ; {3C2B} IF IT'S ONE, THEN SET
         BNE   ]TWO       ; {3C2B} VIEWING PAGE TO PAGE ONE
]ONE
         BIT   HPAGE1     ; {3C2B}
         JMP   ]HVEXIT    ; {3C3B}
]TWO                      ;        ELSE, SET TO PAGE 2
         BIT   HPAGE2     ; {3C2B}
]HVEXIT
         <<<
*
*``````````````````````````````*
* HWORKPG                      *
*                              *
* SET THE WORKING HIRES PAGE.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = PAGE NUMBER (1 OR 2)   *
*                              *
* CYCLES: 27                   *
* SIZE: 20 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HWORKPG  MAC
         LDA   ]1         ; {4C3B} GET PAGE NUMBER
         CMP   #1         ; {3C2B} IF IT'S ONE, THEN SET
         BNE   ]WTWO      ; {3C2B} WORKING PAGE TO PAGE ONE
]WONE    LDA   #0         ; {3C2B}
         STA   HOFFSET    ; {4C3B}
         JMP   ]HWEXIT    ; {3C3B}
]WTWO    LDA   #$20       ; {3C2B} ELSE, SET TO PAGE 2
         STA   HOFFSET    ; {4C3B}
]HWEXIT
         <<<
*
*``````````````````````````````*
* HPLOT                        *
*                              *
* PLOT A POINT TO THE GIVEN    *
* HIRES WORKING PAGE.          *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X POSITION (2)         *
*  ]2 = Y POSITION (1)         *
*  ]3 = COLOR (1)              *
*                              *
* CYCLES: 348+                 *
* SIZE: 14 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HPLOT    MAC
         LDY   ]2         ; {4C3B}
         LDA   ]3         ; {4C3B} COLOR CODE
         STA   ZPB1       ; {3C2B}
         _AXLIT ]1        ; {8C6B}
         JSR   HRPLOT     ; {329C214B}
         <<<
*
*``````````````````````````````*
* HCLR                         *
*                              *
* FILL THE WORKING HIRES PAGE  *
* WITH THE SPECIFIED COLOR.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = COLOR                  *
*                              *
* CYCLES: 96+                  *
* SIZE: 5 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HCLR     MAC
         LDA   ]1         ; {4C3B}
         STA   ZPB1       ; {3C2B}
         JSR   HCLEAR     ; {89C0B}
         <<<
*
*``````````````````````````````*
* HLIN                         *
*                              *
* DRAW A HORIZONTAL LINE ON    *
* THE HIRES WORKING PAGE.      *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X ORIGIN (2)           *
*  ]2 = X DESTINATION (2)      *
*  ]3 = Y POSITION (1)         *
*  ]4 = COLOR                  *
*                              *
* CYCLES: 494+                 *
* SIZE: 34 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HLIN     MAC
         _MLIT ]1;ZPW5    ; {16C12B}
         _MLIT ]2;ZPW6    ; {16C12B}
         LDA   ]3         ; {4C3B}
         STA   PASSTAB    ; {3C2B}
         LDA   ]4         ; {4C3B}
         STA   PASSTAB+2  ; {3C2B}
         JSR   HRHLINE    ; {448C0B}
         <<<
*
*``````````````````````````````*
* VLIN                         *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = Y ORIGIN (1)           *
*  ]2 = Y DESTINATION (1)      *
*  ]3 = X POSITION (2)         *
*  ]4 = COLOR (1)              *
*                              *
* CYCLES: 449+                 *
* SIZE: 30 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
VLIN     MAC
         LDA   ]1         ; {4C3B}
         STA   ZPW5       ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   ZPW5+1     ; {3C2B}
         _MLIT ]3;ZPW6    ; {16C12B}
         LDA   ]4         ; {4C3B}
         STA   ZPB1       ; {3C2B}
         JSR   HRVLINE    ; {412C3B}
         <<<
*
*``````````````````````````````*
* LINE                         *
* DRAW A LINE ON THE WORKING   *
* HIRES PAGE FROM X0,Y0 TO     *
* X1,Y1 IN THE GIVEN COLOR.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X ORIGIN (2)           *
*  ]2 = Y ORIGIN (1)           *
*  ]3 = X DESTINATION (2)      *
*  ]4 = Y DESTINATION (1)      *
*  ]5 = COLOR                  *
*                              *
* CYCLES: 825+                 *
* SIZE: 42 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LINE     MAC
         _MLIT ]1;ZPW5    ; {16C12B}
         LDA   ]2         ; {4C3B}
         STA   PASSTAB    ; {3C2B}
         _MLIT ]3;ZPW6    ; {16C12B}
         LDA   ]4         ; {4C3B}
         STA   PASSTAB+2  ; {3C2B}
         LDA   ]5         ; {4C3B}
         STA   ZPB1       ; {3C2B}
         JSR   HRBLINE    ; {788C3B}
         <<<
*
*``````````````````````````````*
* HCHAR                        *
*                              *
* PLACE A CHARACTER AT THE     *
* GIVEN COORDINATES ON THE     *
* HIRES WORKING PAGE.          *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X POSITION (2)         *
*  ]2 = Y POSITION (1)         *
*  ]3 = BYTE TO PRINT (1)      *
*                              *
* CYCLES: 432+                 *
* SIZE: 296 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HCHAR    MAC
         HBSET ]1;]2+0;]3+0 ; {54C37B}
         HBSET ]1;]2+1;]3+1 ; {54C37B}
         HBSET ]1;]2+2;]3+2 ; {54C37B}
         HBSET ]1;]2+3;]3+3 ; {54C37B}
         HBSET ]1;]2+4;]3+4 ; {54C37B}
         HBSET ]1;]2+5;]3+5 ; {54C37B}
         HBSET ]1;]2+6;]3+6 ; {54C37B}
         HBSET ]1;]2+7;]3+7 ; {54C37B}
         <<<
*
*``````````````````````````````*
* HSTR                         *
*                              *
* PLOT A STRING OF CHARACTERS  *
* TO THE HIRES WORKING PAGE.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X POSITION (2)         *
*  ]2 = Y POSITION (1)         *
*  ]3 = STRING ADDRESS (2)     *
*  ]4 = OFFSET VALUE (1)       *
*                              *
* CYCLES: 767+                 *
* SIZE: 37 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
HSTR     MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         LDA   ]2         ; {4C3B}
         STA   ZPB1       ; {3C2B}
         _MSTR ]3;ZPW2    ; {16C12B}
         LDA   ]4         ; {4C3B}
         STA   ZPB2       ; {3C2B}
         JSR   HRSTR      ; {721C3B}
         <<<
