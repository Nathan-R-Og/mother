.segment        "CHR2": absolute
        ;map gfx 3
        incbinRange "../../split/global/chr/bank2.bin",0,$1160

        ;cross was changed to glass pane
        ;9 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank2.bin",$1160,$11F0
        .else
        incbinRange "../../split/us/chr/bank2.bin",$1160,$11F0
        .endif

        .incbin "../../split/global/chr/bank2.bin",$11F0
