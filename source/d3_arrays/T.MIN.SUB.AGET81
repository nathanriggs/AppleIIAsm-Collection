]RES     EQU   VARTAB     
]IDX     EQU   VARTAB+2   
]ESIZE   EQU   VARTAB+4   
]ALEN    EQU   VARTAB+5   
AGET81
         STA   ADDR1      
         STX   ADDR1+1    
         STY   ]IDX       
         LDA   #0         
         STA   ]IDX+1
         LDY   #1         
         LDA   (ADDR1),Y  
         STA   ]ESIZE
         STA   RETLEN     
         DEY   
         LDA   (ADDR1),Y  
         STA   ]ALEN      
         TYA   
         STY   SCRATCH    
         BEQ   :ENTLP     
:DOADD
         CLC   
         ADC   ]IDX       
         TAX   
         TYA   
         ADC   SCRATCH    
         TAY   
         TXA   
:LP
         ASL   ]IDX       
         ROL   SCRATCH    
:ENTLP
         LSR   ]ESIZE     
         BCS   :DOADD     
         BNE   :LP
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
         ADC   ADDR1      
         STA   ]RES       
         LDA   ]RES+1     
         ADC   ADDR1+1    
         STA   ]RES+1     
         LDY   #0         
         LDA   ]RES       
         STA   ADDR1      
         LDA   ]RES+1     
         STA   ADDR1+1    
:LDLOOP
         LDA   (ADDR1),Y  
         STA   RETURN,Y   
         INY   
         CPY   RETLEN     
         BCC   :LDLOOP    
         BEQ   :LDLOOP    
         LDX   ]RES       
         LDY   ]RES+1     
         LDA   RETLEN     
         RTS
