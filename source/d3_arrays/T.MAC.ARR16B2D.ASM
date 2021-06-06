*
*``````````````````````````````*
* MAC.ARR16B2D.ASM             *
*                              *
* A MACRO LIBRARY FOR 16-BIT,  *
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
*  SUB.ADIM162                 *
*  SUB.AGET162                 *
*  SUB.APUT162                 *
*                              *
* LIST OF MACROS               *
*                              *
* DIM162: DIM 2D, 16BIT ARRAY  *
* GET162: GET ELEMENT FROM 2D, *
*         16BIT ARRAY.         *
* PUT162: PUT VALUE INTO A 2D, *
*         16BIT ARRAY INDEX.   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DIM162        (NATHAN RIGGS) *
*                              *
* INITIALIZE A 16-BIT, TWO-    *
* DIMENSIONAL ARRAY.           *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = X DIMENSION            *
*  ]3 = Y DIMENSION            *
*  ]4 = ELEMENT SIZE           *
*  ]5 = FILL VALUE             *
*                              *
* CYCLES: 466+                 *
* SIZE: 49 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM162   MAC
         _MLIT ]1;ZPW3    ; {16C12B} PARSE ARRAY ADDRESS
         _MLIT ]2;ZPW1    ; {16C12B} PARSE X DIMENSION
         _MLIT ]3;ZPW2    ; {16C12B} PARSE Y DIMENSION
         LDA   ]4         ; {4C3B}   ELEMENT LENGTH
         STA   ZPB1       ; {3C2B}
         LDA   ]5         ; {4C3B}   FILL VAL
         STA   ZPB2       ; {3C2B}
         JSR   ADIM162    ; {404C3B}
         <<<
*
*``````````````````````````````*
* PUT162        (NATHAN RIGGS) *
*                              *
* SET VALUE OF AN ELEMENT IN   *
* A 16-BIT, TWO-DIMENSIONAL    *
* ARRAY.                       *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = DEST ARRAY ADDRESS     *
*  ]3 = ELEMENT X INDEX        *
*  ]4 = Y INDEX                *
*                              *
* CYCLES: 448+                 *
* SIZE: 51 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT162   MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE ARRAY ADDRESS
         _MLIT ]3;ZPW3    ; {16C12B} PARSE X INDEX
         _MLIT ]4;ZPW4    ; {16C12B} PARSE Y INDEX
         JSR   APUT162    ; {384C3B}
         <<<
*
*``````````````````````````````*
* GET162        (NATHAN RIGGS) *
*                              *
* GET THE VALUE STORED AT AN   *
* ELEMENT OF A 16-BIT, TWO-    *
* DIMENSIONAL ARRAY.           *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = ELEMENT X INDEX        *
*  ]3 = Y INDEX                *
*                              *
* CYCLES: 436+                 *
* SIZE: 39 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET162   MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE ARAY ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE X INDEX
         _MLIT ]3;ZPW3    ; {16C12B} PARSE Y INDEX
         JSR   AGET162    ; {388C3B}
         <<<
*
