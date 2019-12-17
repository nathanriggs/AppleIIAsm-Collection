]MSIZE   EQU   VARTAB     
]ASIZE   EQU   VARTAB+2   
]ASZBAK  EQU   VARTAB+4   
]ESIZE   EQU   VARTAB+6   
]ESZBAK  EQU   VARTAB+7   
]FILL    EQU   VARTAB+8   
ADIM161
         PLA   
         TAX   
         PLA   
         TAY   
         PLA   
         STA   ]FILL      
         PLA   
         STA   ]ESIZE     
         STA   ]ESZBAK    
         PLA   
         STA   ]ASIZE
         STA   ]ASZBAK    
         PLA   
         STA   ]ASIZE+1
         STA   ]ASZBAK+1  
         STA   SCRATCH    
         PLA   
         STA   ADDR1
         STA   ADDR2
         PLA   
         STA   ADDR1+1
         STA   ADDR2+1
         TYA   
         PHA   
         TXA   
         PHA   
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
         STA   (ADDR1),Y  
         INY   
         BNE   :FULL      
         INC   ADDR1+1    
         DEX   
         BNE   :FULL      
:PART
         LDX   ]MSIZE     
         BEQ   :MFEXIT    
         LDY   #0         
:PARTLP
         STA   (ADDR1),Y  
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
         LDX   ADDR1      
         LDY   ADDR1+1    
         LDA   ]MSIZE     
         STA   RETURN     
         LDA   ]MSIZE+1
         STA   RETURN+1
         LDA   #2
         STA   RETLEN     
         LDA   ]ASZBAK    
         RTS
