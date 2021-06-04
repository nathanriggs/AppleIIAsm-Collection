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
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 397+                 *
* SIZE: 409 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]ORGX    EQU   BPAR1      ; X POSITION OF CHAR
]ORGY    EQU   BPAR2      ; Y POSITION OF CHAR
]CADDR   EQU   WPAR1      ; ADDRESS OF 3-BYTE CHAR DEFINITION
]CBYTE1  EQU   VARTAB     ; COPY OF 1ST BYTE
]CBYTE2  EQU   VARTAB+1   ; COPY OF SECOND
]CBYTE3  EQU   VARTAB+2   ; COPY OF THIRD
]CX      EQU   ADDR1      ; PLOTTING X POSITION
]CY      EQU   ADDR2      ; PLOTTING Y POSITION
]CNT     EQU   VARTAB+5   ; COUNTER
]COLOR   EQU   BPAR3      ; CHARACTER COLOR
]TMPBYTE EQU   VARTAB+11  ; WORKING BYTE TO READ
]OFFSET  EQU   VARTAB+12  ; CHARACTER BYTE OFFSET
]NIBBLE  EQU   VARTAB+13  ; FLAG TO INDICATE 1ST OR 2ND NIBBLE
*
LRCHAR
         LDA   #0         ; {4C3B} RESET NIBBLE AND OFFSET
         STA   ]NIBBLE    ; {4C3B}
         STA   ]OFFSET    ; {4C3B}
*
         LDA   ]ORGX      ; {4C3B} COPY ORGX TO X TO START
         STA   ]CX        ; {4C3B} PLOTTING CHAR FROM LEFT TOP
         LDA   ]ORGY      ; {4C3B} DO THE SAME WITH ORGY AND Y
         STA   ]CY        ; {4C3B}
         LDA   ]CX        ; {4C3B}
         LDY   #0         ; {3C2B} RESET BYTE INDEX
         LDA   (]CADDR),Y ; {6C2B} GET APPROPRIATE BYTE
         STA   ]CBYTE1    ; {4C3B} STORE IN DEDICATED VAR
         INY              ; {2C1B} NOW DO SECOND BYTE
         LDA   (]CADDR),Y ; {6C2B}
         STA   ]CBYTE2    ; {4C3B}
         INY              ; {2C1B} AND THE THIRD
         LDA   (]CADDR),Y ; {6C2B}
         STA   ]CBYTE3    ; {4C3B}
*
         LDA   #0         ; {3C2B} RESET COUNTER
         STA   ]CNT       ; {4C3B} FOR BITS
:PRELOOP
         LDY   ]OFFSET
*LDA ]OFFSET ; {4C3B} GET CHAR BYTE OFFSET
         LDA   ]CBYTE1,Y  ; {5C3B} LOAD APPROPRIATE BYTE
         STA   ]TMPBYTE   ; {4C3B} STORE IN WORKING EMORY
:LP1
         SEC              ; {2C1B} SET CARRY
         LDA   ]TMPBYTE   ; {4C3B} LOAD WORKING BYTE
         ASL              ; {2C1B} SHIFT LEFT BYTE INTO CARRY
         STA   ]TMPBYTE   ; {4C3B} STORE NEW WORKING BYTE
         BCC   :NOPLOT    ; {3C2B} IF CARRY HOLDS A 0, DON'T PLOT
         LDA   ]COLOR     ; {4C3B} OTHERWISE, PLOT
         LDY   ]CY        ; {4C3B}
         LDX   ]CX        ; {4C3B}
         JSR   LOCPLOT    ; {174C112B}
:NOPLOT
         INC   ]CX        ; {5C2B} INCREASE X, WHETHER PLOTTED
         LDA   ]CNT       ; {4C3B} OR NOT
         CMP   #3         ; {3C2B} IF # OF BITS = 4, THEN
         BEQ   :NEXTLP    ; {3C2B} WE'RE DONE WITH THIS NIBBLE
         INC   ]CNT       ; {5C2B} INCREASE THE BIT COUNTER
         JMP   :LP1       ; {3C3B} LOOP AGAIN UNTIL NIBBLE DONE
:NEXTLP
         INC   ]NIBBLE    ; {5C2B} NOW INCREASE TO 2ND NIBBLE
         INC   ]CY        ; {5C2B} INCREASE Y PLOT POS, SINCE
         LDA   #0         ; {3C2B} EACH LINE IS 4 BITS LONG
         STA   ]CNT       ; {4C3B} RESET COUNTER
         LDA   ]ORGX      ; {4C3B} RESET X POSITION
         STA   ]CX        ; {4C3B}
         LDA   ]NIBBLE    ; {4C3B} CHECK IF NIBBLE 2 IS DONE
         CMP   #2         ; {3C2B} AND IF SO,
         BEQ   :NEXTLP2   ; {3C2B} GET OUT OF ANOTHER LOOP
         JMP   :LP1       ; {3C3B} ELSE, LOOP FOR 2ND NIBBLE
