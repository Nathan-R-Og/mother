.segment        "PRGE": absolute
        incbinRange "../../split/jp/prg/banke.bin", 0, $3E00
        .include "../../global/starting_sram.asm"
        .ifndef kanjiMacro
                binclude "../global/starting_characters.asm"
        .else
                .include "../../global/starting_characters.asm"
        .endif


.code

