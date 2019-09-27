*
*``````````````````````````````*
* DEMO.ARRAYS                  *
*                              *
* A DECIDEDLY NON-EXHAUSTIVE   *
* DEMO OF ARRAY FUNCTIONALITY  *
* IN THE APPLEIIASM LIBRARY.   *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      14-JUL-2019       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** ASSEMBLER DIRECTIVES
*
         CYC   AVE
         EXP   OFF
         TR    ON
         DSK   DEMO.ARRAYS
         OBJ   $BFE0
         ORG   $6000
*
*``````````````````````````````*
*  TOP INCLUDES (HOOKS,MACROS) *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.HEAD.REQUIRED
         USE   MIN.MAC.REQUIRED
         USE   MIN.MAC.ARRAYS
         PUT   MIN.HOOKS.ARRAYS
*
*``````````````````````````````*
*      PROGRAM MAIN BODY       *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]VAR1    EQU   $300
]COUNT1  EQU   $320
]ARRAY1  EQU   $4000
]ARRAY2  EQU   $5000
]HOME    EQU   $FC58
*
         JSR   ]HOME
         _PRN  "1D AND 2D 8BIT/16BIT ARRAYS",8D
         _PRN  "===========================",8D8D
         _PRN  "THIS MACRO LIBRARY AND VARIOUS",8D
         _PRN  "SUBROUTINES ARE USED FOR THE CREATION,",8D
         _PRN  "ACCESS AND MANAGEMENT OF ARRAYS THAT",8D
         _PRN  "CAN BE EITHER ONE OR TWO DIMENSIONS",8D
         _PRN  "AND CAN HAVE EITHER 255 ELEMENTS PER",8D
         _PRN  "DIMENSION IN THE CASE OF 8BIT ARRAYS OR",8D
         _PRN  "UP TO 65,530 ELEMENTS IN THE CASE OF",8D
         _PRN  "16BIT ARRAYS--AT LEAST, THEORETICALLY.",8D
         _PRN  "SINCE THAT WOULD TAKE UP THE ENTIRETY",8D
         _PRN  "OF RAM ON MOST APPLE ][ COMPUTERS,",8D
         _PRN  "HAVING THAT MANY ELEMENTS IS NOT LIKELY.",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "AT LEAST IN THIS LIBRARY, ARRAYS",8D
         _PRN  "ARE FAIRLY SIMPLE DATA STRUCTURES.",8D
         _PRN  "EVERY ARRAY HAS A HEADER THAT SPECIFIES",8D
         _PRN  "THE NUMBER OF ELEMENTS PER DIMENSION",8D
         _PRN  "AS WELL AS THE LENGTH OF EACH ELEMENT.",8D
         _PRN  "THESE ARE SET WITH THE DIM MACROS AND",8D
         _PRN  "SUBROUTINES:",8D8D
         _PRN  "DIM81: INIT 1-DIMENSIONAL 8BIT ARRAY",8D
         _PRN  "DIM82: INIT 2-DIMENSIONAL 8BIT ARRAY",8D
         _PRN  "DIM161: INIT 1-DIMENSIONAL 16BIT ARRAY",8D
         _PRN  "DIM162: INIT 2-DIMENSIONAL 16BIT ARRAY",8D8D
         _WAIT
         _PRN  "IF YOU NEED FEWER THAN 255 ELEMENTS",8D
         _PRN  "IN A DIMENSION, I HIGHLY SUGGEST",8D
         _PRN  "USING THE 8BIT ARRAY MACROS AND,",8D
         _PRN  "SUBROUTINES, AS THERE IS A SIGNIFICANT",8D
         _PRN  "SAVING OF BYTES AND CPU CYCLES.",8D
         _WAIT
         JSR   ]HOME
         _PRN  "LIKE THE DIM MACROS, EACH ARRAY",8D
         _PRN  "TYPE ALSO HAS A GET AND PUT MACRO AND",8D
         _PRN  "SET OF SUBROUTINES DEDICATED TO IT:",8D8D
         _WAIT
         _PRN  "GET81: RETRIEVE THE DATA IN A GIVEN",8D
         _PRN  "       ELEMENT AND PUT IN RETURN.",8D
         _PRN  "GET82: RETRIEVE DATA FROM ELEMENT AT",8D
         _PRN  "       X,Y AND PUT IN RETURN.",8D
         _PRN  "GET161: GET DATA FROM 16-BIT ELEMENT",8D
         _PRN  "        AND PUT IN RETURN.",8D
         _PRN  "GET162: GET DATA FROM ELEMENT AT 16BIT",8D
         _PRN  "        X,Y LOCATION AND PUT IN RETURN.",8D8D
         _WAIT
         _PRN  "PUT81: PUT DATA FROM SOURCE LOCATION IN",8D
         _PRN  "       AN ARRAY'S ELEMENT.",8D
         _PRN  "PUT82: PUT DATA FROM SOURCE ADDRESS IN",8D
         _PRN  "       ARRAY ELEMENT AT X,Y.",8D
         _PRN  "PUT161: PUT DATA FROM SOURCE ADDRESS IN",8D
         _PRN  "        16-BIT ARRAY ELEMENT.",8D
         _PRN  "PUT162: PUT DATA FROM SOURCE INTO 16BIT",8D
         _PRN  "        ARRAY ELEMENT AT X,Y.",8D8D
         _WAIT
