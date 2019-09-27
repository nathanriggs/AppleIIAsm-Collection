]ADDR    EQU   WPAR1
]ASIZE   EQU   WPAR2
]ESIZE   EQU   WPAR3
]FILL    EQU   BPAR1
]MSIZE   EQU   VARTAB     
]ASZBAK  EQU   VARTAB+4   
]ESZBAK  EQU   VARTAB+6   
ADIM81
         LDA   ]ESIZE
         STA   ]ESZBAK
         LDA   ]ASIZE
         STA   ]ASZBAK
         LDA   #0
         STA   ]ASIZE+1
         STA   ]ASZBAK+1
         LDY   #0         
         TYA   
         LDY   ]ASIZE+1
         STY   SCRATCH    
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
         STX   ]MSIZE     
         STY   ]MSIZE+1   
         LDA   ]MSIZE     
         CLC   
         ADC   #2
         STA   ]MSIZE     
         LDA   ]MSIZE+1
         ADC   #0         
         STA   ]MSIZE+1
         LDA   ]FILL      
         LDX   ]MSIZE+1   
         BEQ   :PART      
         LDY   #0         
:FULL
         STA   (]ADDR),Y  
         INY   
         BNE   :FULL      
         INC   ]ADDR+1    
         DEX   
         BNE   :FULL      
:PART
         LDX   ]MSIZE     
         BEQ   :MFEXIT    
         LDY   #0         
:PARTLP
         STA   (]ADDR),Y  
         INY              
         DEX   
         BNE   :PARTLP    
:MFEXIT
         LDY   #0         
         LDA   ]ASZBAK    
         STA   (]ADDR),Y
         INY
         LDA   ]ESZBAK    
         STA   (]ADDR),Y  
         LDX   ]ADDR      
         LDY   ]ADDR+1    
         LDA   ]ASZBAK    
         LDA   ]MSIZE     
         STA   RETURN     
         LDA   ]MSIZE+1
         STA   RETURN+1
         LDA   #2         
         STA   RETLEN     
         RTS
