]ADDR    EQU   WPAR1
]XIDX    EQU   WPAR2
]YIDX    EQU   WPAR3
]ESIZE   EQU   VARTAB     
]MCAND   EQU   VARTAB+2   
]MLIER   EQU   VARTAB+4   
]PROD    EQU   VARTAB+6   
]PBAK    EQU   VARTAB+10  
]XLEN    EQU   VARTAB+12  
]YLEN    EQU   VARTAB+14  
AGET162
         LDY   #4         
         LDA   (]ADDR),Y  
         STA   ]ESIZE
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]XLEN
         LDY   #1         
         LDA   (]ADDR),Y  
         STA   ]XLEN+1
         LDY   #2         
         LDA   (]ADDR),Y  
         STA   ]YLEN
         LDY   #3         
         LDA   (]ADDR),Y  
         STA   ]YLEN+1
         LDY   #0         
         LDA   ]YIDX      
         STA   ]MLIER     
         LDA   ]YIDX+1    
         STA   ]MLIER+1
         LDA   ]YLEN      
         STA   ]MCAND     
         LDA   ]YLEN+1    
         STA   ]MCAND+1
         LDA   #00        
         STA   ]PROD      
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       
:SHIFT_R
         LSR   ]MLIER+1   
         ROR   ]MLIER     
         BCC   :ROT_R     
         LDA   ]PROD+2    
         CLC   
         ADC   ]MCAND     
         STA   ]PROD+2    
         LDA   ]PROD+3    
         ADC   ]MCAND+1   
:ROT_R
         ROR   
         STA   ]PROD+3    
         ROR   ]PROD+2    
         ROR   ]PROD+1    
         ROR   ]PROD      
         DEX   
         BNE   :SHIFT_R   
         LDA   ]PROD      
         STA   ]PBAK      ; 1ST AND 2ND BYTES
         LDA   ]PROD+1    
         STA   ]PBAK+1
         LDA   ]XIDX      
         STA   ]MLIER     
         LDA   ]XIDX+1    
         STA   ]MLIER+1
         LDA   ]ESIZE     
         STA   ]MCAND     
         LDA   #0         
         STA   ]MCAND+1
         STA   ]PROD      
         STA   ]PROD+1
         STA   ]PROD+2
         STA   ]PROD+3
         LDX   #$10       
:SHIFTR  LSR   ]MLIER+1   
         ROR   ]MLIER     
         BCC   :ROTR      
         LDA   ]PROD+2    
         CLC   
         ADC   ]MCAND     
         STA   ]PROD+2    
         LDA   ]PROD+3    
         ADC   ]MCAND+1   
:ROTR
         ROR   
         STA   ]PROD+3    
         ROR   ]PROD+2    
         ROR   ]PROD+1    
         ROR   ]PROD      
         DEX   
         BNE   :SHIFTR    
         CLC   
         LDA   ]PROD      
         ADC   ]PBAK      
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   ]PBAK+1
         STA   ]PROD+1
         CLC   
         LDA   ]PROD      
         ADC   #5         
         STA   ]PROD
         LDA   ]PROD+1
         ADC   #0         
         STA   ]PROD+1
         CLC   
         LDA   ]PROD      
         ADC   ]ADDR      
         STA   ADDR2      
         LDA   ]PROD+1    
         ADC   ]ADDR+1
         STA   ADDR2+1
         LDY   #0         
:CLP
         LDA   (ADDR2),Y  
         STA   RETURN,Y   
         INY   
         CPY   ]ESIZE     
         BNE   :CLP       
         LDA   ]ESIZE     
         STA   RETLEN     
         LDY   ADDR2+1    
         LDX   ADDR2      
         RTS
