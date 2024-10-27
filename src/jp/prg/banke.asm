.segment        "PRGE": absolute
        incbinRange "../../split/jp/prg/banke.bin", 0, $3E00
        .include "../../global/starting_sram.asm"
        binclude "../global/starting_characters.asm"
