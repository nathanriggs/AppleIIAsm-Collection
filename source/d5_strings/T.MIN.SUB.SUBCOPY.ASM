]SUBLEN  EQU   BPAR1      
]SUBIND  EQU   BPAR2      
]STR     EQU   WPAR1      
SUBCOPY
         LDY   ]SUBIND    
         LDA   ]SUBLEN    
         STA   RETLEN     
         LDX   #0
:COPY
         LDA   (]STR),Y   
         STA   RETURN,X   
         CPX   ]SUBLEN    
         BEQ   :EXIT      
         INY   
         INX   
         CLC   
         BCC   :COPY      
:EXIT
         LDA   ]SUBLEN    
         RTS
