]ADDRS   EQU   WPAR1
]ADDRD   EQU   WPAR2
]XIDX    EQU   WPAR3
]YIDX    EQU   ADDR1
]ESIZE   EQU   VARTAB     
]MCAND   EQU   VARTAB+6   
]MLIER   EQU   VARTAB+8   
]PBAK    EQU   VARTAB+10  
]XLEN    EQU   VARTAB+12  
]YLEN    EQU   VARTAB+14  
]PROD    EQU   VARTAB+16  
APUT162
         LDY   #4         
         LDA   (]ADDRD),Y 
         STA   ]ESIZE
         LDY   #0         
         LDA   (]ADDRD),Y 
         STA   ]XLEN
         LDY   #1         
         LDA   (]ADDRD),Y 
         STA   ]XLEN+1
         LDY   #2         
         LDA   (]ADDRD),Y 
         STA   ]YLEN
         LDY   #3         
         LDA   (]ADDRD),Y 
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
         STA   ]PBAK      
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
         ADC   ]ADDRD     
         STA   ADDR2      ; ELEMENT ADDRESS
         LDA   ]PROD+1    
         ADC   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0         
:CLP
         LDA   (]ADDRS),Y 
         STA   (ADDR2),Y  
         INY   
         CPY   ]ESIZE     
         BNE   :CLP
         LDY   ADDR2+1    
         LDX   ADDR2      
         LDA   ]ESIZE     
         RTS
