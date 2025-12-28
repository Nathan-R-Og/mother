;the only difference between jp and us stats is whether or not
;unused slots have blank names


;enemy graphics are divided between every 0x400 bytes.
;its exactly the same size as a tileset. uses the same system? probably
;therefore, some are shared. will be noted accordingly (with _A_)
;these numbers are just n = (ADDR - CHR_START) / 0x400
; (same as tilesets)
.enum ENEMY_GRAPHICS
    BIGWOODOH = $20
    DRAGON = $21
    R703 = $22
    ELEPHANT = $23
    GIEGUE = $24
    BIG_FOOT = $25
    TRUCK_A_GROUCHO = $26
    ROBOT_A_FOUREYES = $27
    BORG_A_UFO = $28
    GARGOYLE_A_BAT = $29
    GABILAN_A_SPIDER = $2A
    BEAR_A_FLY = $2B
    BISON_A_ENERGY = $2C
    TIGER_A_SKUNK = $2D
    FISH_A_CAR = $2E
    ARMOR_A_TEDDY = $2F
    WOODOH_A_MAGIC_SNAIL = $30
    BARBOT_A_CROCODILE = $31
    NANCY_A_GORILLA = $32
    STARMAN_A_TITANIAN = $33
    MOOK_A_SHROUDLEY = $34
    FUGITIVE_A_EAGLE = $35
    ULLRICH_A_DOG = $36
    TEDDY_A_SEAGULL = $37
    CEREBRUM_A_PILLOW_A_DOLL_A_LAMP = $38
    HIPPIE_A_WALLY_A_FIREBALL = $39
    BAGLADY_A_CENTIPEDE_A_GHOST = $3A
    DUSTBALL_A_BBGANG_A_BOMBER = $3B
    GANGZOMBIE_A_ZOMBIE_A_STARMANJR = $3C
    COUGAR_A_SNAKE_A_SCORPION = $3D
    HYENA_A_CROW_A_RAT = $3E
    DRDISTORTO_A_BETADOLL_A_ROPE = $3F
.endenum

.enum ENEMY_FLAGS
    NONE = 0
    SPRAYS = 1 << 0
    R_PK_BEAM = 1 << 1
    R_DEFDOWN_CONFSLEEP = 1 << 2
    UNK = 1 << 3
    R_PK_THUNDER = 1 << 4
    R_PK_FREEZE = 1 << 5
    R_PK_FIRE = 1 << 6
    GOD = 1 << 7
.endenum

.struct enemy_struct
    unk_0 .byte ;0
    status .byte ;1
    flags .byte ;2
    .union ;3-4
        hp .word
        palette_index .word
        tilemap .word
    .endunion
    .union ;5-6
        pp .word
        sprite_gfx .word
    .endunion
    .union ;7-8
        offense .word
        final_action .word
        altitude .word
    .endunion
    .union ;9-A
        defense .word
        defeat_message .word
        unk_param .word
    .endunion
    fight .byte ;B
    speed .byte ;C
    wisdom .byte ;D
    strength .byte ;E
    force .byte ;F
    moveset .res 8 ;10-17
    name .addr ;18-19
    exp .word ;1A-1B
    money .word ;1C-1D
    item_drop .byte ;1E
    graphic_page .byte ;1F
.endstruct

;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/Enemy_data
;enemy health can range from 0-$3ff (inclusive)
;ggggsshhhhhhhhhh
.define ething1(health, subpal, gtile) .word (gtile<<12) | (subpal<<10) | health
;enemy pp can range from 0-$3ff (inclusive)
;ggggggpppppppppp
.define ething2(pp, gfx) .word (gfx<<10) | pp
;enemy offense can range from 0-$3ff (inclusive)
;aaafffoooooooooo
.define ething3(offense, finalAction, altitude) .word (altitude<<13) | (finalAction<<10) | offense
;enemy defense can range from 0-$3ff (inclusive)
;uuummmdddddddddd
.define ething4(defense, messageDefeat, unkParam) .word (unkParam<<13) | (messageDefeat<<10) | defense

STATS_START:

STATS_UNKENEMY0:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 300, 0, 0
    ;pp, gfx
    ething2 300, 0
    ;offense, finalAction, altitude
    ething3 300, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 300, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 100, 100, 100
    ;battle actions
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    ;name pointer
    .addr ENAME_NULL
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_BIGWOODOH:
    .byte $00
    ;init status
    .byte $00
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 70, 1, 1
    ;pp, gfx
    ething2 0, 3
    ;offense, finalAction, altitude
    ething3 18, 2, 0
    ;defense, messageDefeat, unkParam
    ething4 50, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 23, 60, 60, 18
    ;battle actions
    .byte $01,$34,$41,$41,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BIGWOODOH
    ;exp
    .word 100
    ;money
    .word 140
    ;item
    .byte $48
    ;graphic
    .byte ENEMY_GRAPHICS::BIGWOODOH

STATS_DRAGON:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 650, 0, 1
    ;pp, gfx
    ething2 200, 0
    ;offense, finalAction, altitude
    ething3 180, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 60, 20, 100, 60
    ;battle actions
    .byte $6C,$0A,$6C,$01,$0A,$01,$01,$83
    ;name pointer
    .addr ENAME_DRAGON
    ;exp
    .word 500
    ;money
    .word 1200
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DRAGON

STATS_R7038:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 1000, 1, 1
    ;pp, gfx
    ething2 0, 5
    ;offense, finalAction, altitude
    ething3 600, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 1000, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 50, 60, 100, 100
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_R7038
    ;exp
    .word 430
    ;money
    .word 101
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::R703

STATS_ELEPHANT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 70, 2, 1
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 34, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 10, 5, 30, 8
    ;battle actions
    .byte $05,$05,$05,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ELEPHANT
    ;exp
    .word 60
    ;money
    .word 99
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ELEPHANT

