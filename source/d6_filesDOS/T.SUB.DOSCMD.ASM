*``````````````````````````````*
* DOSCMD        (NATHAN RIGGS) *
*                              *
* EXECUTES A DOS COMMAND THAT  *
* IS PASSED VIA A STRING ADDR  *
*                              *
* INPUT:                       *
*                              *
*  WPAR1 = STRING ADDRESS PTR  *
*                              *
* OUTPUT:                      *
*                              *
*  NONE                        *
*                              *
* DESTROY: AXYNVBDIZCMS        *
*          ^^^^^   ^^^         *
*                              *
* CYCLES: 76+                  *
* SIZE: 52 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SLEN    EQU   VARTAB
]ADDR    EQU   WPAR1
*
DOSCMD
*
         LDA   #1         ; SET DOS TO APPLESOFT MODE
         STA   $AAB6      ; BY SWITCHING DOS LANG FLAG
         STA   $75+1      ; AND SETTING INDIRECT MODE
         STA   $33        ; NOT DIRECT MODE
         LDA   #$8D       ; CARRIAGE RETURN
         JSR   FCOUT      ; SEND TO COUT
         LDA   #$84       ; CTRL-D FOR DOS COMMAND
         JSR   FCOUT      ; SEND TO COUT
         LDY   #0         ; RESET INDEX
         LDA   (]ADDR),Y  ; GET STRING LENGTH
         STA   ]SLEN      ; HOLD IN ]SLEN
         LDY   #$01       ; SET INDEX TO FIRST CHARACTER
:LP
         LDA   (]ADDR),Y  ; LOAD CHARACTER
         JSR   FCOUT      ; SEND TOU COUT
         INY              ; INCREASE INDEX
         CPY   ]SLEN      ; IF .Y <= STRING LENGTH
         BCC   :LP        ; THEN KEEP LOOPING
         BEQ   :LP
         LDA   #$8D       ; OTHERWISE, LOAD CARRIAGE RETURN
         JSR   FCOUT      ; AND SEND TO COUT
         RTS
