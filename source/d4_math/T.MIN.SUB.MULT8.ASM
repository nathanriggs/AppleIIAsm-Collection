]MUL1    EQU   WPAR1
]MUL2    EQU   WPAR2
MULT8
         STA   ]MUL1
         STX   ]MUL2
         LDA   #0         
         TAY
         TAX
         STA   ]MUL1+1    
         BEQ   :GOLOOP
:DOADD
         CLC   
         ADC   ]MUL1      
         TAX              
         TYA              
         ADC   ]MUL1+1    
         TAY   
         TXA   
:LP
         ASL   ]MUL1      
         ROL   ]MUL1+1    
:GOLOOP
         LSR   ]MUL2      
         BCS   :DOADD     
         BNE   :LP        
         LDA   #2         
         STA   RETLEN     
         STX   RETURN     
         STY   RETURN+1   
         TXA   
         LDX   RETURN+1   
         RTS
