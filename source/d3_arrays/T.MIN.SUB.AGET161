]AIDX    EQU   WPAR2
]ADDR    EQU   WPAR1
]ESIZE   EQU   VARTAB     
]ESIZEB  EQU   VARTAB+1   
]ASIZE   EQU   VARTAB+2   
]IDX     EQU   VARTAB+6   
AGET161
         LDA   ]AIDX
         STA   ]IDX
         LDA   ]AIDX+1    
         STA   ]AIDX+1
         STA   SCRATCH
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]ASIZE     
         LDY   #1         
         LDA   (]ADDR),Y  
         STA   ]ASIZE+1
         INY   
         LDA   (]ADDR),Y  
         STA   ]ESIZE
         STA   ]ESIZEB
         LDY   #0         
         LDA   #0
         BEQ   :ENTLPA    
:DOADD
         CLC   
         ADC   ]AIDX      
         TAX   
         TYA   
         ADC   SCRATCH    
         TAY   
         TXA   
:LPA
         ASL   ]AIDX      
         ROL   SCRATCH    
:ENTLPA
         LSR   ]ESIZE     
         BCS   :DOADD     
         BNE   :LPA       
         STX   ]IDX       
         STY   ]IDX+1     
         LDA   #3         
         CLC   
         ADC   ]IDX
         STA   ADDR2      
         LDA   ]IDX+1     
         ADC   #0
         STA   ADDR2+1
         LDA   ADDR2      
         CLC
         ADC   ]ADDR      
         STA   ADDR2
         LDA   ADDR2+1    
         ADC   ]ADDR+1
         STA   ADDR2+1
         LDY   #0         
:LP
         LDA   (ADDR2),Y  
         STA   RETURN,Y   
         INY   
         CPY   ]ESIZEB    
         BNE   :LP        
         LDA   ]ESIZEB    
         STA   RETLEN     
         LDY   ADDR2+1    
         LDX   ADDR2      
         RTS
