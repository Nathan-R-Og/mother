.segment        "PRG8": absolute

.include "../../global/objects/include.asm"

OBJ_BANK_POINTERS1:
.word OBJ_BANK_0
.word OBJ_BANK_1
.word OBJ_BANK_2
.word $8608
.word $8830
.word $8BA8
.word $8D91
.word $8EE6
.word $9002
.word $91C6
.word $931B
.word $95E2
.word $962E
.word $971E
.word $987D
.word $990B
.word $996B
.word $9985
.word $99CB
.word $99D7
.word $9A0F
.word $9AAA
.word $9AAC
.word $9AC6
.word $9C93
.word $9E0D

OBJ_BANK_0:
.word 0
.word 0

.include "../../global/objects/bank1.asm"

OBJ_BANK_2:
incbinRange "../../split/jp/prg/bank8.bin", $3f5, $1f7d

.res $83, $FF
incbinRange "../../split/jp/prg/bank8.bin", $2000, $2322

;this is the actual object btw
.word UMSG::MYHOME_MINNIE_INVASION
.byte 0

incbinRange "../../split/jp/prg/bank8.bin", $2325, $3d96


.code

