.segment        "CHR8": absolute
    ;title screen gfx
    .incbin "../../split/global/chr/8/global1.bin"

    ;some things were reformatted in the localization
    .ifdef VER_JP
    .incbin "../../split/jp/chr/8/jp.bin"
    .else
    .incbin "../../split/us/chr/8/us1.bin"
    .endif

    ;the only REAL thing that's shared
    ;the globe that spins
    .incbin "../../split/global/chr/8/global2.bin"

    ;JP ends here in padding
    .ifndef VER_JP
    ;the crazy melody effect in US
    ;its one tile copied across 64 times so whatever man
    .repeat 4, ArgX
        .repeat 64
            .incbin "../../split/us/chr/8/us2.bin", (ArgX*64*16), $10
        .endrepeat
    .endrepeat
    .endif
