*
*``````````````````````````````*
* LIB.REQUIRED                 *
*                              *
* LIBRARY OF REQUIRED ROUTINES *
* AS PART OF THE APPLEIIASM    *
* MACRO AND SUBROUTINE LIBRARY *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      04-JUN-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* LICENSE:   APACHE 2.0        *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINES:                 *
*                              *
* __DUMP    : DUMP MEMORY      *
* __P       : PRINT            *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** LIBRARY-SPECIFIC VARIABLES
*
         JMP   _ENDMAINLIB
*
]RIGHT   DS    1
]LEFT    DS    1
]LENGTH  DS    1
]A       DS    1          ; REGISTER .A BACKUP
]X       DS    1          ; REGISTER .X BACKUP
]Y       DS    1          ; REGISTER .Y BACKUP
]C       DS    1          ; CARRY FLAG BACKUP
]Z       DS    1          ; ZERO FLAG BACKUP
]N       DS    1          ; NEGATIVE FLAG BACKUP
]O       DS    1          ; OVERFLOW FLAG BACKUP
]HEXTAB  ASC   "0123456789ABCDEF"
*
** LIBRARY-SPECIFIC HOOKS
*
]COUT    EQU   $FDF0      ; SCREEN OUTPUT ROUTINE
]KYBD    EQU   $C000      ; KEYBOARD INPUT
]STROBE  EQU   $C010      ; KEYBOARD STROBE
*
*``````````````````````````````*
* __DUMP:       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = ADDRESS LOBYTE         *
*  .X = ADDRESS HIBYTE         *
*  .Y = NUMBER OF BYTES        *
*                              *
* OUTPUT:                      *
*                              *
*  OUTPUTS DATA LOCATED AT THE *
*  SPECIFIED ADDRESS IN HEX    *
*  FORMAT FOR SPECIFIED NUMBER *
*  OF BYTES.                   *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 787+                 *
* SIZE: 111 BYTES              *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
__DUMP
         STY   ]LENGTH    ; {4C3B} LENGTH PASSED IN .Y
         STA   ZPWSYS     ; {3C2B} ADDRESS LOBYTE IN .A
         STX   ZPWSYS+1   ; {3C2B} ADDRESS HIBYTE IN .X
         LDA   #$8D       ; {2C2B} LOAD CARRIAGE RETURN {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ZPWSYS+1   ; {2C2B} GET ADDRESS HIBYTE {NZ}
         CLRHI            ; {22C13B} CLEAR HIBITS {ZCV,N=0}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEX CHAR FROM TABLE AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ZPWSYS+1   ; {2C2B} LOAD ADDRESS HIBYTE AGAIN {NZ}
         AND   #$0F       ; {2C2B} CLEAR LOBITS {NZ}
         TAX              ; {2C1B} TRANSER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD CHAR FROM TABLE AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SENT TO COUT {NZCV}
         LDA   ZPWSYS     ; {4C3B} LOAD LOBYTE {NZ}
         CLRHI            ; {22C13B} CLEAR HIBITS {ZCV,N=0}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEXCHAR AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ZPWSYS     ; {3C2B} LOAD LOBYTE AGAIN {NZ}
         AND   #$0F       ; {2C2B} CLEAR LOBITS {NZ}
         TAX              ; {2C1B} TRANSFER T .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEXCHAR AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   #":"       ; {2C2B} {NZ}
         JSR   ]COUT      ; {89C3B} SEND COLON TO COUT {NZCV}
         LDA   #"#"       ; {2C2B} {NZ}
         JSR   ]COUT      ; {89C3B} SEND SPACE TO COUT {NZCV}
         LDY   #0         ; {2C2B} RESET COUNTER {NZ}
:LP
         LDA   (ZPWSYS),Y ; {6C2B} LOAD BYTE FROM ADDRESS {NZ}
         CLRHI            ; {22C13B} AT COUNTER OFFSET; CLEAR HIBITS
         STA   ]LEFT      ; {4C3B} SAVE LEFT INDEX
         LDA   (ZPWSYS),Y ; {6C2B} RELOAD {NZ}
         AND   #$0F       ; {2C2B} CLEAR LOBITS {NZ}
         STA   ]RIGHT     ; {4C3B} SAVE RIGHT INDEX
         LDX   ]LEFT      ; {4C3B} LOAD LEFT INDEX {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} GET NIBBLE CHAR {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NCZV}
         LDX   ]RIGHT     ; {4C3B} LOAD RIGHT INDEX {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} GET NIBBLE CHAR {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   #160       ; {4C3B} LOAD SPACE {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         INY              ; {2C1B} INCREASE COUNTER {NZ}
         CPY   ]LENGTH    ; {4C3B} IF COUNTER < LENGTH {NZC}
         BNE   :LP        ; {4C2B} CONTINUE LOOP
         RTS              ; {6C1B} ELSE, EXIT
*
*``````````````````````````````*
* __P:          (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  ASC STRING FOLLOWING CALL   *
*  TERMINATED WITH A 00 BYTE   *
*                              *
* OUTPUT:                      *
*                              *
*  CONTENTS OF STRING.         *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^  ^             *
*                              *
* CYCLES: 155+                 *
* SIZE: 35 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
__P
         PLA              ; {4C1B} PULL RETURN LOBYTE {NZ}
         STA   ZPWSYS     ; {3C2B} STORE TO ZERO PAGE
         PLA              ; {4C1B} PULL RETURN HIBYTE {NZ}
         STA   ZPWSYS+1   ; {3C2B} STORE TO ZERO PAGE
         LDY   #1         ; {2C2B} SET OFFSET TO PLUS ONE
:LP      LDA   (ZPWSYS),Y ; {6C2B} LOAD BYTE AT OFFSET .Y
         BEQ   :DONE      ; {4C2B} IF BYTE = 0, QUIT
         JSR   ]COUT      ; {89C3B} OTHERWISE, PRINT BYTE {NZCV}
         INY              ; {2C1B} INCREASE OFFSET {NZ}
         BNE   :LP        ; {4C2B} IF .Y <> 0, CONTINUE LOOP
:DONE    CLC              ; {2C1B} CLEAR CARRY FLAG {C=0}
         TYA              ; {2C1B} TRANSFER OFFSET TO .A {NZ}
         ADC   ZPWSYS     ; {3C2B} ADD OFFSET TO RETURN ADDR {NZCV}
         STA   ZPWSYS     ; {4C2B} STORE TO RETURN ADDRESS LOBYTE
         LDA   ZPWSYS+1   ; {4C2B} DO THE SAME WITH THE HIBYTE {NZ}
         ADC   #0         ; {3C2B} CARRY NOT RESET, SO INC HIBYTE {NZCV}
         PHA              ; {3C1B} IF NEEDED; THEN, PUSH HIBYTE
         LDA   ZPWSYS     ; {4C2B} LOAD LOBYTE {NZ}
         PHA              ; {3C1B} PUSH LOBYTE
         RTS              ; {6C1B} EXIT
*
_ENDMAINLIB
