]ADDR    EQU   WPAR1      
]XIDX    EQU   BPAR1      
]YIDX    EQU   BPAR2      
]XLEN    EQU   VARTAB+0   
]YLEN    EQU   VARTAB+2   
]PROD    EQU   VARTAB+4   
]MLIER   EQU   VARTAB+8   
]MCAND   EQU   VARTAB+10  
]ELEN    EQU   VARTAB+12  
]PBAK    EQU   VARTAB+14  
AGET82
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]XLEN
         LDY   #1         
         LDA   (]ADDR),Y  
         STA   ]YLEN
         LDY   #2         
         LDA   (]ADDR),Y  
         STA   ]ELEN
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
         LDA   ]ELEN      
         STA   ]MCAND     
         LDA   #0         
         STA   ]MLIER+1   
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
         LDA   ]PROD      
         CLC   
         ADC   #3         
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   #0
         STA   ]PROD+1
         CLC   
         LDA   ]PROD      
         ADC   ]PBAK      
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   ]PBAK+1    
         STA   ]PROD+1    
         CLC   
         LDA   ]PROD      
         ADC   ]ADDR      
         STA   ]PROD      
         LDA   ]PROD+1    
         ADC   ]ADDR+1    
         STA   ]PROD+1    
         LDY   ]PROD      
         LDX   ]PROD+1    
         STY   ]ADDR      
         STX   ]ADDR+1
         LDY   #0         
:RLP
         LDA   (]ADDR),Y  
         STA   RETURN,Y   
         INY   
         CPY   ]ELEN      
         BNE   :RLP       
         LDA   ]ELEN      
         STA   RETLEN     
         LDA   RETLEN     
         LDX   ]ADDR      
         LDY   ]ADDR+1    
         RTS
