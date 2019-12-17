*
*``````````````````````````````*
* MAC.ARRAYS                   *
*                              *
* A MACRO LIBRARY FOR 8BIT AND *
* 16BIT ARRAYS, BOTH IN ONE    *
* DIMENSION AND TWO DIMENSIONS *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      13-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
*    SUB.ADIM161               *
*    SUB.ADIM162               *
*    SUB.ADIM81                *
*    SUB.ADIM82                *
*    SUB.AGET161               *
*    SUB.AGET162               *
*    SUB.AGET81                *
*    SUB.AGET82                *
*    SUB.APUT161               *
*    SUB.APUT162               *
*    SUB.APUT81                *
*    SUB.APUT82                *
*                              *
* LIST OF MACROS               *
*                              *
* DIM81:  DIM 1D, 8BIT ARRAY   *
* GET81:  GET ELEMENT IN 8BIT, *
*         1D ARRAY.            *
* PUT81:  PUT VALUE INTO ARRAY *
*         AT SPECIFIED INDEX   *
* DIM82:  DIM A 2D, 8BIT ARRAY *
* GET82:  GET ELEMENT IN 8BIT, *
*         2D ARRAY             *
* PUT82:  PUT VALUE INTO ARRAY *
*         AT SPECIFIED INDEX   *
* DIM161: DIM 1D, 16BIT ARRAY  *
* GET161: GET ELEMENT FROM 1D, *
*         16BIT ARRAY.         *
* PUT161: PUT VALUE INTO A 1D, *
*         16BIT ARRAY INDEX.   *
* DIM162: DIM 2D, 16BIT ARRAY  *
* GET162: GET ELEMENT FROM 2D, *
*         16BIT ARRAY.         *
* PUT162: PUT VALUE INTO A 2D, *
*         16BIT ARRAY INDEX.   *
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
* SAMPLE USAGE                 *
*                              *
*  DIM81 #$300;#10;#2;#0       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM81    MAC
         _MLIT ]1;WPAR1   ; PARSE IF LITERAL OR NOT
         LDA   ]2         ; ARRAY LENGTH
         STA   WPAR2
         LDA   ]3         ; ELEMENT LENGTH
         STA   WPAR3
         LDA   ]4
         STA   BPAR1      ; FILL VAL
         JSR   ADIM81
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
* SAMPLE USAGE                 *
*                              *
*  GET81 #$300;#5              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET81    MAC
         _AXLIT ]1        ; PARSE ADDRESS
         LDY   ]2         ; ELEM INDEX
         JSR   AGET81
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
* SAMPLE USAGE                 *
*                              *
*  PUT81 #$300;#$3A0;#5        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT81    MAC
         _MLIT ]1;WPAR1   ; PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; PARSE DEST ADDRESS
         LDA   ]3         ; DEST INDEX
         STA   BPAR1
         JSR   APUT81
         <<<
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
* SAMPLE USAGE                 *
*                              *
*  DIM82 #$300;#4;#4;#1;#0     *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM82    MAC
         _MLIT ]1;WPAR1   ; PARSE ARRAY ADDRESS
         LDA   ]2         ; X DIM
         STA   WPAR2
         LDA   ]3         ; Y DIM
         STA   WPAR3
         LDA   ]4         ; ELEMENT LENGTH
         STA   BPAR2
         LDA   ]5         ; FILL VAL
         STA   BPAR1
         JSR   ADIM82
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
* SAMPLE USAGE                 *
*                              *
*  GET82 #$300;#2;#3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET82    MAC
         _MLIT ]1;WPAR1
         LDA   ]2         ; X INDEX
         STA   BPAR1
         LDA   ]3         ; Y INDEX
         STA   BPAR2
         JSR   AGET82
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
* SAMPLE USAGE                 *
*                              *
*  PUT82 #$300;$3A0;#2;#3      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT82    MAC
         _MLIT ]1;WPAR1   ; PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; PARSE DEST ADDRESS
         LDA   ]3         ; X INDEX
         STA   BPAR1
         LDA   ]4         ; Y INDEX
         STA   BPAR2
         JSR   APUT82
         <<<
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
* SAMPLE USAGE                 *
*                              *
*  DIM161 #$300;#10;#2;#$00    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM161   MAC
         _MLIT ]1;WPAR1   ; PARSE ARRAY ADDRESS
         _MLIT ]2;WPAR2   ; PARSE BYTE LENGTH
         LDA   ]3         ; ELEMENT LENGTH
         STA   WPAR3
         LDA   ]4         ; FILL VALUE
         STA   BPAR1
         JSR   ADIM161
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
* SAMPLE USAGE                 *
*                              *
*  PUT161 #$300;$3A0;#5        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT161   MAC
         _MLIT ]1;WPAR1   ; PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; PARSE ARRAY ADDRESS
         _MLIT ]3;WPAR3   ; PARSE INDEX
         JSR   APUT161
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
* SAMPLE USAGE                 *
*                              *
*  GET161 #$3A0;#300           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET161   MAC
         _MLIT ]1;WPAR1   ; PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; PARSE INDEX
         JSR   AGET161
         <<<
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
* SAMPLE USAGE                 *
*                              *
*  DIM162 #$300;#4;#4;#1;#0    *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DIM162   MAC
         _MLIT ]1;WPAR3   ; PARSE ARRAY ADDRESS
         _MLIT ]2;WPAR1   ; PARSE X DIMENSION
         _MLIT ]3;WPAR2   ; PARSE Y DIMENSION
         LDA   ]4         ; ELEMENT LENGTH
         STA   BPAR1
         LDA   ]5         ; FILL VAL
         STA   BPAR2
         JSR   ADIM162
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
* SAMPLE USAGE                 *
*                              *
*  PUT162 #$3A0;#280;#2        *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
PUT162   MAC
         _MLIT ]1;WPAR1   ; PARSE SOURCE ADDRESS
         _MLIT ]2;WPAR2   ; PARSE ARRAY ADDRESS
         _MLIT ]3;WPAR3   ; PARSE X INDEX
         _MLIT ]4;ADDR1   ; PARSE Y INDEX
         JSR   APUT162
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
* SAMPLE USAGE                 *
*                              *
*  GET162 #$300;#1000;#10      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
GET162   MAC
         _MLIT ]1;WPAR1   ; PARSE ARAY ADDRESS
         _MLIT ]2;WPAR2   ; PARSE X INDEX
         _MLIT ]3;WPAR3   ; PARSE Y INDEX
         JSR   AGET162
         <<<
*
