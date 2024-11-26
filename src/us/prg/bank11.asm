.include "../../global/objects/include.asm"

.segment        "PRG11": absolute

OBJ_BANK_POINTERS2:
.word OBJ_BANK_1A
.word OBJ_BANK_1B
.word $8675
.word $872F
.word $87E9
.word $88FB
.word $8A7B
.word $8DC5
.word $8FD5
.word $9285
.word $9385
.word $94D5
.word $964A
.word $9749
.word $990B
.word $9B86
.word $9C96

;twinkle elementary
.include "../../global/objects/2/bank1a.asm"
;general home/heal stuff
.include "../../global/objects/2/bank1b.asm"

.incbin "../../split/us/objbank_2.bin",$675

