mus_humoresque_of_a_little_dog_pulse1:
.addr B29_06CA
B29_0610:
.addr B29_062B
.addr -1
.addr B29_0610

mus_humoresque_of_a_little_dog_pulse2:
.addr B29_0628
.addr -1
.addr mus_humoresque_of_a_little_dog_pulse2

mus_humoresque_of_a_little_dog_triangle:
.addr B29_06D0
.addr -1
.addr mus_humoresque_of_a_little_dog_triangle

mus_humoresque_of_a_little_dog_noise:
.addr B29_0708
.addr -1
.addr mus_humoresque_of_a_little_dog_noise

B29_0628:
.byte $9F,$13,$F1
B29_062B:
.byte $C2
    .byte $B9,$48,$02,$4A,$5A,$02,$48,$4A,$02,$5A
.byte $FF
.byte $56,$02,$54,$52,$02,$50,$4C,$02,$02,$4C,$02,$50,$52,$02,$54
.byte $B1,$64,$02,$60,$02,$5E,$02
.byte $B9,$52,$02,$54,$4C,$02,$02
.byte $C2
    .byte $02,$02,$62,$60,$02,$62,$5E,$02,$5A
.byte $FF
.byte $02,$02,$5E,$5A,$02,$5E
.byte $B1,$62,$02,$64,$02,$58,$02,$5A,$02
.byte $C2
    .byte $B9,$52,$02,$54
.byte $FF
.byte $B2,$4A,$4C
.byte $B9,$42,$02,$40,$48,$02,$4A,$50,$02,$4A,$5A,$02,$02,$56,$02,$42,$54,$02,$42,$50,$02,$52,$54,$02,$42,$4C,$02,$02,$4C,$02,$50,$52,$02,$54
.byte $B1,$64,$02,$60,$02,$5E,$02,$5A,$02,$54,$02
.byte $B2,$5E,$5E,$62,$5E
.byte $B9,$5A,$02,$58,$5A,$02,$5E,$02,$02,$5A,$54,$02,$02,$50,$02,$02,$50,$02,$02,$5A,$02,$52
.byte $B1,$50,$02,$4C,$02,$42,$02,$4C
.byte $B5,$02
.byte $00

B29_06CA:
.byte $9F,$6D,$F3
.byte $BA,$02
.byte $00

B29_06D0:
.byte $9F,$00,$00
.byte $B2,$2A,$02,$38,$02,$2A,$2A,$2E,$32,$34,$02,$2A,$02,$34,$34,$32,$2E
.byte $B3,$2A,$38,$2A,$38,$34,$02
.byte $B4,$02
.byte $B3,$2A,$38,$2A,$38,$34,$2A,$34,$2A
.byte $B2,$3E,$3E,$40,$40,$42,$42,$46,$46,$38,$38,$2A,$2A,$34,$2A,$34,$02
.byte $00

B29_0708:
.byte $CC
    .byte $B2,$44
    .byte $B9,$84,$01,$04
.byte $FF
.byte $B4,$44,$01
.byte $C8
    .byte $B2,$44
    .byte $B9,$84,$01,$04
.byte $FF
.byte $C3
    .byte $B2,$44
    .byte $B9,$84,$01,$04,$44,$01,$04,$84,$01,$04
.byte $FF
.byte $B2,$44,$44,$44,$01
.byte $00
