mus_b_win_pulse1:
.addr B28_1A0B
.addr 0
mus_b_win_pulse2:
.addr B28_1A1A
mus_b_win_triangle:
.addr B28_1A29

B28_1A0B:
    .byte $9F,$A7,$F3
    .byte $B0,$1C,$26,$2E,$34,$3E,$46,$4C,$56
    .byte $B4,$54
    .byte $00

B28_1A1A:
    .byte $9F,$A7,$F3
    .byte $B0,$0E,$16,$1C,$26,$2E,$34,$3E,$46
    .byte $B4,$34
    .byte $00

B28_1A29:
    .byte $9F,$A0,$00
    .byte $B0,$2E,$34,$3E,$46,$4C,$56,$5E,$64
    .byte $B4,$5A
    .byte $00
