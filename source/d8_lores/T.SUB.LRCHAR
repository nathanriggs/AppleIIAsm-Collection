*``````````````````````````````*
* LRCHAR        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE PLACES A     *
* LORES CHARACTER AT A GIVEN   *
* POSITION AND COLOR. ALL OF   *
* THE CHARACTERS ARE 4*6 IN    *
* ORDER TO ALLOW EIGHT LETTERS *
* BOTH HORIZONTALLY AND ALSO   *
* VERTICALLY.                  *
*                              *
* INPUT:                       *
*                              *
* BPAR1 = X POSITION OF CHAR   *
* BPAR2 = Y POSITION OF CHAR   *
* WPAR1 = ADDRESS OF CHAR DEF  *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 202+                 *
* SIZE: 466 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ORGX    EQU   BPAR1      ; X POSITION OF CHAR
]ORGY    EQU   BPAR2      ; Y POSITION OF CHAR
]CADDR   EQU   WPAR1      ; ADDRESS OF 3-BYTE CHAR DEFINITION
]CBYTE1  EQU   VARTAB     ; COPY OF 1ST BYTE
]CBYTE2  EQU   VARTAB+1   ; COPY OF SECOND
]CBYTE3  EQU   VARTAB+2   ; COPY OF THIRD
]X       EQU   ADDR1      ; PLOTTING X POSITION
]Y       EQU   ADDR2      ; PLOTTING Y POSITION
]CNT     EQU   VARTAB+5   ; COUNTER
]COLOR   EQU   BPAR3      ; CHARACTER COLOR
]TMPBYTE EQU   VARTAB+11  ; WORKING BYTE TO READ
]OFFSET  EQU   VARTAB+12  ; CHARACTER BYTE OFFSET
]NIBBLE  EQU   VARTAB+13  ; FLAG TO INDICATE 1ST OR 2ND NIBBLE
*
LRCHAR
*
         LDA   #0         ; RESET NIBBLE AND OFFSET
         STA   ]NIBBLE
         STA   ]OFFSET
*
         LDA   ]ORGX      ; COPY ORGX TO X TO START
         STA   ]X         ; PLOTTING CHAR FROM LEFT TOP
         LDA   ]ORGY      ; DO THE SAME WITH ORGY AND Y
         STA   ]Y
         LDA   ]X
         LDY   #0         ; RESET BYTE INDEX
         LDA   (]CADDR),Y ; GET APPROPRIATE BYTE
         STA   ]CBYTE1    ; STORE IN DEDICATED VAR
         INY              ; NOW DO SECOND BYTE
         LDA   (]CADDR),Y
         STA   ]CBYTE2
         INY              ; AND THE THIRD
         LDA   (]CADDR),Y
         STA   ]CBYTE3
*
         LDA   #0         ; RESET COUNTER
         STA   ]CNT       ; FOR BITS
:PRELOOP
         LDY   ]OFFSET    ; GET CHAR BYTE OFFSET
         LDA   ]CBYTE1,Y  ; LOAD APPROPRIATE BYTE
         STA   ]TMPBYTE   ; STORE IN WORKING EMORY
:LP1
         SEC              ; SET CARRY
         LDA   ]TMPBYTE   ; LOAD WORKING BYTE
         ASL              ; SHIFT LEFT BYTE INTO CARRY
         STA   ]TMPBYTE   ; STORE NEW WORKING BYTE
         BCC   :NOPLOT    ; IF CARRY HOLDS A 0, DON'T PLOT
         LDA   ]COLOR     ; OTHERWISE, PLOT
         LDY   ]Y
         LDX   ]X
         JSR   LOCPLOT
:NOPLOT
         INC   ]X         ; INCREASE X COUNTER, WHETHER PLOTTED
         LDA   ]CNT       ; OR NOT
         CMP   #3         ; IF # OF BITS = 4, THEN
         BEQ   :NEXTLP    ; WE'RE DONE WITH THIS NIBBLE
         INC   ]CNT       ; INCREASE THE BIT COUNTER
         JMP   :LP1       ; LOOP AGAIN UNTIL NIBBLE DONE
