]X1      EQU   WPAR1      
]Y1      EQU   WPAR1+1    
]X2      EQU   WPAR2      
]Y2      EQU   WPAR2+1    
]COLOR   EQU   BPAR1      
]DX      EQU   VARTAB+9   
]DY      EQU   VARTAB+10  
]SX      EQU   VARTAB+11  
]SY      EQU   VARTAB+12  
]ERR     EQU   VARTAB+13  
]ERR2    EQU   VARTAB+14  
LRBLINE
         LDX   #$FF       
         LDA   ]Y1        
         SEC              
         SBC   ]Y2
         BPL   :YSTORE    
         LDX   #1         
         EOR   #$FF       
         CLC
         ADC   #1
:YSTORE
         STA   ]DY        
         STX   ]SY        
         LDX   #$FF       
         LDA   ]X1        
         SEC              
         SBC   ]X2        
         BPL   :XSTORE    
         LDX   #1         
         EOR   #$FF       
         CLC
         ADC   #1
:XSTORE
         STA   ]DX        
         STX   ]SX        
         CMP   ]DY        
         BEQ   :SKIP      
         BPL   :SKIP2     
:SKIP
         LDA   ]DY        
         EOR   #$FF       
         CLC
         ADC   #1
:SKIP2
         STA   ]ERR       
         ASL   ]DX        
         ASL   ]DY        
:LP
         LDA   ]COLOR     
         LDY   ]Y1        
         LDX   ]X1        
         JSR   LOCPLOT    
         LDA   ]X1        
         CMP   ]X2        
         BNE   :KEEPGO
         LDA   ]Y1        
         CMP   ]Y2
         BEQ   :EXIT      ; IF EQUAL, EXIT
:KEEPGO
         LDA   ]ERR       
         STA   ]ERR2      
         CLC              
         ADC   ]DX        
         BMI   :SKIPX     
         BEQ   :SKIPX     
         LDA   ]ERR       
         SEC              
         SBC   ]DY        
         STA   ]ERR       
         LDA   ]X1        
         CLC              
         ADC   ]SX        
         STA   ]X1        
:SKIPX
         LDA   ]ERR2      
         CMP   ]DY        
         BPL   :SKIPY     
         LDA   ]ERR       
         CLC              
         ADC   ]DX        
         STA   ]ERR       
         LDA   ]Y1        
         CLC              
         ADC   ]SY        
         STA   ]Y1        
:SKIPY
         JMP   :LP        
:EXIT
         RTS
