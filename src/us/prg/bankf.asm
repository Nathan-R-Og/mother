.segment        "PRGF": absolute
        incbinRange "../../split/us/prg/bankf.bin", 0, $1634
        ;value of which chr table to load based on area
        ;divide by 2 and multiply by $500 to get distance from start
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

        .incbin "../../split/us/prg/bankf.bin", $1674
