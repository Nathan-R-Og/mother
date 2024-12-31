.include "../../global/objects/include.asm"
.segment        "PRG11": absolute

OBJ_BANK_POINTERS2:
.word OBJ_BANK_1A
.word OBJ_BANK_1B
.word $860C
.word $86D1
.word $8795
.word $88BB
.word $8A27
.word $8CD8
.word $8ED4
.word $9166
.word $9266
.word $93AD
.word $9536
.word $9635
.word $97F7
.word $9A71
.word $9B81


;twinkle elementary
.include "../../global/objects/2/bank1a.asm"
;general home/heal stuff
.include "../../global/objects/2/bank1b.asm"

.incbin "../../split/jp/objbank_2.bin", $60c

