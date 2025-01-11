.segment        "PRG10": absolute

OBJ_BANK_POINTERS1:
.addr OBJ_BANK_0
.addr OBJ_BANK_1
.addr OBJ_BANK_2
.addr OBJ_BANK_3
.addr OBJ_BANK_4
.addr OBJ_BANK_5
.addr OBJ_BANK_6
.addr OBJ_BANK_7
.addr OBJ_BANK_8
.addr OBJ_BANK_9
.addr OBJ_BANK_A
.addr OBJ_BANK_B
.addr OBJ_BANK_C
.addr OBJ_BANK_D
.addr OBJ_BANK_E
.addr OBJ_BANK_F
.addr OBJ_BANK_10
.addr OBJ_BANK_11
.addr OBJ_BANK_12
.addr OBJ_BANK_13
.addr OBJ_BANK_14
.addr OBJ_BANK_15
.addr OBJ_BANK_16
.addr OBJ_BANK_17
.addr OBJ_BANK_18
.addr OBJ_BANK_19

OBJ_BANK_0:
.addr 0
.addr 0
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
.addr 0
;ellay special
.include "1/bank16.asm"
;hosptial generic
.include "1/bank17.asm"
;hotel generic
.include "1/bank18.asm"
;indoor special
.include "1/bank19.asm"