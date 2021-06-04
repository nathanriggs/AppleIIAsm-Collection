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
* DATE:      11-MAR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* LICENSE:   APACHE 2.0        *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINES:                 *
*                              *
* __DUMP    : DUMP MEMORY      *
* __ERRH    : HANDLE ERRORS    *
* __P       : PRINT            *
* DELAYMS   : DELAY MLSECS     *
* MEMFILL   : FILL MEM BLOCK   *
* MEMMOVE   : MOVE MEM BLOCK   *
* MEMSWAP   : SWAP MEM BLOCKS  *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
** LIBRARY-SPECIFIC VARIABLES
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
         STA   ADDR1      ; {3C2B} ADDRESS LOBYTE IN .A
         STX   ADDR1+1    ; {3C2B} ADDRESS HIBYTE IN .X
         LDA   #$8D       ; {2C2B} LOAD CARRIAGE RETURN {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ADDR1+1    ; {2C2B} GET ADDRESS HIBYTE {NZ}
         CLRHI            ; {22C13B} CLEAR HIBITS {ZCV,N=0}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEX CHAR FROM TABLE AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ADDR1+1    ; {2C2B} LOAD ADDRESS HIBYTE AGAIN {NZ}
         AND   #$0F       ; {2C2B} CLEAR LOBITS {NZ}
         TAX              ; {2C1B} TRANSER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD CHAR FROM TABLE AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SENT TO COUT {NZCV}
         LDA   ADDR1      ; {4C3B} LOAD LOBYTE {NZ}
         CLRHI            ; {22C13B} CLEAR HIBITS {ZCV,N=0}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEXCHAR AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   ADDR1      ; {3C2B} LOAD LOBYTE AGAIN {NZ}
         AND   #$0F       ; {2C2B} CLEAR LOBITS {NZ}
         TAX              ; {2C1B} TRANSFER T .X {NZ}
         LDA   ]HEXTAB,X  ; {5C3B} LOAD HEXCHAR AT .X {NZ}
         JSR   ]COUT      ; {89C3B} SEND TO COUT {NZCV}
         LDA   #":"       ; {2C2B} {NZ}
         JSR   ]COUT      ; {89C3B} SEND COLON TO COUT {NZCV}
         LDA   "#" ;        {2C2B} {NZ}
         JSR   ]COUT      ; {89C3B} SEND SPACE TO COUT {NZCV}
         LDY   #0         ; {2C2B} RESET COUNTER {NZ}
:LP
         LDA   (ADDR1),Y  ; {6C2B} LOAD BYTE FROM ADDRESS {NZ}
         CLRHI            ; {22C13B} AT COUNTER OFFSET; CLEAR HIBITS
         STA   ]LEFT      ; {4C3B} SAVE LEFT INDEX
         LDA   (ADDR1),Y  ; {6C2B} RELOAD {NZ}
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
* __ERRH        (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  .A = ADDRESS LOBYTE         *
*  .X = ADDRESS HIBYTE         *
*                              *
* OUTPUT:                      *
*                              *
*  SETS NEW ADDRESS FOR THE    *
*  APPLSOFT ERROR HANDLING     *
*  ROUTINE.                    *
*                              *
* DESTROYS: NZCIDV             *
*           ^^                 *
*                              *
* CYCLES: 53                   *
* SIZE: 32 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
__ERRH
         LDA   #1         ; {2C2B} TRICK DOS INTO THINKING {NZ}
         STA   $AAB6      ; {4C3B} IT'S IN APPLESOFT MODE
         STA   $75+1      ; {3C2B} APPLESOFT LINE NUMBER POINTER
         STA   $33        ; {3C2B} APPLESOFT PROMPT CHARACTER
         STA   ADDR1      ; {3C2B} ADDRESS LOBYTE IN .A
         STX   ADDR1+1    ; {3C2B} ADDRESS HIBYTE IN .X
         LDA   #$FF       ; {2C2B} TURN ON ERROR HANDLING {NZ}
         STA   $D8        ; {3C3B} BYTE HERE
         LDY   #0         ; {2C2B} CLEAR OFFSET {NZ}
         LDA   (ADDR1),Y  ; {6C2B} LOAD ADDRESS LOBYTE {NZ}
         STA   $9D5A      ; {4C3B} SET AS ERROR HANDLING LO
         INY              ; {2C1B} INCREASE OFFSET {NZ}
         LDA   (ADDR1),Y  ; {6C2B} LOAD ADDRESS HIBYTE {NZ}
         STA   $9D5B      ; {4C3B} SET AS ERROR HANDLING HI
         RTS              ; {6C1B} EXIT SUBROUTINE
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
* CYCLES: 72+(155+ WITH COUT)  *
* SIZE: 35 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
__P
         PLA              ; {4C1B} PULL RETURN LOBYTE {NZ}
         STA   ADDR1      ; {3C2B} STORE TO ZERO PAGE
         PLA              ; {4C1B} PULL RETURN HIBYTE {NZ}
         STA   ADDR1+1    ; {3C2B} STORE TO ZERO PAGE
         LDY   #1         ; {2C2B} SET OFFSET TO PLUS ONE
:LP      LDA   (ADDR1),Y  ; {6C2B} LOAD BYTE AT OFFSET .Y
         BEQ   :DONE      ; {4C2B} IF BYTE = 0, QUIT
         JSR   ]COUT      ; {89C3B} OTHERWISE, PRINT BYTE {NZCV}
         INY              ; {2C1B} INCREASE OFFSET {NZ}
         BNE   :LP        ; {4C2B} IF .Y <> 0, CONTINUE LOOP
