.include "../../global/objects/include.asm"
.segment        "PRG11": absolute

OBJ_BANK_POINTERS2:
.word OBJ_BANK_1A
.word $8208
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

incbinRange "../../split/jp/objbank_2.bin", $208, $322
;this is the actual object btw
.word UMSG::MYHOME_MINNIE_INVASION
.byte 0
.incbin "../../split/jp/objbank_2.bin", $325

