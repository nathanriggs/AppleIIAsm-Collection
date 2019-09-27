]HI      EQU   VARTAB     
]LO      EQU   VARTAB+2   
]STR     EQU   WPAR1      
HEXASC2HEX
         LDY   #1         
         LDA   (]STR),Y
         STA   ]HI        
         INY   
         LDA   (]STR),Y   
         STA   ]LO        
         SEC   
         SBC   #'0'       
         CMP   #10        
         BCC   :CONT      
         SBC   #7         
:CONT
         STA   ]LO        
         LDA   ]HI        
         SEC   
         SBC   #'0'       
         CMP   #10        
         BCC   :C2        
         SBC   #7         
:C2
         STA   ]HI        
         ASL   
         ASL
         ASL
         ASL
         ORA   ]LO        
         
         LDY   #1         
         STY   RETLEN
         STA   RETURN     
         RTS
