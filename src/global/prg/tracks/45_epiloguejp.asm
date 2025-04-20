mus_epiloguejp_pulse2_phrase03:
    Set_Timbre 5, 19, timbre_c_square SQTD_50, 1, SQTV_ISVOL, 1

    Note_Length nl_whole
    Note_G 5
    Note_Length nl_half
    Note_C 6
    Note_B 5

    Note_Length nl_whole
    Note_G 5
    Note_Length nl_half
    Note_D 5
    Note_C 5

    Note_Length nl_whole
    Note_C 5
    Note_Length nl_half
    Note_AS 4
    Note_A 4

    Note_Length nl_whole
    Note_A 4
    Note_D 5

    Track_End

mus_epiloguejp_pulse1_phrase03:
.byte $9F,$0E,$B1
.byte $B3,$34,$42,$54,$50,$32,$42,$B4,$4A,$B3,$30,$42
.byte $B4,$50,$B3,$2E,$38,$B4,$40
.byte $00

mus_epiloguejp_triangle_phrase03:
.byte $C8,$B4,$02,$FF
.byte $00

mus_epiloguejp_noise_phrase03:
.byte $C8,$B4,$01
.byte $FF
.byte $00

mus_epiloguejp_pulse1_phrase07:
.byte $9C,$8D
.byte $00

mus_epiloguejp_pulse2_phrase01:
.byte $9F,$10,$B5
.byte $B2,$68,$6C,$70,$76,$B4,$6C
.byte $B2,$80,$7E,$7A,$70,$B4,$76,$B2,$7A,$7E,$80,$B3,$76,$B6,$68,$B2,$72
.byte $70,$68,$B4,$5E,$B2,$02,$B3,$62,$66,$68,$72,$B2,$70,$72,$76,$70
.byte $6C,$70,$72,$6C,$B2,$62,$72,$70,$5E,$B3,$6C,$66,$B3,$68,$B2,$5E
.byte $6C,$B4,$68
.byte $00

mus_epiloguejp_pulse1_phrase01:
.byte $9F,$0C,$B1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62
.byte $4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E,$68
.byte $42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66
.byte $50,$58,$5E,$58,$46,$4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66
.byte $50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

mus_epiloguejp_triangle_phrase01:
.byte $D0,$B4,$02,$FF
.byte $00

mus_epiloguejp_noise_phrase01:
.byte $D0,$B4
.byte $01,$FF
.byte $00

mus_epiloguejp_pulse2_phrase04:
.byte $9F,$A7,$F6
.byte $C3,$B3,$4A,$B2,$4C,$50,$B3,$50,$54,$B3
.byte $46,$B2,$4A,$4C,$B3,$4A,$42,$B3,$42,$B2,$46,$3C,$B2,$40,$42,$46
.byte $4A,$B3,$40,$3C,$B4,$38,$FF,$B3,$4A,$B2,$50,$5A,$B3,$54,$4C,$B3
.byte $50,$B2,$46,$4C,$B6,$4A,$B1,$4A,$46,$B3,$42,$B2,$46,$4A,$B3,$46
.byte $3C,$42,$40,$42,$46
.byte $9F,$A7,$F3
.byte $B4,$4A,$B3,$46,$50,$B4,$4A,$46
.byte $9F,$09,$F2
.byte $B4,$46
.byte $00

mus_epiloguejp_pulse1_phrase04:
.byte $9F,$A7,$B2
.byte $C2,$B1,$5A,$50,$4A,$42,$38
.byte $42,$4A,$50,$5A,$54,$4C,$42,$3C,$42,$4C,$54,$58,$50,$46,$40,$38
.byte $40,$46,$50,$50,$4A,$42,$38,$32,$38,$42,$4A,$50,$4A,$42,$3C,$36
.byte $3C,$42,$4A,$4E,$46,$3C,$36,$2E,$36,$3C,$46,$50,$46,$40,$38,$2E
.byte $38,$40,$46,$50,$4C,$46,$40,$38,$34,$2E,$28,$FF
mus_epiloguejp_pulse1_phrase05:
.byte $C2,$B0,$5A,$50
.byte $4A,$42,$38,$42,$4A,$50,$FF,$C2,$5A,$54,$4C,$42,$3C,$42,$4C,$54
.byte $FF,$C2,$58,$50,$46,$40,$38,$40,$46,$50,$FF,$C2,$50,$4A,$42,$38
.byte $32,$38,$42,$4A,$FF,$50,$4A,$42,$3C,$38,$32,$2A,$24,$20,$24,$2A
.byte $32,$3C,$42,$4A,$50,$54,$4E,$46,$42,$3C,$36,$2E,$2A,$24,$2E,$36
.byte $3C,$42,$46,$4E,$54,$C2,$50,$46,$40,$38,$2E,$38,$40,$46,$FF,$C2
.byte $50,$4C,$46,$40,$38,$34,$2E,$28,$FF
.byte $00

mus_epiloguejp_pulse1_phrase06:
.byte $9F,$A9,$B2
.byte $C2,$B2,$5A,$50,$4A,$50,$5A,$4C,$46,$4C,$FF
.byte $9F,$0E,$B1
.byte $5A,$4C,$46,$4C
.byte $00

mus_epiloguejp_triangle_phrase04:
.byte $C2,$B4,$42,$34,$38,$42,$3C,$46,$38,$B3,$38,$34,$FF,$B3,$2A,$B2
.byte $2E,$32,$B3,$34,$1C,$B3,$20,$B2,$28,$2E,$B6,$2A,$B2,$28,$24,$20
.byte $B3,$1E,$B4,$2E,$20,$B3,$38,$34,$B3,$42,$B2,$46,$4A,$B3,$4C,$34
.byte $B3,$38,$B2,$40,$46,$B6,$42,$B2,$40,$3C,$38,$B3,$36,$B4,$2E,$20
.byte $32,$2A,$26,$2A,$26,$26
.byte $00

