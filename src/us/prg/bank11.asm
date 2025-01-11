.include "../../global/objects/include.asm"

.segment        "PRG11": absolute

OBJ_BANK_POINTERS2:
.addr OBJ_BANK_1A
.addr OBJ_BANK_1B
.addr OBJ_BANK_1C
.addr OBJ_BANK_1D
.addr $87E9
.addr $88FB
.addr $8A7B
.addr $8DC5
.addr $8FD5
.addr $9285
.addr $9385
.addr $94D5
.addr $964A
.addr $9749
.addr $990B
.addr $9B86
.addr $9C96

;twinkle elementary
.include "../../global/objects/2/bank1a.asm"
;general home/heal stuff
.include "../../global/objects/2/bank1b.asm"
;
.include "../../global/objects/2/bank1c.asm"

OBJ_BANK_1D:
.addr $8755
.addr $875D
.addr $8765
.addr $876D
.addr $8775
.addr $877D
.addr $8785
.addr $878D
.addr $8795
.addr $879D
.addr $87A5
.addr $87AD
.addr $87B5
.addr $87BD
.addr $87C9
.addr $87D1
.addr $87D9
.addr $87E1
.addr 0

.incbin "../../split/us/objbank_2.bin",$755

