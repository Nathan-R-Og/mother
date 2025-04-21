mus_b_dangerous_pulse1:
.addr mus_b_intro_pulse1
song_3_second1:
.addr B28_1674
.addr B28_16b6
.addr -1
.addr song_3_second1

mus_b_dangerous_pulse2:
.addr mus_b_intro_pulse2
song_3_second2:
.addr B28_1695
.addr B28_175A
.addr -1
.addr song_3_second2

mus_b_dangerous_triangle:
.addr mus_b_intro_triangle
song_3_second3:
.addr B28_17C8
.addr -1
.addr song_3_second3

mus_b_dangerous_noise:
.addr mus_b_intro_noise
song_3_second4:
.addr B28_1823
.addr -1
.addr song_3_second4

; battle intro
    .include "./tracks/generic/b_intro.asm"


B28_1674:
    .byte $9F,$04,$F3
    .byte $B8,$50,$50,$50
    .byte $9F,$0B,$F3
    .byte $50,$50,$50
    .byte $9F,$0C,$F3
    .byte $50,$50
    .byte $9F,$0D,$F3
    .byte $50,$50
    .byte $9F,$0E,$F3
    .byte $50,$50
    .byte $B0,$02
    .byte $BB,$02
    .byte $00
B28_1695:
    .byte $9F,$04,$F6
    .byte $B8,$5A,$5A,$5A
    .byte $9F,$0B,$F6
    .byte $5A,$5A,$5A
    .byte $9F,$0C,$F6
    .byte $5A,$5A
    .byte $9F,$0D,$F6
    .byte $5A,$5A
    .byte $9F,$0E,$F6
    .byte $5A,$5A
    .byte $B0,$02
    .byte $BB,$02
    .byte $00
B28_16b6:
    .byte $9F,$A9,$F3
    .byte $B8,$02
    .byte $B0,$42,$38,$3A,$48
    .byte $B6,$44
    .byte $B0,$4E,$4E,$02,$02
    .byte $B6,$02
    .byte $B0,$42,$38,$3A,$48
    .byte $B6,$44
    .byte $B0,$52,$52,$02,$02
    .byte $B2,$02
    .byte $B8,$02,$02
    .byte $BB,$02
    .byte $9F,$A8,$F3
    .byte $B4,$20
    .byte $B3,$26,$22
    .byte $B4,$20
    .byte $B3,$2C,$26
    .byte $9F,$29,$F2
    .byte $C4
        .byte $B0,$30,$38,$2A,$30
    .byte $FF
    .byte $C4
        .byte $32,$3A,$2C,$32
    .byte $FF
    .byte $C4
        .byte $34,$24,$2E,$34
    .byte $FF
    .byte $C2
        .byte $36,$3E,$30,$36
    .byte $FF
    .byte $C2
        .byte $38,$40,$32,$38
    .byte $FF
    .byte $9F,$A8,$F3
    .byte $C2
        .byte $B0,$02,$02,$20,$02,$02,$20,$02,$02
        .byte $B3,$20
        .byte $B0,$02,$02,$22,$02,$02,$22,$02,$02
        .byte $B3,$22
    .byte $FF
    .byte $BB,$02
    .byte $9F,$A1,$B4
    .byte $C2
        .byte $B0,$34,$3A,$42,$50
        .byte $B2,$48,$42,$3A
        .byte $B1,$42,$3A,$48,$3A,$3E,$34,$2E,$34
        .byte $B0,$4C,$52,$5A,$68
        .byte $B2,$60,$5A,$52
        .byte $B0,$5A,$52,$48,$42,$3A,$42,$48,$52,$56,$4C,$46,$3E,$34,$3E,$46,$4C
    .byte $FF
    .byte $00
B28_175A:
    .byte $9F,$A8,$F4
    .byte $B0,$42,$38,$3A,$48
    .byte $B6,$44
    .byte $B0,$4E,$4E,$02,$02
    .byte $B6,$02
    .byte $B0,$42,$38,$3A,$48
    .byte $B6,$44
    .byte $B0,$52,$52,$02,$02
    .byte $B6,$02
    .byte $B4,$2A
    .byte $B3,$30,$2C
    .byte $B4,$2A
    .byte $B3,$36,$30
    .byte $9F,$A9,$F3
    .byte $C4
        .byte $B0,$42,$30,$38,$42
    .byte $FF
    .byte $C4
        .byte $44,$32,$3A,$44
    .byte $FF
        .byte $C4,$46,$34,$3C,$46
    .byte $FF
    .byte $C2
        .byte $48,$36,$3E,$48
    .byte $FF
    .byte $C2
        .byte $4A,$38,$40,$4A
    .byte $FF
    .byte $9F,$A8,$F4
    .byte $C2
        .byte $B0,$02,$02,$2A,$02,$02,$2A,$02,$02
        .byte $B3,$2A
        .byte $B0,$02,$02,$2C,$02,$02,$2C,$02,$02
        .byte $B3,$2C
    .byte $FF
    .byte $C4
        .byte $B4,$4C
        .byte $B3,$48,$46
    .byte $FF
    .byte $00
B28_17C8:
    .byte $9F,$00,$00
    .byte $C5
        .byte $B1,$2A,$20,$26,$20
        .byte $B0,$2A,$2A
        .byte $B1,$20,$26,$20,$2A,$20,$26,$20
        .byte $B0,$2A,$2A
        .byte $B1,$1A,$1C,$20
    .byte $FF
    .byte $2A,$2C,$2E,$30,$32,$30,$2E,$2C,$2C,$2E,$30,$32,$34,$32,$30,$2E,$2E,$30,$32,$34,$36,$34,$32,$30,$30,$32,$34,$36,$32,$34,$36,$38
    .byte $9F,$0F,$00
    .byte $E0
        .byte $B0,$2A,$2A
    .byte $FF
    .byte $9F,$00,$00
    .byte $C4
        .byte $B1,$34,$32,$30,$2E,$2C,$2A,$28,$26,$3A,$38,$36,$34,$3E,$3C,$3A,$38
    .byte $FF
    .byte $00
B28_1823:
    .byte $DC
        .byte $B0,$04,$04,$04,$04,$07,$04,$04,$04
    .byte $FF
    .byte $C4
        .byte $04,$04,$07,$04,$04,$07,$04,$04,$07,$04,$04,$04,$07,$07,$07,$07
    .byte $FF
    .byte $E0
        .byte $04,$04,$07,$04
    .byte $FF
    .byte $00
