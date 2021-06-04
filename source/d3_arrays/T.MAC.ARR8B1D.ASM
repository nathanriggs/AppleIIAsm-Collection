*
*``````````````````````````````*
* MAC.ARR8B1D.ASM              *
*                              *
* LIBRARY OF MACROS FOR 8-BIT, *
* 1-DIMENSIONAL ARRAYS.        *
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
*  SUB.ADIM81                  *
*  SUB.AGET81                  *
*  SUB.APUT81                  *
*                              *
* LIST OF MACROS               *
*                              *
* DIM81: DIM 1D, 8BIT ARRAY    *
* GET81: GET ELEMENT IN 8BIT,  *
*        1D ARRAY.             *
* PUT81: PUT VALUE INTO 8BIT,  *
*        1D ARRAY AT INDEX     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DIM81         (NATHAN RIGGS) *
*                              *
* CREATE A ONE DIMENSIONAL,    *
* 8-BIT ARRAY AT THE GIVEN     *
* ADDRESS.                     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = ARRAY BYTE LENGTH      *
*  ]3 = ELEMENT BYTE LENGTH    *
*  ]4 = FILL VALUE             *
*                              *
* CYCLES: 234+                 *
* SIZE: 146 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM81    MAC
         _MLIT ]1;WPAR1   ; {16C12B} PARSE IF LITERAL OR NOT
         LDA   ]2         ; {3C2B} ARRAY LENGTH
         STA   WPAR2      ; {3C2B}
         LDA   ]3         ; {3C2B} ELEMENT LENGTH
         STA   WPAR3      ; {3C2B}
         LDA   ]4         ; {3C2B}
         STA   BPAR1      ; {3C2B} FILL VAL
         JSR   ADIM81     ; {200C132B}
         <<<
*
*``````````````````````````````*
* GET81         (NATHAN RIGGS) *
*                              *
* RETRIEVE A VALUE FROM THE    *
* GIVEN ARRAY AT THE SPECIFIED *
* ELEMENT INDEX AND STORE THE  *
* VALUE IN RETURN.             *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = ELEMENT INDEX          *
*                              *
* CYCLES: 193+                 *
* SIZE: 125 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET81    MAC
         _AXLIT ]1        ; {8C6B} PARSE ADDRESS
         LDY   ]2         ; {3C2B} ELEMENT INDEX
         JSR   AGET81     ; {182C117B}
         <<<
*
*``````````````````````````````*
* PUT81         (NATHAN RIGGS) *
*                              *
* PUTS THE DATA FOUND AT THE   *
* GIVEN ADDRESS INTO THE ARRAY *
* AT THE GIVEN INDEX.          *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = ARRAY ADDRESS          *
*  ]3 = ELEMENT INDEX          *
*                              *
* CYCLES: 216+                 *
* SIZE: 131 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT81    MAC
         _MLIT ]1;WPAR1   ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; {16C12B} PARSE DEST ADDRESS
         LDA   ]3         ; {3C2B} DEST INDEX
         STA   BPAR1      ; {3C2B}
         JSR   APUT81     ; {178C103B}
         <<<
*
