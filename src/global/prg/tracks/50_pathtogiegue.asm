.ifndef VER_JP

B29_1580:
.addr B29_159C
B29_1582:
.addr B29_159F
.addr -1
.addr B29_1582

B29_1588:
.addr B29_15A3
B29_158A:
.addr B29_15A6
.addr -1
.addr B29_158A

B29_1590:
.addr B29_15AA
.addr -1
.addr B29_1590

B29_1596:
.addr B29_15BC
.addr -1
.addr B29_1596



B29_159C:
.byte $9F,$3C,$F1
B29_159F:
.byte $B6,$84,$84
.byte $00

B29_15A3:
.byte $9F,$3C,$F1
B29_15A6:
.byte $B6,$80,$80
.byte $00

B29_15AA:
    .byte $9F,$00,$00
    Note_Repeat 2
        .byte $B0,$02
        .byte $B3,$02
    Note_End_Repeat
    Note_Repeat 2
        .byte $B0,$24,$26,$02,$B3,$02
    Note_End_Repeat
    Track_End

B29_15BC:
.byte $C2,$B0,$01,$B3
.byte $01,$FF,$C2,$B0,$41,$41,$01,$B3,$01,$FF
.byte $00

.endif
