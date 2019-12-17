DPRINT
         PLA   
         TAX
         PLA   
         TAY
         PLA   
         STA   ADDR1      
         PLA
         STA   ADDR1+1    
         TYA
         PHA   
         TXA   
         PHA
         LDY   #$00       
:LOOP
         LDA   (ADDR1),Y
         BEQ   :EXIT      
         JSR   COUT1      
         INY   
         BNE   :LOOP      
:EXIT
         RTS
