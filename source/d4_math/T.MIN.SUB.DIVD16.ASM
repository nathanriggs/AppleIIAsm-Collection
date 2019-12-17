]DVEND   EQU   WPAR1
]DVSOR   EQU   WPAR2
]REM     EQU   WPAR3
]RESULT  EQU   WPAR1
DIVD16
         LDA   #0         
         STA   ]REM
         STA   ]REM+1
         LDX   #16        
:DVLP
         ASL   ]DVEND     
         ROL   ]DVEND+1   
         ROL   ]REM       
         ROL   ]REM+1     
         LDA   ]REM
         SEC   
         SBC   ]DVSOR     
         TAY   
         LDA   ]REM+1     
         SBC   ]DVSOR+1   
         BCC   :SKIP      
         STA   ]REM+1     
         STY   ]REM
         INC   ]RESULT    
:SKIP
         DEX   
         BNE   :DVLP      
         LDA   #2         
         STA   RETLEN     
         LDA   ]RESULT    
         STA   RETURN     
         LDX   ]RESULT+1  
         STX   RETURN+1   
         RTS