:DONE    CLC              ; {2C1B} CLEAR CARRY FLAG {C=0}
         TYA              ; {2C1B} TRANSFER OFFSET TO .A {NZ}
         ADC   ADDR1      ; {3C2B} ADD OFFSET TO RETURN ADDR {NZCV}
         STA   ADDR1      ; {4C2B} STORE TO RETURN ADDRESS LOBYTE
         LDA   ADDR1+1    ; {4C2B} DO THE SAME WITH THE HIBYTE {NZ}
         ADC   #0         ; {3C2B} CARRY NOT RESET, SO INC HIBYTE {NZCV}
         PHA              ; {3C1B} IF NEEDED; THEN, PUSH HIBYTE
         LDA   ADDR1      ; {4C2B} LOAD LOBYTE {NZ}
         PHA              ; {3C1B} PUSH LOBYTE
         RTS              ; {6C1B} EXIT
*
*``````````````````````````````*
* DELAYMS  (LEVENTHAL/SEVILLE) *
*                              *
* ADAPTED FROM LEVANTHAL AND   *
* SEVILLE'S /6502 ASSEMBLY     *
* LANGUAGE ROUTINES/.          *
*                              *
* INPUT:                       *
*                              *
*  .Y = NUMBER OF MILLISECS    *
*                              *
* OUTPUT:                      *
*                              *
*   DELAYS FOR X NUMBER OF     *
*   MILLISECONDS BY LOOPING    *
*   THROUGH A PRECISE NUMBER   *
*   OF CYCLES.                 *
*                              *
* DESTROYS: NZCDIV             *
*           ^^^  ^             *
*                              *
* CYCLES: 39+                  *
* SIZE: 29 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DELAYMS
*
]MSCNT   EQU   $0CA       ; LOOP 202 TIMES THROUGH DELAY1
                          ; SPECIFIC TO 1.23 MHZ
                          ; SPEED OF APPLE II
:DELAY
         CPY   #0         ; {2C2B} IF Y = 0, THEN EXIT {NZC}
         BEQ   :EXIT      ; {2C|3C2B}
         NOP              ; {2C1B} (MAKE OVERHEAD=25C)
*
** IF DELAY IS 1MS THEN GOTO LAST1
** THIS LOGIC IS DESIGNED TO BE
** 5 CYCLES THROUGH EITHER ATH
*
         CPY   #1         ; {2C2B} USE 2 CYCLES {NZC}
         BNE   :DELAYA    ; {2C|3C2B} 3C IF TAKEN, ELSE 2C
         JMP   :LAST1     ; {3C3B}
*
** DELAY 1 MILLISENCOND TIMES (Y-1)
*
:DELAYA
         DEY              ; {2C1B} (PREDEC Y) {NZ}
:DELAY0
         LDX   #]MSCNT    ; {2C2B} {NZ}
:DELAY1
         DEX              ; {2C1B} {NZ}
         BNE   :DELAY1    ; {3C2B}
         NOP              ; {2C1B}
         NOP              ; {2C1B}
         DEY              ; {2C1B} {NZ}
         BNE   :DELAY0    ; {3C2B}
