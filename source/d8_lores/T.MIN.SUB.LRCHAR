]ORGX    EQU   BPAR1      
]ORGY    EQU   BPAR2      
]CADDR   EQU   WPAR1      
]CBYTE1  EQU   VARTAB     
]CBYTE2  EQU   VARTAB+1   
]CBYTE3  EQU   VARTAB+2   
]X       EQU   ADDR1      
]Y       EQU   ADDR2      
]CNT     EQU   VARTAB+5   
]COLOR   EQU   BPAR3      
]TMPBYTE EQU   VARTAB+11  
]OFFSET  EQU   VARTAB+12  
]NIBBLE  EQU   VARTAB+13  
LRCHAR
         LDA   #0         
         STA   ]NIBBLE
         STA   ]OFFSET
         LDA   ]ORGX      
         STA   ]X         
         LDA   ]ORGY      
         STA   ]Y
         LDA   ]X
         LDY   #0         
         LDA   (]CADDR),Y 
         STA   ]CBYTE1    
         INY   
         LDA   (]CADDR),Y
         STA   ]CBYTE2
         INY   
         LDA   (]CADDR),Y
         STA   ]CBYTE3
         LDA   #0         
         STA   ]CNT       
:PRELOOP
         LDY   ]OFFSET    
         LDA   ]CBYTE1,Y  
         STA   ]TMPBYTE   
:LP1
         SEC   
         LDA   ]TMPBYTE   
         ASL   
         STA   ]TMPBYTE   
         BCC   :NOPLOT    
         LDA   ]COLOR     
         LDY   ]Y
         LDX   ]X
         JSR   LOCPLOT
:NOPLOT
         INC   ]X         
         LDA   ]CNT       
         CMP   #3         
         BEQ   :NEXTLP    
         INC   ]CNT       
         JMP   :LP1       
:NEXTLP
         INC   ]NIBBLE    
         INC   ]Y         
         LDA   #0         
         STA   ]CNT       
         LDA   ]ORGX      
         STA   ]X
         LDA   ]NIBBLE    
         CMP   #2         
         BEQ   :NEXTLP2   
         JMP   :LP1       
:NEXTLP2
         INC   ]OFFSET    
         LDA   #0         
         STA   ]NIBBLE
         LDA   ]ORGX      
         STA   ]X
         LDA   #0         
         STA   ]CNT
         LDA   ]OFFSET    
         CMP   #3         
         BEQ   :NEXT3     
         JMP   :PRELOOP
:NEXT3
         RTS
LR_A     DFB   %01101001  
                          
         DFB   %11111001  
                          
         DFB   %10010000  
         
LR_B
         DFB   %11101001  
                          
         DFB   %11101001  
                          
         DFB   %11100000  
                          
LR_C
         DFB   %11111000  
         
         DFB   %10001000  
         
         DFB   %11110000  
         
LR_D
         DFB   %11101001  
         
         DFB   %10011001  
         
         DFB   %11100000  
         
LR_E
         DFB   %11111000  
         
         DFB   %11101000  
         
         DFB   %11110000  
         
LR_F
         DFB   %11111000  
         
         DFB   %11101000  
         
         DFB   %10000000  
         
LR_G
         DFB   %11111000  
         
         DFB   %10111001  
         
         DFB   %11110000  
         
LR_H
         DFB   %10011001  
         
         DFB   %11111001  
         
         DFB   %10010000  
         
LR_I
         DFB   %11110110  
         
         DFB   %01100110  
         
         DFB   %11110000  
         
LR_J
         DFB   %00010001  
         
         DFB   %00011001  
         
         DFB   %01100000  
         
LR_K
         DFB   %10011010  
         
         DFB   %11001010  
         
         DFB   %10010000  
         
LR_L
         DFB   %10001000  
         
         DFB   %10001000  
         
         DFB   %11110000  
         
LR_M
         DFB   %10111101  
         
         DFB   %11011001  
         
         DFB   %10010000  
         
LR_N
         DFB   %10011101  
         
         DFB   %11011011  
         
         DFB   %10010000  
         
LR_O
         DFB   %01101001  
         
         DFB   %10011001  
         
         DFB   %01100000  
         
LR_P
         DFB   %11101001  
         
         DFB   %11101000  
         
         DFB   %10000000  
         
LR_Q
         DFB   %01101001  
         
         DFB   %10011011  
         
         DFB   %01100001  
         
LR_R
         DFB   %11101001  
         
         DFB   %11101010  
         
         DFB   %10010000  
         
LR_S
         DFB   %01111000  
         
         DFB   %01100001  
         
         DFB   %11100000  
         
LR_T
         DFB   %11110110  
         
         DFB   %01100110  
         
         DFB   %01100000  
         
LR_U
         DFB   %10011001  
         
         DFB   %10011001  
         
         DFB   %11110000  
         
LR_V
         DFB   %10011001  
         
         DFB   %10101010  
         
         DFB   %01000000  
         
