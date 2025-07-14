mus_ghastly_site_pulse1:
.addr B29_0445
B29_0427:
.addr B29_04A6
.addr -1
.addr B29_0427

mus_ghastly_site_pulse2:
.addr B29_045D
B29_042F:
.addr B29_04A3
.addr -1
.addr B29_042F

mus_ghastly_site_triangle:
.addr B29_0478
B29_0437:
.addr B29_04EC
.addr -1
.addr B29_0437

mus_ghastly_site_noise:
.addr B29_048B
B29_043F:
.addr B29_0516
.addr -1
.addr B29_043F

B29_0445:
.byte $9F,$27,$F6
.byte $C2
    .byte $B3,$04,$14
    .byte $B4,$12
    .byte $B3,$0A,$10
    .byte $B6,$08
    .byte $B1,$08,$02
.byte $FF
.byte $9F,$A9,$F3
.byte $B8,$02
.byte $00

B29_045D:
.byte $9F,$21,$F4
.byte $C4
    .byte $B4,$02
.byte $FF
.byte $C3
    .byte $B1,$72,$74,$72,$74,$78,$7A,$78,$74
.byte $FF
.byte $72,$74,$72,$74,$78,$7A,$78,$02
.byte $00

B29_0478:
.byte $9F,$A0,$00
.byte $C2
    .byte $B3,$1C,$2C
    .byte $B4,$2A
    .byte $B3,$22,$28
    .byte $B6,$20
    .byte $B1,$20,$02
.byte $FF
.byte $00

B29_048B:
.byte $C6
    .byte $B3,$04,$04
.byte $FF
.byte $C4
    .byte $B2,$04
.byte $FF
.byte $C4
    .byte $B0,$04
.byte $FF
.byte $C4
    .byte $07
.byte $FF
.byte $C4
    .byte $0D
.byte $FF
.byte $10,$10,$10,$01
.byte $00

B29_04A3:
.byte $9F,$A7,$F6
;fallthrough
B29_04A6:
.byte $C2
    .byte $B3,$5A,$72,$70,$68
    .byte $B4,$6E,$02
.byte $FF
.byte $B3,$54,$60,$5E,$52
.byte $B4,$50,$02
.byte $B4,$02
.byte $B6,$02
.byte $B0,$66,$7A
.byte $B1,$78
.byte $B4,$76,$9F,$A9,$F3
.byte $B6,$02
.byte $B0,$4E,$62
.byte $B1,$60
.byte $B4,$5E,$02
.byte $B2,$5A,$5C,$5E,$60,$68,$66,$64,$62,$60,$62,$64,$66,$6E,$6C,$6A,$68
.byte $B3,$2A,$38
.byte $B4,$3A
.byte $B3,$40,$38
.byte $B4,$36
.byte $00

B29_04EC:
.byte $C4
    .byte $B3,$2A,$38
    .byte $B4,$3A
.byte $FF
.byte $B3,$34,$40,$3E,$32
.byte $B4,$30,$02
.byte $C3
    .byte $B3,$2A,$38
    .byte $B4,$3A
.byte $FF
.byte $B3,$42,$50,$44,$52,$46,$54,$48,$56
.byte $B3,$2A,$38
.byte $B4,$3A
.byte $B3,$40,$38
.byte $B4,$36
.byte $00

B29_0516:
.byte $E0
    .byte $B0,$04,$04,$04,$04
    .byte $B2,$04,$04,$01
    .byte $B6,$01
    .byte $B0,$04,$04,$07,$01
.byte $FF
.byte $00
