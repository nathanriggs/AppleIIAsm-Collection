]STR1    EQU   WPAR1      
]STR2    EQU   WPAR2      
STRCMP
         LDY   #0         
         LDA   (]STR1),Y  
         CMP   (]STR2),Y  
         BCC   :BEGCMP    ; THEN BEGIN COMPARISON
         LDA   (]STR2),Y  
:BEGCMP
         TAX   
         BEQ   :TSTLEN    
         LDY   #1         
:CMPLP
         LDA   (]STR1),Y  
         CMP   (]STR2),Y  
         BNE   :EXIT      
         
         INY   
         DEX   
         BNE   :CMPLP     
:TSTLEN
         LDY   #0         
         LDA   (]STR1),Y  
         CMP   (]STR2),Y  
:EXIT
         RTS
