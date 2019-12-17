]ADDRS   EQU   WPAR1
]ADDRD   EQU   WPAR2
]AIDX    EQU   WPAR3
]ESIZE   EQU   VARTAB     
]ESIZEB  EQU   VARTAB+1   
]ASIZE   EQU   VARTAB+2   
]IDX     EQU   VARTAB+6   
APUT161
         LDA   ]AIDX
         STA   ]IDX
         LDA   ]AIDX+1
         STA   ]IDX+1
         STA   SCRATCH
         LDY   #0         
         LDA   (]ADDRD),Y 
         STA   ]ASIZE     
         LDY   #1         
         LDA   (]ADDRD),Y 
         STA   ]ASIZE+1   
         INY   
         LDA   (]ADDRD),Y 
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
         CLC
         LDA   #3         
         ADC   ]IDX
         STA   ADDR2      
         LDA   ]IDX+1     
         ADC   #0
         STA   ADDR2+1
         CLC   
         LDA   ADDR2      
         ADC   ]ADDRD     
         STA   ADDR2      
         LDA   ADDR2+1    
         ADC   ]ADDRD+1
         STA   ADDR2+1
         LDY   #0
:LP
         LDA   (]ADDRS),Y 
         STA   (ADDR2),Y  
         INY   
         CPY   ]ESIZEB    
         BNE   :LP        
         LDY   ADDR2+1    
         LDX   ADDR2      
         LDA   ]ESIZEB    
         RTS