mus_epiloguejp_noise_phrase04:
.byte $C7,$B3,$41,$04,$B5,$41,$B1,$04,$B3
.byte $07,$FF,$B3,$41,$B5,$81,$B0,$41,$41,$B1,$81,$41,$01,$41,$01,$41
.byte $81,$01,$C8,$B2,$44,$04,$81,$04,$B1,$04,$41,$44,$01,$B2,$81,$04
.byte $FF,$C4,$B3,$01,$04,$FF
.byte $00


;why is this out of order ????????????????????????
mus_epiloguejp_pulse2_start:
.addr mus_epiloguejp_pulse2_phrase01
.addr mus_epiloguejp_pulse2_phrase02
.addr mus_epiloguejp_pulse2_phrase03
.addr mus_epiloguejp_pulse2_phrase04
mus_epiloguejp_pulse2_loop:
.addr mus_epiloguejp_pulse2_phrase01
.addr -1
.addr mus_epiloguejp_pulse2_loop



mus_epiloguejp_pulse1_start:
.addr mus_epiloguejp_pulse1_phrase01
.addr mus_epiloguejp_pulse1_phrase02
.addr mus_epiloguejp_pulse1_phrase03
.addr mus_epiloguejp_pulse1_phrase04
.addr mus_epiloguejp_pulse1_phrase05
.addr mus_epiloguejp_pulse1_phrase06
.addr mus_epiloguejp_pulse1_phrase07
mus_epiloguejp_pulse1_loop:
.addr mus_epiloguejp_pulse1_phrase01
.addr -1
.addr mus_epiloguejp_pulse1_loop



mus_epiloguejp_triangle_start:
.addr mus_epiloguejp_triangle_phrase01
.addr mus_epiloguejp_triangle_phrase02
.addr mus_epiloguejp_triangle_phrase03
.addr mus_epiloguejp_triangle_phrase04
mus_epiloguejp_triangle_loop:
.addr mus_epiloguejp_triangle_phrase01
.addr -1
.addr mus_epiloguejp_triangle_loop



mus_epiloguejp_noise_start:
.addr mus_epiloguejp_noise_phrase01
.addr mus_epiloguejp_noise_phrase02
.addr mus_epiloguejp_noise_phrase03
.addr mus_epiloguejp_noise_phrase04
mus_epiloguejp_noise_loop:
.addr mus_epiloguejp_noise_phrase01
.addr -1
.addr mus_epiloguejp_noise_loop



mus_epiloguejp_pulse2_phrase02:
.byte $9F,$10,$B1
.byte $C2,$B2,$50,$54,$58,$5E,$B4,$54
.byte $B2,$68,$66,$62,$58,$B4,$5E,$B2,$62,$66,$68,$B3,$5E,$B6,$50,$B2
.byte $5A,$58,$50,$B4,$46,$B2,$02,$B3,$4A,$4E,$50,$5A,$B2,$58,$5A,$5E
.byte $58,$54,$58,$5A,$54,$B2,$4A,$5A,$58,$46,$B3,$54,$4E,$B3,$50,$B2
.byte $46,$54,$B4,$50,$FF
.byte $00

mus_epiloguejp_pulse1_phrase02:
.byte $9F,$B4,$B1
.byte $B2,$5E,$70,$5E,$70,$62,$72
.byte $62,$72,$62,$70,$62,$70,$5E,$70,$5E,$70,$62,$72,$62,$B3,$5E,$B2
.byte $70,$5E,$70,$62,$72,$62,$B3,$66,$B2,$76,$66,$76,$62,$72,$62,$B3
.byte $72,$B2,$62,$B3,$72,$B2,$5E,$70,$5E,$70,$5A,$6C,$5A,$6C,$62,$72
.byte $62,$72,$66,$76,$66,$76,$68,$70,$76,$70,$80,$76,$70,$68
.byte $9F,$A9,$B2
.byte $B1,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42
.byte $46,$42,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$40,$46,$40,$4A,$40
.byte $46,$40,$46,$42,$46,$42,$4A,$42,$B5,$46,$B1,$40,$46,$40,$4A,$40
.byte $B5,$46,$B1,$42,$46,$42,$4A,$42,$B5,$46,$B1,$3C,$46,$3C,$4A,$3C
.byte $B2,$46,$B1,$4A,$42,$4A,$42,$4E,$42,$4E,$42,$50,$42,$50,$42,$54
.byte $42,$54,$42,$58,$50,$46,$40,$50,$46,$40,$38,$3C,$46,$4E,$46,$54
.byte $4E,$46,$4E,$4A,$38,$4A,$38,$4A,$38,$4A,$38,$4E,$3C,$4E,$3C,$4E
.byte $3C,$4E,$3C,$50,$40,$50,$40,$50,$40,$50,$40,$50,$46,$40,$38,$46
.byte $40,$38,$40
.byte $00

mus_epiloguejp_triangle_phrase02:
.byte $9F,$A0,$00
.byte $C2,$B4,$38,$42,$32,$28,$B6,$2A,$B4
.byte $38,$B2,$02,$B6,$2A,$B4,$2E,$B2,$02,$B3,$2A,$2E,$32,$36,$B4,$38
.byte $2E,$B4,$2A,$2E,$38,$20,$FF
.byte $00

mus_epiloguejp_noise_phrase02:
.byte $D0,$B4,$01,$FF,$D0,$B3,$01,$04
.byte $FF
.byte $00
