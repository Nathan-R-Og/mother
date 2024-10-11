.segment        "CHR8": absolute
        ;title screen gfx
        incbinRange "../../split/global/chr/bank18.bin", 0, $400

        ;some things were reformatted in the localization
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank18.bin", $400, $800
        .else
        incbinRange "../../split/us/chr/bank18.bin", $400, $800
        .endif

        ;the only REAL thing that's shared
        ;the globe that spins
        incbinRange "../../split/global/chr/bank18.bin", $800, $1000

        ;JP ends here in padding
        .ifndef VER_JP
        ;the crazy melody effect in US
        ;its one tile copied across 64 times so whatever man
        .repeat 4, ArgX
                .repeat 64
                .incbin "../../split/us/chr/bank18.bin", $1000+(ArgX*64*16), $10
                .endrepeat
        .endrepeat
        .endif

.code