STATS_BEAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 80, 0, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 42, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 64, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 28, 20, 40, 10
    ;battle actions
    .byte $01,$01,$01,$04,$05,$4F,$01,$01
    ;name pointer
    .addr ENAME_BEAR
    ;exp
    .word 70
    ;money
    .word 250
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BEAR_A_FLY

STATS_BIG_FOOT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 90, 2, 1
    ;pp, gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 50, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 38, 30, 60, 15
    ;battle actions
    .byte $0F,$0D,$0C,$0C,$0C,$0C,$0C,$0C
    ;name pointer
    .addr ENAME_BIG_FOOT
    ;exp
    .word 150
    ;money
    .word 48
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BIG_FOOT

STATS_MAD_TRUCK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 60, 0, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 22, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 40, 6, 0
    ;fight, speed, wisdom, strength, force
    .byte 38, 35, 35, 100, 100
    ;battle actions
    .byte $06,$06,$06,$06,$06,$06,$32,$32
    ;name pointer
    .addr ENAME_MAD_TRUCK
    ;exp
    .word 57
    ;money
    .word 30
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TRUCK_A_GROUCHO

STATS_OLD_ROBOT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 60, 2, 2
    ;pp, gfx
    ething2 30, 0
    ;offense, finalAction, altitude
    ething3 48, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 72, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 20, 20, 100, 100
    ;battle actions
    .byte $01,$12,$12,$53,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_OLD_ROBOT
    ;exp
    .word 54
    ;money
    .word 38
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_MEGABORG:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 160, 0, 2
    ;pp, gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 80, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 170, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 50, 60, 100, 100
    ;battle actions
    .byte $12,$13,$12,$12,$12,$12,$12,$01
    ;name pointer
    .addr ENAME_MEGABORG
    ;exp
    .word 197
    ;money
    .word 109
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_GARGOYLE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP
    ;health, subpal, gtile
    ething1 180, 0, 3
    ;pp, gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 90, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 160, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 80, 70, 70, 100, 100
    ;battle actions
    .byte $0A,$01,$0B,$0A,$01,$0B,$01,$3E
    ;name pointer
    .addr ENAME_GARGOYLE
    ;exp
    .word 110
    ;money
    .word 86
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GARGOYLE_A_BAT

STATS_GABILAN:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 100, 0, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 62, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 100, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 68, 70, 15, 15
    ;battle actions
    .byte $01,$3F,$3F,$01,$02,$01,$01,$34
    ;name pointer
    .addr ENAME_GABILAN
    ;exp
    .word 70
    ;money
    .word 43
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GABILAN_A_SPIDER

STATS_GORILLA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 2, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 26, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 35, 15, 5, 10, 20
    ;battle actions
    .byte $4B,$01,$01,$28,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_GORILLA
    ;exp
    .word 23
    ;money
    .word 52
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::NANCY_A_GORILLA

STATS_BISON:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 160, 0, 3
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 70, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 160, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 50, 80, 80, 80
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$02
    ;name pointer
    .addr ENAME_BISON
    ;exp
    .word 186
    ;money
    .word 83
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_TIGER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 35, 2, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 26, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 24, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 20, 5, 10, 20
    ;battle actions
    .byte $03,$02,$02,$03,$03,$03,$03,$02
    ;name pointer
    .addr ENAME_TIGER
    ;exp
    .word 24
    ;money
    .word 47
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TIGER_A_SKUNK

STATS_MAD_CAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 40, 0, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 38, 6, 0
    ;fight, speed, wisdom, strength, force
    .byte 45, 40, 35, 100, 100
    ;battle actions
    .byte $06,$06,$06,$06,$06,$06,$06,$32
    ;name pointer
    .addr ENAME_MAD_CAR
    ;exp
    .word 55
    ;money
    .word 32
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::FISH_A_CAR

STATS_RAEB_YDDET:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 2, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 22, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 38, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 25, 18, 25, 18
    ;battle actions
    .byte $49,$49,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_RAEB_YDDET
    ;exp
    .word 25
    ;money
    .word 27
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ARMOR_A_TEDDY

STATS_MAGIC_SNAIL:
    .byte $00
    ;init status
    .byte $00
    ;flags
    .byte ENEMY_FLAGS::UNK
    ;health, subpal, gtile
    ething1 50, 1, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 18, 18, 40, 18
    ;attacks
    .byte $01,$5D,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_MAGIC_SNAIL
    ;exp
    .word 42
    ;money
    .word 28
    ;item drop
    .byte 0
    ;gfx
    .byte ENEMY_GRAPHICS::WOODOH_A_MAGIC_SNAIL

STATS_TITANEES:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK
    ;health, subpal, gtile
    ething1 130, 2, 4
    ;pp, gfx
    ething2 40, 0
    ;offense, finalAction, altitude
    ething3 54, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 58, 80, 60, 10
    ;battle actions
    .byte $44,$44,$44,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_TITANEES
    ;exp
    .word 78
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::STARMAN_A_TITANIAN

STATS_GIEGUE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 35, 3, 1
    ;pp, gfx
    ething2 0, 15
    ;offense, finalAction, altitude
    ething3 15, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 100, 14, 10, 23
    ;battle actions
    .byte $08,$08,$08,$08,$08,$08,$08,$08
    ;name pointer
    .addr ENAME_GIEGUE
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GIEGUE

STATS_EAGLE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 45, 3, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 32, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 44, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 60, 30, 20, 40
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_EAGLE
    ;exp
    .word 36
    ;money
    .word 30
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::FUGITIVE_A_EAGLE

STATS_WOLF:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 50, 1, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 30, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 46, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 30, 30, 30, 30
    ;battle actions
    .byte $03,$03,$03,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_WOLF
    ;exp
    .word 34
    ;money
    .word 31
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ULLRICH_A_DOG

