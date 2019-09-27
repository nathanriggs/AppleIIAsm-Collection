BLOAD    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINLOAD
         LDY   SCRATCH
         <<<
BSAVE    MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   BINSAVE
         LDY   SCRATCH
         <<<
AMODE    MAC
         LDA   #1
         STA   $AAB6      
         STA   $75+1      
         STA   $33        
         <<<
CMD      MAC
         STY   SCRATCH
         _MSTR ]1;WPAR1
         JSR   DOSCMD
         LDY   SCRATCH
         <<<
FPRN     MAC
         STY   SCRATCH
         IF    ",]1
         JSR   FPRINT
         ASC   ]1
         HEX   8D00
         ELSE               
         _ISLIT ]1
         JSR   FPSTR      
         FIN
         LDY   SCRATCH
         <<<
FSPRN    MAC
         STY   SCRATCH
         _MLIT ]1;WPAR1
         JSR   FPSTR
         LDY   SCRATCH
         <<<
FINP     MAC
         STY   SCRATCH
         JSR   FINPUT
         LDY   SCRATCH
         <<<
SLOT     MAC
         LDA   ]1
         STA   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH
         ASL   SCRATCH    
         LDA   SCRATCH
         STA   IOB_SLOT
         <<<
DRIVE    MAC
         LDA   ]1
         STA   IOB_DRIV
         <<<
TRACK    MAC
         LDA   ]1
         STA   IOB_TRAK
         <<<
SECT     MAC
         LDA   ]1
         STA   IOB_SECT
         <<<
DSKR     MAC
         LDA   $01
         STA   IOB_COMM
         <<<
DSKW     MAC
         LDA   $02
         STA   IOB_COMM
         <<<
DBUFF    MAC
         LDA   #<]1
         STA   IOB_BUFL
         LDA   #>]1
         STA   IOB_BUFH
         <<<
DRWTS    MAC
         STY   SCRATCH
         JSR   DISKRW
         LDY   SCRATCH
         <<<
