]ADDRD   EQU   WPAR1
]ASIZE   EQU   WPAR2
]ESIZE   EQU   WPAR3
]FILL    EQU   BPAR1
]MSIZE   EQU   VARTAB     
]ASZBAK  EQU   VARTAB+4   
]ESZBAK  EQU   VARTAB+7   
ADIM161
         LDA   ]ESIZE     
         STA   ]ESZBAK    
         LDA   ]ASIZE
         STA   ]ASZBAK    
         LDA   ]ASIZE+1
         STA   ]ASZBAK+1  
         STA   SCRATCH    
         LDA   ]ADDRD
         STA   ADDR2
         LDA   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0         
         LDA   #0         
         BEQ   :ENTLP     
:DOADD
         CLC   
         ADC   ]ASIZE     
         TAX   
         TYA   
         ADC   SCRATCH    
         TAY   
         TXA   
:LP
         ASL   ]ASIZE     
         ROL   SCRATCH    
:ENTLP
         LSR   ]ESIZE     
         BCS   :DOADD     
         BNE   :LP        
         CLC   
         TXA   
         ADC   #3         
         STA   ]MSIZE     
         TYA   
         ADC   #0         
         STA   ]MSIZE+1   
         LDA   ]FILL      
         LDX   ]MSIZE+1   
         BEQ   :PART      
         LDY   #0         
:FULL
         STA   (]ADDRD),Y 
         INY   
         BNE   :FULL      
         INC   ]ADDRD+1   
         DEX   
         BNE   :FULL      
:PART
         LDX   ]MSIZE     
         BEQ   :MFEXIT    
         LDY   #0         
:PARTLP
         STA   (]ADDRD),Y 
         INY              
         DEX   
         BNE   :PARTLP    
:MFEXIT
         LDY   #0         
         LDA   ]ASZBAK    
         STA   (ADDR2),Y
         INY   
         LDA   ]ASZBAK+1  
         STA   (ADDR2),Y
         INY   
         LDA   ]ESZBAK    
         STA   (ADDR2),Y  
         LDX   ]ADDRD     
         LDY   ]ADDRD+1   
         LDA   ]MSIZE     
         STA   RETURN     
         LDA   ]MSIZE+1
         STA   RETURN+1
         LDA   #2
         STA   RETLEN     
         LDA   ]ASZBAK    
         RTS
