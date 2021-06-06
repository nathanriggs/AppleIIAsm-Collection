*
*``````````````````````````````*
* MAC.DOSMORE.ASM              *
*                              *
*                              *
* AUTHOR:    NATHAN RIGGS      *
* CONTACT:   NATHAN.RIGGS@     *
*            OUTLOOK.COM       *
*                              *
* DATE:      20-APR-2021       *
* ASSEMBLER: MERLIN 8 PRO      *
* OS:        DOS 3.3           *
*                              *
* SUBROUTINE FILES USED        *
*                              *
* NONE                         *
*                              *
* LIST OF MACROS               *
*                              *
* DVER  : CHECK DOS VERSION    *
* DOSIN : CHECK IF DOS LOADED  *
* ABAS  : IS APPLESOFT LOADED  *
* IBEX  : IS INTEGER BASIC     *
*         PROGRAM RUNNING      *
* ABEX  : IS APPLESOFT BASIC   *
*         PROGRAM RUNNING      *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
*``````````````````````````````*
* DVER          (NATHAN RIGGS) *
*                              *
* RETURN THE DOS VERSION. THIS *
* IS ADAPTED FROM DON WORTH'S  *
* AND PIETER LECHNER'S         *
* /BENEATH APPLE DOS/. THE     *
* LICENSE MAY ACCORDINGLY      *
* VARY.                        *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 28                   *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DVER     MAC
         CLC              ; {2C1B} CLEAR CARRY FLAG
         LDA   #0         ; {3C2B} CLEAR ACCUMULATOR
         ADC   #$BE       ; {2C2B} ADD #$16BE TO DOS LOAD POINT
         STA   ZPWSYS     ; {3C2B} STORE LOW BYTE
         LDA   $3D2       ; {4C3B} LOAD DOS LOADING POINT
         ADC   #$16       ; {2C2B} ADD OFFSET
         STA   ZPWSYS+1   ; {3C2B} STORE HIGH BYTE
         LDY   #0         ; {3C2B} SET INDEX TO 0
         LDA   (ZPWSYS),Y ; {6C2B} RETURNS #2 OR #3 FOR
                          ;        THE DOS VERSION IN .A
         <<<
*
*``````````````````````````````*
* DOSIN                        *
*                              *
* CHECKS IF DOS IS LOADED.     *
* THIS SHOULD BE CALLED BEFORE *
* RUNNING RWTS OR THE FILE     *
* MANAGER.                     *
*                              *
* THIS IS ADAPTED FROM DON     *
* WORTH'S AND PIETER LECHNER'S *
* /BENEATH APPLE DOS/, SO THE  *
* LICENSE MAY VARY ACCORDINGLY *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 17                   *
* SIZE: 12 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
DOSIN    MAC
         LDA   $3D0       ; {4C3B} GET VECTOR JUMP
         CMP   #$4C       ; {3C2B} IS IT A JUMP?
         BNE   ]NODOS     ; {3C2B} NOPE, JUMP TO NONE
         SEC              ; {2C1B} CARRY SET, MEANING DOS LOADED
         JMP   ]EXIT      ; {3C3B}
]NODOS
         CLC              ; {2C1B} CARRY CLEAR, MEANING NO DOS
]EXIT
         <<<
*
*``````````````````````````````*
* ABAS                         *
*                              *
* DETERMINE WHICH BASIC IS     *
* LOADED. IF CARRY IS CLEAR,   *
* THEN INTEGER BASIC IS        *
* LOADED--ELSE, APPLESOFT IS.  *
*                              *
* THIS IS ADAPTED FROM DON     *
* WORTH'S AND PIETER LECHNER'S *
* /BENEATH APPLE DOS/, SO THE  *
* LICENSE MAY VARY ACCORDINGLY *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 40                   *
* SIZE: 29 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ABAS     MAC
         LDA   #$4C       ; {4C3B} CODE FOR APPLESOFT
                          ;        #$20 IS FOR INTEGER BASIC
         CMP   $E000      ; {4C3B} CORRECT BASIC ALREADY THERE?
         BEQ   ]APPLES    ; {3C2B} YES, GOTO RETURN CARRY
         STA   $C080      ; {4C3B} NOW IS IT THERE?
         CMP   $E000      ; {4C3B} NOW IS IT THERE?
         BEQ   ]APPLES    ; {3C2B} YEP, GOTO RETURN CARRY
         STA   $C081      ; {4C3B} STILL NO, TRY ROM CARD
         CMP   $E000      ; {4C3B} THERE NOW?
         BEQ   ]APPLES    ; {3C2B} YEP, GOTO RETURN CARRY
                          ;        NOPE, DON'T RETURN CARRY
         CLC              ; {2C1B}
         JMP   ]EXIT      ; {3C3B}
]APPLES
         SEC              ; {2C1B}
]EXIT
         <<<
*
*``````````````````````````````*
* IBEX                         *
*                              *
* CHECK IF AN INTEGER BASIC    *
* PROGRAM IS RUNNING.          *
*                              *
* THIS IS ADAPTED FROM DON     *
* WORTH'S AND PIETER LECHNER'S *
* /BENEATH APPLE DOS/, SO THE  *
* LICENSE MAY VARY ACCORDINGLY *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 17                   *
* SIZE: 12 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
IBEX     MAC
         LDA   $D9        ; {4C3B} CHECK BASIC
         BMI   ]YES       ; {3C2B} IF NEG, THEN INT BASIC RUNNING
         BPL   ]NO        ; {3C2B} IF POSITIVE, THEN NOT
]YES
         SEC              ; {2C1B} INT BASIC RUNNING, SET CARRY
         JMP   ]EXIT      ; {3C3B} AND EXIT
]NO
         CLC              ; {2C1B} NOT RUNNING, SO CLEAR CARRY
]EXIT                     ;        AND EXIT
         <<<
*
*``````````````````````````````*
* ABEX                         *
*                              *
* CHECK IF AN APPLESOFT BASIC  *
* PROGRAM IS RUNNING.          *
*                              *
* THIS IS ADAPTED FROM DON     *
* WORTH'S AND PIETER LECHNER'S *
* /BENEATH APPLE DOS/, SO THE  *
* LICENSE MAY VARY ACCORDINGLY *
*                              *
* PARAMETERS                   *
*                              *
*  NONE                        *
*                              *
* CYCLES: 26                   *
* SIZE: 18 BYTES               *
*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,*
*
ABEX     MAC
         LDX   $76        ; {4C3B} GET LINE NUMBER
         INX              ; {2C1B}
         BEQ   ]NO        ; {3C2B}
         LDX   $33        ; {4C3B} GET PROMPT CHARACTER
         CPX   #$DD       ; {3C2B} IS PROMPT A "]" ?
         BEQ   ]NO        ; {3C2B} YES, SO NOT EXECUTING
         SEC              ; {2C1B} ELSE, IS EXECUTING--SET CARRY
         JMP   ]EXIT      ; {3C3B}
]NO
         CLC              ; {2C1B}
]EXIT
         <<<
