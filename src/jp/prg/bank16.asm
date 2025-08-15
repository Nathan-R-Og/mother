.segment        "PRG16": absolute
.include "../../global/enemy_stats.asm"

;positioning
battle_positionings:
.byte $0C,$00,$00,$00
.byte $0D,$00,$00,$00
.byte $0E,$00,$00,$00
.byte $00,$0D,$00,$00
.byte $00,$0E,$00,$00
.byte $00,$0B,$11,$00
.byte $00,$08,$0E,$14
.byte $0B,$11,$00,$00
.byte $08,$12,$00,$00
.byte $07,$11,$00,$00
.byte $08,$0E,$14,$00
.byte $05,$0D,$15,$00
.byte $06,$0B,$10,$15
.byte $02,$09,$10,$17
.byte $0B,$10,$00,$00
.byte $07,$0C,$15,$00
.byte $0C,$15,$00,$00
.byte $0A,$12,$00,$00
.byte $02,$07,$10,$15
.byte $03,$0C,$15,$00
.byte $00,$08,$12,$00
.byte $00,$05,$0D,$15

.include "../../global/battles.asm"

ENEMY_TILE_POINTERS:
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER2
.word ENEMY_TILE_POINTER3
.word ENEMY_TILE_POINTER4
.word ENEMY_TILE_POINTER5
.word ENEMY_TILE_POINTER1
.word ENEMY_TILE_POINTER6
.word ENEMY_TILE_POINTER7
.word ENEMY_TILE_POINTER8
.word ENEMY_TILE_POINTER9
.word ENEMY_TILE_POINTERA
.word ENEMY_TILE_POINTERB
.word ENEMY_TILE_POINTERC
.word ENEMY_TILE_POINTERD
.word ENEMY_TILE_POINTERE

ENEMY_TILE_POINTER1:
.byte 8,8
.byte $00
.byte $00,$01,$02,$03,$04,$05,$06,$07
.byte $10,$11,$12,$13,$14,$15,$16,$17
.byte $20,$21,$22,$23,$24,$25,$26,$27
.byte $30,$31,$32,$33,$34,$35,$36,$37
.byte $08,$09,$0A,$0B,$0C,$0D,$0E,$0F
.byte $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
.byte $28,$29,$2A,$2B,$2C,$2D,$2E,$2F
.byte $38,$39,$3A,$3B,$3C,$3D,$3E,$3F

ENEMY_TILE_POINTER2:
.byte 8,6
.byte $00
.byte $00,$01,$02,$03,$04,$05,$10,$11
.byte $12,$13,$14,$15,$20,$21,$22,$23
.byte $24,$25,$30,$31,$32,$33,$34,$35
.byte $06,$07,$08,$09,$0A,$0B,$16,$17
.byte $18,$19,$1A,$1B,$26,$27,$28,$29
.byte $2A,$2B,$36,$37,$38,$39,$3A,$3B

ENEMY_TILE_POINTER3:
.byte 6,8
.byte 2
.byte $00,$01,$02,$03,$04,$05
.byte $06,$07,$10,$11,$12,$13
.byte $14,$15,$16,$17,$20,$21
.byte $22,$23,$24,$25,$26,$27
.byte $30,$31,$32,$33,$34,$35
.byte $36,$37,$08,$09,$0A,$0B
.byte $28,$29,$2A,$2B,$18,$19
.byte $1A,$1B,$38,$39,$3A,$3B

ENEMY_TILE_POINTER4:
.byte 6,6
.byte 2
.byte $07,$08,$09,$0A,$0B,$0C
.byte $17,$18,$19,$1A,$1B,$1C
.byte $27,$28,$29,$2A,$2B,$2C
.byte $37,$38,$39,$3A,$3B,$3C
.byte $0D,$0E,$0F,$2D,$2E,$2F
.byte $1D,$1E,$1F,$3D,$3E,$3F

ENEMY_TILE_POINTER5:
.byte 7,4
.byte 1
.byte $00,$01,$02,$03,$10,$11,$12
.byte $13,$20,$21,$22,$23,$30,$31
.byte $32,$33,$04,$05,$06,$14,$15
.byte $16,$24,$25,$26,$34,$35,$36

ENEMY_TILE_POINTER6:
.byte 6,4
.byte $02
.byte $00,$01,$02,$03,$10,$11
.byte $12,$13,$20,$21,$22,$23
.byte $30,$31,$32,$33,$04,$05
.byte $24,$25,$14,$15,$34,$35

ENEMY_TILE_POINTER7:
.byte 6,4
.byte 2
.byte $06,$07,$08,$09,$16,$17
.byte $18,$19,$26,$27,$28,$29
.byte $36,$37,$38,$39,$0A,$0B
.byte $2A,$2B,$1A,$1B,$3A,$3B

