mus_mt_itoi_pulse1:
.addr B29_0385
.addr -1
.addr mus_mt_itoi_pulse1

mus_mt_itoi_pulse2:
.addr B29_039F
.addr -1
.addr mus_mt_itoi_pulse2

mus_mt_itoi_triangle:
.addr B29_03E8
.addr -1
.addr mus_mt_itoi_triangle

mus_mt_itoi_noise:
.addr B29_0416
.addr -1
.addr mus_mt_itoi_noise

B29_0385:
.byte $9F,$B3,$31
.byte $D2
    .byte $B2,$1A,$1A,$1A
    .byte $B1,$1A,$1C
.byte $FF
.byte $9F,$A9,$B2
.byte $B4,$20,$B2,$24,$1E,$2E,$24,$B4,$20
.byte $24
.byte $00

B29_039F:
.byte $9F,$B3,$31
.byte $C4
    .byte $B2,$24,$24,$24,$B1,$24,$26
.byte $FF
.byte $9F,$A1,$B5
.byte $B3,$24,$B2,$2E,$32,$B4,$2C,$02
.byte $9F,$29,$31
.byte $C4
    .byte $B1,$6E,$70
.byte $FF
.byte $B4,$02
.byte $9F,$A1,$B5
.byte $B3,$38,$B2,$36,$2E,$B4,$2C,$02
.byte $9F,$29,$31
.byte $C8
    .byte $B1,$6E,$70
.byte $FF
.byte $9F,$A1,$B3
.byte $B4,$2E,$2C,$2E,$2C,$B6,$32,$B2,$20,$B2,$2E,$24,$B3,$36,$B4,$2A,$2E
.byte $00

B29_03E8:
.byte $9F,$A0,$00
.byte $D2
    .byte $B7,$24,$B0,$02,$B7,$24,$B0,$02,$B7,$24,$B0,$02,$B1,$24,$26
.byte $FF
.byte $C4
    .byte $B7,$2A,$B0,$02
.byte $FF
.byte $C4
    .byte $B7,$20,$B0,$02
.byte $FF
.byte $C4
    .byte $B7,$24,$B0,$02
.byte $FF
.byte $9F,$00,$00
.byte $C8
    .byte $B1,$2A
.byte $FF
.byte $00

B29_0416:
.byte $D4
    .byte $B2,$41,$44,$41,$07
.byte $FF
.byte $C4
    .byte $44
.byte $FF
.byte $C8
    .byte $B1,$44
.byte $FF
.byte $00
