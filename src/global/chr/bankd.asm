.segment        "CHRD": absolute
    ;general character/object sprites 2

    ;carol (mom)
    ;changed to look less like a peanut character
    ;14 tiles
    ;NOTE- the sideways face tile is unchanged. technically only 5 tiles have changed
    ;george diamond
    ;exists!
    ;now with a sparkle!
    ;6 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/characters5.bin"
        .incbin "../../split/jp/chr/characters6.bin"
    .else
        .incbin "../../split/us/chr/characters5.bin"
        .incbin "../../split/us/chr/characters6.bin"
    .endif

    .incbin "../../split/global/chr/characters7.bin"

    ;flying man grave
    ;cross replaced with stone
    ;4 tiles
    .ifdef VER_JP
        .incbin "../../split/jp/chr/characters8.bin"
    .else
        .incbin "../../split/us/chr/characters8.bin"
    .endif