mus_pollyanna_pulse1:
.addr B28_1BDB
B28_1BB9:
.addr B28_1C54
.addr B28_1C98
.addr -1
.addr B28_1BB9

mus_pollyanna_pulse2:
.addr B28_1BFC
B28_1BC3:
.addr B28_1D3F
.addr B28_1D76
.addr -1
.addr B28_1BC3

mus_pollyanna_triangle:
.addr B28_1C1D
B28_1BCD:
.addr B28_1DAE
.addr -1
.addr B28_1BCD

mus_pollyanna_noise:
.addr B28_1C35
B28_1BD5:
.addr B28_1CE8
.addr -1
.addr B28_1BD5

B28_1BDB:
Set_Timbre 5, 9, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 2
Note_Length nl_eighth
Note_D 4
Note_G 4
Note_B 4
Note_Length nl_quarter
Note_E 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_eighth
Note_FS 4
Note_FS 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_half
Note_D 4
Note_Length nl_eighth
Note_Rest
Note_Length nl_eighth
Note_D 4
Note_G 4
Note_B 4
Note_Length nl_quarter
Note_E 4
Note_Length nl_quarter
Note_FS 4
Note_Length nl_whole
Note_FS 4
Note_Length nl_eighth
Note_Rest
Track_End
B28_1BFC:
    .byte $9F,$B2,$B1
    .byte $B1,$5A,$62,$68
    .byte $B2,$66
    .byte $B2,$68
    .byte $B1,$68,$68
    .byte $B2,$5E
    .byte $B3,$62
    .byte $B1,$02
    .byte $B1,$5A,$62,$68
    .byte $B2,$66
    .byte $B2,$68
    .byte $B4,$68
    .byte $B1,$02
    .byte $00
B28_1C1D:
    .byte $9F,$A0,$00
    .byte $B5,$42
    .byte $B3,$46
    .byte $B1,$02
    .byte $B5,$38
    .byte $B3,$42
    .byte $B1,$02
    .byte $B5,$42
    .byte $B3,$46
    .byte $B4,$38
    .byte $B1,$02
    .byte $00
B28_1C35:
    .byte $C2
        .byte $B1,$44,$04,$04,$44,$01,$04,$01,$04
    .byte $FF
    .byte $44,$04,$04,$44,$01,$44,$01,$44,$01,$04,$04,$01
    .byte $B0,$81,$81
    .byte $B1,$41,$81,$41
    .byte $00
B28_1C54:
    .byte $9F,$B2,$B1
    .byte $C2
        .byte $B1,$02,$40,$46,$50,$02,$3C,$46,$4E,$02,$38,$40,$4A,$02,$38,$40,$46,$42,$4A,$50,$42,$40,$46,$50,$40,$3E,$46,$4C,$46,$3C,$46,$36,$46
    .byte $FF
    .byte $02,$32,$38,$40,$02,$30,$38,$40,$02,$2E,$38,$40,$02,$2C,$32,$38
    .byte $9F,$A9,$B2
    .byte $4A,$46,$42,$46,$46,$46,$42,$46
    .byte $B4,$40
    .byte $00
B28_1C98:
    .byte $9F,$B2,$F2
    .byte $B1,$36,$1E,$28
    .byte $B5,$36
    .byte $B2,$1E
    .byte $B1,$38,$20,$2A
    .byte $B5,$38
    .byte $B2,$20
    .byte $B1,$36,$1E,$28,$2E,$36,$16,$24,$2E,$28,$16,$20,$28,$2E,$20,$28,$2E
    .byte $B1,$4A,$42,$38,$42,$46,$40
    .byte $B2,$38
    .byte $B1,$42,$38,$32,$38,$46,$40
    .byte $B2,$38
    .byte $B1,$4A,$42,$38,$42,$46,$40
    .byte $B2,$38
    .byte $9F,$A9,$B1
    .byte $B1,$4A,$4A,$4A,$4A,$50
    .byte $B2,$42
    .byte $B4,$40
    .byte $B1,$02
    .byte $00

    .byte $00
