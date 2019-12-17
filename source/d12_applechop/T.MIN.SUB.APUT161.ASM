]ESIZE   EQU   VARTAB     
]ESIZEB  EQU   VARTAB+1   
]ASIZE   EQU   VARTAB+2   
]AIDX    EQU   VARTAB+4   
]IDX     EQU   VARTAB+6   
APUT161
         PLA   
         TAX   
         PLA   
         TAY   
         PLA   
         STA   ]AIDX
         STA   ]IDX
         PLA              
         STA   ]AIDX+1
         STA   ]IDX+1
         STA   SCRATCH
         PLA   
         STA   ADDR4      
         PLA   
         STA   ADDR4+1    
         PLA   
         STA   ADDR3      
         PLA   
         STA   ADDR3+1    
         TYA   
         PHA
         TXA   
         PHA
         LDY   #0         
         LDA   (ADDR4),Y  
         STA   ]ASIZE     
         LDY   #1         
         LDA   (ADDR4),Y  
         STA   ]ASIZE+1   
         INY   
         LDA   (ADDR4),Y  
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
         ADC   ADDR4      
         STA   ADDR2      
         LDA   ADDR2+1    
         ADC   ADDR4+1
         STA   ADDR2+1
         LDY   #0
:LP
         LDA   (ADDR3),Y  
         STA   (ADDR2),Y  
         INY   
         CPY   ]ESIZEB    
         BNE   :LP        
         LDY   ADDR2+1    
         LDX   ADDR2      
         LDA   ]ESIZEB    
         RTS
