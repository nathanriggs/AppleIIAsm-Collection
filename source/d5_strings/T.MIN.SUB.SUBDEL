]SUBLEN  EQU   BPAR1
]SUBIND  EQU   BPAR2
]STR     EQU   WPAR1
SUBDEL
         DEC   ]SUBIND
         INC   ]SUBLEN
         LDY   #0         
         LDA   (]STR),Y   
         SEC   
         SBC   ]SUBLEN    
         STA   RETLEN     
         INC   RETLEN
:LP1
         INY   
         LDA   (]STR),Y   
         STA   RETLEN,Y   
         CPY   ]SUBIND    
         BNE   :LP1       
         LDX   ]SUBIND    
         TYA   
         CLC   
         ADC   ]SUBLEN    
         TAY   
         DEX
         DEY
:LP2
         INY   
         INX   
         LDA   (]STR),Y   
         STA   RETURN,X   
         CPX   RETLEN     
         BNE   :LP2       
:EXIT
         LDA   RETLEN     
         RTS
         CPY   #255       
         BEQ   :EXIT      