:NEXTLP
*
         INC   ]NIBBLE    ; NOW INCREASE TO 2ND NIBBLE
         INC   ]Y         ; INCREASE Y PLOT POSITION, SINCE
         LDA   #0         ; EACH LINE IS 4 BITS LONG
         STA   ]CNT       ; RESET COUNTER
         LDA   ]ORGX      ; RESET X POSITION
         STA   ]X
         LDA   ]NIBBLE    ; CHECK IF NIBBLE 2 IS DONE
         CMP   #2         ; AND IF SO,
         BEQ   :NEXTLP2   ; GET OUT OF ANOTHER LOOP
         JMP   :LP1       ; OTHERWISE, KEEP LOOPING FOR 2ND NIBBLE
:NEXTLP2
         INC   ]OFFSET    ; NOT INCREASE CHARACTER BYTE OFFSET
         LDA   #0         ; RESET NIBBLE TO FIRST NIBBLE
         STA   ]NIBBLE
         LDA   ]ORGX      ; RESET X POSITION
         STA   ]X
         LDA   #0         ; RESET THE BIT COUNTER
         STA   ]CNT
         LDA   ]OFFSET    ; IF OFFSET IS MORE THAN 2,
         CMP   #3         ; THEN WE'RE DONE WITH THIS LOOP
         BEQ   :NEXT3     ; OTHERWISE START ALL OVER FOR NEXT BYTE
         JMP   :PRELOOP
*
:NEXT3
         RTS
*
** WHAT FOLLOWS ARE THE BINARY REPRESENTATIONS OF EACH
** CHARACTER AVAILABLE.
*
LR_A     DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %11111001  ; "XXXX"
                          ; "X..X"
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_B
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %11100000  ; "XXX."
                          ; "...."
LR_C
         DFB   %11111000  ; "XXXX"
                          ; "X..."
         DFB   %10001000  ; "X..."
                          ; "X..."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_D
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11100000  ; "XXX."
                          ; "...."
LR_E
         DFB   %11111000  ; "XXXX"
                          ; "X..."
         DFB   %11101000  ; "XXX."
                          ; "X..."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_F
         DFB   %11111000  ; "XXXX"
                          ; "X..."
         DFB   %11101000  ; "XXX."
                          ; "X..."
         DFB   %10000000  ; "X..."
                          ; "...."
LR_G
         DFB   %11111000  ; "XXXX"
                          ; "X..."
         DFB   %10111001  ; "X.XX"
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_H
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11111001  ; "XXXX"
                          ; "X..X"
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_I
         DFB   %11110110  ; "XXXX"
                          ; ".XX."
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_J
         DFB   %00010001  ; "...X"
                          ; "...X"
         DFB   %00011001  ; "...X"
                          ; "X..X"
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_K
         DFB   %10011010  ; "X..X"
                          ; "X.X."
         DFB   %11001010  ; "XX.."
                          ; "X.X."
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_L
         DFB   %10001000  ; "X..."
                          ; "X..."
         DFB   %10001000  ; "X..."
                          ; "X..."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_M
         DFB   %10111101  ; "X.XX"
                          ; "XX.X"
         DFB   %11011001  ; "XX.X"
                          ; "X..X"
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_N
         DFB   %10011101  ; "X..X"
                          ; "XX.X"
         DFB   %11011011  ; "XX.X"
                          ; "X.XX"
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_O
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_P
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %11101000  ; "XXX."
                          ; "X..."
         DFB   %10000000  ; "X..."
                          ; "...."
LR_Q
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %10011011  ; "X..X"
                          ; "X.XX"
         DFB   %01100001  ; ".XX."
                          ; "...X"
LR_R
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %11101010  ; "XXX."
                          ; "X.X."
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_S
         DFB   %01111000  ; ".XXX"
                          ; "X..."
         DFB   %01100001  ; ".XX."
                          ; "...X"
         DFB   %11100000  ; "XXX."
                          ; "...."
LR_T
         DFB   %11110110  ; "XXXX"
                          ; ".XX."
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_U
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_V
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %10101010  ; "X.X."
                          ; "X.X."
         DFB   %01000000  ; ".X.."
                          ; "...."
LR_W
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %10111011  ; "XX.X"
                          ; "XX.X"
         DFB   %11010000  ; "X.XX"
                          ; "...."
