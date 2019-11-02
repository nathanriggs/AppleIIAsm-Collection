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
* DATE:      01-OCT-2019       *
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
* WHICH PAGE IS BEING VIEWD.   *
*                              *
* PARAMETERS:                  *
*                              *
*  ]1 = PAGE NUMBER            *
*                              *
* SAMPLE USAGE:                *
*                              *
*  LWORKPG #1                  *
*                              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LWORKPG  MAC
         LDA   ]1         ; LOAD PAGE NUMBER
         CMP   #2         ; IF IT IS NOT PAGE 2,
         BNE   ]__P1      ; THEN ASSUME PAGE 1
         LDA   #2         ; ELSE SET WORKING PAGE
         STA   LWP        ; TO PAGE 2
         JMP   ]EXIT
]__P1
         LDA   #1         ; SET WORKING PAGE TO PAGE 1
         STA   LWP
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
* SAMPLE USAGE:                *
*                              *
*  LVIEWPG #1                  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LVIEWPG  MAC
         LDA   ]1         ; GET PAGE NUMBER PASSED
         CMP   #2         ; IF IT ISN'T 2, THEN
         BNE   ]P1        ; ASSUME VIEWING PAGE 2
         BIT   VPG2       ; SET VIEWING PAGE TO PAGE 2
         JMP   ]EXIT
]P1
         BIT   VPG1       ; SET VIEW PAGE TO PAGE 1
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
* SAMPLE USAGE:                *
*                              *
*  LRGF                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGF     MAC
         BIT   LORES
         BIT   MIXEDOFF
         BIT   TEXTOFF    ; GRAPHICS SOFT SWITCH
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
* SAMPLE USAGE:                *
*                              *
*  LRGP                        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGP     MAC
         BIT   LORES
         BIT   MIXEDON
         BIT   TEXTOFF    ; GRAPHICS SOFT SWITCH
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
* SAMPLE USAGE:                *
*                              *
*  LFCLR #15                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LFCLR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   LRGFCLR
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LPCLR #15                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LPCLR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   LRGPCLR
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LPLOT #10;#10;#]WHITE       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LPLOT    MAC
         STY   SCRATCH
         LDX   ]1
         LDY   ]2
         LDA   ]3
         JSR   LRPLOT
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LLINE #1;#1;#10;#12;#5      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LLINE    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   WPAR2
         LDA   ]4
         STA   WPAR2+1
         LDA   ]5
         STA   BPAR1
         JSR   LRBLINE
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
* LCIRC #19;#19;#10;#5         *
*                              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LCIRC    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR2
         LDA   ]3
         STA   WPAR3
         LDA   ]4
         STA   BPAR2
         JSR   LRCIRCLE
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LVLIN #0;#10;#19;#6         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LVLIN    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   BPAR1
         LDA   ]4
         STA   BPAR2
         JSR   LRVLINE
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LHLIN #3;#20;#5;#10         *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LHLIN    MAC
         STY   SCRATCH
         LDA   ]1
         STA   WPAR1
         LDA   ]2
         STA   WPAR1+1
         LDA   ]3
         STA   BPAR1
         LDA   ]4
         STA   BPAR2
         JSR   LRHLINE
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LRGET  #10;#20              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LRGET    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         LDA   ]2
         STA   BPAR2
         JSR   LRGETPIX
         LDY   SCRATCH
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
* SAMPLE USAGE:                *
*                              *
*  LCHAR #5;#5;LR_A;#15        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
LCHAR    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         LDA   ]2
         STA   BPAR2
         LDA   #>]3
         STA   WPAR1+1
         LDA   #<]3
         STA   WPAR1
         LDA   ]4
         STA   BPAR3
         JSR   LRCHAR
         LDY   SCRATCH
         <<<
