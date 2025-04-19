mus_twinkle_elementary_pulse1:
.addr B29_0541
.addr -1
.addr mus_twinkle_elementary_pulse1

mus_twinkle_elementary_pulse2:
.addr B29_0585
.addr -1
.addr mus_twinkle_elementary_pulse2

mus_twinkle_elementary_triangle:
.addr B29_05B1
.addr -1
.addr mus_twinkle_elementary_triangle

mus_twinkle_elementary_noise:
.addr B29_05D7
.addr -1
.addr mus_twinkle_elementary_noise

B29_0541:
.byte $9F,$0A,$B1
.byte $C2
    .byte $B1,$46,$3C,$36,$3C,$3C,$36,$2E,$36,$44,$3C,$32,$3C,$2C,$32,$2C,$32,$2E,$24,$2E,$24,$2E,$32,$36,$32,$46,$40,$38,$40,$36,$38,$46,$38
.byte $FF
.byte $9F,$B4,$B3
.byte $C8
    .byte $B1,$2E,$24,$2E
    .byte $B2,$3C
    .byte $B1,$2E,$24
    .byte $B2,$3A
    .byte $B1,$2E,$28
    .byte $B2,$38
    .byte $B1,$2E
    .byte $B2,$28
.byte $FF
.byte $C8
    .byte $B4,$02
.byte $FF
.byte $00

B29_0585:
.byte $9F,$12,$B1
.byte $C2
    .byte $B3,$66,$5E,$62,$54,$54,$5E,$66,$5E
.byte $FF
.byte $9F,$14,$F1
.byte $C8
    .byte $B4,$02
.byte $FF
.byte $B3,$4E,$46,$4A,$54
.byte $B4,$3C,$02
.byte $B3,$4E,$46,$4A
.byte $B2,$54,$50
.byte $B4,$4E,$02
.byte $C8
    .byte $B4,$02
.byte $FF
.byte $00

B29_05B1:
.byte $9F,$A0,$00
.byte $C2
    .byte $B4,$46,$44
    .byte $B3,$36,$28,$38,$3C
.byte $FF
.byte $9F,$00,$00
.byte $CC
    .byte $B5,$2E
    .byte $B1,$2E
    .byte $9F,$A0,$00
    .byte $B3,$28
    .byte $9F,$00,$00
    .byte $B1,$02
    .byte $B5,$32
    .byte $B2,$24,$2C
.byte $FF
.byte $00

B29_05D7:
.byte $C3
    .byte $B1,$04,$01,$04,$04,$44,$01,$04,$04,$01,$41,$04,$04,$81,$04,$04,$04
.byte $FF
.byte $04,$01,$04,$04,$44,$01,$04,$04,$01,$81,$01,$41,$81,$81,$81,$01
.byte $CC
    .byte $B1,$41,$01,$04,$04,$81,$01,$04,$04,$01,$41,$04,$04,$81,$01,$04,$04
.byte $FF
.byte $00
