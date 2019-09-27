]NGFLAG  EQU   VARTAB     
]VALSTR  EQU   WPAR1      
]MOD10   EQU   VARTAB+2   
HEX2INTASC
         LDA   ]VALSTR+1  
         STA   ]NGFLAG    
         BPL   :GETBP     
         LDA   #0         
         SEC
         SBC   ]VALSTR
         STA   ]VALSTR    
         LDA   #0         
         SBC   ]VALSTR+1
         STA   ]VALSTR+1
:GETBP
         LDA   #0         
         LDY   #0
         STA   RETLEN,Y   
:CNVERT  
         LDA   #0         
         STA   ]MOD10
         STA   ]MOD10+1
         LDX   #16
         CLC   
:DVLOOP
         ROL   ]VALSTR    
         ROL   ]VALSTR+1  
         ROL   ]MOD10     
         ROL   ]MOD10+1
         SEC   
         LDA   ]MOD10     
         SBC   #10        
         TAY   
         LDA   ]MOD10+1   
         SBC   #0         
         BCC   :DECCNT    
         STY   ]MOD10     
         STA   ]MOD10+1   
                          
:DECCNT
         DEX   
         BNE   :DVLOOP    
         ROL   ]VALSTR    
         ROL   ]VALSTR+1
:CONCH
         LDA   ]MOD10
         CLC   
         ADC   #$B0       
         
         JSR   :CONCAT    
         LDA   ]VALSTR    
         ORA   ]VALSTR+1  
         BNE   :CNVERT    ;
:EXIT
         LDA   ]NGFLAG    
         BPL   :POS       
         LDA   #173       
         JSR   :CONCAT    
:POS     
         RTS              
:CONCAT  
         PHA              
         LDY   #0         
         LDA   RETLEN,Y   
         TAY   
         BEQ   :EXITMR    
:MVELP
         LDA   RETLEN,Y   
         INY   
         STA   RETLEN,Y   
         DEY   
         DEY
         BNE   :MVELP     
:EXITMR
         PLA   
         LDY   #1
         STA   RETLEN,Y   
         LDY   #0         
         LDA   RETLEN,Y   
         CLC   
         ADC   #1         
         STA   RETLEN,Y   
         LDA   RETLEN
         RTS