STATS_SEAGULL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 90, 3, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 68, 0, 1
    ;defense, messageDefeat, unkParam
    ething4 90, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 70, 40, 20, 20
    ;battle actions
    .byte $4B,$4C,$01,$53,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_SEAGULL
    ;exp
    .word 100
    ;money
    .word 44
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TEDDY_A_SEAGULL

STATS_ALLIGATOR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 30, 0, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 18, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 22, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 10, 15, 10, 15, 5
    ;battle actions
    .byte $5D,$5D,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ALLIGATOR
    ;exp
    .word 21
    ;money
    .word 18
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BARBOT_A_CROCODILE

STATS_ENERGYROBOT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 80, 0, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 60, 1, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 20, 40, 100, 100
    ;battle actions
    .byte $53,$2E,$2E,$2E,$2E,$01,$01,$01
    ;name pointer
    .addr ENAME_ENERGYROBOT
    ;exp
    .word 202
    ;money
    .word 70
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_THE_FISH:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE
    ;health, subpal, gtile
    ething1 65, 2, 5
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 38, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 60, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 45, 30, 20, 40, 40
    ;battle actions
    .byte $02,$02,$02,$02,$02,$02,$02,$02
    ;name pointer
    .addr ENAME_THE_FISH
    ;exp
    .word 140
    ;money
    .word 180
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::FISH_A_CAR

STATS_FUGITIVE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 60, 1, 5
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 32, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 45, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 22, 6, 18, 8
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_FUGITIVE
    ;exp
    .word 60
    ;money
    .word 350
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::FUGITIVE_A_EAGLE

STATS_BBS_BOSS:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 108, 2, 5
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 57, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 51, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 81, 18, 54, 36
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BBS_BOSS
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TEDDY_A_SEAGULL

STATS_BARBOT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 60, 0, 5
    ;pp, gfx
    ething2 40, 0
    ;offense, finalAction, altitude
    ething3 24, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 36, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 35, 35, 100, 100
    ;battle actions
    .byte $01,$01,$01,$15,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BARBOT
    ;exp
    .word 32
    ;money
    .word 45
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BARBOT_A_CROCODILE

STATS_NANCY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 120, 0, 5
    ;pp, gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 62, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 170, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 72, 60, 100, 100
    ;battle actions
    .byte $6B,$01,$36,$0F,$6B,$01,$01,$01
    ;name pointer
    .addr ENAME_NANCY
    ;exp
    .word 68
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::NANCY_A_GORILLA

STATS_STARMAN:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 80, 0, 5
    ;pp, gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 45, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 80, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 40, 60, 40, 35
    ;battle actions
    .byte $12,$12,$38,$01,$01,$53,$53,$15
    ;name pointer
    .addr ENAME_STARMAN
    ;exp
    .word 165
    ;money
    .word 68
    ;item
    .byte $49
    ;graphic
    .byte ENEMY_GRAPHICS::STARMAN_A_TITANIAN

STATS_ULLRICH:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_THUNDER
    ;health, subpal, gtile
    ething1 40, 2, 5
    ;pp, gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 18, 0, 1
    ;defense, messageDefeat, unkParam
    ething4 40, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 30, 30, 10, 20
    ;battle actions
    .byte $17,$17,$17,$17,$17,$17,$17,$17
    ;name pointer
    .addr ENAME_ULLRICH
    ;exp
    .word 65
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ULLRICH_A_DOG

STATS_CEREBRUM:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 200, 1, 5
    ;pp, gfx
    ething2 180, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 280, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 120, 120, 80, 100, 100
    ;battle actions
    .byte $12,$13,$82,$0A,$36,$30,$38,$18
    ;name pointer
    .addr ENAME_CEREBRUM
    ;exp
    .word 89
    ;money
    .word 80
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::CEREBRUM_A_PILLOW_A_DOLL_A_LAMP

STATS_MOOK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP
    ;health, subpal, gtile
    ething1 85, 0, 5
    ;pp, gfx
    ething2 80, 0
    ;offense, finalAction, altitude
    ething3 50, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 110, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 40, 100, 30, 30
    ;battle actions
    .byte $0C,$0D,$42,$29,$1D,$31,$44,$45
    ;name pointer
    .addr ENAME_MOOK
    ;exp
    .word 166
    ;money
    .word 42
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::MOOK_A_SHROUDLEY

STATS_ARMOR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 120, 0, 5
    ;pp, gfx
    ething2 100, 10
    ;offense, finalAction, altitude
    ething3 68, 4, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 60, 50, 100, 100
    ;battle actions
    .byte $01,$18,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ARMOR
    ;exp
    .word 200
    ;money
    .word 300
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ARMOR_A_TEDDY

STATS_WOODOH:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 40, 0, 5
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 38, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 25, 30, 40, 20
    ;battle actions
    .byte $4A,$4A,$4A,$62,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_WOODOH
    ;exp
    .word 40
    ;money
    .word 38
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::WOODOH_A_MAGIC_SNAIL

STATS_WALLY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 20, 2, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 8, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 12, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 6, 4, 1, 1, 2
    ;battle actions
    .byte $28,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_WALLY
    ;exp
    .word 5
    ;money
    .word 20
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HIPPIE_A_WALLY_A_FIREBALL

STATS_THE_HIPPIE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 25, 0, 7
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 8, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 14, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 3, 6, 1, 1, 3
    ;battle actions
    .byte $3C,$50,$28,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_THE_HIPPIE
    ;exp
    .word 6
    ;money
    .word 35
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HIPPIE_A_WALLY_A_FIREBALL

