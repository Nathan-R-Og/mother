.segment        "CHRC": absolute
    ;general character/object sprites

    ;ninten got another shirt stripe! also some cleanup
    ;8 tiles
    ;mustache guy npc (cleanup)
    ;5 tile
    ;receptionist (stylistic change)
    ;changed her hair
    ;6 tiles
    ;cool guy (stylistic change)
    ;changed the direction of his foot
    ;1 tile
    ;dusty npc (stylistic change)
    ;changed to less resemble pig-pen from peanuts (what with the dust and whatnot)
    ;8 tiles
    ;NOTE- the walking sideways front foot is unchanged. technically only 7 tiles were changed

    .ifdef VER_JP
        .incbin "../../split/jp/chr/characters1.bin"
        .incbin "../../split/jp/chr/characters2.bin"
    .else
        .incbin "../../split/us/chr/characters1.bin"
        .incbin "../../split/us/chr/characters2.bin"
    .endif

    .incbin "../../split/global/chr/characters3.bin"
    ;priest
    ;removed the cross on his front
    ;2 tiles

    ;casket & laying teddy
    ;removed cross
    ;lowered teddy
    ;8 tiles
    ;NOTE- the bottom right of the casket is unchanged. technically only 3 tiles were changed
    .ifdef VER_JP
        .incbin "../../split/jp/chr/characters4.bin"
    .else
        .incbin "../../split/us/chr/characters4.bin"
    .endif

