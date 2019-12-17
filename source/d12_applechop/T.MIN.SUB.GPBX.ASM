GPBX
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
         LDA   (ADDR1),Y  
         BMI   :1         
         JMP   :0
:1
         LDY   #$01       ; BTN PUSHED;A=1
         JMP   :EXIT
:0
         LDY   #$00       ; BTN NOT PUSHED;A=0
:EXIT
         TYA   
         RTS
