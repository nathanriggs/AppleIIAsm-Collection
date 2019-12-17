]S1LEN   EQU   VARTAB+1   
]S2LEN   EQU   VARTAB+3   
]INDEX   EQU   WPAR3      
]STR2    EQU   WPAR2      
]STR1    EQU   WPAR1      
STRCAT
         LDY   #0         
         LDA   (]STR1),Y  
         STA   ]S1LEN     
         LDA   (]STR2),Y  
         STA   ]S2LEN     
         LDA   ]S2LEN     
         CLC   
         ADC   ]S1LEN     
         STA   RETLEN     
         BCC   :DOCAT     
         LDA   #255       
         STA   RETLEN
:DOCAT
         LDY   #0         
:CAT1
         INY
         LDA   (]STR1),Y  
         STA   RETLEN,Y   
         CPY   ]S1LEN     
         BNE   :CAT1      
         TYA   
         CLC   
         ADC   #<RETLEN   
         STA   ]INDEX     
         LDA   #0         
         ADC   #>RETLEN+1 
         STA   ]INDEX+1   
         CLC   
         LDY   #0
:CAT2
         INY
         LDA   (]STR2),Y  
         STA   (]INDEX),Y 
         CPY   RETLEN     
         BEQ   :EXIT
         BNE   :CAT2      
:EXIT
         LDA   RETLEN     
         RTS
