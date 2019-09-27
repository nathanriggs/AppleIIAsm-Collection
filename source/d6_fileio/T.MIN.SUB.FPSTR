]SLEN    EQU   VARTAB     
]ADDR    EQU   WPAR1      
FPSTR
         LDY   #0         
         LDA   (]ADDR),Y  
         STA   ]SLEN      
:LP
         INY   
         LDA   (]ADDR),Y  
         JSR   FCOUT      
         CPY   ]SLEN      
         BNE   :LP        
:EXIT
         TYA   
         RTS