LR_X
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %10010000  ; "X..X"
LR_Y
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_Z
         DFB   %11110001  ; "XXXX"
                          ; "...X"
         DFB   %01101000  ; "..X."
                          ; ".X.."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_0
         DFB   %11111001  ; "XXXX"
                          ; "X..X"
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_1
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_2
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %00100100  ; "..X."
                          ; ".X.."
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_3
         DFB   %11100001  ; "XXX."
                          ; "...X"
         DFB   %01100001  ; ".XX."
                          ; "...X"
         DFB   %11100000  ; "XXX."
                          ; "...."
LR_4
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11110001  ; "XXXX"
                          ; "...X"
         DFB   %00010000  ; "...X"
                          ; "...."
LR_5
         DFB   %11111000  ; "XXXX"
                          ; "X..."
         DFB   %11110001  ; "XXXX"
                          ; "...X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_6
         DFB   %01101000  ; ".XX."
                          ; "X..."
         DFB   %11101001  ; "XXX."
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_7
         DFB   %11110001  ; "XXXX"
                          ; "...X"
         DFB   %00100100  ; "..X."
                          ; ".X.."
         DFB   %10000000  ; "X..."
                          ; "...."
LR_8
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_9
         DFB   %01111001  ; ".XXX"
                          ; "X..X"
         DFB   %01110001  ; ".XXX"
                          ; "...X"
         DFB   %00010000  ; "...X"
                          ; "...."
LR_EXC
         DFB   %01100110  ; ".XX."
                          ; ".XX."
         DFB   %01100000  ; ".XX."
                          ; "...."
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_QUEST
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %00100000  ; "..X."
                          ; "...."
         DFB   %00100000  ; "..X."
                          ; "...."
LR_PRD
         DFB   %00000000  ; "...."
                          ; "...."
         DFB   %00001100  ; "...."
                          ; "XX.."
         DFB   %11000000  ; "XX.."
                          ; "...."
LR_CMA
         DFB   %00000000  ; "...."
                          ; "...."
         DFB   %00000100  ; "...."
                          ; ".X.."
         DFB   %01001000  ; ".X.."
                          ; "X..."
LR_APOST
         DFB   %00010001  ; "...X"
                          ; "...X"
         DFB   %00100000  ; "..X."
                          ; "...."
         DFB   %00000000  ; "...."
                          ; "...."
LR_QUOT
         DFB   %10101010  ; "X.X."
                          ; "X.X."
         DFB   %00000000  ; "...."
                          ; "...."
         DFB   %00000000  ; "...."
                          ; "...."
LR_COLON
         DFB   %00000100  ; "...."
                          ; ".X.."
         DFB   %00000100  ; "...."
                          ; ".X.."
         DFB   %00000000  ; "...."
                          ; "...."
LR_SEMI
         DFB   %00000100  ; "...."
                          ; ".X.."
         DFB   %00000100  ; "...."
                          ; ".X.."
         DFB   %10000000  ; "X..."
                          ; "...."
LR_MINUS
         DFB   %00000000  ; "...."
                          ; "...."
         DFB   %11111111  ; "XXXX"
                          ; "XXXX"
         DFB   %00000000  ; "...."
                          ; "...."
LR_PLUS
         DFB   %00000110  ; "...."
                          ; ".XX."
         DFB   %11111111  ; "XXXX"
                          ; "XXXX"
         DFB   %01100000  ; ".XX."
                          ; "...."
LR_EQUAL
         DFB   %00001111  ; "...."
                          ; "XXXX"
         DFB   %00001111  ; "...."
                          ; "XXXX"
         DFB   %00000000  ; "...."
                          ; "...."
LR_CHECKER1
         DFB   %10100101  ; "X.X."
                          ; ".X.X"
         DFB   %10100101  ; "X.X."
                          ; ".X.X"
         DFB   %10100000  ; "X.X."
                          ; "...."
LR_CHECKER2
         DFB   %01011010  ; ".X.X"
                          ; "X.X."
         DFB   %01011010  ; ".X.X"
                          ; "X.X."
         DFB   %01010000  ; ".X.X"
                          ; "...."
LR_UP
         DFB   %00100111  ; "..X."
                          ; ".XXX"
         DFB   %00000010  ; "...."
                          ; "..X."
         DFB   %01110000  ; ".XXX"
                          ; "...."
LR_DOWN
         DFB   %01110010  ; ".XXX"
                          ; "..X."
         DFB   %00000111  ; "...."
                          ; ".XXX"
         DFB   %00100000  ; "..X."
                          ; "...."
