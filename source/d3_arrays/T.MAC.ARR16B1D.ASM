*
*``````````````````````````````*
* MAC.ARR16B1D.ASM             *
*                              *
* A MACRO LIBRARY FOR 16-BIT   *
* 1-DIMENSIONAL ARRAYS.        *
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
*  SUB.ADIM161                 *
*  SUB.AGET161                 *
*  SUB.APUT161                 *
*                              *
* LIST OF MACROS               *
*                              *
* DIM161: DIM 1D, 16BIT ARRAY  *
* GET161: GET ELEMENT FROM 1D, *
*         16BIT ARRAY.         *
* PUT161: PUT VALUE INTO A 1D, *
*         16BIT ARRAY INDEX.   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DIM161        (NATHAN RIGGS) *
*                              *
* INITIALIZE A 16-BIT ARRAY    *
* WITH A SINGLE DIMENSION.     *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = ARRAY ADDRESS          *
*  ]2 = ARRAY BYTE LENGTH      *
*  ]3 = ELEMENT BYTE LENGTH    *
*  ]4 = ARRAY FILL VALUE       *
*                              *
* CYCLES: 271+                 *
* SIZE: 35 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM161   MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE ARRAY ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE BYTE LENGTH
         LDA   ]3         ; {3C2B}   ELEMENT LENGTH
         STA   ZPW3       ; {3C2B}
         LDA   ]4         ; {3C2B}   FILL VALUE
         STA   ZPB1       ; {3C2B}
         JSR   ADIM161    ; {227C3B}
         <<<
*
*``````````````````````````````*
* PUT161        (NATHAN RIGGS) *
*                              *
* SET THE VALUE OF AN INDEX    *
* ELEMENT IN A 16-BIT, ONE-    *
* DIMENSIONAL ARRAY.           *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = ARRAY ADDRESS          *
*  ]3 = ELEMENT INDEX          *
*                              *
* CYCLES: 238+                 *
* SIZE: 39 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT161   MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE ARRAY ADDRESS
         _MLIT ]3;ZPW3    ; {16C12B} PARSE INDEX
         JSR   APUT161    ; {190C3B}
         <<<
*
*``````````````````````````````*
* GET161        (NATHAN RIGGS) *
*                              *
* GET THE VALUE STORED IN THE  *
* ELEMENT OF A 16-BIT, ONE-    *
* DIMENSIONAL ARRAY.           *
*                              *
* PARAMETERS                   *
*                              *
*  ]1 = SOURCE ADDRESS         *
*  ]2 = ARRAY ADDRESS          *
*                              *
* CYCLES: 223+                 *
* SIZE: 27 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET161   MAC
         _MLIT ]1;ZPW1    ; {16C12B} PARSE SOURCE ADDRESS
         _MLIT ]2;ZPW2    ; {16C12B} PARSE INDEX
         JSR   AGET161    ; {191C03B}
         <<<
*
