.segment        "PRG1D": absolute
        incbinRange "../../split/jp/prg/bank1d.bin", 0, $1E00
        .include "../../global/starting_sram.asm"
        binclude "../global/starting_characters.asm"
