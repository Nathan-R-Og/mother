.segment        "PRG8_1": absolute

OBJ_BANK_POINTERS1:
.word OBJ_BANK_0
.word OBJ_BANK_1
.word OBJ_BANK_2
.word OBJ_BANK_3
.word OBJ_BANK_4
.word OBJ_BANK_5
.word OBJ_BANK_6
.word OBJ_BANK_7
.word OBJ_BANK_8
.word OBJ_BANK_9
.word OBJ_BANK_A
.word OBJ_BANK_B
.word OBJ_BANK_C
.word OBJ_BANK_D
.word OBJ_BANK_E
.word OBJ_BANK_F
.word OBJ_BANK_10
.word OBJ_BANK_11
.word OBJ_BANK_12
.word OBJ_BANK_13
.word OBJ_BANK_14
.word OBJ_BANK_15
.word OBJ_BANK_16
.word OBJ_BANK_17
.word OBJ_BANK_18
.word OBJ_BANK_19

OBJ_BANK_0:
.word 0
.word 0
;special 1
.include "1/bank1.asm"
;podunk generic
.include "1/bank2.asm"
;merrysville generic
.include "1/bank3.asm"
;reindeer/ellay special
.include "1/bank4.asm"
;reindeer generic
.include "1/bank5.asm"
;spookane generic
.include "1/bank6.asm"
;snowman generic
.include "1/bank7.asm"
;yucca/itoi caves special
.include "1/bank8.asm"
;youngtown generic
.include "1/bank9.asm"
;ellay generic
.include "1/banka.asm"
;podunk special
.include "1/bankb.asm"
;graveyard
.include "1/bankc.asm"
;zoo
.include "1/bankd.asm"
;podunk magicant cave exterior
.include "1/banke.asm"
;merrysville special
.include "1/bankf.asm"
;reindeer special
.include "1/bank10.asm"
;spookane special
.include "1/bank11.asm"
;snowman special
.include "1/bank12.asm"
;youngtown/yucca special
.include "1/bank13.asm"
;yucca generic
.include "1/bank14.asm"
OBJ_BANK_15:
.word 0
;ellay special
.include "1/bank16.asm"
;hosptial generic
.include "1/bank17.asm"
;hotel generic
.include "1/bank18.asm"
;indoor special
.include "1/bank19.asm"