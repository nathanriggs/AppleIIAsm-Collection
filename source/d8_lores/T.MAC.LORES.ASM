*``````````````````````````````*
* MAC.LORES                    *
*                              *
* THIS IS A MACRO LIBRARY FOR  *
* LOW RESOLUTION GRAPHICS.     *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      12-MAY-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES NEEDED      *
*                              *
*  SUB.LRBLINE                 *
*  SUB.LRCHAR                  *
*  SUB.LRCIRCLE                *
*  SUB.LRGETPIX                *
*  SUB.LRGFCLR                 *
*  SUB.LRGPCLR                 *
*  SUB.LRHLINE                 *
*  SUB.LRPLOT                  *
*  SUB.LRVLINE                 *
*                              *
* LIST OF MACROS               *
*                              *
* LWORKPG : SET DRAWING PAGE   *
* LVIEWPG : SET VIEWING PAGE   *
* LRGF    : INIT FULL SCREEN   *
* LRGP    : INIT PART SCREEN   *
* LFCLR   : CLEAR FULL SCREEN  *
* LPCLR   : CLEAR MIXED SCREEN *
* LPLOT   : PLT TO SCREEN      *
* LLINE   : DIAGONAL LINE      *
* LCIRC   : LORES CIRCLE       *
* LVLIN   : LORES VERT LINE    *
* LHLIN   : LORES HORIZ LINE   *
* LRGET   : GET COLOR OF PIXEL *
* LCHAR   : OUTPUT LORES TEXT  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* LWORKPG                      *
*                              *
* SET THE WORKING PAGE TO      *
* EITHER PAGE 1 OR PAGE 2.     *
* THIS MEANS THAT ALL COMMANDS *
* IN THE LORES LIBRARY WILL    *
* PLOT TO THIS PAGE, NO MATTER *
* WHICH PAGE IS BEING VIEWED.  *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = PAGE NUMBER            *
*                              *
* CYCLES: 27+                  *
* SIZE: 20 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LWORKPG  MAC
         LDA   ]1         ; {4C3B} LOAD PAGE NUMBER
         CMP   #2         ; {3C2B} IF IT IS NOT PAGE 2,
         BNE   ]__P1      ; {3C2B} THEN ASSUME PAGE 1
         LDA   #2         ; {3C2B} ELSE SET WORKING PAGE
         STA   LWP        ; {4C3B} TO PAGE 2
         JMP   ]EXIT      ; {3C3B}
]__P1
         LDA   #1         ; {3C2B} SET WORKING PAGE TO PAGE 1
         STA   LWP        ; {4C3B}
]EXIT
         <<<
*
*``````````````````````````````*
* LVIEWPG                      *
*                              *
* SET THE VIEWING PAGE FOR LOW *
* RSEOLUTION GRAPHICS.         *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = PAGE NUMBER            *
*                              *
* CYCLES: 21+                  *
* SIZE: 16 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LVIEWPG  MAC
         LDA   ]1         ; {4C3B} GET PAGE NUMBER PASSED
         CMP   #2         ; {3C2B} IF IT ISN'T 2, THEN
         BNE   ]P1        ; {3C2B} ASSUME VIEWING PAGE 2
         BIT   VPG2       ; {4C3B} SET VIEWING PAGE TO PAGE 2
         JMP   ]EXIT      ; {3C3B}
]P1
         BIT   VPG1       ; {4C3B} SET VIEW PAGE TO PAGE 1
]EXIT
         <<<
*
*``````````````````````````````*
* LRGF                         *
*                              *
* SET LOW-RESOLUTION MODE WITH *
* FULL-SCREEN 40X48 RESOLUTION *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 12                   *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGF     MAC
         BIT   LORES      ; {4C3B}
         BIT   MIXEDOFF   ; {4C3B}
         BIT   TEXTOFF    ; {4C3B} GRAPHICS SOFT SWITCH
         <<<
*
*``````````````````````````````*
* LRGP                         *
*                              *
* SETS THE GRAPHICS MODE TO    *
* LORES WITH FOR BOTTOM LINES  *
* OF TEXT.                     *
*                              *
* PARAMETERS:                  *
*                              *
*  NONE                        *
*                              *
* CYCLES: 12                   *
* SIZE: 9 BYTES                *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGP     MAC
         BIT   LORES      ; {4C3B}
         BIT   MIXEDON    ; {4C3B}
         BIT   TEXTOFF    ; {4C3B} GRAPHICS SOFT SWITCH
         <<<
*
*``````````````````````````````*
* LFCLR                        *
*                              *
* CLEAR THE LOW RESOLUTION     *
* SCREEN IN FULL SCREEN MODE   *
* WITH A GIVEN COLOR.          *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = FILL COLOR             *
*                              *
* CYCLES: 135+                 *
* SIZE: 92 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LFCLR    MAC
         LDA   ]1         ; {4C3B}
         JSR   LRGFCLR    ; {131C89B}
         <<<
*
*``````````````````````````````*
* LPCLR                        *
*                              *
* CLEAR A PARTIAL LORES SCREEN *
* WITH A GIVEN COLOR.          *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = FILL COLOR             *
*                              *
* CYCLES: 147+                 *
* SIZE: 100 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LPCLR    MAC
         LDA   ]1         ; {4C3B}
         JSR   LRGPCLR    ; {143C97B}
         <<<