ENEMY_TILE_POINTER8:
.byte 4,6
.byte 4
.byte $00,$01,$02,$03
.byte $04,$05,$10,$11
.byte $12,$13,$14,$15
.byte $20,$21,$22,$23
.byte $24,$25,$30,$31
.byte $32,$33,$34,$35

ENEMY_TILE_POINTER9:
.byte 4,4
.byte 4
.byte $0C,$0D,$0E,$0F
.byte $1C,$1D,$1E,$1F
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F

ENEMY_TILE_POINTERA:
.byte 4,3
.byte 4
.byte $07,$08,$09,$17
.byte $18,$19,$27,$28
.byte $29,$37,$38,$39

ENEMY_TILE_POINTERB:
.byte 4,3
.byte 4
.byte $0A,$0B,$0C,$1A
.byte $1B,$1C,$2A,$2B
.byte $2C,$3A,$3B,$3C

ENEMY_TILE_POINTERC:
.byte 4,3
.byte 4
.byte $0D,$0E,$0F,$1D
.byte $1E,$1F,$2D,$2E
.byte $2F,$3D,$3E,$3F

ENEMY_TILE_POINTERD:
.byte 2,4
.byte 3
.byte $0C,$0D
.byte $0E,$0F
.byte $1C,$1D
.byte $1E,$1F

ENEMY_TILE_POINTERE:
.byte 4,4
.byte 3
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F
.byte $2C,$2D,$2E,$2F
.byte $3C,$3D,$3E,$3F

;enemy extra tiles
.byte 0
.word 0

.byte $04
.word $9740

.byte $04
.word $9744

.byte $05
.word $9748

.byte $04
.word $974C

.byte $10
.word $9750

.byte $18
.word $9754

.byte $09
.word $9758

.byte $07
.word $975C

.byte $05
.word $9760

.byte $04
.word $9764

.byte $04
.word $9768

.byte $07
.word $976C

.byte $01
.word $9770

.byte $08
.word $9774

.byte $22
.word $9778

.byte $08
.word $977C

BATTLE_ACTION_POINTERS:
.word BATTLE_ACTION0
.word $990E
.word $9944
.word $9957
.word $996B
.word $9973
.word $997B
.word $9985
.word $99A6
.word $99C5
.word $99DF
.word $99E8
.word $9A0D
.word $9A1D
.word $9A26
.word $9A39
.word $9A45
.word $9A4E
.word $9A5A
.word $9A74
.word $9A87
.word $9A9A
.word $9ADE
.word $9AB2
.word $9AC2
.word $9E42
.word $9E56
.word $9B68
.word $99B9
.word $9B73
.word $9B84
.word $9B95
.word $9E9D
.word $9E9D
.word $9BF8
.word $9C04
.word $9E9D
.word $9BB3
.word $9E9D
.word $9E9D
.word $9BA2
.word $9CC7
.word $9CD4
.word $9CDD
.word $9CE8
.word $9CFB
.word $9D0C
.word $9D11
.word $9E62
.word $9B06
.word $9C0B
.word $9E9D
.word $9C25
.word $9E9D
.word $9DB6
.word $9DC2
.word $9DCD
.word $9DD8
.word $9E9D
.word $9E9D
.word $9C3B
.word $9BC6
.word $9C65
.word $9B1C
.word $9B28
.word $9B3D
.word $9B44
.word $9B4B
.word $9C77
.word $9C8C
.word $9E26
.word $9CBB
.word $9DE6
.word $9E6E
.word $9E70
.word $9E72
.word $9E2B
.word $9E9D
.word $9E9D
.word $9E2E
.word $9E31
.word $9E7E
.word $9E9D
.word $9DFC
.word $9E8A
.word $9E9D
.word $9E9D
.word $9E9D
.word $9E9D
.word $9E02
.word $9E9D
.word $9D65
.word $9E08
.word $9BAC
.word $9E92
.word $9D77
.word $9C59
.word $9E9D
.word $9CB1
.word $9D82
.word $9D8D
.word $9D98
.word $9E1B
.word $99F1
.word $9E9D
.word $9A6A
.word $9A7D
.word $9B7E
.word $9BD8
.word $9B15
.word $9C9B
.word $9E96
.word $9E9D
.word $9D20
.word $9D29
.word $9D32
.word $9D3B
.word $9D44
.word $9DA0
.word $9AFE
.word $9E34
.word $9E3B
.word $9D4E
.word $9D57
.word $9D70
.word $99D8
.word $9E9D
.word $9E9D
.word $9CAC
.word $9E9D
.word $9BDD
.word $9ACB
.word $9D5E
.word $99FB
.word $9DAB
.word $9E9D
.word $9E4C

;battle actions
BATTLE_ACTION0:
.byte $00 ;END

.incbin "../../split/jp/battle_actions.bin",$113
.incbin "../../split/jp/prg/bank16/unk1ec7.bin"