:LAST1
*
** DELAY THE LAST TIME 25 CYCLES
** LESS TO TAKE THE CALL, RETURN,
** AND ROUTINE OVERHEAD INTO
** ACCOUNT.
*
         LDX   #]MSCNT-3  ; {2C2B} {NZ}
:DELAY2
         DEX              ; {2C1B} {NZ}
         BNE   :DELAY2    ; {3C2B}
:EXIT
         RTS              ; {6C1B}
*
*``````````````````````````````*
* MEMFILL  (LEVENTHAL/SAVILLE) *
*                              *
*  ADAPTED FROM LEVANTHAL AND  *
*  SAVILLE'S /6502 ASSEMBLY    *
*  LANGUAGE ROUTINES/. FILLS A *
*  SPECIFIED RANGE OF MEMORY   *
*  WITH A FILL VALUE.          *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = FILL VALUE          *
*  WPAR2 = FILL LENGTH         *
*  WPAR3 = STARTING ADDRESS    *
*                              *
* DESTROYS: NZCIDV             *
*           ^^                 *
*                              *
* CYCLES: 59+                  *
* SIZE: 31 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]FILL    EQU   BPAR1      ; FILL VALUE
]SIZE    EQU   WPAR2      ; RANGE LENGTH IN BYTES
]ADDR    EQU   WPAR1      ; RANGE STARTING ADDRESS
*
MEMFILL
*
** FILL WHOLE PAGES FIRST
*
         LDA   ]FILL      ; {3C2B} GET VAL FOR FILL {NZ}
         LDX   ]SIZE+1    ; {3C2B} X=# OF PAGES TO DO {NZ}
         BEQ   :PARTPG    ; {3C2B} BRANCH IF HIGHBYTE OF SZ = 0
         LDY   #0         ; {2C2B} RESET INDEX {NZ}
:FULLPG
         STA   (]ADDR),Y  ; {6C2B} FILL CURRENT BYTE
         INY              ; {2C1B} INCREMENT INDEX {NZ}
         BNE   :FULLPG    ; {3C2B} BRANCH IF NOT DONE W/ PAGE
         INC   ]ADDR+1    ; {5C2B} ADVANCE TO NEXT PAGE {NZ}
         DEX              ; {2C1B} DECREMENT COUNTER {NZ}
         BNE   :FULLPG    ; {3C2B} BRANCH IF NOT DONE W/ PAGES
*
** DO THE REMAINING PARTIAL PAGE
** REGISTER A STILL CONTAINS VALUE
*
:PARTPG
         LDX   ]SIZE      ; {3C2B} GET # OF BYTES IN LAST PAGE {NZ}
         BEQ   :EXIT      ; {3C2B} BRANCH IF LOW BYTE = 0
         LDY   #0         ; {2C2B} RESET INDEX {NZ}
:PARTLP
         STA   (]ADDR),Y  ; {6C2B} STORE VAL
         INY              ; {2C1B} INCREMENT INDEX {NZ}
         DEX              ; {2C1B} DECREMENT COUNTER {NZ}
         BNE   :PARTLP    ; {3C2B} BRANCH IF NOT DONE
:EXIT
         RTS              ; {6C1B}