*
*``````````````````````````````*
* LPLOT                        *
*                              *
* PLOT A PIXEL TO THE LORES    *
* SCREEN IN THE GIVEN COLOR AT *
* THE GIVEN COORDINATES.       *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X COORDINATE           *
*  ]2 = Y COORDINATE           *
*  ]3 = COLOR                  *
*                              *
* CYCLES: 148+                 *
* SIZE: 107 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LPLOT    MAC
         LDX   ]1         ; {4C3B}
         LDY   ]2         ; {4C3B}
         LDA   ]3         ; {4C3B}
         JSR   LRPLOT     ; {136C98B}
         <<<
*
*``````````````````````````````*
* LLINE                        *
*                              *
* CREATES A DIAGONAL LINE IN   *
* LORES GRAPHICS MODE VIA THE  *
* BRESSANHAM LINE ALGORITHM.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X ORIGIN               *
*  ]2 = X DESTINATION          *
*  ]3 = Y ORIGIN               *
*  ]4 = Y DESTINATION          *
*  ]5 = COLOR                  *
*                              *
* CYCLES: 439+                 *
* SIZE: 177 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LLINE    MAC
         LDA   ]1         ; {4C3B}
         STA   WPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   WPAR1+1    ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   WPAR2      ; {3C2B}
         LDA   ]4         ; {4C3B}
         STA   WPAR2+1    ; {3C2B}
         LDA   ]5         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         JSR   LRBLINE    ; {400C152B}
         <<<
*
*``````````````````````````````*
* LCIRC                        *
*                              *
* CREATE A CIRCLE IN LORES     *
* GRAPHICS MODE AT THE CENTER  *
* COORDINATES AND RADIUS GIVEN *
* AS WELL AS THE COLOR. BASED  *
* ON BRESSENHAM'S CIRCLE ALGO. *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = CENTER X POSITION      *
*  ]2 = CENTER Y POSITION      *
*  ]3 = CIRCLE RADIUS          *
*  ]4 = COLOR                  *
*                              *
* CYCLES: 2437+                *
* SIZE: 520 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LCIRC    MAC
         LDA   ]1         ; {4C3B}
         STA   WPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   WPAR2      ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   WPAR3      ; {3C2B}
         LDA   ]4         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         JSR   LRCIRCLE   ; {2410C500B}
         <<<
*
*``````````````````````````````*
* LVLIN                        *
*                              *
* CREATE A LORES VERTICAL LINE *
* FROM A Y ORIGIN TO DEST IN   *
* THE GIVEN COLOR.             *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = Y ORIGIN               *
*  ]2 = Y DESTINATION          *
*  ]3 = X COORDINATE           *
*  ]4 = COLOR                  *
*                              *
* CYCLES: 250+                 *
* SIZE: 164 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LVLIN    MAC
         LDA   ]1         ; {4C3B}
         STA   WPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   WPAR1+1    ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         LDA   ]4         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         JSR   LRVLINE    ; {222C144B}
         <<<
*
*``````````````````````````````*
* LHLIN                        *
*                              *
* CREATE A HORIZONTAL LINE IN  *
* LORES MODE FROMA GIVEN X     *
* ORIGIN TO DESTINATION AT A   *
* Y COORDINATE, IN GIVEN COLOR *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X ORIGIN               *
*  ]2 = X DESTINATION          *
*  ]3 = Y COORDINATE           *
*  ]4 = COLOR                  *
*                              *
* CYCLES: 246+                 *
* SIZE: 161 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LHLIN    MAC
         LDA   ]1         ; {4C3B}
         STA   WPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   WPAR1+1    ; {3C2B}
         LDA   ]3         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         LDA   ]4         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         JSR   LRHLINE    ; {218C141B}
         <<<
*
*``````````````````````````````*
* LRGET                        *
*                              *
* GET THE COLOR OF THE LORES   *
* PIXEL AT THE GIVEN COORDS.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X COORDINATE           *
*  ]2 = Y COORDINATE           *
*                              *
* CYCLES: 110+                 *
* SIZE: 71 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGET    MAC
         LDA   ]1         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   BPAR2      ; {3C2B}
         JSR   LRGETPIX   ; {96C61B}
         <<<
*
*``````````````````````````````*
* LCHAR                        *
*                              *
* PRINT A LORES CHARACTER TO   *
* LORES SCREEN AT A GIVE COLOR *
* AT THE GIVEN COORDINATES.    *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = X COORDINATE           *
*  ]2 = Y COORDINATE           *
*  ]3 = ADDRESS OF 3-BYTE CHAR *
*  ]4 = CHARACTER COLOR        *
*                              *
* CYCLES: 441+                 *
* SIZE: 439 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LCHAR    MAC
         LDA   ]1         ; {4C3B}
         STA   BPAR1      ; {3C2B}
         LDA   ]2         ; {4C3B}
         STA   BPAR2      ; {3C2B}
*LDA #>]3
*STA WPAR1+1
*LDA #<]3
*STA WPAR1
         _MLIT ]3;WPAR1   ; {16C12B}
         LDA   ]4         ; {4C3B}
         STA   BPAR3      ; {3C2B}
         JSR   LRCHAR     ; {403C412B}
         <<<
