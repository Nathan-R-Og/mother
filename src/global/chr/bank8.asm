.segment        "CHR8": absolute
    ;title screen gfx
    ;some things were reformatted in the localization
    .ifdef VER_JP
        .incbin "../../split/jp/chr/title.bin"
    .else
        .incbin "../../split/us/chr/title.bin"
    .endif

    ;the only REAL thing that's shared
    ;the globe that spins
    .incbin "../../split/global/chr/earth.bin"

    ;JP ends here in padding
    .ifndef VER_JP
        ;the crazy melody effect in US
        .incbin "../../split/us/chr/melody_effect.bin"
    .endif
