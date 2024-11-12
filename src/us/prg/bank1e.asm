.segment        "PRG1E": absolute
        incbinRange "../../split/us/prg/bank1e.bin", 0, $F9C
        ;overworld sprites palette
        .byte $0F,$0F,$00,$30
        .byte $0F,$0F,$16,$37
        .byte $0F,$0F,$24,$37
        .byte $0F,$0F,$12,$37
        incbinRange "../../split/us/prg/bank1e.bin", $FAC, $1634

        
        ;value of which chr table to load based on area
        ;divide by 2 and multiply by $400 to get distance from start
        ;of chr rom
        AREA_CHR_TABLE:
        .byte $00
        .byte $68
        .byte $62
        .byte $62
        .byte $62
        .byte $62
        .byte $64
        .byte $62
        .byte $74
        .byte $64
        .byte $6A
        .byte $62
        .byte $66
        .byte $6C
        .byte $62
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $00
        .byte $66
        .byte $00
        .byte $6A
        .byte $66
        .byte $62
        .byte $68
        .byte $64
        .byte $68
        .byte $6E
        .byte $66
        .byte $66
        .byte $66
        .byte $62
        .byte $62
        .byte $62
        .byte $66
        .byte $64
        .byte $6E
        .byte $62
        .byte $64
        .byte $66
        .byte $74
        .byte $6C
        .byte $66
        .byte $00
        .byte $00
        .byte $68
        .byte $6C
        .byte $72
        .byte $00
        .byte $66
        .byte $00
        .byte $00
        .byte $00
        .byte $6A
        .byte $00
        .byte $6C
        .byte $6E
        .byte $6C
        .byte $6E
        .byte $6C
        .byte $6E
        .byte $6E
        .byte $00

        .incbin "../../split/us/prg/bank1e.bin", $1674