STATS_BAG_LADY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 90, 1, 7
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 12, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 38, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 40, 30, 30, 10
    ;battle actions
    .byte $02,$02,$02,$22,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BAG_LADY
    ;exp
    .word 63
    ;money
    .word 150
    ;item
    .byte $3F
    ;graphic
    .byte ENEMY_GRAPHICS::BAGLADY_A_CENTIPEDE_A_GHOST

STATS_BB_GANG:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 80, 3, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 125, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 40, 20, 20, 20
    ;battle actions
    .byte $23,$23,$02,$02,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BB_GANG
    ;exp
    .word 72
    ;money
    .word 60
    ;item
    .byte $22
    ;graphic
    .byte ENEMY_GRAPHICS::DUSTBALL_A_BBGANG_A_BOMBER

STATS_DR_DISTORTO:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 60, 1, 7
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 38, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 48, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 45, 30, 30, 30
    ;battle actions
    .byte $48,$28,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_DR_DISTORTO
    ;exp
    .word 45
    ;money
    .word 40
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DRDISTORTO_A_BETADOLL_A_ROPE

STATS_UNKENEMY1:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 12, 1, 8
    ;pp, gfx
    ething2 106, 0
    ;offense, finalAction, altitude
    ething3 13, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 13, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 9, 9, 2, 6, 4
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY1
.else
.word ENAME_GANG_ZOMBIE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DRDISTORTO_A_BETADOLL_A_ROPE

STATS_GANG_ZOMBIE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 34, 1, 7
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 18, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 8, 8, 5, 40, 5
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_GANG_ZOMBIE
    ;exp
    .word 12
    ;money
    .word 32
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_PSEUDOZOMBI:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 30, 1, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 16, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 16, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 10, 12, 5, 40, 7
    ;battle actions
    .byte $04,$03,$05,$04,$03,$05,$04,$03
    ;name pointer
    .addr ENAME_PSEUDOZOMBI
    ;exp
    .word 8
    ;money
    .word 12
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_CROW:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 22, 2, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 8, 0, 1
    ;defense, messageDefeat, unkParam
    ething4 12, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 8, 12, 1, 5, 10
    ;battle actions
    .byte $4B,$4C,$4C,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_CROW
    ;exp
    .word 3
    ;money
    .word 4
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HYENA_A_CROW_A_RAT

STATS_SNAKE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 18, 1, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 6, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 8, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 5, 10, 1, 10, 1
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_SNAKE
    ;exp
    .word 2
    ;money
    .word 8
    ;item
    .byte $3E
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_HYENA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 30, 0, 9
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 10, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 16, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 10, 22, 18, 10, 5
    ;battle actions
    .byte $4F,$4F,$4F,$48,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_HYENA
    ;exp
    .word 12
    ;money
    .word 20
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HYENA_A_CROW_A_RAT

STATS_COUGAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 42, 3, 9
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 28, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 40, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 35, 78, 30, 20, 20
    ;battle actions
    .byte $04,$04,$04,$04,$04,$04,$04,$04
    ;name pointer
    .addr ENAME_COUGAR
    ;exp
    .word 32
    ;money
    .word 25
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_CENTIPEDE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 12, 1, 8
    ;pp, gfx
    ething2 0, 9
    ;offense, finalAction, altitude
    ething3 4, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 12, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 3, 17, 40, 20, 1
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_CENTIPEDE
    ;exp
    .word 1
    ;money
    .word 1
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BAGLADY_A_CENTIPEDE_A_GHOST

STATS_DUST_BALL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 78, 1, 9
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 40, 2, 0
    ;defense, messageDefeat, unkParam
    ething4 120, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 50, 50, 60, 20
    ;battle actions
    .byte $4F,$4F,$4F,$4F,$4F,$4F,$4F,$4F
    ;name pointer
    .addr ENAME_DUST_BALL
    ;exp
    .word 80
    ;money
    .word 100
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::DUSTBALL_A_BBGANG_A_BOMBER

STATS_FLY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 10, 0, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 1, 0, 4
    ;defense, messageDefeat, unkParam
    ething4 40, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 32, 40, 10, 1, 40
    ;battle actions
    .byte $49,$49,$49,$01,$48,$01,$01,$01
    ;name pointer
    .addr ENAME_FLY
    ;exp
    .word 1
    ;money
    .word 1
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BEAR_A_FLY

STATS_SPIDER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 80, 2, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 45, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 95, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 80, 80, 60, 15
    ;battle actions
    .byte $49,$3D,$3D,$49,$49,$01,$01,$23
    ;name pointer
    .addr ENAME_SPIDER
    ;exp
    .word 48
    ;money
    .word 40
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GABILAN_A_SPIDER

STATS_SCORPION:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 75, 1, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 80, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 60, 80, 60, 15
    ;battle actions
    .byte $3D,$3D,$3D,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_SCORPION
    ;exp
    .word 50
    ;money
    .word 36
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_ROPE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 80, 3, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 50, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 30, 5, 80, 80
    ;battle actions
    .byte $47,$47,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ROPE
    ;exp
    .word 48
    ;money
    .word 80
    ;item
    .byte $28
    ;graphic
    .byte ENEMY_GRAPHICS::DRDISTORTO_A_BETADOLL_A_ROPE

STATS_FIRE_BALL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 58, 3, 10
    ;pp, gfx
    ething2 50, 8
    ;offense, finalAction, altitude
    ething3 24, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 58, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 35, 40, 30, 50, 30
    ;battle actions
    .byte $09,$09,$09,$09,$09,$09,$09,$09
    ;name pointer
    .addr ENAME_FIRE_BALL
    ;exp
    .word 61
    ;money
    .word 35
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HIPPIE_A_WALLY_A_FIREBALL

