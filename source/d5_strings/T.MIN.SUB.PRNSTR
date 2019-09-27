]LEN     EQU   VARTAB     
]STR     EQU   ADDR1      
PRNSTR
         STA   ]STR       
         STX   ]STR+1     
         LDY   #0         
         LDA   (]STR),Y   
         STA   ]LEN       
:LP
         INY   
         LDA   (]STR),Y   
         JSR   SCOUT1     
         CPY   ]LEN       
         BNE   :LP        
         LDA   ]LEN       
         RTS