B28_1CE8:
    .byte $C8
        .byte $B1,$41,$04,$81
        .byte $B0,$04,$41
        .byte $B1,$41,$44,$81
        .byte $B0,$04,$04
    .byte $FF
    .byte $C3
        .byte $B1,$44,$04,$84,$44,$44,$04,$84,$04
    .byte $FF
    .byte $44,$04,$84,$44
    .byte $B0,$81,$81
    .byte $B1,$81,$81,$81
    .byte $C2
        .byte $B1,$44,$04,$84,$44,$01,$84,$84,$01
    .byte $FF
    .byte $44,$04,$84,$44,$44,$04,$84,$04,$44,$04,$84,$44,$44,$81,$81,$07
    .byte $C4
        .byte $44,$04,$84,$44,$44,$04,$84,$04
    .byte $FF
    .byte $44,$04,$84,$44,$44,$04
    .byte $B0,$81,$81
    .byte $B1,$81
    .byte $00
B28_1D3F:
    .byte $9F,$A7,$B3
B28_1D42:
    .byte $C2
        .byte $B1,$40,$40,$46,$46
        .byte $B2,$54
        .byte $B1,$4E
        .byte $B4,$50
        .byte $B1,$02
        .byte $B1,$4A,$4A,$50,$50
        .byte $B2,$58
        .byte $B1,$50
        .byte $B3,$46
        .byte $B1,$42
        .byte $B3,$42
    .byte $FF
    .byte $B1,$40,$3C,$38,$3C
    .byte $B2,$40,$4A,$50,$58
    .byte $B3,$62
    .byte $C2
        .byte $B1,$50,$4E,$4A,$4E
    .byte $FF
    .byte $B4,$50
    .byte $00
B28_1D76:
    .byte $B1,$46,$46,$46,$02
    .byte $B0,$46,$02
    .byte $B1,$40,$3C
    .byte $B4,$38
    .byte $B1,$02
    .byte $B1,$46,$46,$46,$02,$54,$50,$4E
    .byte $B6,$50
    .byte $B1,$02,$4A,$4E
    .byte $C3
        .byte $50,$4E,$4A,$4E
    .byte $FF
    .byte $50,$02,$46,$46
    .byte $C2
        .byte $50,$4E,$4A,$4E
    .byte $FF
    .byte $C4
        .byte $50
    .byte $FF
    .byte $58
    .byte $B2,$50
    .byte $B4,$50
    .byte $B1,$02
    .byte $00
B28_1DAE:
    .byte $9F,$00,$00
    .byte $C2
        .byte $B5,$38
        .byte $B1,$38
        .byte $B5,$36
        .byte $B1,$36
        .byte $B5,$32
        .byte $B1,$32
        .byte $B5,$2E
        .byte $B1,$2E
        .byte $B5,$2A
        .byte $B1,$2A
        .byte $B5,$28
        .byte $B1,$28
        .byte $B5,$26
        .byte $B1,$26
        .byte $B5,$2E
        .byte $B1,$2E
    .byte $FF
    .byte $9F,$1F,$00
    .byte $C4
        .byte $B1,$32
    .byte $FF
    .byte $C4
        .byte $30
    .byte $FF
    .byte $C4
        .byte $2E
    .byte $FF
    .byte $C4
        .byte $2C
    .byte $FF
    .byte $C4
        .byte $2A
    .byte $FF
    .byte $C4
        .byte $2E
    .byte $FF
    .byte $9F,$A0,$00
    .byte $B4,$20
    .byte $9F,$00,$00
    .byte $B5,$28
    .byte $B3,$28
    .byte $B1,$02
    .byte $B5,$2A
    .byte $B3,$2A
    .byte $B1,$02
    .byte $B5,$28
    .byte $B1,$28
    .byte $B5,$2E
    .byte $B1,$2E
    .byte $C2
        .byte $B5,$38
        .byte $B1,$38
    .byte $FF
    .byte $9F,$1F,$00
    .byte $C4
        .byte $B1,$2A
    .byte $FF
    .byte $C4
        .byte $28
    .byte $FF
    .byte $C4
        .byte $24
    .byte $FF
    .byte $C4
        .byte $28
    .byte $FF
    .byte $C4
        .byte $2A
    .byte $FF
    .byte $C4
        .byte $28
    .byte $FF
    .byte $C4
        .byte $24
    .byte $FF
    .byte $C4
        .byte $2E
    .byte $FF
    .byte $9F,$A0,$00
    .byte $B4,$20
    .byte $00
