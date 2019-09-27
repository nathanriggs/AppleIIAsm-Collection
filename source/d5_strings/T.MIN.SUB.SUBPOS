]STRIND  EQU   VARTAB     
]SUBIND  EQU   VARTAB+1   
]CNT     EQU   VARTAB+2   
]STRLEN  EQU   VARTAB+3   
]SUBLEN  EQU   VARTAB+4   
]SIDX    EQU   VARTAB+6
]SUB     EQU   WPAR1      
]STR     EQU   WPAR2      
SUBPOS
         LDY   #0         
         LDA   (]STR),Y   
         BEQ   :NOTFND    
         STA   ]STRLEN    
         LDA   (]SUB),Y   
         BEQ   :NOTFND    
         STA   ]SUBLEN    
         LDA   ]SUBLEN    
         CMP   ]STRLEN    
         BEQ   :LENOK     
         BCS   :NOTFND    
:LENOK
         LDA   #1         
         STA   ]STRIND    
         LDA   ]STRLEN    
         SEC   
         SBC   ]SUBLEN    
         STA   ]CNT       
         INC   ]CNT       
:SLP1
         LDA   ]STRIND
         STA   ]SIDX
         LDA   #1         
         STA   ]SUBIND    
:CMPLP
         LDY   ]SIDX      
         LDA   (]STR),Y   
         LDY   ]SUBIND    
         CMP   (]SUB),Y   
         BNE   :SLP2      ; NOT A MATCH
         CPY   ]SUBLEN    
         BEQ   :FOUND     
         INY   
         STY   ]SUBIND    
         INC   ]SIDX      
         JMP   :CMPLP     
:SLP2
         INC   ]STRIND    
         DEC   ]CNT       
         BNE   :SLP1      
         BEQ   :NOTFND    
:FOUND
         LDA   ]STRIND    
         JMP   :EXIT
:NOTFND
         LDA   #0         
:EXIT
         STA   RETURN     
         LDY   #1         
         STY   RETLEN     
         RTS