*
         JSR   ]HOME
         _PRN  "ONE-DIMENSIONAL, 8-BIT ARRAYS",8D
         _PRN  "=============================",8D8D
         _PRN  "DIM81, GET81, AND PU81 ARE USED FOR",8D
         _PRN  "1D ARRAYS THAT DON'T NEED MORE THAN",8D
         _PRN  "A SINGLE DIMENSION OF LESS THAN 255",8D
         _PRN  "ELEMENTS. FOR MANY USES, THIS SUFFICES;",8D
         _PRN  "THE FACT THAT THE APPLE ][ IS AN 8-BIT",8D
         _PRN  "COMPUTER ATTESTS TO THIS FACT.",8D8D
         _WAIT
         _PRN  "HOWEVER, THERE ARE A NUMBER OF CASES ",8D
         _PRN  "IN WHICH 8-BIT INDEXING ISN'T ENOUGH.",8D
         _PRN  "AGAIN, MAKE THE CHOICE BASED ON NEED,",8D
         _PRN  "NOT CONVENIENCE. IF 255 ELEMENTS IS",8D
         _PRN  "ENOUGH TO ACCOMPLISH THE TASK, USE ",8D
         _PRN  "THESE MACROS AND SUBROUTINES.",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "EIGHT BITS AND ONE DIMENSION: DIM",8D
         _PRN  "=================================",8D8D
         _PRN  "THE DIM81 MACRO CREATES A THREE",8D
         _PRN  "BYTE HEADER THAT HOLDS, IN ORDER:",8D8D
         _PRN  "BYTE 0: NUMBER OF ELEMENTS",8D
         _PRN  "BYTE 1: ELEMENT SIZE",8D8D
         _PRN  "THE GET81 AND PUT81 ROUTINES USE ",8D
         _PRN  "THIS HEADER TO KNOW HOW  MUCH DATA",8D
         _PRN  "TO READ AND WRITE FROM AN ELEMENT.",8D
         _PRN  "BASIC CHECKS AGAINST THE INTENDED",8D
         _PRN  "NUMBER OF ELEMENTS CAN ALSO BE DONE",8D
         _PRN  "USING THIS HEADER.",8D8D
         _WAIT
         _PRN  "   DIM81 #ARRAY1;#10;#2;#$FF",8D8D
         _PRN  "CREATES AN 8BIT, 1D ARRAY AT THE",8D
         _PRN  "ADDRESS OF #ARRAY1 WITH TEN ELEMENTS",8D
         _PRN  "OF 2 BYTES EACH. ALL ELEMENTS ARE",8D
         _PRN  "FILLED WITH THE LAS PARAMETER, $FF."
         _WAIT
         JSR   ]HOME
         _PRN  "WE CAN DUMP #ARRAY1 BEFORE AND",8D
         _PRN  "AFTER USING DIM81 TO SHOW THE",8D
         _PRN  "DIFFERENCE:",8D8D
         _PRN  "BEFORE:",8D8D
         DUMP  #]ARRAY1;#2
         DUMP  #]ARRAY1+2;#10
         DUMP  #]ARRAY1+12;#10
         _PRN  " ",8D8D
         _WAIT
         DIM81 #]ARRAY1;#10;#2;#$FF
         _PRN  "AFTER:",8D8D
         DUMP  #]ARRAY1;#2
         DUMP  #]ARRAY1+2;#10
         DUMP  #]ARRAY1+12;#10
         _WAIT
         JSR   ]HOME
         _PRN  "8 BITS AND ONE DIMENSION: PUT",8D
         _PRN  "=============================",8D8D
         _PRN  "THE PUT81 MACRO PUTS THE DATA FROM",8D
         _PRN  "A SOURCE ADDRESS INTO AN 8BIT, 1D",8D
         _PRN  "ARRAY ELEMENT. THE SOURCE ADDRESS,",8D
         _PRN  "ARRAY ADDRESS AND THE ELEMENT NUMBER",8D
         _PRN  "ARE SPECIFIED AS PARAMETERS, IN",8D
         _PRN  "THAT ORDER. NOTE THAT THE NUMBER OF",8D
         _PRN  "BYTES TO COPY INTO THE ELEMENT IS",8D
         _PRN  "PREDETERMINED BY THE ELEMENT SIZE",8D
         _PRN  "SET BY DIM81 IN THE HEADER.",8D8D
         _PRN  "THUS:",8D8D
         _WAIT
         _PRN  "   LDA    #0",8D
         _PRN  "   STA    ]VAR1",8D
         _PRN  "   STA    ]VAR1+1",8D
         _PRN  "   PUT81  #]VAR1;#ARRAY1;#3",8D8D
         _PRN  "WILL PUT $0000 IN ARRAY1'S ",8D
         _PRN  "ELEMENT 3, WHICH IS TECHNICALLY THE",8D
         _PRN  "FOURTH ELEMENT DUE TO ZERO INDEXING."
         LDA   #0
         STA   ]VAR1
         STA   ]VAR1+1
         PUT81 #]VAR1;#]ARRAY1;#3
         _WAIT
         JSR   ]HOME
         _PRN  "IF WE DUMP THE ARRAY AGAIN, WE ",8D
         _PRN  "CAN READILY SEE THE CHANGE:",8D8D
         _WAIT
         DUMP  #]ARRAY1;#2
         DUMP  #]ARRAY1+2;#10
         DUMP  #]ARRAY1+12;#10
         _WAIT
         _PRN  " ",8D8D
         _PRN  "OF COURSE, THIS IS OF LIMITED",8D
         _PRN  "USE WITHOUT A FUNCTION TO EXTRACT",8D
         _PRN  "THE ELEMENT INA USEFUL FASHION--",8D
         _PRN  "RELYING ON THE DUMP MACRO ONLY GOES",8D
         _PRN  "SO FAR. THAT'S WHERE OUR THIRD MACRO",8D
         _PRN  "AND SUBROUTINE COMES IN..."
         _WAIT
         JSR   ]HOME
         _PRN  "8-BIT, 1-DIMENSION ARRAYS: GET",8D
         _PRN  "==============================",8D8D
         _PRN  "THE GET81 MACRO GETS THE DATA",8D
         _PRN  "STORED IN AN ELEMENT AND COPIES IT",8D
         _PRN  "TO RETURN, STORING THE ELEMENT",8D
         _PRN  "LENGTH IN RETLEN. THIS ALLOWS YOU",8D
         _PRN  "TO USE THE ARRAY..WELL, LIKE AN",8D
         _PRN  "ARRAY. SO:",8D8D
         _WAIT
         _PRN  "   GET81  #ARRAY1;#3",8D8D
         _PRN  "RETRIEVES ELEMENT 3 OF ARRAY1 AND",8D
         _PRN  "STORES IT IN RETURN FOR USE BY YOUR",8D
         _PRN  "PROGRAM. WE CAN DUMP RETURN BEFORE",8D
         _PRN  "AND AFTER USING GET81 TO SHOW",8D
         _PRN  "THE DIFFERENCE:",8D8D
         _WAIT
         _PRN  "BEFORE:",8D
         DUMP  #RETURN;RETLEN
         _WAIT
         _PRN  " ",8D8D
         _PRN  "AFTER: ",8D
         GET81 #]ARRAY1;#3
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "16-BITS AND ONE DIMENSION: DIM161",8D
         _PRN  "=================================",8D8D
         _PRN  "DIM161 WORKS IN FORM AND FUNCTION JUST",8D
         _PRN  "AS DIM81 DOES, EXCEPT IT ACCEPTS",8D
         _PRN  "A TWO-BYTE VALUE FOR THE NUMBER",8D
         _PRN  "OF ELEMENTS. BECAUSE OF THIS, THE ARRAY",8D
         _PRN  "HEADER CREATED IS THREE BYTES INSTEAD",8D
         _PRN  "OF THE TWO IN 8-BIT ARRAYS. SO:",8D8D
         _WAIT
         _PRN  "   DIM161 #ARRAY1;#300;#2;#$00",8D8D
         _PRN  "WILL INITIALIZE AN ARRAY WITH 0..300",8D
         _PRN  "ELEMENTS, ONE DIMENSION. AGAIN, THIS",8D
         _PRN  "CAN TECHNICALLY USE A BIT MORE THAN",8D
         _PRN  "65,000 ELEMENTS, BUT THIS IS BEYOND",8D
         _PRN  "IMPRACTICAL FOR THE PURPOSES OF THIS",8D
         _PRN  "LIBRARY, AS A CONSECUTIVE 64K OF BYTES",8D
         _PRN  "IS UNLIKELY IN MOST APPLE II SYSTEMS.",8D8D
         _WAIT
         DIM161 #]ARRAY1;#300;#2;#$00
         JSR   ]HOME
         _PRN  "16-BITS AND ONE DIMENSION: PUT",8D
         _PRN  "==============================",8D8D
         _PRN  "NOW THAT WE HAVE CREATED OUR ARRAY,",8D
         _PRN  "WE CAN USE PUT161 TO CHANGE THE DATA",8D
         _PRN  "IN EACH ELEMENT. AGAIN, THIS WORKS",8D
         _PRN  "EXACTLY LIKE PUT81, BUT WITH SOME",8D
         _PRN  "EXTRA BYTES HERE AND THERE TO ACCOUNT",8D
         _PRN  "FOR THE EXTRA BREADTH. LET'S FILL",8D
         _PRN  "EACH ELEMENT 0..300 WITH ITS OWN VALUE--",8D
         _PRN  "THAT IS, 0 WILL HOLD 0, 1 WILL HOLD 1,",8D
         _PRN  "299 WILL HOLD 2999 AND 300 WILL HOLD",8D
         _PRN  "300:",8D8D
         _WAIT
         _PRN  "   LDA #0",8D
         _PRN  "   STA ]COUNT",8D
         _PRN  "   STA ]COUNT+1",8D
         _PRN  "   TAX",8D
         _PRN  "   TAY",8D
         _PRN  "LP ",8D
         _PRN  "   PUT161 #]COUNT'#]ARRAY1;]COUNT",8D
         _PRN  "   LDA ]COUNT",8D
         _PRN  "   CLC",8D
         _PRN  "   ADC #1",8D
         _PRN  "   STA ]COUNT",8D
         _PRN  "   LDA ]COUNT+1",8D
         _PRN  "   ADC #0",8D
         _PRN  "   STA ]COUNT+1",8D
         _PRN  "   CMP #$01",8D
         _PRN  "   BNE LP",8D
         _PRN  "   LDA ]COUNT",8D
         _PRN  "   CMP #$2C",8D
         _PRN  "   BNE LP"
         _WAIT
