is_scripted_battle = $21

is_in_tank         = $23

attacker_offset    = $53
target_offset      = $54

battlers           = $0600
ENEMY_ID      = $00
AILMENTS      = $01
RESISTANCES   = $02
HP            = $03
PP            = $05
OFFENSE       = $07
DEFENSE       = $09
FIGHT         = $0B
SPEED         = $0C
WISDOM        = $0D
STRENGTH      = $0E
FORCE         = $0F
; $10 UNKNOWN
ALLY_ID       = $11
; $12~$17 UNKNOWN
DATA_POINTER  = $18
; $1A~$1B UNKNOWN
ACTION_TARGET = $1C
ACTION_ID     = $1D
BATTLE_STATUS = $1E
; $1F UNKNOWN

.segment        "PRG17": absolute

BattleMain:
    lda #$00
    sta pad1_forced
    sta pad2_forced
    sta $52
    sta $59
    sta $49
    sta $4a
    sta $4b
    sta $4c
    sta $4d
    tax


    .incbin "../../split/jp/prg/bank17.bin",$15