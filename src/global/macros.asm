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
.endenum