LR_LEFT
         DFB   %00010011  ; "...X"
                          ; "..XX"
         DFB   %01110011  ; ".XXX"
                          ; "..XX"
         DFB   %00010000  ; "...X"
                          ; "...."
LR_RIGHT
         DFB   %10001100  ; "X..."
                          ; "XX.."
         DFB   %11101100  ; "XXX."
                          ; "XX.."
         DFB   %10000000  ; "X..."
                          ; "...."
LR_FSLASH
         DFB   %00010010  ; "...X"
                          ; "..X."
         DFB   %01001000  ; ".X.."
                          ; "X..."
         DFB   %10000000  ; "X..."
LR_BSLASH
         DFB   %10000100  ; "X..."
                          ; ".X.."
         DFB   %00100001  ; "..X."
                          ; "...X"
         DFB   %00010000  ; "...X"
                          ; "...."
LR_LPAR
         DFB   %00010010  ; "...X"
                          ; "..X."
         DFB   %01000100  ; ".X.."
                          ; ".X.."
         DFB   %00100001  ; "..X."
                          ; "...X"
LR_RPAR
         DFB   %10000100  ; "X..."
                          ; ".X.."
         DFB   %00100010  ; "..X."
                          ; "..X."
         DFB   %01001000  ; ".X.."
                          ; "X..."
LR_BLOCK
         DFB   %11111111  ; "XXXX"
                          ; "XXXX"
         DFB   %11111111  ; "XXXX"
                          ; "XXXX"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_GOOMBA
         DFB   %01101001  ; ".XX."
                          ; "X..X"
         DFB   %11110110  ; "XXXX"
                          ; ".XX."
         DFB   %11110000  ; "XXX."
                          ; "...."
LR_PERCENT
         DFB   %10010001  ; "X..X
                          ; "...X"
         DFB   %00100100  ; "..X."
                          ; ".X.."
         DFB   %10010000  ; "X..X"
                          ; "...."
LR_BULLET
         DFB   %00000110  ; "...."
                          ; ".XX."
         DFB   %01100000  ; ".XX."
                          ; "....
         DFB   %00000000  ; "...."
                          ; "...."
LR_OFACE
         DFB   %10010000  ; "X..X"
                          ; "...."
         DFB   %11111001  ; "XXXX"
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_HFACE
         DFB   %10010000  ; "X..X"
                          ; "...."
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %11110000  ; "XXXX"
                          ; "...."
LR_SFACE
         DFB   %10011001  ; "X..X"
                          ; "X..X"
         DFB   %00001111  ; "...."
                          ; "XXXX"
         DFB   %10010000  ; "X..X"
                          ; "...."
*``````````````````````````````*
* LRCHAR        (NATHAN RIGGS) *
*                              *
* THIS SUBROUTINE PLACES A     *
* LORES CHARACTER AT A GIVEN   *
* POSITION AND COLOR. ALL OF   *
* THE CHARACTERS ARE 4*6 IN    *
* ORDER TO ALLOW EIGHT LETTERS *
* BOTH HORIZONTALLY AND ALSO   *
* VERTICALLY.                  *
*                              *
* INPUT:                       *
*                              *
* BPAR1 = X POSITION OF CHAR   *
* BPAR2 = Y POSITION OF CHAR   *
* WPAR1 = ADDRESS OF CHAR DEF  *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 202+                 *
* SIZE: 466 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ORGX    EQU   BPAR1      ; X POSITION OF CHAR
]ORGY    EQU   BPAR2      ; Y POSITION OF CHAR
]CADDR   EQU   WPAR1      ; ADDRESS OF 3-BYTE CHAR DEFINITION
]CBYTE1  EQU   VARTAB     ; COPY OF 1ST BYTE
]CBYTE2  EQU   VARTAB+1   ; COPY OF SECOND
]CBYTE3  EQU   VARTAB+2   ; COPY OF THIRD
]X       EQU   ADDR1      ; PLOTTING X POSITION
]Y       EQU   ADDR2      ; PLOTTING Y POSITION
]CNT     EQU   VARTAB+5   ; COUNTER
]COLOR   EQU   BPAR3      ; CHARACTER COLOR
]TMPBYTE EQU   VARTAB+11  ; WORKING BYTE TO READ
]OFFSET  EQU   VARTAB+12  ; CHARACTER BYTE OFFSET
]NIBBLE  EQU   VARTAB+13  ; FLAG TO INDIC