*
         LDA   #0
         STA   ]COUNT1
         STA   ]COUNT1+1
         TAX
         TAY
LP161
         PUT161 #]COUNT1;#]ARRAY1;]COUNT1
         LDA   ]COUNT1
         DUMP  #]COUNT1;#2
         LDA   ]COUNT1
         CLC
         ADC   #1
         STA   ]COUNT1
         LDA   ]COUNT1+1
         ADC   #0
         STA   ]COUNT1+1
         CMP   #$01
         BNE   LP161
         LDA   ]COUNT1
         CMP   #$2D
         BNE   LP161
         _WAIT
*
         JSR   ]HOME
         _PRN  "WE CAN NOW DUMP THE ENTIRE ARRAY",8D
         _PRN  "TO SEE HOW EACH ELEMENT IS STORED,"
         _PRN  "ALONG WITH THE THREE BYTE HEADER:",8D8D
         _WAIT
         DUMP  #]ARRAY1;#3
         _WAIT
         DUMP  #]ARRAY1+3;#60
         _WAIT
         DUMP  #]ARRAY1+63;#60
         _WAIT
         DUMP  #]ARRAY1+123;#60
         _WAIT
         DUMP  #]ARRAY1+183;#60
         _WAIT
         DUMP  #]ARRAY1+243;#60
         _WAIT
         DUMP  #]ARRAY1+303;#60
         _WAIT
         DUMP  #]ARRAY1+363;#60
         _WAIT
         DUMP  #]ARRAY1+423;#60
         _WAIT
         DUMP  #]ARRAY1+483;#60
         _WAIT
         DUMP  #]ARRAY1+543;#64
         _PRN  " ",8D8D
         _PRN  "WELL THAT CERTAINLY WAS A DUMP...",8D8D
         _WAIT
         JSR   ]HOME
         _PRN  "16-BITS IN ONE DIMENSION: GET",8D
         _PRN  "=============================",8D8D
         _PRN  "AND OF COURSE, WE HAVE THE SAME GET",8D
         _PRN  "MACRO FOR 16-BIT, 1D ARRAYS, GET162. THIS",8D
         _PRN  "AGAIN FUNCTIONS THE SAME AS ITS 8-BIT",8D
         _PRN  "COUNTERPART, EXCEPT THE INDEX IS TWO ",8D
         _PRN  "BYTES RATHER THAN ONE.",8D8D
         _PRN  " ",8D8D
         _PRN  "THUS:",8D8D
         _WAIT
         _PRN  "   GET161 #]ARRAY1;#270",8D8D
         _PRN  "RETURNS: "
         GET161 #]ARRAY1;#270
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "8-BIT, 2D ARRAYS: FML ANOTHER DIM",8D
         _PRN  "=================================",8D8D
         _PRN  "AT THIS POINT, YOU SHOULD HAVE A",8D
         _PRN  "GOOD GRASP AS TO HOW ARRAYS WORK",8D
         _PRN  "IN THIS LIBRARY. TWO-DIMENSIONAL",8D
         _PRN  "ARRAYS DO NOT SIGNIFICANTLY DIFFER",8D
         _PRN  "FROM ONE-DIMENSIONAL ARRAYS; IT JUST",8D
         _PRN  "MEANS THAT AN EXTRA ELEMENT INDEX IS",8D
         _PRN  "NEEDED AS A PARAMETER. AS SUCH, WE CAN",8D
         _PRN  "MOSTLY BREEZE THROUGH THE REST OF THESE.",8D8D
         _WAIT
         _PRN  "TO INITIALIZE A 2D, 8BIT ARRAY:",8D8D
         _PRN  "   DIM82 #ARRAY1;#10;#10;#1;#00",8D8D
         _PRN  "THIS CREATES AN ARRAY OF TEN BY TEN",8D
         _PRN  "ELEMENTS (TOTAL OF 100 ELEMENTS) WITH ",8D
         _PRN  "A LENGTH OF ONE BYTE. EACH ELEMENT",8D
         _PRN  "IS INITIALIZED TO A VALUE OF 0."
         _WAIT
         DIM82 #]ARRAY1;#10;#10;#1;#0
         JSR   ]HOME
         _PRN  "NOTE THAT WE HAVE A LONGER HEADER",8D
         _PRN  "THANKS TO THE EXTRA ELEMENT INDEX. THE",8D
         _PRN  "HEADER CONTAINS THE X-DIMENSION AS ",8D
         _PRN  "BYTE ZERO, Y-DIMENSION AS BYTE ONE,",8D
         _PRN  "AND ELEMENT LENGTH AS BYTE TWO, AS SUCH:",8D8D
         DUMP  #]ARRAY1;#3
         _WAIT
         _PRN  " ",8D8D
         _PRN  "AND THE REST OF THE ARRAY:",8D8D
         DUMP  #]ARRAY1+3;#10
         DUMP  #]ARRAY1+13;#10
         DUMP  #]ARRAY1+23;#10
         DUMP  #]ARRAY1+33;#10
         DUMP  #]ARRAY1+43;#10
         DUMP  #]ARRAY1+53;#10
         DUMP  #]ARRAY1+63;#10
         DUMP  #]ARRAY1+73;#10
         DUMP  #]ARRAY1+83;#10
         DUMP  #]ARRAY1+93;#10
         _WAIT
         JSR   ]HOME
         _PRN  "8-BIT, 2-DIMENSIONAL ARRAYS: PUT, GET",8D
         _PRN  "=====================================",8D8D
         _PRN  "AND OF COURSE, JUST AS WITH 1D ARRAYS",8D
         _PRN  "WE CAN USE PUT82 AND GET82 TO WRITE",8D
         _PRN  "TO AND READ FROM THE ARRAY:",8D8D
         _WAIT
         _PRN  "   LDA #$FF",8D
         _PRN  "   STA ]VAR1",8D
         _PRN  "   PUT82 #]VAR1;#]ARRAY1;#4;#5",8D
         _PRN  "   GET82 #]ARRAY1;#4;#5",8D
         _PRN  "   DUMP #RETURN;RETLEN",8D8D
         _PRN  "PRODUCES:",8D8D
         _WAIT
         LDA   #$FF
         STA   ]VAR1
         PUT82 #]VAR1;#]ARRAY1;#4;#5
         GET82 #]ARRAY1;#4;#5
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  "16-BIT 2D ARRAYS: DIM, GET, PUT",8D
         _PRN  "===============================",8D8D
         _PRN  "AND LASTLY, WE CAN USE 16-BIT, TWO-",8D
         _PRN  "DIMENSIONAL ARRAYS VIA THE DIM162,",8D
         _PRN  "PUT162, AND GET162 MACROS:",8D8D
         _PRN  "   DIM162 #]ARRAY1;#300;#300;#1;#$00",8D
         _PRN  "   PUT162 #]VAR1;#]ARRAY1;#280;#280",8D
         _PRN  "   GET162 #]ARRAY1;#280;#280",8D
         _PRN  "   DUMP #RETURN;RETLEN",8D8D
         _PRN  "PRODUCES:",8D8D
         _WAIT
         DIM162 #]ARRAY1;#300;#2;#1;#$00
         PUT162 #]VAR1;#]ARRAY1;#280;#1
         GET162 #]ARRAY1;#280;#1
         DUMP  #RETURN;RETLEN
         _WAIT
         JSR   ]HOME
         _PRN  " ",8D8D
         _PRN  "FIN.",8D8D8D
*
         JMP   REENTRY
*
*``````````````````````````````*
* BOTTOM INCLUDES (ROUTINES)   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
         PUT   MIN.LIB.REQUIRED
*
** INDIVIDUAL SUBROUTINE INCLUDES
*
** 8-BIT 1-DIMENSIONAL ARRAY SUBROUTINES
*
         PUT   MIN.SUB.ADIM81
         PUT   MIN.SUB.AGET81
         PUT   MIN.SUB.APUT81
*
** 8-BIT 2-DIMENSIONAL ARRAY SUBROUTINES
*
         PUT   MIN.SUB.ADIM82
         PUT   MIN.SUB.AGET82
         PUT   MIN.SUB.APUT82
*
** 16-BIT 1-DIMENSIONAL ARRAYS
*
         PUT   MIN.SUB.ADIM161
         PUT   MIN.SUB.APUT161
         PUT   MIN.SUB.AGET161
*
** 16-BIT 2-DIMENSIONAL ARRAYS
*
         PUT   MIN.SUB.ADIM162
         PUT   MIN.SUB.APUT162
         PUT   MIN.SUB.AGET162
