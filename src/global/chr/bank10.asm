.segment        "CHR0": absolute
        ;map gfx 1
        
        incbinRange "../../split/global/chr/bank10.bin",0,$750
        
        ;the steeple was changed to remove the cross
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank10.bin",$750,$790
        .else
        incbinRange "../../split/us/chr/bank10.bin",$750,$790
        .endif
        
        incbinRange "../../split/global/chr/bank10.bin",$790,$1dc0
        
        ;the grave was changed to remove the cross
        ;4 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank10.bin",$1dc0,$1e00
        .else
        incbinRange "../../split/us/chr/bank10.bin",$1dc0,$1e00
        .endif
        
        incbinRange "../../split/global/chr/bank10.bin",$1e00,$1f20
        
        ;the basic grave was changed to remove the cross
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank10.bin",$1f20,$1f40
        .else
        incbinRange "../../split/us/chr/bank10.bin",$1f20,$1f40
        .endif
        
        incbinRange "../../split/global/chr/bank10.bin",$1f40,$1f80
        
        ;part 2
        ;2 tiles
        .ifdef VER_JP
        incbinRange "../../split/jp/chr/bank10.bin",$1f80,$1fA0
        .else
        incbinRange "../../split/us/chr/bank10.bin",$1f80,$1fA0
        .endif
        
        .incbin "../../split/global/chr/bank10.bin",$1fA0
.code