:NEXTLP2
         INC   ]OFFSET    ; {5C2B} NOW INC CHAR BYTE OFFSET
         LDA   #0         ; {3C2B} RESET NIBBLE TO FIRST NIBBLE
         STA   ]NIBBLE    ; {4C3B}
         LDA   ]ORGX      ; {4C3B} RESET X POSITION
         STA   ]CX        ; {4C3B}
         LDA   #0         ; {3C2B} RESET THE BIT COUNTER
         STA   ]CNT       ; {4C3B}
         LDA   ]OFFSET    ; {4C3B} IF OFFSET IS MORE THAN 2,
         CMP   #3         ; {3C2B} THEN DONE WITH THIS LOOP
         BEQ   :NEXT3     ; {3C2B} ELSE START OVER FOR NEXT BYTE
         JMP   :PRELOOP   ; {3C3B}
*
:NEXT3
         RTS              ; {6C1B}
*
** WHAT FOLLOWS ARE THE BINARY REPRESENTATIONS OF EACH
** CHARACTER AVAILABLE.
*
LR_A     DFB   %01101001  ; {OC1B} ".XX."
                          ;        "X..X"
         DFB   %11111001  ; {OC1B} "XXXX"
                          ;        "X..X"
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_B
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %11100000  ; {0C1B} "XXX."
                          ;        "...."
LR_C
         DFB   %11111000  ; {0C1B} "XXXX"
                          ;        "X..."
         DFB   %10001000  ; {0C1B} "X..."
                          ;        "X..."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_D
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %11100000  ; {0C1B} "XXX."
                          ;        "...."
LR_E
         DFB   %11111000  ; {0C1B} "XXXX"
                          ;        "X..."
         DFB   %11101000  ; {0C1B} "XXX."
                          ;        "X..."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_F
         DFB   %11111000  ; {0C1B} "XXXX"
                          ;        "X..."
         DFB   %11101000  ; {0C1B} "XXX."
                          ;        "X..."
         DFB   %10000000  ; {0C1B} "X..."
                          ;        "...."
LR_G
         DFB   %11111000  ; {0C1B} "XXXX"
                          ;        "X..."
         DFB   %10111001  ; {0C1B} "X.XX"
                          ;        "X..X"
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_H
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %11111001  ; {0C1B} "XXXX"
                          ;        "X..X"
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_I
         DFB   %11110110  ; {0C1B} "XXXX"
                          ;        ".XX."
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_J
         DFB   %00010001  ; {0C1B} "...X"
                          ;        "...X"
         DFB   %00011001  ; {0C1B} "...X"
                          ;        "X..X"
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_K
         DFB   %10011010  ; {0C1B} "X..X"
                          ;        "X.X."
         DFB   %11001010  ; {0C1B} "XX.."
                          ;        "X.X."
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_L
         DFB   %10001000  ; {0C1B} "X..."
                          ;        "X..."
         DFB   %10001000  ; {0C1B} "X..."
                          ;        "X..."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_M
         DFB   %10111101  ; {0C1B} "X.XX"
                          ;        "XX.X"
         DFB   %11011001  ; {0C1B} "XX.X"
                          ;        "X..X"
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_N
         DFB   %10011101  ; {0C1B} "X..X"
                          ;        "XX.X"
         DFB   %11011011  ; {0C1B} "XX.X"
                          ;        "X.XX"
         DFB   %10010000  ; {0C1B} "X..X"
                          ; "...."
LR_O
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_P
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %11101000  ; {0C1B} "XXX."
                          ;        "X..."
         DFB   %10000000  ; {0C1B} "X..."
                          ; "...."
LR_Q
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %10011011  ; {0C1B} "X..X"
                          ;        "X.XX"
         DFB   %01100001  ; {0C1B} ".XX."
                          ;        "...X"
LR_R
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %11101010  ; {0C1B} "XXX."
                          ;        "X.X."
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_S
         DFB   %01111000  ; {0C1B} ".XXX"
                          ;        "X..."
         DFB   %01100001  ; {0C1B} ".XX."
                          ;        "...X"
         DFB   %11100000  ; {0C1B} "XXX."
                          ;        "...."
LR_T
         DFB   %11110110  ; {0C1B} "XXXX"
                          ;        ".XX."
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_U
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_V
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %10101010  ; {0C1B} "X.X."
                          ;        "X.X."
         DFB   %01000000  ; {0C1B} ".X.."
                          ;        "...."
LR_W
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %10111011  ; {0C1B} "XX.X"
                          ;        "XX.X"
         DFB   %11010000  ; {0C1B} "X.XX"
                          ;        "...."
LR_X
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %10010000  ; {0C1B} "X..X"
                          ;        "...."
