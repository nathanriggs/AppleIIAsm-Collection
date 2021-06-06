*
*``````````````````````````````*
* MAC.ARR8B2D.ASM              *
*                              *
* A MACRO LIBRARY FOR 8BIT,    *
* 2-DIMENSIONAL ARRAYS.        *
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
*  SUB.ADIM82                  *
*  SUB.AGET82                  *
*  SUB.APUT82                  *
*                              *
* LIST OF MACROS               *
*                              *
* DIM82: DIM A 2D, 8BIT ARRAY  *
* GET82: GET ELEMENT IN 8BIT,  *
*        2D ARRAY              *
* PUT82: PUT VALUE INTO 8BIT,  *
*        2D ARRAY AT INDEX     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DIM82         (NATHAN RIGGS) *
*                              *
* INITIALIZES AN 8-BIT ARRAY   *
* WITH TWO DIMENSIONS.         *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = X DIMENSION            *
*  ]3 = Y DIMENSION            *
*  ]4 = ELEMENT SIZE           *
*  ]5 = FILL VALUE             *
*                              *
* CYCLES: 359+                 *
* SIZE: 35 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM82    MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE ARRAY ADDRESS
         LDA   ]2         ; {4C3B}   X DIM
         STA   ZPW2       ; {3C2B}
         LDA   ]3         ; {4C3B}   Y DIM
         STA   ZPW3       ; {3C2B}
         LDA   ]4         ; {4C3B}   ELEMENT LENGTH
         STA   ZPB2       ; {3C2B}
         LDA   ]5         ; {4C3B}   FILL VAL
         STA   ZPB1       ; {3C2B}
         JSR   ADIM82     ; {315C3B}
         <<<
*
*``````````````````````````````*
* GET82         (NATHAN RIGGS) *
*                              *
* RETRIEVE VALUE FROM ELEMENT  *
* OF 8-BIT, TWO DIMENSIONAL    *
* ARRAY.                       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = X INDEX                *
*  ]3 = Y INDEX                *
*                              *
* CYCLES: 342+                 *
* SIZE: 25 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET82    MAC
         _MLIT ]1;ZPW1    ; {16C12B}
         LDA   ]2         ; {4C3B}   X INDEX
         STA   ZPB1       ; {3C2B}
         LDA   ]3         ; {4C3B}   Y INDEX
         STA   ZPB2       ; {3C2B}
         JSR   AGET82     ; {312C3B}
         <<<
*
*``````````````````````````````*
* PUT82         (NATHAN RIGGS) *
*                              *
* SET VALUE OF AN ELEMENT IN   *
* AN 8-BIT, TWO-DIMENSIONAL    *
* ARRAY.                       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = DEST ARRAY ADDRESS     *
*  ]3 = ELEMENT X INDEX        *
*  ]4 = Y INDEX                *
*                              *
* CYCLES: 354+                 *
* SIZE: 37 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT82    MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE DEST ADDRESS
         LDA   ]3         ; {4C3B}   X INDEX
         STA   ZPB1       ; {3C2B}
         LDA   ]4         ; {4C3B} Y INDEX
         STA   ZPB2       ; {3C2B}
         JSR   APUT82     ; {308C3B}
         <<<
*