STATS_WATCHER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 30, 1, 14
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 16, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 24, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 30, 20, 20, 20
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_WATCHER
    ;exp
    .word 30
    ;money
    .word 20
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_GROUCHO:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 35, 1, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 12, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 40, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 20, 20, 20, 20
    ;battle actions
    .byte $51,$51,$51,$51,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_GROUCHO
    ;exp
    .word 3
    ;money
    .word 12
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TRUCK_A_GROUCHO

STATS_GHOST:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 20, 1, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 12, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 24, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 6, 22, 5, 40, 15
    ;battle actions
    .byte $48,$48,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_GHOST
    ;exp
    .word 5
    ;money
    .word 10
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BAGLADY_A_CENTIPEDE_A_GHOST

STATS_LIL_SAUCER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 32, 1, 10
    ;pp, gfx
    ething2 20, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 4
    ;defense, messageDefeat, unkParam
    ething4 30, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 15, 20, 18, 100, 100
    ;battle actions
    .byte $01,$36,$01,$01,$38,$01,$01,$01
    ;name pointer
    .addr ENAME_LIL_SAUCER
    ;exp
    .word 30
    ;money
    .word 22
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_MR_BAT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 20, 3, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 8, 0, 4
    ;defense, messageDefeat, unkParam
    ething4 10, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 8, 5, 5, 4, 8
    ;battle actions
    .byte $54,$54,$54,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_MR_BAT
    ;exp
    .word 4
    ;money
    .word 7
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GARGOYLE_A_BAT

STATS_STARMAN_JR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 52, 0, 10
    ;pp, gfx
    ething2 16, 0
    ;offense, finalAction, altitude
    ething3 32, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 52, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 35, 20, 18, 30, 30
    ;battle actions
    .byte $12,$12,$15,$01,$01,$01,$01,$53
    ;name pointer
    .addr ENAME_STARMAN_JR
    ;exp
    .word 30
    ;money
    .word 5
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_SKUNK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 2, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 26, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 48, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 52, 30, 30, 20, 20
    ;battle actions
    .byte $01,$01,$01,$01,$46,$01,$01,$01
    ;name pointer
    .addr ENAME_SKUNK
    ;exp
    .word 32
    ;money
    .word 32
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TIGER_A_SKUNK

STATS_SHROUDLEY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 90, 2, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 42, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 128, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 35, 55, 70, 10
    ;battle actions
    .byte $34,$34,$07,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_SHROUDLEY
    ;exp
    .word 58
    ;money
    .word 34
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::MOOK_A_SHROUDLEY

STATS_RAT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 10, 2, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 4, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 8, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 6, 5, 1, 3, 7
    ;battle actions
    .byte $23,$23,$23,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_RAT
    ;exp
    .word 3
    ;money
    .word 2
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::HYENA_A_CROW_A_RAT

STATS_BOMBER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 60, 1, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 10, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 64, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 35, 30, 100, 100
    ;battle actions
    .byte $46,$46,$46,$10,$10,$01,$01,$01
    ;name pointer
    .addr ENAME_BOMBER
    ;exp
    .word 56
    ;money
    .word 32
    ;item
    .byte $23
    ;graphic
    .byte ENEMY_GRAPHICS::DUSTBALL_A_BBGANG_A_BOMBER

STATS_UNKENEMY2:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 4, 0, 11
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 3, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 5, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 1, 5, 3, 3, 3
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY2
.else
.word ENAME_DOLL
.endif
    ;exp
    .word 1
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::CEREBRUM_A_PILLOW_A_DOLL_A_LAMP

STATS_DOLL:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 12, 1, 12
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 4, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 5, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 3, 5, 1, 1, 1
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_DOLL
    ;exp
    .word 10
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::CEREBRUM_A_PILLOW_A_DOLL_A_LAMP

STATS_LAMP:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 6, 1, 13
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 3, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 5, 5, 0
    ;fight, speed, wisdom, strength, force
    .byte 1, 5, 3, 3, 3
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_LAMP
    ;exp
    .word 1
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::CEREBRUM_A_PILLOW_A_DOLL_A_LAMP

STATS_UNKENEMY3:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY3
.else
.word ENAME_BIONICCENTI
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_UNKENEMY4:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY4
.else
.word ENAME_BIONICCENTI
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_BIONICCENTI:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 35, 2, 8
    ;pp, gfx
    ething2 0, 9
    ;offense, finalAction, altitude
    ething3 16, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 32, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 15, 28, 60, 30, 30
    ;battle actions
    .byte $01,$3D,$3D,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BIONICCENTI
    ;exp
    .word 18
    ;money
    .word 14
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BAGLADY_A_CENTIPEDE_A_GHOST

STATS_BIONICSCORP:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 100, 2, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 70, 80, 60, 60
    ;battle actions
    .byte $3D,$3E,$3D,$3E,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BIONICSCORP
    ;exp
    .word 61
    ;money
    .word 56
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_UNKENEMY5:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY5
.else
.word ENAME_RED_SNAKE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_UNKENEMY6:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY6
.else
.word ENAME_RED_SNAKE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_RED_SNAKE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 150, 1, 8
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 50, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 160, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 90, 100, 60, 60, 40
    ;battle actions
    .byte $48,$48,$48,$48,$48,$48,$01,$01
    ;name pointer
    .addr ENAME_RED_SNAKE
    ;exp
    .word 500
    ;money
    .word 330
    ;item
    .byte $2F
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_LONE_WOLF:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 80, 2, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 60, 30, 30, 60
    ;battle actions
    .byte $03,$03,$03,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_LONE_WOLF
    ;exp
    .word 100
    ;money
    .word 41
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ULLRICH_A_DOG

STATS_POLAR_BEAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 100, 1, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 52, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 180, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 40, 30, 40, 30
    ;battle actions
    .byte $01,$01,$01,$04,$05,$4F,$01,$01
    ;name pointer
    .addr ENAME_POLAR_BEAR
    ;exp
    .word 160
    ;money
    .word 50
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BEAR_A_FLY