LR_W
         DFB   %10011001  
         
         DFB   %10111011  
         
         DFB   %11010000  
         
LR_X
         DFB   %10011001  
         
         DFB   %01101001  
         
         DFB   %10010000  
LR_Y
         DFB   %10011001  
         
         DFB   %01100110  
         
         DFB   %01100000  
         
LR_Z
         DFB   %11110001  
         
         DFB   %01101000  
         
         DFB   %11110000  
         
LR_0
         DFB   %11111001  
         
         DFB   %10011001  
         
         DFB   %11110000  
         
LR_1
         DFB   %01100110  
         
         DFB   %01100110  
         
         DFB   %01100000  
         
LR_2
         DFB   %01101001  
         
         DFB   %00100100  
         
         DFB   %11110000  
         
LR_3
         DFB   %11100001  
         
         DFB   %01100001  
         
         DFB   %11100000  
         
LR_4
         DFB   %10011001  
         
         DFB   %11110001  
         
         DFB   %00010000  
         
LR_5
         DFB   %11111000  
         
         DFB   %11110001  
         
         DFB   %11110000  
         
LR_6
         DFB   %01101000  
         
         DFB   %11101001  
         
         DFB   %11110000  
         
LR_7
         DFB   %11110001  
         
         DFB   %00100100  
         
         DFB   %10000000  
         
LR_8
         DFB   %01101001  
         
         DFB   %01101001  
         
         DFB   %01100000  
         
LR_9
         DFB   %01111001  
         
         DFB   %01110001  
         
         DFB   %00010000  
         
LR_EXC
         DFB   %01100110  
         
         DFB   %01100000  
         
         DFB   %01100000  
         
LR_QUEST
         DFB   %01101001  
         
         DFB   %00100000  
         
         DFB   %00100000  
         
LR_PRD
         DFB   %00000000  
         
         DFB   %00001100  
         
         DFB   %11000000  
         
LR_CMA
         DFB   %00000000  
         
         DFB   %00000100  
         
         DFB   %01001000  
         
LR_APOST
         DFB   %00010001  
         
         DFB   %00100000  
         
         DFB   %00000000  
         
LR_QUOT
         DFB   %10101010  
         
         DFB   %00000000  
         
         DFB   %00000000  
         
LR_COLON
         DFB   %00000100  
         
         DFB   %00000100  
         
         DFB   %00000000  
         
LR_SEMI
         DFB   %00000100  
         
         DFB   %00000100  
         
         DFB   %10000000  
         
LR_MINUS
         DFB   %00000000  
         
         DFB   %11111111  
         
         DFB   %00000000  
         
LR_PLUS
         DFB   %00000110  
         
         DFB   %11111111  
         
         DFB   %01100000  
         
LR_EQUAL
         DFB   %00001111  
         
         DFB   %00001111  
         
         DFB   %00000000  
         
LR_CHECKER1
         DFB   %10100101  
         
         DFB   %10100101  
               
         DFB   %10100000  
         
LR_CHECKER2
         DFB   %01011010  
         
         DFB   %01011010  
         
         DFB   %01010000  
         
LR_UP
         DFB   %00100111  
         
         DFB   %00000010  
         
         DFB   %01110000  
         
LR_DOWN
         DFB   %01110010  
         
         DFB   %00000111  
         
         DFB   %00100000  
         
LR_LEFT
         DFB   %00010011  
         
         DFB   %01110011  
         
         DFB   %00010000  
               
LR_RIGHT
         DFB   %10001100  
         
         DFB   %11101100  
         
         DFB   %10000000  
         
LR_FSLASH
         DFB   %00010010  
         
         DFB   %01001000  
         
         DFB   %10000000  
LR_BSLASH
         DFB   %10000100  
         
         DFB   %00100001  
         
         DFB   %00010000  
         
LR_LPAR
         DFB   %00010010  
         
         DFB   %01000100  
         
         DFB   %00100001  
         
LR_RPAR
         DFB   %10000100  
         
         DFB   %00100010  
         
         DFB   %01001000  
         
LR_BLOCK
         DFB   %11111111  
         
         DFB   %11111111  
         
         DFB   %11110000  
         
LR_GOOMBA
         DFB   %01101001  
         
         DFB   %11110110  
         
         DFB   %11110000  
         
LR_PERCENT
         DFB   %10010001  
         
         DFB   %00100100  
         
         DFB   %10010000  
         
LR_BULLET
         DFB   %00000110  
         
         DFB   %01100000  
         
         DFB   %00000000  
         
LR_OFACE
         DFB   %10010000  
         
         DFB   %11111001  
               
         DFB   %11110000  
         
LR_HFACE
         DFB   %10010000  
               
         DFB   %10011001  
         
         DFB   %11110000  
         
LR_SFACE
         DFB   %10011001  
         
         DFB   %00001111  
         
         DFB   %10010000  
         