*
*``````````````````````````````*
* MEMMOVE (LEVENTHAL/SEVILLE)  *
*                              *
*  ADAPTED FROM LEVANTHAL AND  *
*  SEVILLE'S /6502 ASSEMBLY    *
*  LANGUAGE ROUTINES/. COPIES  *
*  SERIES OF BYTES FROM SRCLOC *
*  TO DESTLOC.                 *
*                              *
* INPUT:                       *
*                              *
*  WPAR3 = LENGTH IN BYTES     *
*  WPAR1 = SOURCE ADDRESS      *
*  WPAR2 = DESTINATION ADDRESS *
*                              *
* DESTROY: NZCIDV              *
*          ^^^  ^              *
*                              *
* CYCLES: 207+                 *
* BYTES: 117                   *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SIZE    EQU   WPAR3      ; LENGTH TO COPY (BYTES)
]ADDR1   EQU   WPAR1      ; SOURCE ADDRESS
]ADDR2   EQU   WPAR2      ; DESTINATION ADDRESS
*
MEMMOVE
*
** DETERMINE IF DEST AREA IS
** ABOVE SRC AREA BUT OVERLAPS
** IT. REMEMBER, OVERLAP CAN BE
** MOD 64K. OVERLAP OCCURS IF
** STARTING DEST ADDRESS MINUS
** STARTING SRC ADDRESS (MOD
** 64K) IS LESS THAN NUMBER
** OF BYTES TO MOVE.
*
         LDA   ]ADDR2     ; {3C2B} CALC DEST-SRC {NZ}
         SEC              ; {2C1B} SET CARRY {C=1}
         SBC   ]ADDR1     ; {3C2B} SUBTRACT SOURCE ADDRESS {NZCV}
         TAX              ; {2C1B} HOLD VAL IN .X {NZ}
         LDA   ]ADDR2+1   ; {3C2B} {NZ}
         SBC   ]ADDR1+1   ; {3C2B} MOD 64K AUTOMATIC {NZCV}
                          ; -- DISCARD CARRY
         TAY              ; {2C1B} HOLD HIBYTE IN .Y {NZ}
         TXA              ; {2C1B} CMP LOBYTE WITH # TO MOVE {NZ}
         CMP   ]SIZE      ; {3C2B} {NZC}
         TYA              ; {2C1B} {NZ}
         SBC   ]SIZE+1    ; {3C2B} SUBTRACT SIZE+1 FROM HIBYTE {NZCV}
         BCS   :DOLEFT    ; {3C2B} BRANCH IF NO OVERLAP
*
** DEST AREA IS ABOVE SRC AREA
** BUT OVERLAPS IT.
** MOVE FROM HIGHEST ADDR TO
** AVOID DESTROYING DATA
*
         JSR   :MVERHT    ; {3C6B}
         JMP   :MREXIT    ; {3C3B}
*
** NO PROB DOING ORDINARY MOVE
** STARTING AT LOWEST ADDR
*
:DOLEFT
         JSR   :MVELEFT   ; {6C3B}
:EXIT
         JMP   :MREXIT    ; {3C3B}
:MVELEFT
         LDY   #0         ; {2C2B} ZERO INDEX {NZ}
         LDX   ]SIZE+1    ; {3C2B} X=# OF FULL PP TO MOVE {NZ}
         BEQ   :MLPART    ; {3C2B} IF X=0, DO PARTIAL PAGE
:MLPAGE
         LDA   (]ADDR1),Y ; {6C2B} LOAD BYTE FROM SOURCE {NZ}
         STA   (]ADDR2),Y ; {6C2B} MOVE BYTE TO DESTINATION
         INY              ; {2C1B} NEXT BYTE {NZ}
         BNE   :MLPAGE    ; {3C2B} CONT UNTIL 256B MOVED
         INC   ]ADDR1+1   ; {5C2B} ADV TO NEXT SRC PAGE {NZ}
         INC   ]ADDR2+1   ; {5C2B} ADV NEXT DEST PAGE {NZ}
         DEX              ; {2C1B} DEC PAGE COUNT {NZ}
         BNE   :MLPAGE    ; {3C2B} CONT UNTIL ALL FULL
                          ; PAGES ARE MOVED
:MLPART
         LDX   ]SIZE      ; {3C2B} GET LENGTH OF LAST PAGE {NZ}
         BEQ   :MLEXIT    ; {3C2B} BR IF LENGTH OF LAST
                          ; PAGE = 0
                          ; REG Y IS 0
:MLLAST
         LDA   (]ADDR1),Y ; {6C2B} LOAD BYTE FROM SOURCE {NZ}
         STA   (]ADDR2),Y ; {6C2B} MOVE BYTE TO DESTINATION
         INY              ; {2C1B} NEXT BYTE {NZ}
         DEX              ; {2C1B} DEC COUNTER {NZ}
         BNE   :MLLAST    ; {3C2B} CONT UNTIL LAST P DONE
:MLEXIT
         JMP   :MREXIT    ; {3C3B}
*
********************************
*
:MVERHT
*
** -- MOVE THE PARTIAL PAGE FIRST
*
         LDA   ]SIZE+1    ; {3C2B} GET SIZE HIBYTE {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]ADDR1+1   ; {3C2B} ADD SOURCE ADDRESS HIBYTE {NZCV}
         STA   ]ADDR1+1   ; {3C2B} POINT TO LAST PAGE OF SRC
         LDA   ]SIZE+1    ; {3C2B} GET SIZE HIBYTE {NZ}
         CLC              ; {2C1B} CLEAR CARRY {C=0}
         ADC   ]ADDR2+1   ; {3C2B} ADD DESTINATION HIBYTE {NZCV}
         STA   ]ADDR2+1   ; {3C2B} POINT TO LAST P OF DEST
