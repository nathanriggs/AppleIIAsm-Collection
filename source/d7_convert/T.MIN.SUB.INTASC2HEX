]NACCUM  EQU   VARTAB
]SIGN    EQU   VARTAB+4
]NINDEX  EQU   VARTAB+6
]STR     EQU   WPAR1
INTASC2HEX
         LDY   #0         
         LDA   (]STR),Y   
         TAX   
         LDA   #1         
         STA   ]NINDEX    ;
         LDA   #0         
         STA   ]NACCUM    
         STA   ]NACCUM+1
         STA   ]SIGN      
         TXA   
         BNE   :INIT1     
         JMP   :EREXIT    
:INIT1
         LDY   ]NINDEX    
         LDA   (]STR),Y   
         CMP   #173       
         BNE   :PLUS      
         LDA   #$0FF      
         STA   ]SIGN
         INC   ]NINDEX    
         DEX              
         BEQ   :EREXIT    
         JMP   :CNVERT
:PLUS
         CMP   #'+'
         BNE   :CHKDIG    

         INC   ]NINDEX    
         DEX              ; DEC COUNT
         BEQ   :EREXIT    
                          
:CNVERT
         LDY   ]NINDEX    
         LDA   (]STR),Y   
:CHKDIG  
         CMP   #$B0       
         BMI   :EREXIT    
         CMP   #$BA       ; '9'+1
         BPL   :EREXIT    
         PHA              
         ASL   ]NACCUM
         ROL   ]NACCUM+1  
         LDA   ]NACCUM
         LDY   ]NACCUM+1  
         ASL   ]NACCUM
         ROL   ]NACCUM+1
         ASL   ]NACCUM
         ROL   ]NACCUM+1  
         CLC
         ADC   ]NACCUM    
         STA   ]NACCUM
         TYA
         ADC   ]NACCUM+1
         STA   ]NACCUM+1  
         PLA              
         SEC   
         SBC   #$B0       
         CLC              
         ADC   ]NACCUM    
         STA   ]NACCUM    
         LDA   #0         
         ADC   ]NACCUM+1
         STA   ]NACCUM+1
         INC   ]NINDEX    ;INC TO NEXT CHARACTER
         DEX   
         BNE   :CNVERT    
         LDA   ]SIGN      
         BPL   :OKEXIT    
         LDA   #0         
         SEC   
         SBC   ]NACCUM    
         STA   ]NACCUM    
         LDA   #0         
         SBC   ]NACCUM+1
         STA   ]NACCUM+1
:OKEXIT
         CLC   
         BCC   :EXIT
:EREXIT
         SEC   
:EXIT
         LDA   #2         
         STA   RETLEN
         LDX   ]NACCUM+1  
         LDA   ]NACCUM    
         STA   RETURN     
         STX   RETURN+1
         RTS
