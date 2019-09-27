]SLEN    EQU   VARTAB
]ADDR    EQU   WPAR1
BINLOAD
         LDA   #1         
         STA   $AAB6      ; MODE
         STA   $75+1      
         STA   $33        
         LDA   #$8D       
         JSR   FCOUT      
         LDA   #$84       
         JSR   FCOUT      
         LDA   #$C2       
         JSR   FCOUT      
         LDA   #$CC       
         JSR   FCOUT      
         LDA   #$CF       
         JSR   FCOUT      
         LDA   #$C1       
         JSR   FCOUT      
         LDA   #$C4       
         JSR   FCOUT      
         LDA   #$A0       
         JSR   FCOUT      
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]SLEN      
         LDY   #1         
:LP
         LDA   (]ADDR),Y  
         JSR   FCOUT      
         INY   
         CPY   ]SLEN      
         BCC   :LP        
         BEQ   :LP        
         LDA   #$8D       
         JSR   FCOUT      
         RTS