*
** MOVE THE LAST PARTIAL PAGE FIRST
*
         LDY   ]SIZE      ; {3C2B} GET LENGTH OF LAST PAGE {NZ}
         BEQ   :MRPAGE    ; {3C2B} IF Y=0 DO THE FULL PAGES
:MR0
         DEY              ; {2C1B} BACK UP Y TO NEXT BYTE {NZ}
         LDA   (]ADDR1),Y ; {6C2B} LOAD CURRENT SOURCE BYTE {NZ}
         STA   (]ADDR2),Y ; {6C2B} STORE IN CURRENT DESTINATION
         CPY   #0         ; {2C2B} BRANCH IF NOT DONE {NZC}
         BNE   :MR0       ; {3C2B} WITH THE LAST PAGE
:MRPAGE
         LDX   ]SIZE+1    ; {3C2B} GET SIZE HIBYTE {NZ}
         BEQ   :MREXIT    ; {3C2B} BR IF HYBYTE = 0 (NO FULL P)
:MR1
         DEC   ]ADDR1+1   ; {5C2B} BACK UP TO PREV SRC PAGE {NZ}
         DEC   ]ADDR2+1   ; {5C2B} TO DEST {NZ}
:MR2
         DEY              ; {2C1B} BACK UP Y TO NEXT BYTE {NZ}
         LDA   (]ADDR1),Y ; {6C2B} LOAD SOURCE CURRENT BYTE {NZ}
         STA   (]ADDR2),Y ; {6C2B} STORE BYTE IN DESTINATION
         CPY   #0         ; {2C2B} IF NOT DONE WITH PAGE {NZC}
         BNE   :MR2       ; {3C2B} THEN BRANCH OUT
         DEX              ; {2C1B} DECREASE BYTE COUNTER {NZ}
         BNE   :MR1       ; {3C2B} BR IF NOT ALL PAGES MOVED
:MREXIT
         RTS              ; {6C1B}
*
*``````````````````````````````*
* MEMSWAP       (NATHAN RIGGS) *
*                              *
* INPUT:                       *
*                              *
*  BPAR1 = SWAP LENGTH         *
*  WPAR1 = 1ST ADDRESS         *
*  WPAR2 = 2ND ADDRESS         *
*                              *
* OUTPUT:                      *
*                              *
*  SWAPS THE VALUES IN THE     *
*  MEMORY LOCATIONS GIVEN      *
*  FOR THE SPECIFIED LENGTH.   *
*                              *
* DESTROYS: NZCIDV             *
*           ^^^                *
*                              *
* CYCLES: 46+                  *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
]SIZE    EQU   BPAR1      ; SIZE OF RANGE TO SWAP
]ADDR1   EQU   WPAR1      ; SOURCE ADDRESS 1
]ADDR2   EQU   WPAR2      ; SOURCE ADDRESS 2
*
MEMSWAP
         LDY   #255       ; {2C2B} RESET BYTE INDEX {NZ}
:LP
         INY              ; {2C1B} INCREASE BYTE INDEX {NZ}
         LDA   (]ADDR1),Y ; {6C2B} LOAD BYTE FROM FIRST ADDRESS {NZ}
         TAX              ; {2C1B} TRANSFER TO .X {NZ}
         LDA   (]ADDR2),Y ; {6C2B} LOAD BYTE FROM SECOND ADDRESS {NZ}
         STA   (]ADDR1),Y ; {6C2B} STORE IN FIRST ADDRESS
         TXA              ; {2C1B} TRANSFER FIRST BYTE VAL TO .A {NZ}
         STA   (]ADDR2),Y ; {6C2B} NOW STORE THAT IN SECOND ADDRESS
         CPY   ]SIZE      ; {3C2B} IF BYTE INDEX < LENGTH, {NZC}
         BNE   :LP        ; {3C2B} CONTINUE LOOPING
         RTS              ; {6C1B} OTHERWISE, EXIT
*
         RTS              ; {6C1B}
