.macro incbinRange path, start, end
        .incbin path, start, end-start
.endmacro

.macro BankswitchCHR_Address addr
    lda #.LOBYTE(addr)
    ldx #.HIBYTE(addr)
    jsr BankswitchCHRFromTable
.endmacro

.macro LoadPalette_Address addr
    lda #.LOBYTE(addr)
    ldx #.HIBYTE(addr)
    jsr LoadPalette
.endmacro

.enum music
    melodies = 1
    b_flippant = 2
    b_dangerous = 3
    b_hippie = 4
    b_win = 5

    pollyanna = 6
    bein_friends = 7
    yucca_desert = 8
    magicant = 9
    snowman = $a
    mt_itoi = $b
    factory = $c
    ghastly_site = $d ;graveyard
    twinkle_elementary = $e
    humoresque_of_a_little_dog = $f ;shop
    poltergeist = $10
    underground = $11
    home = $12
    approaching_mt_itoi = $13
    paradies_line = $14
    fallin_love = $15
    mother_earth = $16
    tank = $17
    monkey_cave = $18
    queen_marys_song = $19
    wisdom_of_the_world = $1a
    tombstone = $1b
    game_over = $1c
    big_victory = $1d
    airplane = $1e
    level_up = $1f
    recovery = $20
    fanfare = $21
    live_house = $22
    all_that_i_needed_was_you = $23
    melody_1 = $24
    melody_2 = $25
    melody_3 = $26
    melody_4 = $27
    melody_5 = $28
    melody_6 = $29
    melody_7 = $2a
    melody_8 = $2b
    vs_giegue = $2c
    ending_jp = $2d
    zoo = $2e
    phone = $2f
    youngtown = $30
    cave_1 = $31
    unk_song = $32
    mute = $ff
.endenum


.enum NMI_COMMANDS
    SKIP = 0
    NOTHING = 1
    BRANCH = 2
    GOTO = 3
    UPDATE_PALETTE = 4
    PPU_WRITE = 5
    PPU_WRITE_32 = 6
    PPU_WRITE_ADDRS = 7
    PPU_WRITE_BYTE = 8
    PPU_READ = 9
    .ifndef VER_JP
        PPU_READ_TEXT = 10
    .endif
.endenum

.enum NMI_MODE
    ; The NMI handler has run to completion
    FINISHED = 0
    ; The NMI handler has not run yet, and WaitNMI has been called and is waiting for NMI to finish
    WAITING_FOR_NMI = 1
    ; The NMI handler is running, and it has progressed far enough that calling it again should be a no-op to avoid issues
    RUNNING = 1 << 7
.endenum

; items
.struct itemd
    nameptr .addr
    flags .byte
    power .byte
    oa .byte ; overworld action
    ba .byte ; battle action
    cost .word
.endstruct

.struct psid
    nameptr .addr
    nintenLevel .byte
    anaLevel .byte
    oa .byte  ; overworld action
    ba .byte  ; battle action
    not_used .byte
    cost .byte
.endstruct

; Battle Instruction lut
; sound effects
.define SFX_Nothing $00
.define SFX_PlayerAttack $01
.define SFX_Hit $02
.define SFX_Crit $03
.define SFX_Thunder $04
.define SFX_Fire $05
.define SFX_Beam $06
.define SFX_Freeze $07
.define SFX_Bomb $08
.define SFX_StatBoost $09
.define SFX_Recovery $0a
.define SFX_Dodge $0b
.define SFX_DimensionSlip $0c
.define SFX_StatusDelay $0d
.define SFX_MenuBloop $0e
.define SFX_EnemyAttack $0f
.define SFX_TakeDamage $10
.define SFX_Run $11
.define SFX_Status $12
.define SFX_BlindMiss $13
.define SFX_GiegueAttack $14
.define SFX_Unconned $15