STATS_UNKENEMY7:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 70, 0, 10
    ;pp, gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 65, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 60, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 55, 45, 30, 30, 45
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY7
.else
.word ENAME_RATTLESNAKE
.endif
    ;exp
    .word 96
    ;money
    .word 37
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_UNKENEMY8:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 70, 0, 10
    ;pp, gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 55, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 55, 40, 40, 60
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY8
.else
.word ENAME_RATTLESNAKE
.endif
    ;exp
    .word 98
    ;money
    .word 34
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_UNKENEMY9:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 95, 0, 0
    ;pp, gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 70, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 50, 30, 30, 40
    ;battle actions
    .byte $37,$3D,$3D,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY9
.else
.word ENAME_RATTLESNAKE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_UNKENEMYA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYA
.else
.word ENAME_RATTLESNAKE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_RATTLESNAKE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::UNK
    ;health, subpal, gtile
    ething1 100, 2, 8
    ;pp, gfx
    ething2 0, 11
    ;offense, finalAction, altitude
    ething3 65, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 128, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 80, 80, 60, 20
    ;battle actions
    .byte $5D,$5D,$5D,$07,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_RATTLESNAKE
    ;exp
    .word 57
    ;money
    .word 54
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::COUGAR_A_SNAKE_A_SCORPION

STATS_TARANTULA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::SPRAYS
    ;health, subpal, gtile
    ething1 120, 1, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 84, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 160, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 70, 80, 80, 60, 15
    ;battle actions
    .byte $49,$49,$3D,$3D,$3D,$3D,$01,$01
    ;name pointer
    .addr ENAME_TARANTULA
    ;exp
    .word 205
    ;money
    .word 85
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GABILAN_A_SPIDER

STATS_CROCODILE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 120, 1, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 80, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 30, 40, 80, 20
    ;battle actions
    .byte $5D,$5D,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_CROCODILE
    ;exp
    .word 172
    ;money
    .word 88
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BARBOT_A_CROCODILE

STATS_UNKENEMYB:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 90, 0, 10
    ;pp, gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 70, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 60, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 80, 80, 80, 80
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYB
.else
.word ENAME_BUFFALO
.endif
    ;exp
    .word 78
    ;money
    .word 36
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_BUFFALO:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 150, 0, 3
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 68, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 43, 40, 40, 20
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_BUFFALO
    ;exp
    .word 103
    ;money
    .word 95
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_UNKENEMYC:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYC
.else
.word ENAME_BIONIC_BAT
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_BIONIC_BAT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 50, 0, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 34, 0, 4
    ;defense, messageDefeat, unkParam
    ething4 64, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 35, 50, 60, 30
    ;battle actions
    .byte $49,$49,$54,$54,$01,$01,$01,$3E
    ;name pointer
    .addr ENAME_BIONIC_BAT
    ;exp
    .word 40
    ;money
    .word 34
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GARGOYLE_A_BAT

STATS_STRAY_DOG:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 16, 3, 4
    ;pp, gfx
    ething2 0, 12
    ;offense, finalAction, altitude
    ething3 8, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 10, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 8, 12, 2, 5, 8
    ;battle actions
    .byte $03,$03,$03,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_STRAY_DOG
    ;exp
    .word 4
    ;money
    .word 10
    ;item
    .byte $1B
    ;graphic
    .byte ENEMY_GRAPHICS::ULLRICH_A_DOG

STATS_PSYCHO_CAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 40, 1, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 18, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 40, 6, 0
    ;fight, speed, wisdom, strength, force
    .byte 45, 40, 35, 100, 100
    ;battle actions
    .byte $06,$32,$06,$06,$06,$06,$06,$06
    ;name pointer
    .addr ENAME_PSYCHO_CAR
    ;exp
    .word 61
    ;money
    .word 45
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::FISH_A_CAR

STATS_PSYCHOTRUCK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 58, 1, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 20, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 40, 6, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 32, 35, 100, 100
    ;battle actions
    .byte $06,$06,$32,$32,$06,$06,$06,$32
    ;name pointer
    .addr ENAME_PSYCHOTRUCK
    ;exp
    .word 34
    ;money
    .word 27
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TRUCK_A_GROUCHO

STATS_MANIACTRUCK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 80, 3, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 34, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 48, 6, 0
    ;fight, speed, wisdom, strength, force
    .byte 45, 35, 35, 100, 100
    ;battle actions
    .byte $32,$32,$06,$06,$32,$06,$06,$32
    ;name pointer
    .addr ENAME_MANIACTRUCK
    ;exp
    .word 75
    ;money
    .word 58
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::TRUCK_A_GROUCHO

STATS_ALARM_GHOST:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 100, 3, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 30, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 160, 7, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 90, 50, 60, 30
    ;battle actions
    .byte $49,$49,$49,$49,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ALARM_GHOST
    ;exp
    .word 80
    ;money
    .word 27
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BAGLADY_A_CENTIPEDE_A_GHOST

STATS_UNKENEMYD:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYD
.else
.word ENAME_FOUREYES
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_FOUREYES:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 1, 15
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 22, 0, 1
    ;defense, messageDefeat, unkParam
    ething4 32, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 40, 20, 20, 20
    ;battle actions
    .byte $5D,$5D,$5D,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_FOUREYES
    ;exp
    .word 32
    ;money
    .word 26
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_DADSEYES:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 1, 14
    ;pp, gfx
    ething2 0, 1
    ;offense, finalAction, altitude
    ething3 20, 0, 1
    ;defense, messageDefeat, unkParam
    ething4 32, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 20, 20, 20, 20
    ;battle actions
    .byte $28,$28,$28,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_DADSEYES
    ;exp
    .word 35
    ;money
    .word 53
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_MOMSEYES:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 40, 1, 14
    ;pp, gfx
    ething2 0, 2
    ;offense, finalAction, altitude
    ething3 24, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 20, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 50, 20, 20, 20
    ;battle actions
    .byte $02,$02,$02,$02,$02,$02,$02,$02
    ;name pointer
    .addr ENAME_MOMSEYES
    ;exp
    .word 35
    ;money
    .word 34
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_UNKENEMYE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 2, 4
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYE
.else
.word ENAME_SKY_YDDET
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ARMOR_A_TEDDY

