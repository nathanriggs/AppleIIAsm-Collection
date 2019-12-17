I2STR    MAC
         STY   SCRATCH
         _MLIT ]1;WPAR1
         JSR   HEX2INTASC
         LDY   SCRATCH
         <<<
STR2I    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   INTASC2HEX
         LDY   SCRATCH
         <<<
H2STR    MAC
         STY   SCRATCH
         LDA   ]1
         JSR   HEX2HEXASC
         LDY   SCRATCH
         <<<
STR2H    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   HEXASC2HEX
         LDY   SCRATCH
         <<<
B2STR    MAC
         STY   SCRATCH
         LDA   ]1
         STA   BPAR1
         JSR   HEX2BINASC
         LDY   SCRATCH
         <<<
STR2B    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINASC2HEX
         LDY   SCRATCH
         <<<
