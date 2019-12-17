]HIGH    EQU   VARTAB
]LOW     EQU   VARTAB+2
]NIB     EQU   VARTAB+4
]STR     EQU   WPAR1
BINASC2HEX
         JSR   :TESTNIB   
         LDA   ]NIB       
         STA   ]HIGH      
         LDA   ]STR       
         CLC   
         ADC   #4         
         STA   ]STR
         LDA   ]STR+1     
         ADC   #0         
         STA   ]STR+1
         JSR   :TESTNIB   
         LDA   ]NIB
         STA   ]LOW       
         LDA   #1         
         STA   RETLEN     
         LDA   ]HIGH      
         ORA   ]LOW       
         STA   RETURN     
         JMP   :EXIT
:TESTNIB
         LDY   #0         
         LDA   (]STR),Y   
         CMP   #'0'       
         BEQ   :_07       
         JMP   :_8F       
:_07
         LDY   #1         
         LDA   (]STR),Y   
         CMP   #'0'       
         BEQ   :_03       
         JMP   :_47       
:_03
         LDY   #2         
         LDA   (]STR),Y   
         CMP   #'0'       
         BEQ   :_01       
         JMP   :_23       
:_01
         LDY   #3         
         LDA   (]STR),Y   
         CMP   #'0'       
         BEQ   :_00       
         LDA   #1         
         STA   ]NIB       
         JMP   :EXIT
:_00     LDA   #0         
         STA   ]NIB
         JMP   :EXIT
:_23     LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_02       
         LDA   #3         
         STA   ]NIB
         JMP   :EXIT
:_02     LDA   #$2        
         STA   ]NIB
         JMP   :EXIT
:_47
         LDY   #2         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_45       
         JMP   :_67       
:_45
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_4        
         LDA   #$5        
         STA   ]NIB
         JMP   :EXIT
:_4      LDA   #$4        
         STA   ]NIB
         JMP   :EXIT
:_67
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_6        
         LDA   #$7        
         STA   ]NIB
         JMP   :EXIT
:_6      LDA   #$6        
         STA   ]NIB
         JMP   :EXIT
:_8F     
         LDY   #1         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_8B       
         JMP   :_CF       
:_8B     
         LDY   #2         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_89       
         JMP   :_AB       
:_89     
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       IF = "0",
         BEQ   :_8        THEN NIBBLE IS 8
         LDA   #9         
         STA   ]NIB
         JMP   :EXIT
:_8      LDA   #$8        
         STA   ]NIB
         JMP   :EXIT
:_AB     
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_A        
         LDA   #$B        
         STA   ]NIB
         JMP   :EXIT
:_A      LDA   #$A        
         STA   ]NIB
         JMP   :EXIT
:_CF     
         LDY   #2         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_CD       
         JMP   :_EF       
:_CD     
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_C        
         LDA   #$D        
         STA   ]NIB
         JMP   :EXIT
:_C      LDA   #$C        
         STA   ]NIB
         JMP   :EXIT
:_EF     
         LDY   #3         
         LDA   (]STR),Y
         CMP   #'0'       
         BEQ   :_E        
         LDA   #$F        
         STA   ]NIB
         JMP   :EXIT
:_E      LDA   #$E        
         STA   ]NIB
:EXIT
         RTS