STATS_UNKENEMYF:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 3, 4
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMYF
.else
.word ENAME_SKY_YDDET
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ARMOR_A_TEDDY

STATS_SKY_YDDET:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 74, 3, 4
    ;pp, gfx
    ething2 0, 16
    ;offense, finalAction, altitude
    ething3 24, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 50, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 30, 20, 50, 20
    ;battle actions
    .byte $4F,$4F,$4F,$4F,$4F,$4F,$07,$07
    ;name pointer
    .addr ENAME_SKY_YDDET
    ;exp
    .word 40
    ;money
    .word 23
    ;item
    .byte $49
    ;graphic
    .byte ENEMY_GRAPHICS::ARMOR_A_TEDDY

STATS_UNKENEMY10:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 3, 2
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY10
.else
.word ENAME_GIGA_BORG
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_GIGA_BORG:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 180, 3, 2
    ;pp, gfx
    ething2 80, 0
    ;offense, finalAction, altitude
    ething3 100, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 180, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 80, 60, 80, 100, 100
    ;battle actions
    .byte $12,$15,$12,$12,$13,$12,$12,$12
    ;name pointer
    .addr ENAME_GIGA_BORG
    ;exp
    .word 98
    ;money
    .word 143
    ;item
    .byte $25
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_OMEGA_BORG:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 230, 2, 2
    ;pp, gfx
    ething2 150, 0
    ;offense, finalAction, altitude
    ething3 150, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 200, 100, 90, 100, 100
    ;battle actions
    .byte $15,$13,$13,$0A,$0A,$83,$01,$0E
    ;name pointer
    .addr ENAME_OMEGA_BORG
    ;exp
    .word 180
    ;money
    .word 205
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_SCRAPPER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 70, 0, 2
    ;pp, gfx
    ething2 30, 7
    ;offense, finalAction, altitude
    ething3 26, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 76, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 25, 20, 20, 100, 100
    ;battle actions
    .byte $53,$53,$01,$01,$01,$12,$12,$12
    ;name pointer
    .addr ENAME_SCRAPPER
    ;exp
    .word 65
    ;money
    .word 38
    ;item
    .byte $25
    ;graphic
    .byte ENEMY_GRAPHICS::ROBOT_A_FOUREYES

STATS_ULTRABARBOT:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 80, 2, 5
    ;pp, gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 54, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 80, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 50, 40, 100, 100
    ;battle actions
    .byte $01,$15,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ULTRABARBOT
    ;exp
    .word 220
    ;money
    .word 87
    ;item
    .byte $26
    ;graphic
    .byte ENEMY_GRAPHICS::BARBOT_A_CROCODILE

STATS_OMEGASAUCER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 65, 1, 10
    ;pp, gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 42, 3, 4
    ;defense, messageDefeat, unkParam
    ething4 50, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 20, 60, 40, 100, 100
    ;battle actions
    .byte $12,$01,$38,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_OMEGASAUCER
    ;exp
    .word 82
    ;money
    .word 57
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BORG_A_UFO

STATS_KELLY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 120, 2, 5
    ;pp, gfx
    ething2 80, 13
    ;offense, finalAction, altitude
    ething3 80, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 150, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 70, 60, 100, 100
    ;battle actions
    .byte $6B,$62,$31,$01,$6B,$01,$01,$01
    ;name pointer
    .addr ENAME_KELLY
    ;exp
    .word 102
    ;money
    .word 88
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::NANCY_A_GORILLA

STATS_STAR_MINER:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 200, 0, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 140, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 200, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 60, 100, 100
    ;battle actions
    .byte $46,$10,$46,$10,$10,$10,$10,$01
    ;name pointer
    .addr ENAME_STAR_MINER
    ;exp
    .word 209
    ;money
    .word 138
    ;item
    .byte $24
    ;graphic
    .byte ENEMY_GRAPHICS::DUSTBALL_A_BBGANG_A_BOMBER

STATS_SUPERENERGY:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 120, 2, 10
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 50, 1, 0
    ;defense, messageDefeat, unkParam
    ething4 120, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 35, 60, 100, 100
    ;battle actions
    .byte $2E,$2E,$2E,$2E,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_SUPERENERGY
    ;exp
    .word 230
    ;money
    .word 260
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BISON_A_ENERGY

STATS_JUANA:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 300, 3, 5
    ;pp, gfx
    ething2 200, 14
    ;offense, finalAction, altitude
    ething3 200, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 250, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 200, 120, 100, 100, 100
    ;battle actions
    .byte $18,$83,$0A,$6B,$0B,$15,$01,$01
    ;name pointer
    .addr ENAME_JUANA
    ;exp
    .word 270
    ;money
    .word 362
    ;item
    .byte $49
    ;graphic
    .byte ENEMY_GRAPHICS::NANCY_A_GORILLA

STATS_BLUESTARMAN:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 100, 2, 5
    ;pp, gfx
    ething2 80, 0
    ;offense, finalAction, altitude
    ething3 74, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 120, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 42, 60, 50, 45
    ;battle actions
    .byte $12,$13,$38,$53,$53,$15,$01,$01
    ;name pointer
    .addr ENAME_BLUESTARMAN
    ;exp
    .word 150
    ;money
    .word 91
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::STARMAN_A_TITANIAN

