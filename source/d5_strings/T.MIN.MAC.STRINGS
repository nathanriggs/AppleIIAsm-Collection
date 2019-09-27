SCMP     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         _MSTR ]2;WPAR2
         JSR   STRCMP
         LDY   SCRATCH
         <<<
SCAT     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         _MSTR ]2;WPAR2
         JSR   STRCAT
         LDY   SCRATCH
         <<<
SPRN     MAC
         STY   SCRATCH
         _AXLIT ]1
         JSR   PRNSTR
         LDY   SCRATCH
         <<<
SPOS     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR2
         _MSTR ]2;WPAR1
         JSR   SUBPOS
         LDY   SCRATCH
         <<<
SCPY     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         LDA   ]2
         STA   BPAR2
         LDA   ]3
         STA   BPAR1
         JSR   SUBCOPY
         LDY   SCRATCH
         <<<
SDEL     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         LDA   ]2
         STA   BPAR2
         LDA   ]3
         STA   BPAR1
         JSR   SUBDEL
         LDY   SCRATCH
         <<<
SINS     MAC
         STY   SCRATCH
         _MSTR ]1;WPAR2
         _MSTR ]2;WPAR1
         LDA   ]3
         STA   BPAR1
         JSR   SUBINS
         LDY   SCRATCH
         <<<
