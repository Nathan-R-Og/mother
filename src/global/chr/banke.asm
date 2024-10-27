.segment        "CHRE": absolute
        ;gfxs to be swapped out ($800 each)
        incbinRange "../../split/global/chr/banke.bin",0,$1900

        ;ninten
        ;same changes as before
        ;8 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/banke.bin",$1900,$1980
        .else
        incbinRange "../../split/us/chr/banke.bin",$1900,$1980
        .endif

        .incbin "../../split/global/chr/banke.bin",$1980
