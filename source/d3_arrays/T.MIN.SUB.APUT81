]ADDRS   EQU   WPAR1
]ADDRD   EQU   WPAR2
]AIDX    EQU   BPAR1
]SCRATCH EQU   ADDR1
]ESIZE   EQU   VARTAB
]ESIZEBK EQU   VARTAB+1
]ASIZE   EQU   VARTAB+2
]IDX     EQU   VARTAB+5
]RES     EQU   VARTAB+7
APUT81
         LDA   ]AIDX      
         STA   ]IDX       
         LDY   #1         
         LDA   (]ADDRD),Y 
         STA   ]ESIZE
         STA   ]ESIZEBK
         LDY   #0         
         LDA   (]ADDRD),Y 
         STA   ]ASIZE     
         TYA   
         STY   ]SCRATCH   
         STY   ]SCRATCH+1 
         BEQ   :ENTLPA    
:DOADD
         CLC   
         ADC   ]AIDX      
         TAX   
         TYA   
         ADC   ]SCRATCH   
         TAY   
         TXA   
:LPA
         ASL   ]AIDX      
         ROL   ]SCRATCH   
:ENTLPA
         LSR   ]ESIZE     
         BCS   :DOADD     
         BNE   :LPA
         STX   ]IDX       
         STY   ]IDX+1     
         CLC   
         LDA   #2         
         ADC   ]IDX       
         STA   ]RES       
         LDA   #0         
         ADC   ]IDX+1
         STA   ]RES+1
         CLC   
         LDA   ]RES       
         ADC   ]ADDRD     
         STA   ]RES       
         LDA   ]RES+1     
         ADC   ]ADDRD+1   ;
         STA   ]RES+1     
         STA   ]ADDRD+1   
         LDA   ]RES       
         STA   ]ADDRD
:LP
         LDA   (]ADDRS),Y 
         STA   (]ADDRD),Y 
         INY   
         CPY   ]ESIZEBK   
         BNE   :LP        
         LDY   ]ADDRD+1   
         LDX   ]ADDRD     
         LDA   ]ESIZE     
         RTS
