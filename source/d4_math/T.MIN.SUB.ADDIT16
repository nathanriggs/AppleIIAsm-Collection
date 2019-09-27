]ADD1    EQU   WPAR1
]ADD2    EQU   WPAR2
ADDIT16
         LDA   #2
         STA   RETLEN
         LDA   ]ADD1      
         CLC   
         ADC   ]ADD2
         TAY   
         LDA   ]ADD1+1    
         ADC   ]ADD2+1
         TAX   
         TYA   
         STA   RETURN
         STX   RETURN+1
         RTS
