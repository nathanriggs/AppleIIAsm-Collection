XPRINT
         PLA   
         STA   ADDR1      
         PLA
         STA   ADDR1+1
         LDY   #$01       
         
:LOOP
         LDA   (ADDR1),Y  
         BEQ   :EXIT      
         JSR   COUT1      
         INY   
         BNE   :LOOP      
:EXIT
         CLC   
         TYA   
         ADC   ADDR1      
         STA   ADDR1      
         LDA   ADDR1+1    
         ADC   #$00       
         PHA   
         LDA   ADDR1
         PHA   
         RTS
