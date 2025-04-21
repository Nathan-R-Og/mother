mus_home_pulse2:
.addr B29_09AC
.addr -1
.addr mus_home_pulse2

mus_home_pulse1:
.addr B29_09E2
.addr -1
.addr mus_home_pulse1

mus_home_triangle:
.addr B29_0A02
.addr -1
.addr mus_home_triangle

mus_home_noise:
.addr B29_09A7
.addr -1
.addr mus_home_noise


B29_09A7:
.byte $B2,$01,$04,$04
.byte $00

B29_09AC:
.byte $9F,$A7,$B1
.byte $C2
    .byte $B3,$4A
    .byte $B2,$4C
    .byte $B5,$4A
    .byte $B1,$46
    .byte $B2,$42
    .byte $B3,$4A
    .byte $B2,$4C
    .byte $B6,$4A
.byte $FF
.byte $B3,$50
.byte $B2,$52
.byte $B5,$50
.byte $B1,$4C
.byte $B2,$48
.byte $B3,$50
.byte $B2,$52
.byte $B6,$50
.byte $B3,$50
.byte $B2,$52
.byte $B5,$50
.byte $B1,$4C
.byte $B2,$48
.byte $B2,$46,$4C,$54
.byte $B6,$50
.byte $00

B29_09E2:
.byte $9F,$0E,$B1
.byte $C2
    .byte $B6,$5A
    .byte $B3,$54
    .byte $B2,$50
    .byte $B6,$5A,$54
.byte $FF
.byte $9F,$B4,$F1
.byte $C3
    .byte $B2,$56,$3E,$56
    .byte $B6,$48
.byte $FF
.byte $B2,$34,$3C,$42
.byte $B6,$46
.byte $00

B29_0A02:
.byte $9F,$A0,$00
.byte $C4
    .byte $B2,$42,$4A,$50,$34,$3C,$4C
.byte $FF
.byte $C3
    .byte $48,$50,$56,$3A,$42,$52
.byte $FF
.byte $46,$3C,$34
.byte $B6,$40
.byte $00
