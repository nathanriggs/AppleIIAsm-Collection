]ADDRS   EQU   WPAR1      
]ADDRD   EQU   WPAR2      
]XIDX    EQU   BPAR1      
]YIDX    EQU   BPAR2      
]ESIZE   EQU   VARTAB     
]MCAND   EQU   VARTAB+1   
]MLIER   EQU   VARTAB+3   
]PROD    EQU   VARTAB+5   
]XLEN    EQU   VARTAB+9   
]YLEN    EQU   VARTAB+13  
]PBAK    EQU   VARTAB+15  
APUT82
         LDY   #0         
         LDA   (]ADDRD),Y 
         STA   ]XLEN
         LDY   #1         
         LDA   (]ADDRD),Y 
         STA   ]YLEN
         LDY   #2         
         LDA   (]ADDRD),Y 
         STA   ]ESIZE
         LDA   #0         
         TAY   
         STY   SCRATCH    
         BEQ   :ENTLP     
:DOADD
         CLC   
         ADC   ]YIDX      
         TAX   
         TYA   
         ADC   SCRATCH    
         TAY   
         TXA   
:LP
         ASL   ]YIDX      
         ROL   SCRATCH    
:ENTLP
         LSR   ]YLEN      
         BCS   :DOADD     
         BNE   :LP        
         STX   ]PBAK      
         STY   ]PBAK+1    
         LDA   ]XIDX      
         STA   ]MLIER
         LDA   #0         
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
         LDA   ]PBAK      
         CLC   
         ADC   ]PROD      
         STA   ]PROD      
         LDA   ]PBAK+1    
         ADC   ]PROD+1    
         STA   ]PROD+1    
         LDA   ]PROD      
         CLC   
         ADC   #3         
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   #0
         STA   ]PROD+1
         CLC   
         LDA   ]PROD      
         ADC   ]ADDRD     
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   ]ADDRD+1   
         STA   ]PROD+1    
         LDX   ]PROD      
         LDY   ]PROD+1    
         STX   ADDR2      
         STY   ADDR2+1
         LDY   #0         
:CLP
         LDA   (]ADDRS),Y 
         STA   (ADDR2),Y  
         INY   
         CPY   ]ESIZE     
         BNE   :CLP       
         LDX   ADDR2      
         LDY   ADDR2+1    
         LDA   ]ESIZE     
         RTS
