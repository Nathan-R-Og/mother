.include "../../global/objects/include.asm"
.include "../../global/objects/1.asm"

.segment        "PRG8_2": absolute
incbinRange "../../split/jp/prg/bank8.bin", $2000, $2322
;this is the actual object btw
.word UMSG::MYHOME_MINNIE_INVASION
.byte 0
incbinRange "../../split/jp/prg/bank8.bin", $2325, $3d96

