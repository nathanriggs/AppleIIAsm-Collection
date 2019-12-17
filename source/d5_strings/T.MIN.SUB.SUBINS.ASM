]SUB     EQU   WPAR1
]STR     EQU   WPAR2
]INDEX   EQU   BPAR1
]OLDIND  EQU   VARTAB
]TMP     EQU   VARTAB+2
]SUBLEN  EQU   VARTAB+4
SUBINS
         DEC   ]INDEX
         LDY   #0         
         LDA   (]STR),Y   
         STA   ]TMP       
         LDA   (]SUB),Y   
         STA   ]SUBLEN
         CLC   
         ADC   ]TMP       
         STA   RETLEN     
         BCC   :CONT      
         LDA   #255       
         STA   RETLEN     
:CONT
         LDA   ]INDEX     
         BEQ   :SUBCOPY   
:LP1
         INY   
         LDA   (]STR),Y   
         STA   RETLEN,Y   
         CPY   ]INDEX     
         BNE   :LP1       
:SUBCOPY
         STY   ]OLDIND    
         TYA   
         TAX   
         LDY   #0         
:SUBLP
         INY   
         INX   
         LDA   (]SUB),Y   
         STA   RETLEN,X   
         CPY   ]SUBLEN    
         BNE   :SUBLP     
         LDY   ]OLDIND    
:FINLP
         INY   
         INX   
         LDA   (]STR),Y   
         STA   RETLEN,X   
         CPY   ]STR       
         BNE   :FINLP     
:EXIT
         LDA   RETLEN     
         RTS
