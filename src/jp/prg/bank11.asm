.include "../../global/objects/include.asm"

.segment        "PRG11": absolute
incbinRange "../../split/jp/prg/bank11.bin", 0, $322
;this is the actual object btw
.word UMSG::MYHOME_MINNIE_INVASION
.byte 0
incbinRange "../../split/jp/prg/bank11.bin", $325, $1d96

