.segment        "PRG1D": absolute
    .incbin "../../split/jp/prg/bank1d/unk0.bin"

.segment        "SRAM": absolute
    .include "../../global/starting_sram.asm"
    binclude "../global/starting_characters.asm"
