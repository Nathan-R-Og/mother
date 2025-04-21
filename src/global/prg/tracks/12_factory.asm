mus_factory_pulse2:
.addr B29_0757
.addr B29_079A
.addr -1
.addr mus_factory_pulse2

mus_factory_pulse1:
.addr B29_07B0
B29_0739:
.addr B29_075A
.addr B29_079D
.addr -1
.addr B29_0739

mus_factory_triangle:
.addr B29_07B6
.addr B29_07BF
.addr -1
.addr mus_factory_triangle

mus_factory_noise:
.addr B29_07D3
.addr B29_07E6
.addr B29_07F8
.addr B29_07E6
.addr B29_07FE
.addr -1
.addr mus_factory_noise

B29_0757:
.byte $9F,$A2,$36
;fallthrough
B29_075A:
.byte $B4,$02,$02
.byte $B0,$0C,$18
.byte $B6,$16
.byte $B1,$02
.byte $B0,$18,$10
.byte $B1,$02
.byte $B6,$02
.byte $B0,$0C,$18
.byte $B6,$16
.byte $B1,$02
.byte $B0,$18,$22
.byte $B1,$02
.byte $B6,$02
.byte $B4,$02,$02
.byte $B0,$3A,$44,$46,$44
.byte $B6,$52
.byte $B0,$50,$48
.byte $B6,$02
.byte $B1,$02
.byte $B0,$3A,$44,$46,$44
.byte $B6,$52
.byte $B1,$54,$56
.byte $B6,$02
.byte $B4,$02,$02
.byte $00

B29_079A:
.byte $9F,$A9,$B2
;fallthrough
B29_079D:
.byte $B3,$38,$3C,$4A,$46
.byte $B4,$38,$34
.byte $B3,$38,$3E,$4C,$3E
.byte $B4,$38,$02,$02,$02
.byte $00

B29_07B0:
.byte $9F,$A9,$33
.byte $B8,$02
.byte $00

B29_07B6:
.byte $9F,$0F,$00
.byte $F8
    .byte $B1,$24,$24
.byte $FF
.byte $00

B29_07BF:
.byte $9F,$A0,$00
.byte $B4,$34,$2A,$26,$24,$30,$2E
.byte $B3,$2C
.byte $9F,$0F,$00
.byte $DC
    .byte $B1,$24
.byte $FF
.byte $00

B29_07D3:
.byte $C4
    .byte $B2,$13,$16
.byte $FF
.byte $D0
    .byte $B1,$04,$04
.byte $FF
.byte $C2
    .byte $B2,$13,$16
.byte $FF
.byte $B4,$1C,$1C
.byte $00

B29_07E6:
.byte $C4
    .byte $BA,$13,$16
.byte $FF
.byte $C4
    .byte $19,$13
.byte $FF
.byte $C4
    .byte $13,$16
.byte $FF
.byte $C4
    .byte $13,$19
.byte $FF
.byte $00

B29_07F8:
.byte $CC
    .byte $B1,$04,$04
.byte $FF
.byte $00

B29_07FE:
.byte $C2
    .byte $B2,$16,$13
.byte $FF
.byte $C4
    .byte $B4,$1C
.byte $FF
.byte $B3
    .byte $19,$1C,$1C,$CE
    .byte $B1,$04,$04
.byte $FF
.byte $00
