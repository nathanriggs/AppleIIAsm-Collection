]SLEN    EQU   VARTAB
]ADDR    EQU   WPAR1
DOSCMD
         LDA   #1         
         STA   $AAB6      
         STA   $75+1      
         STA   $33        
         LDA   #$8D       
         JSR   FCOUT      
         LDA   #$84       
         JSR   FCOUT      
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]SLEN      
         LDY   #$01       
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
