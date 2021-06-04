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
* DATE:      18-MAR-2021       *
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
* CYCLES: 355+                 *
* SIZE: 228 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM82    MAC
         _MLIT ]1;WPAR1   ; {16C12B} PARSE ARRAY ADDRESS
         LDA   ]2         ; {3C2B} X DIM
         STA   WPAR2      ; {3C2B}
         LDA   ]3         ; {3C2B} Y DIM
         STA   WPAR3      ; {3C2B}
         LDA   ]4         ; {3C2B} ELEMENT LENGTH
         STA   BPAR2      ; {3C2B}
         LDA   ]5         ; {3C2B} FILL VAL
         STA   BPAR1      ; {3C2B}
         JSR   ADIM82     ; {315C200B}
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
* CYCLES: 340+                 *
* SIZE: 222 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET82    MAC
         _MLIT ]1;WPAR1   ; {16C12B}
         LDA   ]2         ; {3C2B} X INDEX
         STA   BPAR1      ; {3C2B}
         LDA   ]3         ; {3C2B} Y INDEX
         STA   BPAR2      ; {3C2B}
         JSR   AGET82     ; {312C192B}
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
* CYCLES: 352+                 *
* SIZE: 223 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT82    MAC
         _MLIT ]1;WPAR1   ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; {16C12B} PARSE DEST ADDRESS
         LDA   ]3         ; {3C2B} X INDEX
         STA   BPAR1      ; {3C2B}
         LDA   ]4         ; {3C2B} Y INDEX
         STA   BPAR2      ; {3C2B}
         JSR   APUT82     ; {308C191B}
         <<<
*