STATS_ROCKOYLE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP
    ;health, subpal, gtile
    ething1 120, 1, 3
    ;pp, gfx
    ething2 60, 0
    ;offense, finalAction, altitude
    ething3 70, 0, 2
    ;defense, messageDefeat, unkParam
    ething4 150, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 65, 120, 30, 100
    ;battle actions
    .byte $0D,$40,$0E,$0F,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_ROCKOYLE
    ;exp
    .word 162
    ;money
    .word 93
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GARGOYLE_A_BAT

STATS_TITANIAN:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK
    ;health, subpal, gtile
    ething1 320, 3, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 100, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 420, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 70, 200, 80, 25
    ;battle actions
    .byte $62,$62,$62,$01,$01,$01,$01,$3E
    ;name pointer
    .addr ENAME_TITANIAN
    ;exp
    .word 180
    ;money
    .word 130
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::STARMAN_A_TITANIAN

STATS_OH_MOOK:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 160, 1, 5
    ;pp, gfx
    ething2 250, 0
    ;offense, finalAction, altitude
    ething3 60, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 140, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 65, 250, 100, 100
    ;battle actions
    .byte $0A,$0D,$42,$4B,$2B,$1D,$31,$36
    ;name pointer
    .addr ENAME_OH_MOOK
    ;exp
    .word 175
    ;money
    .word 110
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::MOOK_A_SHROUDLEY

STATS_UNKENEMY11:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 180, 0, 0
    ;pp, gfx
    ething2 120, 0
    ;offense, finalAction, altitude
    ething3 35, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 20, 0, 0
    ;fight, speed, wisdom, strength, force
    .byte 50, 5, 5, 45, 30
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
.ifdef VER_JP
.word ENAME_UNKENEMY11
.else
.word ENAME_ZOMBIE
.endif
    ;exp
    .word 0
    ;money
    .word 0
    ;item
    .byte $00
    ;graphic
    .byte 0

STATS_ZOMBIE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 70, 2, 8
    ;pp, gfx
    ething2 50, 0
    ;offense, finalAction, altitude
    ething3 50, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 80, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 45, 48, 80, 60, 15
    ;battle actions
    .byte $42,$42,$42,$4C,$4C,$4C,$4C,$01
    ;name pointer
    .addr ENAME_ZOMBIE
    ;exp
    .word 48
    ;money
    .word 43
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_NASTYZOMBIE:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 90, 2, 7
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 62, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 90, 4, 0
    ;fight, speed, wisdom, strength, force
    .byte 30, 30, 50, 60, 20
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_NASTYZOMBIE
    ;exp
    .word 54
    ;money
    .word 58
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::GANGZOMBIE_A_ZOMBIE_A_STARMANJR

STATS_SILVER_WOLF:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_FREEZE
    ;health, subpal, gtile
    ething1 80, 2, 4
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 44, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 76, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 40, 42, 30, 30, 25
    ;battle actions
    .byte $03,$03,$03,$03,$03,$03,$03,$03
    ;name pointer
    .addr ENAME_SILVER_WOLF
    ;exp
    .word 66
    ;money
    .word 43
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::ULLRICH_A_DOG

STATS_R7037:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::UNK | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 1000, 0, 1
    ;pp, gfx
    ething2 0, 4
    ;offense, finalAction, altitude
    ething3 300, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 600, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 40, 100, 100
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_R7037
    ;exp
    .word 205
    ;money
    .word 71
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::R703

STATS_GRIZZLYBEAR:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 340, 2, 2
    ;pp, gfx
    ething2 0, 0
    ;offense, finalAction, altitude
    ething3 160, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 340, 1, 0
    ;fight, speed, wisdom, strength, force
    .byte 100, 100, 60, 100, 25
    ;battle actions
    .byte $02,$02,$02,$04,$05,$02,$02,$07
    ;name pointer
    .addr ENAME_GRIZZLYBEAR
    ;exp
    .word 250
    ;money
    .word 65
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::BEAR_A_FLY

STATS_R7038XX:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::R_PK_BEAM | ENEMY_FLAGS::R_DEFDOWN_CONFSLEEP | ENEMY_FLAGS::R_PK_THUNDER | ENEMY_FLAGS::R_PK_FREEZE | ENEMY_FLAGS::R_PK_FIRE | ENEMY_FLAGS::GOD
    ;health, subpal, gtile
    ething1 1000, 3, 1
    ;pp, gfx
    ething2 0, 6
    ;offense, finalAction, altitude
    ething3 900, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 1000, 3, 0
    ;fight, speed, wisdom, strength, force
    .byte 60, 60, 60, 100, 100
    ;battle actions
    .byte $01,$01,$01,$01,$01,$01,$01,$01
    ;name pointer
    .addr ENAME_R7038XX
    ;exp
    .word 550
    ;money
    .word 180
    ;item
    .byte $00
    ;graphic
    .byte ENEMY_GRAPHICS::R703

STATS_LASTSTARMAN:
    .byte $0
    ;init status
    .byte $0
    ;flags
    .byte ENEMY_FLAGS::NONE
    ;health, subpal, gtile
    ething1 120, 2, 5
    ;pp, gfx
    ething2 100, 0
    ;offense, finalAction, altitude
    ething3 90, 0, 0
    ;defense, messageDefeat, unkParam
    ething4 140, 2, 0
    ;fight, speed, wisdom, strength, force
    .byte 70, 60, 60, 80, 50
    ;battle actions
    .byte $13,$13,$38,$15,$01,$01,$53,$53
    ;name pointer
    .addr ENAME_LASTSTARMAN
    ;exp
    .word 330
    ;money
    .word 389
    ;item
    .byte $49
    ;graphic
    .byte ENEMY_GRAPHICS::STARMAN_A_TITANIAN