LR_Y
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_Z
         DFB   %11110001  ; {0C1B} "XXXX"
                          ;        "...X"
         DFB   %01101000  ; {0C1B} "..X."
                          ;        ".X.."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_0
         DFB   %11111001  ; {0C1B} "XXXX"
                          ;        "X..X"
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_1
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_2
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %00100100  ; {0C1B} "..X."
                          ;        ".X.."
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_3
         DFB   %11100001  ; {0C1B} "XXX."
                          ;        "...X"
         DFB   %01100001  ; {0C1B} ".XX."
                          ;        "...X"
         DFB   %11100000  ; {0C1B} "XXX."
                          ;        "...."
LR_4
         DFB   %10011001  ; {0C1B} "X..X"
                          ;        "X..X"
         DFB   %11110001  ; {0C1B} "XXXX"
                          ;        "...X"
         DFB   %00010000  ; {0C1B} "...X"
                          ;        "...."
LR_5
         DFB   %11111000  ; {0C1B} "XXXX"
                          ;        "X..."
         DFB   %11110001  ; {0C1B} "XXXX"
                          ;        "...X"
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_6
         DFB   %01101000  ; {0C1B} ".XX."
                          ;        "X..."
         DFB   %11101001  ; {0C1B} "XXX."
                          ;        "X..X"
         DFB   %11110000  ; {0C1B} "XXXX"
                          ;        "...."
LR_7
         DFB   %11110001  ; {0C1B} "XXXX"
                          ;        "...X"
         DFB   %00100100  ; {0C1B} "..X."
                          ;        ".X.."
         DFB   %10000000  ; {0C1B} "X..."
                          ;        "...."
LR_8
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_9
         DFB   %01111001  ; {0C1B} ".XXX"
                          ;        "X..X"
         DFB   %01110001  ; {0C1B} ".XXX"
                          ;        "...X"
         DFB   %00010000  ; {0C1B} "...X"
                          ;        "...."
LR_EXC
         DFB   %01100110  ; {0C1B} ".XX."
                          ;        ".XX."
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_QUEST
         DFB   %01101001  ; {0C1B} ".XX."
                          ;        "X..X"
         DFB   %00100000  ; {0C1B} "..X."
                          ;        "...."
         DFB   %00100000  ; {0C1B} "..X."
                          ;        "...."
LR_PRD
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
         DFB   %00001100  ; {0C1B} "...."
                          ;        "XX.."
         DFB   %11000000  ; {0C1B} "XX.."
                          ;        "...."
LR_CMA
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
         DFB   %00000100  ; {0C1B} "...."
                          ;        ".X.."
         DFB   %01001000  ; {0C1B} ".X.."
                          ;        "X..."
LR_APOST
         DFB   %00010001  ; {0C1B} "...X"
                          ;        "...X"
         DFB   %00100000  ; {0C1B} "..X."
                          ;        "...."
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
LR_QUOT
         DFB   %10101010  ; {0C1B} "X.X."
                          ;        "X.X."
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
LR_COLON
         DFB   %00000100  ; {0C1B} "...."
                          ;        ".X.."
         DFB   %00000100  ; {0C1B} "...."
                          ;        ".X.."
         DFB   %00000000  ; {OC1B} "...."
                          ;        "...."
LR_SEMI
         DFB   %00000100  ; {0C1B} "...."
                          ;        ".X.."
         DFB   %00000100  ; {0C1B} "...."
                          ;        ".X.."
         DFB   %10000000  ; {0C1B} "X..."
                          ;        "...."
LR_MINUS
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
         DFB   %11111111  ; {0C1B} "XXXX"
                          ;        "XXXX"
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
LR_PLUS
         DFB   %00000110  ; {0C1B} "...."
                          ;        ".XX."
         DFB   %11111111  ; {0C1B} "XXXX"
                          ;        "XXXX"
         DFB   %01100000  ; {0C1B} ".XX."
                          ;        "...."
LR_EQUAL
         DFB   %00001111  ; {0C1B} "...."
                          ;        "XXXX"
         DFB   %00001111  ; {0C1B} "...."
                          ;        "XXXX"
         DFB   %00000000  ; {0C1B} "...."
                          ;        "...."
LR_FSLASH
         DFB   %00010010  ; {0C1B} "...X"
                          ;        "..X."
         DFB   %00100100  ; {0C1B} "..X."
                          ;        ".X.."
         DFB   %01001000  ; {0C1B} ".X.."
                          ;        "X..."
LR_BSLASH
         DFB   %10000100  ; {0C1B} "X..."
                          ;        ".X.."
         DFB   %01000010  ; {0C1B} ".X.."
                          ;        "..X."
         DFB   %00100001  ; {0C1B} "..X."
                          ;        "...X"
LR_LPAR
         DFB   %00010010  ; {0C1B} "...X"
                          ;        "..X."
         DFB   %01000100  ; {0C1B} ".X.."
                          ;        ".X.."
         DFB   %00100001  ; {0C1B} "..X."
                          ;        "...X"
LR_RPAR
         DFB   %10000100  ; {0C1B} "X..."
                          ;        ".X.."
         DFB   %00100010  ; {0C1B} "..X."
                          ;        "..X."
         DFB   %01001000  ; {0C1B} ".X.."
                          ;        "X..."
