wordvar0590 = $0590

; import table ids
; battle action ids
BA_NONE             = $00
BA_BASH             = $01
BA_SING             = $1c
BA_FLAMES           = $19
BA_EXPLODE          = $1a
BA_ENEMY_GUARD      = $53
BA_PLAYER_GUARD     = $59
BA_ASTHMA_SPRAY     = $76
BA_EVEEXPLOSION     = $88
BA_COMPLETE         = $ff   ; true constant
; psi table ids
LIFEUP_ALPHA        = $08
LIFEUP_BETA         = $09
LIFEUP_GAMMA        = $0A
HEALING_BETA        = $11
HEALING_GAMMA       = $12
HEALING_PI          = $13
HEALING_SUPER       = $14
; item table ids
ITEM_BADGE          = $68
; music table ids
MUSIC_WIN           = $5
MUSIC_SING          = $19
MUSIC_BATTLE_GIEGUE = $2c
MUSIC_NONE          = $ff

; zeropage ram variables
; $40 series : battle variables
battle_endtype              = $47
    ENDTYPE_RUN             = $1
    ENDTYPE_DIMENSION_SLIP  = $2
    ENDTYPE_BLUEROBO_SLIP   = $3

; .importzp enemy_group     ; $48

; length 5 ($49 ~ $4D) used to hold battle rewards
battle_reward_vars          = $49

; 16-bit variable typically used for carrying values
battle_input_num            = $4E

; $50 series : byte sized local global variables
battle_bytevar50            = $50
battle_bytevar51            = $51
battle_bytevar52            = $52   ; message counter?
attacker_offset             = $53
target_offset               = $54
battle_bytevar55            = $55
battle_script               = $56
    BSCRIPT_NONE            = $0
    BSCRIPT_TEDDY           = $1
    BSCRIPT_GREYROBO        = $2
    BSCRIPT_REDROBO         = $3
    BSCRIPT_BLUEROBO        = $4
    BSCRIPT_GIEGUE_YAPPING  = $5 ; changes to 6 once Giegue stops yapping
    BSCRIPT_GIEGUE_FIGHTING = $6

battle_bytevar57            = $57
battle_bytevar58            = $58
is_auto                     = $59

battle_var5a                = $5a

; Counts turns starting at 255 and decrementing by 1, draws fight at 0
; BattleScript 1 (Teddy) sets this value to 3
; When BSCRIPT 1 is active, DrawEffect doesnt lag & print msg
turn_counter                = $5b
ptr_chara                   = $5c   ; stores ptr to character's full data (for various purposes)

battle_var5e                = $5e
battle_var5f                = $5f

; $60 series : word sized local variables
; Used for various operations, like holding pointers or 16-bit numbers
; used in more limited and flexible scope
battle_wordvar60            = $60
battle_wordvar62            = $62
battle_wordvar64            = $64
battle_wordvar66            = $66
battle_wordvar68            = $68

; ram registers (non-zeropage)

; $0300 (super scary)
; They seem to be cross-bank & cross-gamestate ram.
bytevar_0300                = $0300
bytevar_0301                = $0301
bytevar_0302                = $0302
bytevar_0303                = $0303
bytevar_0304                = $0304
bytevar_0305                = $0305
bytevar_0306                = $0306
bytevar_0307                = $0307

; $0400 (PPU Address)
; not labeled
; nmi_queue

; $0500 (between banks)
; used to hold information when bankswitching
; battle engine uses max up to 5 bytes (bytevar_0594)
; Calling Bankswitch operations requires 4 bytes from $0590 ~ $0593
bytevar_0590                = $0590
bytevar_0591                = $0591
bytevar_0592                = $0592
bytevar_0593                = $0593
bytevar_0594                = $0594
; for clarity, will use human language "wordvar" when the code is using the RAM address as a word, not a byte
wordvar_0590                = $0590
wordvar_0591                = $0591
wordvar_0592                = $0592


; $0600 battler data in src/global/ram.asm

; Battle Instruction lut
; sound effects
SFX_Nothing         = $00
SFX_PlayerAttack    = $01
SFX_Hit             = $02
SFX_Crit            = $03
SFX_Thunder         = $04
SFX_Fire            = $05
SFX_Beam            = $06
SFX_Freeze          = $07
SFX_Bomb            = $08
SFX_StatBoost       = $09
SFX_Recovery        = $0a
SFX_Dodge           = $0b
SFX_DimensionSlip   = $0c
SFX_StatusDelay     = $0d
SFX_MenuBloop       = $0e
SFX_EnemyAttack     = $0f
SFX_TakeDamage      = $10
SFX_Run             = $11
SFX_Status          = $12
SFX_BlindMiss       = $13
SFX_GiegueAttack    = $14
SFX_Unconned        = $15


;yeah
.segment        "PRG17": absolute

BattleMain:
    ;clear values
    lda #0
    sta pad1_forced
    sta pad2_forced
    sta battle_bytevar52
    sta is_auto
    sta battle_reward_vars          ; first 3 bytes for exps
    sta battle_reward_vars+1
    sta battle_reward_vars+2
    sta battle_reward_vars+3        ; last 2 for money
    sta battle_reward_vars+4
    ;x = 0
    tax
    @clear_loop:
    sta BATTLER, x
    inx
    bne @clear_loop

    ldx #$1f
    @clear_loop2:
    sta BATTLER_1BASED, x
    dex
    bpl @clear_loop2

    lda #0
    sta attacker_offset

    ldx #0
@InitPlayerBattler: ; loop thru all party members to init data
    txa
    pha
    lda party_members, x
    beq @EmptyPlayer
    jsr InitializePlayerBattler
    clc
    lda attacker_offset
    adc #BATTLER_DATASIZE
    sta attacker_offset
; skip init if party member ID is 0 (empty)
@EmptyPlayer:
    pla
    tax
    inx
    cpx #$04 ; loop thru party members 4 times
    bne @InitPlayerBattler
    ; init enemies
    jsr GetEnemyGroupPointer
    lda #BATTLER_DATASIZE * 4
    sta attacker_offset
    ldy #$00
@EnemyInitStart:
    lda (ptr_chara), y
    sta battle_wordvar60
    iny
    lda (ptr_chara), y
    sta battle_wordvar60+1
    iny
    tya
    pha
    lda battle_wordvar60
    cmp #$ff
    beq @EmptyEnemy
    jsr CopyEnemy
; skip init if enemy ID is FF (empty)
@EmptyEnemy:
    clc
    lda attacker_offset
    adc #BATTLER_DATASIZE
    sta attacker_offset
    pla
    tay
    cpy #$08                            ; there are 8 battler slots total (0-3 players, 4-7 enemies)
    bne @EnemyInitStart
    lda (ptr_chara), y
    and #$e0
    ldx #$05
; copy battle script into ram (this is used by bosses Teddy, the Robos, and Giga-Gas himself)
@GetBattleScript:
    lsr a
    dex
    bne @GetBattleScript
    sta battle_script

    lda (ptr_chara), y
    and #$1f
    sta battle_var5a                    ; enemy position
    iny
    lda (ptr_chara), y
    and #$0f
    sta battle_wordvar60
    lda #$00
    ldx #$05
; pulls palette (0-3) from upper 2 bits of enemy's Offense stat
@GetPaletteFromOffense:
    asl battle_wordvar60
    rol a
    dex
    bne @GetPaletteFromOffense
    sta battle_wordvar60+1
    clc

    lda #.LOBYTE(Battle_Palettes)
    adc battle_wordvar60
    sta battle_wordvar60
    lda #.HIBYTE(Battle_Palettes)
    adc battle_wordvar60+1
    sta battle_wordvar60+1
    jsr BANKSWAP_L00
    jsr LoadPaletteFrom

    jsr BANKSWAP_L16
    ldx #.HIBYTE($23c0)
    ldy #.LOBYTE($23c0)
    jsr ClearNametableAttribute
    ldx #.HIBYTE($2bc0)
    ldy #.LOBYTE($2bc0)
    jsr ClearNametableAttribute
    jsr B31_15e5
    lda #0
    sta turn_counter
    lda #$80
    sta attacker_offset
:   ldx attacker_offset         ; --
    lda BATTLER, x
    beq :+
    jsr B23_028a
:   inc turn_counter
    clc
    lda attacker_offset
    adc #BATTLER_DATASIZE
    sta attacker_offset
    bcc :--                     ; --
    ldy #$00
    ldx #$00
:   lda BATTLER_1BASED, y
    iny
    ora BATTLER_1BASED, y
    sta battle_wordvar60
    iny
    lda BATTLER_1BASED, y
    iny
    ora BATTLER_1BASED, y
    asl a
    asl a
    ora battle_wordvar60
    sta battle_wordvar60
    asl a
    asl a
    asl a
    asl a
    ora battle_wordvar60
    sta BATTLER_1BASED, x
    iny
    inx
    cpx #$08
    bne :-
    jsr PpuSync
    lda #$05
    sta nmi_queue
    lda #$10
    sta nmi_queue+1
    ldy #$00
    ldx #$04
:   lda BATTLER_1BASED, y
    sta nmi_queue, x
    sta nmi_queue+8, x
    iny
    inx
    cpy #$08
    bne :-
    lda #$00
    sta nmi_queue+8, x
    lda #$80
    sta $e5
    lda #$23
    sta nmi_queue+2
    lda #$d8
    sta nmi_queue+3
    lda #$00
    sta $e6
    lda #$00
    sta battle_endtype
    sta enemy_group
    ldx #$80
:   txa                     ; --
    pha
    ldy #$04
:   lda BATTLER_CURR_HP+1, x
    and #$03
    sta BATTLER_CURR_HP+1, x
    inx
    inx
    dey
    bne :-
    pla
    clc
    adc #$20
    tax
    bne :--                 ; --
    ldx #$00
; check teddy script
    lda battle_script
    cmp #BSCRIPT_TEDDY
    bne :+                              ; + skip if not
; effects
    ldx #$04                            ; turn counter is set to 4
    lda #$ff                            ; set enemy1 hp to 16-bit max
    sta BATTLER_ENEMY1 + HP_Offset
    sta BATTLER_ENEMY1 + HP_Offset+1
    lda #$00
    sta BATTLER_PLAYER2
    sta BATTLER_PLAYER3
    sta BATTLER_PLAYER4
:   stx turn_counter                    ; +
; check tank
    lda is_tank
    beq :++                             ; if not, branch to check giegue script
; effects
    ldy #$00                            ; set battle script to 0 (in vanilla, the grey robo fight becomes normal)
    sty battle_script
:   lda BATTLER_MINOR_STATUS, y         ; give players barrier
    ora #BARRIER
    sta BATTLER_MINOR_STATUS, y
    tya
    clc
    adc #$20
    tay
    bpl :-
; check giegue script
:   lda battle_script
    cmp #BSCRIPT_GIEGUE_YAPPING
    bne :+
; effects
    lda #$96
    sta battle_bytevar55
    lda BATTLER_SPD                     ; infamous effect where giegue yoinks the player leader's speed stat
    sta BATTLER_SPD+ENEMY1_OFFSET       ; fun fact, his original speed is 69
; end of all bscript checks
:   ldx #20
    jsr WaitXFrames
    jsr B31_174c

; Turn Input main loop
BattleTurnInput:
    lda #$00
    jsr B31_14ce
    jsr BattleTurnEngine
    bcs @BattleTurnInputExit
    ldx #20
    jsr WaitXFrames
    lda #$07
    jsr B31_14ce
    lda #$00
    sta battle_bytevar52
    jsr B31_0cff
    jsr B31_1765
    jsr SubroutinePlayerTurnInput
    jsr B31_1760
    lda #$03
    jsr B31_14ce
    jsr B31_0cfc
    jmp BattleTurnInput

@BattleTurnInputExit:
    jsr B31_1759
    lda #0
    sta pad1_forced
    sta pad2_forced
    rts

InitializePlayerBattler:
    sta battle_wordvar62
    tax
    lda #.LOBYTE(party_data-$40)
    sta battle_wordvar60
    lda #.HIBYTE(party_data-$40)
    sta battle_wordvar60+1
:   clc
    lda battle_wordvar60
    adc #$40
    sta battle_wordvar60
    lda battle_wordvar60+1
    adc #$00
    sta battle_wordvar60+1
    dex
    bne :-
    ldy #$01
    ldx attacker_offset
:   lda (battle_wordvar60), y
    sta BATTLER_STATUS, x
    iny
    inx
    cpy #$10
    bne :-
    ldy #$14
    ldx attacker_offset
:   lda (battle_wordvar60), y
    sta BATTLER_CURR_HP, x
    inx
    iny
    cpy #$18
    bne :-
    ldx attacker_offset
    lda #$ff
    sta BATTLER, x
    lda battle_wordvar62
    sta BATTLER_PLAYER_ID, x
    lda battle_wordvar60
    sta BATTLER_FULLDATA_PTR, x
    lda battle_wordvar60+1
    sta BATTLER_FULLDATA_PTR+1, x
    rts

; wip: undocumented / unclean
CopyEnemy:
    ldx attacker_offset
    lda battle_wordvar60+1
    asl a
    asl a
    sta BATTLER_LETTER, x
    lda battle_wordvar60
    sta battle_wordvar62
    lda #$00
    ldx #$05
    B23_023e:
    asl battle_wordvar62
    rol a
    dex
    bne B23_023e
    sta battle_wordvar62+1
    clc
    lda #$00
    adc battle_wordvar62
    sta battle_wordvar62
    lda #$80
    adc battle_wordvar62+1
    sta battle_wordvar62+1
    ldy #$01
    ldx attacker_offset
    B23_0257:
    lda (battle_wordvar62), y
    sta BATTLER_STATUS, x
    iny
    inx
    cpy #$18
    bne B23_0257
    ldx attacker_offset
    ldy enemy_group
    iny
    tya
    sta BATTLER, x
    lda battle_wordvar62
    sta BATTLER_FULLDATA_PTR, x
    lda battle_wordvar62+1
    sta BATTLER_FULLDATA_PTR+1, x
    ldy #$5e
    lda battle_wordvar60+1
    bpl B23_0285
    lda BATTLER_MINOR_STATUS, x
    ora #CALLABLE
    sta BATTLER_MINOR_STATUS, x
    ldy #$00
    B23_0285:
    tya
    sta BATTLER_ACTION_ID, x
    rts

; wip: undocumented / unclean
; some battle init function
B23_028a:
    lda BATTLER_MINOR_STATUS, x
    and #CALLABLE
    beq B23_0296
    lda #$00
    sta BATTLER, x
    B23_0296:
    lda BATTLER_LETTER, x
    ora turn_counter
    sta BATTLER_LETTER, x
    lda BATTLER_CURR_HP+1, x
    and #$f0
    lsr a
    lsr a
    lsr a
    tay
    lda ENEMY_TILE_POINTERS, y
    sta battle_wordvar60
    lda ENEMY_TILE_POINTERS+1, y
    sta battle_wordvar60+1
    lda BATTLER_OFF+1, x
    and #$e0
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    sta battle_wordvar66
    ldy #$00
    lda (battle_wordvar60), y
    sta battle_wordvar62
    iny
    lda (battle_wordvar60), y
    sta battle_wordvar62+1
    iny
    sec
    lda (battle_wordvar60), y
    sbc battle_wordvar66
    tay
    iny
    lda #$e0
    B23_02d2:
    clc
    adc #$20
    dey
    bne B23_02d2
    sta battle_wordvar64
    lda battle_var5a
    asl a
    asl a
    adc turn_counter
    tay
    lda battle_positionings, y
    sta battle_wordvar64+1
    lda BATTLER_CURR_HP+1, x
    and #$0c
    lsr a
    lsr a
    ldy battle_wordvar64+1
    ldx #$00
    B23_02f1:
    sta BATTLER_1BASED, y
    iny
    inx
    cpx battle_wordvar62+1
    bne B23_02f1
    clc
    lda battle_wordvar64+1
    adc battle_wordvar64
    adc #$80
    sta battle_wordvar64
    lda #$00
    adc #$21
    sta battle_wordvar64+1
    lda battle_wordvar64
    and #$e0
    sta battle_wordvar68
    lda battle_wordvar64+1
    and #$03
    lsr a
    ror battle_wordvar68
    lsr a
    ror battle_wordvar68
    sec
    lda battle_wordvar68
    sbc #$19
    sta battle_wordvar68
    lda battle_wordvar64
    asl a
    asl a
    asl a
    sec
    sbc #$10
    sta battle_wordvar68+1
    ldx turn_counter
    inx
    lda #$c0
    B23_032f:
    clc
    adc #$40
    dex
    bne B23_032f
    sta battle_wordvar66
    ldy #$02
    B23_0339:
    jsr PpuSync
    ldx #$00
    lda #$05
    sta nmi_queue, x ; TODO: NMI command
    inx
    lda battle_wordvar62+1
    sta nmi_queue, x
    sta battle_wordvar66+1
    inx
    lda battle_wordvar64+1
    sta nmi_queue, x
    inx
    lda battle_wordvar64
    sta nmi_queue, x
    B23_0357:
    iny
    lda (battle_wordvar60), y
    clc
    adc battle_wordvar66
    inx
    sta nmi_queue, x
    dec battle_wordvar66+1
    bne B23_0357
    lda #$00
    inx
    sta nmi_queue, x
    clc
    lda battle_wordvar64
    adc #$20
    sta battle_wordvar64
    lda battle_wordvar64+1
    adc #$00
    sta battle_wordvar64+1
    lda #$00
    sta $e6
    lda #$80
    sta $e5
    dec battle_wordvar62
    bne B23_0339
    ldx attacker_offset
    lda BATTLER_CURR_PP+1, x
    and #$fc
    beq B23_03d1
    lsr a
    lsr a
    sta battle_wordvar60
    asl a
    adc battle_wordvar60
    clc
    adc #.LOBYTE(battle_extra_tiles)
    sta battle_wordvar60
    lda #$00
    adc #.HIBYTE(battle_extra_tiles)
    sta battle_wordvar60+1
    ldy #$00
    lda (battle_wordvar60), y
    sta BATTLER_TARGET, x
    lda turn_counter
    asl a
    asl a
    asl a
    tax
    lda #$00
    sta bytevar_0300, x
    sta bytevar_0301, x
    sta bytevar_0304, x
    sta bytevar_0305, x
    lda battle_wordvar68+1
    sta bytevar_0302, x
    lda battle_wordvar68
    sta bytevar_0303, x

    ;enemy extra tile pointer -> [$306]
    ldy #1
    lda (battle_wordvar60), y
    sta bytevar_0306, x
    iny
    lda (battle_wordvar60), y
    sta bytevar_0307, x

    B23_03d1:
    rts

; Fill 64 bytes at PPU address in YX with 0xFF
ClearNametableAttribute:
    jsr PpuSync
    stx nmi_queue+2
    sty nmi_queue+3
    lda #$08
    sta nmi_queue ; PPU_FILL
    lda #$40
    sta nmi_queue+1 ; Fill 64 bytes
    lda #$ff
    sta nmi_queue+4 ; With $FF
    lda #$00
    sta nmi_queue+5 ; END
    lda #$80
    sta $e5
    lda #$00
    sta $e6
    rts


DisplayText_battle:
    cmp #$00
    beq DisplayText_RTS
    pha
    jsr B23_04bb
    jsr BANKSWAP_L00
    pla

    .ifndef VER_JP
    cmp #$ff
    bne B23_042d
    sec

    ;get ram pointer - $8000
    ldy target_offset
    lda BATTLER_FULLDATA_PTR, y
    sbc #.LOBYTE($8000)
    sta tilepack_ptr
    lda BATTLER_FULLDATA_PTR+1, y
    sbc #.HIBYTE($8000)

    ;ram pointer << 3
    asl tilepack_ptr
    rol a
    asl tilepack_ptr
    rol a
    asl tilepack_ptr
    rol a
    ;by this point, it basically discards the lower half

    clc

    ;lo = hi + 20
    adc #20
    sta tilepack_ptr

    ;a = 5 + carry
    lda #0
    adc #5
    sta tilepack_ptr-1

    bcc PrintChar
    B23_042d:
    .endif

    ldy #$00
    sty battle_wordvar60+1
    asl a
    rol battle_wordvar60+1
    clc
    adc #.LOBYTE(Battle_Text)
    sta battle_wordvar60
    lda battle_wordvar60+1
    .ifdef VER_JP
    adc #$87
    .else
    adc #$90
    .endif
    sta battle_wordvar60+1
    ldy #$00
    lda (battle_wordvar60), y
    .ifdef VER_JP
    sta UNK_50
    iny
    lda (battle_wordvar60),y
    sta UNK_50+1
    .else
    sta tilepack_ptr
    iny
    lda (battle_wordvar60), y
    sta UNK_73
    .endif
    PrintChar: ; assumed function
    .ifdef VER_JP
    lda battle_bytevar52
    cmp #$03
    bne :+
    ldx #$ca
    jsr B23_04cc
    ldx #$94
    jsr B23_04bf
    ldx #$5e
    jsr B23_04bf
    jsr PpuSync
    lda #$06
    jsr B31_14ce
    jsr BANKSWAP_L00
    ldx #$94
    jsr B23_04bf
    ldx #$5e
    jsr B23_04bf
    jsr PpuSync
    lda #$05
    jsr B31_14ce
    jsr BANKSWAP_L00
    .else
    jsr GetTextData
    lda tilepack_ptr
    sta battle_bytevar50
    lda tilepack_ptr+1
    sta battle_bytevar51
    lda battle_bytevar52
    cmp #$03
    bne :+
    ldx #$03
    jsr DELAY_PRINT_SCROLL
    .endif
    dec battle_bytevar52
:   jsr B23_0479
    cmp #$02
    beq :+
    inc battle_bytevar52
    cmp #$00
    .ifdef VER_JP
    beq :+
    lda tilepack_ptr
    sta battle_bytevar50
    lda tilepack_ptr+1
    sta battle_bytevar51
    jmp PrintChar
    .else
    bne PrintChar
    .endif
:   jsr BANKSWAP_L16
    ldx battle_message_speed
    jsr WaitXFrames
    DisplayText_RTS:
    rts

; undocumented / unclean
B23_0479:
    lda battle_bytevar52
    asl a
    adc #$03
    sta $77
    ldy #$00
    lda (battle_bytevar50), y
    cmp #$03
    .ifdef VER_JP
    bne B23_0495
    .else
    bne B23_049d
    .endif
    lda #$0f
    sta $76
    jsr B31_15c2
    inc battle_bytevar50
    bne B23_0495
    inc battle_bytevar51
    B23_0495:
    ldy #$00
    lda (battle_bytevar50), y
    cmp #$02
    beq B23_04ba
    .ifdef VER_JP
    lda #$13
    .else
    B23_049d:
    lda #$16
    .endif
    sta $70
    .ifdef VER_JP
    lda #$07
    .else
    lda #$05
    .endif
    sta $76
    jsr PpuSync
    lda battle_bytevar50
    sta $74
    lda battle_bytevar51
    .ifdef VER_JP
    sta UNK_73
    jsr GetTextData
    .else
    sta $75
    .endif
    jsr PRINT_STRING    ; PrintLine
    lda #$01
    jsr B30_07af
    lda $72
    B23_04ba:
    rts

.ifdef VER_JP
B23_04bf:
    txa
    pha
    jsr B23_04e0
    jsr B23_04e0
    pla
    tax
    jmp B23_04d6

B23_04cc:
    jsr B23_04e0
    txa
    pha
    jsr B23_04e0
    pla
    tax
B23_04d6:
    jsr PpuSync
    stx nmi_flags+1
    lda #$80
    sta nmi_flags+0
    rts

B23_04e0:
    sec
    lda nmi_queue+3,x
    sbc #$20
    sta nmi_queue+3,x
    lda nmi_queue+2,x
    sbc #$00
    sta nmi_queue+2,x
    clc
    lda nmi_queue+1,x
    adc #$04
    sta UNK_60+0
    clc
    txa
    adc UNK_60+0
    tax
    rts
.endif


B23_04bb:
    lda #$21
    sta $0580
    sta $0588
    lda #$80
    sta battle_wordvar62
    lda #$05
    sta battle_wordvar62+1
    ldx attacker_offset
    jsr B23_04da
    lda #$88
    sta battle_wordvar62
    lda #$05
    sta battle_wordvar62+1
    ldx target_offset
    B23_04da:
    lda BATTLER_FULLDATA_PTR, x
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, x
    sta battle_wordvar60+1
    ldy #$18
    lda (battle_wordvar60), y
    pha
    iny
    lda (battle_wordvar60), y
    ldy #$02
    sta (battle_wordvar62), y
    pla
    dey
    sta (battle_wordvar62), y
    iny
    iny
    lda BATTLER_LETTER, x
    and #$1c
    beq B23_0505
    lsr a
    lsr a
    clc
    adc #$40
    sta (battle_wordvar62), y
    iny
    B23_0505:
    lda #$00
    sta (battle_wordvar62), y
    rts

; Subroutine for Player inputting
; Tries turn input for all 4 player battlers.
; Skips asking for player input under various conditions, such as:
;       battler is an NPC (EVE, Flying Man) or empty (ID 00)
;       battler has a bad status like Sleep, Para, Petrify, Puzzle, Bound, Uncon
; Variables used:
;       attacker_offset: Direct 0-based Indexer incremented by Subroutine
;           $00 = Player Battler 1
;           $20 = Player Battler 2
;           $40 = Player Battler 3
;           $60 = Player Battler 4
SubroutinePlayerTurnInput:
    lda #$00
    sta attacker_offset
    ; jmp @PlayerTurnRoutine

; Start of Main loop
@PlayerTurnInput_MainLoop:
    ldy attacker_offset
    lda #$00
    sta BATTLER_ACTION_ID, y
    lda BATTLER_MINOR_STATUS, y
    and #~GUARD
    sta BATTLER_MINOR_STATUS, y
    lda BATTLER, y
    beq @PlayerTurnInput_INC                                    ; skip turn if BATTLER ID is 0
    lda BATTLER_STATUS, y                                       ; skip turn if battler has bad status
    and #UNCON | PETRIFICATION | PARALYSIS | SLEEP | PUZZLE
    bne @PlayerTurnInput_INC
    lda BATTLER_MINOR_STATUS, y                                 ; ditto for minor status (being bound by rope)
    and #BIND
    bne @PlayerTurnInput_INC
    jsr @PromptPlayerTurnInput                                  ; prompt player for input
    bcs @PlayerTurnInput_MainLoop
@PlayerTurnInput_INC:
    clc
    lda attacker_offset
    adc #$20
    sta attacker_offset
    bne @PlayerTurnInput_MainLoop
    rts

; Bring up menu for Turn Input & wait for an entry, then store it.
@PromptPlayerTurnInput:
    lda is_auto
    bne @InputTurnAsAI
    ldy attacker_offset
    bmi @InputTurnAsAI
    lda BATTLER_PLAYER_ID, y
    and #EVE
    eor #EVE                     ; check for Flying Man
    beq @InputTurnAsAI
    jsr OpenPlayerInputMainMenu
    bcs :++                     ; ++ branch to RTS
    lda is_auto
    beq @PlayerInputtedTurn
@InputTurnAsAI:
    jsr @BattleAIDeterminer

; Guarding gets priority (immediately adds Guard status)
; the only diff between enemy and player guard is the text it prints (what a waste of processing power... and incredibly misleading!)
@PlayerInputtedTurn:
    ldy attacker_offset
    lda BATTLER_ACTION_ID, y
    cmp #BA_ENEMY_GUARD
    beq @AddGuardingStatus
    cmp #BA_PLAYER_GUARD
    bne :+                      ; +
@AddGuardingStatus:
    lda BATTLER_MINOR_STATUS, y
    ora #$08
    sta BATTLER_MINOR_STATUS, y
:   clc                         ; +  jump here to skip guarding
:   rts                         ; ++ branch here to end turn input

@BattleAIDeterminer:
    lda attacker_offset
    bmi :+
    jmp AutoFightRoutine
:   jmp EnemyAIRoutine


AutoFightRoutine:
    ldy #$00
@AutoFight_MainLoop:
    sty target_offset
    lda BATTLER, y
    beq @AutoFight_LoopINC
    lda BATTLER_PLAYER_ID, y
    and #EVE
    eor #EVE                     ; check for Flying Man
    beq @AutoFight_LoopINC
; Try to use Super Healing
    lda BATTLER_STATUS, y
    bmi @AutoSuperHealing_JMP
@AutoFight_LoopINC:
    tya
    clc
    adc #BATTLER_DATASIZE
    tay
    bpl @AutoFight_MainLoop
    .ifdef VER_JP
    jmp B23_05a0
    .else
    bmi B23_05a0
    .endif
@AutoSuperHealing_JMP:
    jmp AutoSuperHealing


B23_05a0:
    ldy #$00
B23_05a2:
    sty target_offset
    lda BATTLER, y
    beq B23_05bc
    lda BATTLER_STATUS, y
    bmi B23_05bc                    ; branch if unconned
    lda BATTLER_PLAYER_ID, y
    and #EVE
    eor #EVE
    beq B23_05bc
    jsr B31_1673
    bcc B23_05c5
B23_05bc:
    tya
    clc
    adc #$20
    tay
    bpl B23_05a2
    .ifdef VER_JP
    jmp B23_05e9
B23_05c5:
    jmp @dude
    @dude:
    .else
    bmi B23_05e9
B23_05c5:
    .endif
    ldx #$00
    ldy #$00
    B23_05c9:
    lda BATTLER, y
    beq B23_05db
    lda BATTLER_STATUS, y
    bmi B23_05db
    jsr B31_1673
    bcs B23_05db
    inx
    sty target_offset
    B23_05db:
    tya
    clc
    adc #$20
    tay
    bpl B23_05c9
    cpx #$01
    .ifdef VER_JP
    bcs @skip
    jmp B23_0611
    @skip:
    .else
    bcc B23_0611
    .endif
    jmp AutoLifeup
    B23_05e9:
    ldy #$00
    B23_05eb:
    sty target_offset
    lda BATTLER, y
    beq B23_0604
    lda BATTLER_PLAYER_ID, y
    and #$06
    eor #$06
    beq B23_0604
    lda BATTLER_STATUS, y
    bmi B23_0604
    and #$70
    bne B23_060e
    B23_0604:
    tya
    clc
    adc #$20
    tay
    bpl B23_05eb
    jmp AutoBash
    B23_060e:
    jmp AutoHealing
    B23_0611:
    lda #$0c
    jsr TryAddingPSIBattleAction
    bcc B23_0622
    lda #$0b
    jsr TryAddingPSIBattleAction
    bcc B23_0622
    jmp AutoLifeup
    B23_0622:
    rts

AutoLifeup:
    lda #LIFEUP_GAMMA
    jsr TryAddingPSIBattleAction
    bcc AutoLifeup_Store

    lda #LIFEUP_BETA
    jsr TryAddingPSIBattleAction
    bcc AutoLifeup_Store

    lda #LIFEUP_ALPHA
    jsr TryAddingPSIBattleAction
    bcc AutoLifeup_Store

    ldy attacker_offset
    jsr CLC_FindFoodInInventory

    .ifdef VER_JP
    bcs @B23_068f
    cpx #$84
    bne @B23_0692
    @B23_068f:
    jmp B23_05e9
    @B23_0692:
    .else
    bcs B23_05e9
    cpx #$7c
    beq B23_05e9
    cpx #$84
    beq B23_05e9
    .endif
    tya
    ldy attacker_offset
    sta BATTLER_TEMP_VARS, y
    txa
    sta BATTLER_ACTION_ID, y
AutoLifeup_Store:
    lda target_offset
    ldy attacker_offset
    sta BATTLER_TARGET, y
    rts

AutoHealing:
    ldy target_offset
    lda BATTLER_STATUS, y
    tax
    and #PARALYSIS
    bne @AutoHealingBeta
    txa
    and #SLEEP
    bne @AutoHealingPi
    txa
    and #PETRIFICATION
    bne @AutoHealingGamma
    jmp @JMPAutoBash

@AutoHealingBeta:
    lda #HEALING_BETA
    jsr TryAddingPSIBattleAction
    bcc @AutoHealing_Store

@AutoHealingPi:
    lda #HEALING_PI
    jsr TryAddingPSIBattleAction
    bcc @AutoHealing_Store

@AutoHealingGamma:
    lda #HEALING_GAMMA
    jsr TryAddingPSIBattleAction
    bcc @AutoHealing_Store

@JMPAutoBash:
    jmp AutoBash

@AutoHealing_Store:
    lda target_offset
    ldy attacker_offset
    sta BATTLER_TARGET, y
    rts

; Sets Battler's Action ID to Bash
; & picks random target on enemy team
; Random algorithm:
;   - pick random num from 0 to 3
;   - Check Status of that Slot on opposing team
;       If Deadge: Try again
AutoBash:
    ldy attacker_offset
    lda #BA_BASH
    sta BATTLER_ACTION_ID, y
:   jsr RNG_BYTE
    and #$e0                    ; get a random value from 0 to 3
    ora #$80
    tay
    lda BATTLER, y
    beq :-
    lda BATTLER_STATUS, y
    bmi :-                      ; branch if unconned
    tya
    ldy attacker_offset
    sta BATTLER_TARGET, y
    rts

AutoSuperHealing:
    lda #HEALING_SUPER
    jsr TryAddingPSIBattleAction
    bcc :+
    jmp B23_05a0
:   ldy attacker_offset
    lda target_offset
    sta BATTLER_TARGET, y
    rts

TryAddingPSIBattleAction:
    sta battle_wordvar60
    jsr LoadPlayerBattlerLearnedPSIs
    lda battle_wordvar60
    lsr a
    lsr a
    lsr a
    tay
    lda battle_wordvar60
    and #$07
    tax
    inx
    sec
    lda #$00
    B23_06d6:
    ror a
    dex
    bne B23_06d6
    sta battle_wordvar60+1
    lda (ptr_chara), y
    and battle_wordvar60+1
    beq B23_0721
    lda #$00
    asl battle_wordvar60
    rol a
    asl battle_wordvar60
    rol a
    asl battle_wordvar60
    rol a
    sta battle_wordvar60+1
    clc
    lda battle_wordvar60
    adc #$00
    sta battle_wordvar60
    lda battle_wordvar60+1
    adc #$9e
    sta battle_wordvar60+1
    jsr BANKSWAP_L00
    ldy #$05
    lda (battle_wordvar60), y
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    ldy #$07
    lda (battle_wordvar60), y
    sta battle_input_num
    lda #$00
    sta battle_input_num+1
    jsr BANKSWAP_L16
    jsr SubtractPP
    bcc B23_0721
    jsr SetCarryAttackerNotBlocked
    bcc B23_0721
    clc
    rts
    B23_0721:
    sec
    rts

; Picks a random move from the Enemy's Moveset
EnemyAIRoutine:
    jsr RNG_BYTE
    and #%00000111
    clc
    adc attacker_offset
    tay
    lda BATTLER_MOVESET, y
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    jsr TargetingFromActionID
    jsr JMPTable


    .addr AITargetRoutine_RTS ; 0 - ???
    .addr AITargetsPlayerRoutine ; 1 - ???
    .addr AISelectTargetRoutine ; 2 - ???

AITargetsPlayerRoutine:
    jsr B23_07ab
    lda target_offset
    bpl AITargetsPlayerRoutine
    jmp AITargetRoutine_RTS

AISelectTargetRoutine:
    lda attacker_offset
    ; skip the battle script checks if the AI is player team (Auto, NPCs)
    bpl @AISelectTarget_CheckNotNull

    ;if not red robo battle, jump
    lda battle_script
    cmp #BSCRIPT_REDROBO
    bne @blue_robo_check
    ;else,
    ; red robo targeting effect
    ; honestly this is pretty stupid. just target the end of party first, instead of writing a custom routine to target specific player ID

    ldx #3
    @find_eve:
    lda #EVE
    jsr TargetSpecificPlayer
    bcs JMP_AITargetRoutine_RTS
    dex
    bpl @find_eve

    @blue_robo_check:
    lda battle_script
    cmp #BSCRIPT_BLUEROBO
    bne @not_blue_robo
; blue robo targeting effect
; oh my god why is this one infinitely more stupid. why does it look for specifically Ninten, then Ana, then Teddy.
; just target leader to back like any sane programmer would
    ldx #3
    @find_ninten:
    lda #NINTEN
    jsr TargetSpecificPlayer
    bcs JMP_AITargetRoutine_RTS
    dex
    bpl @find_ninten

    ldx #3
    @find_ana:
    lda #ANA
    jsr TargetSpecificPlayer
    bcs JMP_AITargetRoutine_RTS
    dex
    bpl @find_ana
    ldx #3
    @find_teddy:
    lda #TEDDY
    jsr TargetSpecificPlayer
    bcs JMP_AITargetRoutine_RTS
    dex
    bpl @find_teddy

    @not_blue_robo:
    ldx #3
    @find_flyingman:
    lda #FLYING_MAN
    jsr TargetSpecificPlayer
    bcs JMP_AITargetRoutine_RTS
    dex
    bpl @find_flyingman

; check to make sure target is not empty
    @AISelectTarget_CheckNotNull:
    jsr B23_07ab
    lda target_offset
    bmi @AISelectTarget_CheckNotNull
    jmp AITargetRoutine_RTS

JMP_AITargetRoutine_RTS:
    jmp AITargetRoutine_RTS ; really fucking stupid line of code

AITargetRoutine_RTS:
    lda target_offset
    ldy attacker_offset
    sta BATTLER_TARGET, y
    rts

B23_07ab:
    jsr RNG_BYTE
    and #%11100000
    tay
    lda BATTLER, y
    beq B23_07ab
    lda BATTLER_STATUS, y
    bmi B23_07ab
    sty target_offset
    rts

; used to do things like target front to back (Blue robo) or always target back (Red robo)
TargetSpecificPlayer:
    cmp party_members, x
    bne :+
    txa
    asl a
    asl a
    asl a
    asl a
    asl a
    tay
    lda BATTLER, y
    beq :+
    lda BATTLER_STATUS, y
    bmi :+
    sty target_offset
    sec
    rts
:   clc
    rts
; lookup table for player selection
; main code for interpreting player's action
OpenPlayerInputMainMenu:
    jsr DrawSelectionMenu
    ; jmp UpdatePlayerinputMainMenu

UpdatePlayerinputMainMenu:
    lda #$02
    .ifdef VER_JP
    ldx battle_script
    cpx #BSCRIPT_GIEGUE_FIGHTING
    bne :+
    .else
    ldx event_flags+28
    bpl :+
    .endif
    lda #$13
:   jsr B31_14ce
    jsr SelectionMenuCheckScenario
    jsr JMPTable



    .addr SelectFight
    .addr SelectAuto
    .addr SelectPSI
    .addr SelectGuard
    .addr SelectItem
    .addr SelectRun
    .addr SelectCheck
    .addr SelectSing
    .addr SelectBack            ; when B button is pressed

SelectRTS:
    rts

SelectFight:
    lda #BA_BASH
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    jsr B23_0962
    bcc :+
    jmp UpdatePlayerinputMainMenu
:   jmp SelectRTS

SelectAuto:
    jsr PpuSync
    lda #$01
    sta is_auto
    lda #.LOBYTE(SPRITEDEF_AUTOBATTLER)
    sta $03e6
    lda #.HIBYTE(SPRITEDEF_AUTOBATTLER)
    sta $03e7
    lda #$04
    sta $03e0
    lda #$00
    sta $03e1
    sta $03e4
    sta $03e5
    lda #$d0
    sta $03e2
    lda #$47
    sta $03e3
    lda #$01
    sta $e5
    clc
    jmp SelectRTS

SelectPSI:
    jsr LoadPlayerBattlerLearnedPSIs
    lda #$00
    sta battle_wordvar60
    ldy #$07
:   lda (ptr_chara), y
    ora battle_wordvar60
    sta battle_wordvar60
    dey
    bne :-
    lda battle_wordvar60
    beq :++
    jsr BtlOpenPSIMenu
    bcs :+
    jmp SelectRTS
:   jmp OpenPlayerInputMainMenu
:   jmp UpdatePlayerinputMainMenu

; seems to load in a player's learned PSIs
LoadPlayerBattlerLearnedPSIs:
    ldy attacker_offset
    clc
    lda BATTLER_FULLDATA_PTR, y
    adc #$30
    sta ptr_chara
    lda BATTLER_FULLDATA_PTR+1, y
    adc #$00
    sta ptr_chara+1
    rts

SelectGuard:
    lda #BA_PLAYER_GUARD
    TargetSelf:
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    clc
    jmp SelectRTS

SelectItem:
    ldy attacker_offset
    clc
    lda BATTLER_FULLDATA_PTR, y
    adc #$20
    sta ptr_chara
    lda BATTLER_FULLDATA_PTR+1, y
    adc #$00
    sta $5d
    lda #$00
    sta battle_wordvar60
    ldy #$07
:   lda (ptr_chara), y
    ora battle_wordvar60
    sta battle_wordvar60
    dey
    bpl :-
    lda battle_wordvar60
    beq :++
    jsr B23_0a08
    bcs :+
    jmp SelectRTS
:   jmp OpenPlayerInputMainMenu
:   jmp UpdatePlayerinputMainMenu

SelectRun:
    lda #$48
    jmp TargetSelf

SelectCheck:
    lda #$80
    sta target_offset
    jsr B23_0991
    bcs :+
    ldx menucursor_pos
    lda bytevar_0591, x
    tax
    dex
    txa
    sta target_offset
    ldy attacker_offset
    sta BATTLER_TARGET, y
    lda #$6f
    sta BATTLER_ACTION_ID, y
    jmp SelectRTS
:   jmp UpdatePlayerinputMainMenu

SelectSing:
    lda #BA_SING
    jmp TargetSelf

SelectBack:
    sec
    lda attacker_offset
    beq :+                          ; if at player 1, go "back" to player 1
    sbc #BATTLER_DATASIZE            ; go back 1 offset to prev. player slot
    sta attacker_offset
    tay
    lda BATTLER, y                  ; go back again if player doesn't exist somehow (useless code, since it's impossible for player team to have holes in it)
    beq SelectBack
    lda BATTLER_STATUS, y           ; go back again if player has status that makes them unable to move
    bmi SelectBack
    lda BATTLER_STATUS, y
    and #UNCON | PETRIFICATION | PARALYSIS | SLEEP | PUZZLE
    bne SelectBack
    lda BATTLER_MINOR_STATUS, y
    and #BIND
    bne SelectBack
:   sec
    jmp SelectRTS

SelectionMenuCheckScenario:
    ldx #.LOBYTE(battle_commands_normal)
    ldy #.HIBYTE(battle_commands_normal)
    .ifdef VER_JP

    ;if battle != giegue, jump
    lda battle_script
    cmp #BSCRIPT_GIEGUE_FIGHTING
    bne @not_giegue
    ldx #.LOBYTE(battle_commands_giegue)
    ldy #.HIBYTE(battle_commands_giegue)
    jmp @no_sing
    @not_giegue:
    ;if battle != teddy, jump
    cmp #BSCRIPT_TEDDY
    bne @no_sing
    ldx #.LOBYTE(battle_commands_teddyfight)
    ldy #.HIBYTE(battle_commands_teddyfight)
    .else

    ;if battle_script != BSCRIPT_TEDDY, jump
    lda battle_script
    cmp #BSCRIPT_TEDDY
    bne @not_teddy
    ldx #.LOBYTE(battle_commands_teddyfight)
    ldy #.HIBYTE(battle_commands_teddyfight)
    jmp @no_sing
    @not_teddy:
    ;if !event_flags[28].7, skip set
    lda event_flags+28
    bpl @no_sing
    ldx #.LOBYTE(battle_commands_giegue)
    ldy #.HIBYTE(battle_commands_giegue)
    .endif
    @no_sing:
    stx $84
    sty $85

    ldx #.LOBYTE(battle_commands_choicer)
    ldy #.HIBYTE(battle_commands_choicer)
    stx $80
    sty $81
    jsr B31_0f3f
    bit $83
    bvs @exit
    lda #$09
    jsr B23_0945
    lda menucursor_pos
    rts
    @exit:
    lda #$08
    rts

B23_0945:
    sta battle_wordvar60
    lda menucursor_pos
    lsr a
    asl a
    clc
    adc $77
    sta $77
    lda menucursor_pos
    and #$01
    beq B23_095d
    clc
    lda $76
    adc battle_wordvar60
    sta $76
    B23_095d:
    lda #$0d
    jmp B31_14ce
    B23_0962:
    jsr TargetingFromActionID
    ;if targeting == 0, jump
    beq @no_targeting
    ldx #$80
    ;if targeting == 2, skip
    cmp #2
    beq @is_2
    ldx #0 ; targeting 1 or 3
    @is_2:
    stx battle_wordvar60
    lda attacker_offset
    and #$80
    eor battle_wordvar60
    sta target_offset
    jsr B23_0991
    bcs B23_098f
    ldx menucursor_pos
    lda bytevar_0591, x
    tax
    dex
    txa
    sta target_offset
    ldy attacker_offset
    sta BATTLER_TARGET, y
    @no_targeting:
    clc
    rts
    B23_098f:
    sec
    rts

B23_0991:
    lda #$0b
    jsr B31_14ce
    jsr B23_09b3

    lda #.LOBYTE(battle_whichenemy_choicer)
    sta $80
    lda #.HIBYTE(battle_whichenemy_choicer)
    sta $81
    jsr PRINT_CURR_CHOICER
    bit $83
    bvs B23_09b1
    bmi B23_09ad
    jmp B23_0991

B23_09ad:
    lda menucursor_pos
    clc
    rts
    B23_09b1:
    sec
    rts

B23_09b3:
    lda #$12
    sta $77
    ldx #$00
    stx bytevar_0591
    stx bytevar_0592
    stx bytevar_0593
    stx bytevar_0594
    inx
    stx bytevar_0590
    lda target_offset
    pha
    ldy #$04
    B23_09ce:
    tya
    pha
    ldy target_offset
    lda BATTLER, y
    beq B23_09f8
    ldy target_offset
    bmi B23_09e4
    lda BATTLER_PLAYER_ID, y
    and #$06
    eor #$06
    beq B23_09f8
    B23_09e4:
    iny
    tya
    sta bytevar_0590, x
    inx
    txa
    pha
    jsr B23_04bb
    lda #$0c
    jsr B31_14ce
    inc $77
    pla
    tax
    B23_09f8:
    clc
    lda target_offset
    adc #$20
    sta target_offset
    pla
    tay
    dey
    bne B23_09ce
    pla
    sta target_offset
    rts

B23_0a08:
    lda #$0e
    jsr B31_14ce
    jsr B23_0a67
    jsr B23_0ae9
    bcs B23_0a65
    ldy attacker_offset
    lda menucursor_pos
    sta BATTLER_TEMP_VARS, y
    ldy menucursor_pos
    lda (ptr_chara), y
    jsr GetItemPointer
    ldy attacker_offset
    jsr B23_0c49
    bcs B23_0a43
    jsr BANKSWAP_L00
    ldy #$05
    lda (battle_wordvar62), y
    jsr BANKSWAP_L16
    cmp #$00
    beq B23_0a4c
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    jsr B23_0962
    bcs B23_0a65
    rts

B23_0a43:
    ldx attacker_offset
    jsr B23_04bb
    ldx #$14
    bne B23_0a5e
    B23_0a4c:
    ldx #$10
    jsr BANKSWAP_L00
    ldy #$03
    lda (battle_wordvar62), y
    jsr BANKSWAP_L16
    cmp #$00
    beq B23_0a5e
    ldx #$11
    B23_0a5e:
    txa
    jsr B31_14ce
    jsr WaitABPressed
    B23_0a65:
    sec
    rts

B23_0a67:
    ldy #$00
    B23_0a69:
    tya
    pha
    and #$01
    tax
    lda B22_1fb1+1, x
    sta $76
    tya
    lsr a
    tax
    lda B22_1fb1+3, x
    sta $77
    lda (ptr_chara), y
    beq B23_0a9c
    jsr GetItemPointer
    jsr BANKSWAP_L00
    lda #$04
    sta $0588
    ldy #$00
    lda (battle_wordvar62), y
    sta $0589
    iny
    lda (battle_wordvar62), y
    sta $058a
    lda #$0f
    jsr B31_14ce
    B23_0a9c:
    pla
    tay
    iny
    cpy #$08
    bne B23_0a69
    rts

; $AAA4
GetItemPointer:
    ldx #$00
    stx battle_wordvar62+1
    ldx #$03
:   asl a
    rol battle_wordvar62+1
    dex
    bne :-
    clc
    adc #.LOBYTE(Item_Data)
    sta battle_wordvar62
    lda battle_wordvar62+1
    adc #.HIBYTE(Item_Data)
    sta battle_wordvar62+1
    rts

; $AABC
GetInventoryPointer_battle:
    clc
    lda BATTLER_FULLDATA_PTR, y
    adc #$20
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    adc #$00
    sta battle_wordvar60+1
    rts

; registers used to call bankswitch op
; $0590 : byte #$21
; $0591 : word
; $0593 : byte (clear)
StoreItemName:
    jsr BANKSWAP_L00
    lda #$21
    sta bytevar_0590
    ldy #$00
    lda (battle_wordvar62), y
    sta wordvar_0591
    iny
    lda (battle_wordvar62), y
    sta wordvar_0591+1
    lda #$00
    sta bytevar_0593
    jmp BANKSWAP_L16

B23_0ae9:
    lda #.LOBYTE(battle_goods_choicer)
    sta $80
    lda #.HIBYTE(battle_goods_choicer)
    sta $81
    lda ptr_chara
    sta $84
    lda $5d
    sta $85
    jsr B31_0f3f
    bit $83
    bvs B23_0b0e
    bmi B23_0b05
    jmp B23_0ae9
    B23_0b05:
    lda #$0c
    jsr B23_0945
    lda menucursor_pos
    clc
    rts
    B23_0b0e:
    sec
    rts

BtlOpenPSIMenu:
    ldy #$01
    B23_0b12:
    lda (ptr_chara), y
    beq B23_0b32
    tya
    pha
    lda #$0e
    jsr B31_14ce
    lda #$12
    jsr B31_14ce
    jsr LoadandDoPSIMenu
    jsr BtlDoPSIPageChoicer
    pla
    tay
    cpx #$01
    beq B23_0b39
    cpx #$02
    beq B23_0b5f
    B23_0b32:
    iny
    cpy #$08
    beq BtlOpenPSIMenu
    bne B23_0b12
    B23_0b39:
    ldy menucursor_pos
    lda BATTLER_1BASED, y
    jsr GetPsiDataPointer
    jsr BANKSWAP_L00
    ldy #$05
    lda (battle_wordvar62), y
    beq B23_0b57
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    pha
    jsr BANKSWAP_L16
    pla
    jmp B23_0962

B23_0b57:
    lda #$10
    jsr B31_14ce
    jsr WaitABPressed
    B23_0b5f:
    sec
    rts

LoadandDoPSIMenu:
    tya
    asl a
    asl a
    asl a
    sta battle_wordvar60
    lda #$80
    sta battle_wordvar60+1
    ldx #$00
    B23_0b6d:
    lda #$00
    sta BATTLER_1BASED, x
    lda (ptr_chara), y
    and battle_wordvar60+1
    beq B23_0b7d
    lda battle_wordvar60
    sta BATTLER_1BASED, x
    B23_0b7d:
    inc battle_wordvar60
    inx
    lsr battle_wordvar60+1
    bcc B23_0b6d
    ldy #$00
B23_0b86:
    tya
    pha
    and #$01
    tax
    lda B22_1fb1+1, x
    sta $76
    tya
    lsr a
    tax
    lda B22_1fb1+3, x
    sta $77
    lda BATTLER_1BASED, y
    beq B23_0bba
    jsr GetPsiDataPointer
    jsr BANKSWAP_L00
    lda #$04
    sta $0588
    ldy #$00
    lda (battle_wordvar62), y
    sta $0589
    iny
    lda (battle_wordvar62), y
    sta $058a
    lda #$0f
    jsr B31_14ce
    B23_0bba:
    pla
    tay
    iny
    cpy #$08
    bne B23_0b86
    rts

BtlDoPSIPageChoicer:
    lda #.LOBYTE(battle_psipage_choicer)
    sta $80
    lda #.HIBYTE(battle_psipage_choicer)
    sta $81
    jsr PRINT_CURR_CHOICER
    lda $83
    and #$06
    bne B23_0be6
    lda $83
    and #$81
    bne :+
    bit $83
    bvs :++
    jmp BtlDoPSIPageChoicer
:   ldx #$00
    rts
:   ldx #$02
    rts

B23_0be6:
    lda #.LOBYTE(battle_psi_choicer)
    sta $80
    lda #.HIBYTE(battle_psi_choicer)
    sta $81
    jsr PRINT_CURR_CHOICER
    lda $83
    and #$08
    bne BtlDoPSIPageChoicer
    bit $83
    bvs :++
    bmi :+
    jmp BtlDoPSIPageChoicer
:   ldx #$01
    rts
:   ldx #$02
    rts

; assumed
DrawSelectionMenu:
    lda #$0a
    jsr B31_14ce
    jsr B23_04bb

    jsr BANKSWAP_L00

    lda #0
    sta $70

    lda #.LOBYTE(ui_thing_tiles11)
    sta $74
    lda #.HIBYTE(ui_thing_tiles11)
    .ifdef VER_JP
    sta UNK_73
    jsr GetTextData
    .else
    sta $75
    .endif

    jsr DrawTilepackClear
    jmp BANKSWAP_L16

;a == battle action id
TargetingFromActionID:
    ;push a
    pha

    ;;this whole sequence gets which 2 bits to and
    ;;so x how many times to shift right %11000000
    ;x = (a & 3)+1
    and #%00000011
    tax
    inx
    ;a = (c into a >> 2) for every x
    ;eg x == 2 will result in a == $30
    lda #1
    sec
    @shifter:
    ror a
    ror a
    dex
    bne @shifter
    ;battle_wordvar60 = a
    sta battle_wordvar60

    ;restore a
    pla

    ;y = a / 4
    lsr a
    lsr a
    tay

    ;battle_wordvar60+1 = BATargetingTable[y] & battle_wordvar60
    lda BATargetingTable, y
    and battle_wordvar60
    sta battle_wordvar60+1

    ;;shift battle_wordvar60 right until it hits a bit
    ;;if it doenst, also shift battle_wordvar60+1 to match
    ;;tldr; move battle_wordvar60+1 down to be a normal number
    ;;break, then set
    @loop:
    lsr battle_wordvar60
    bcs @break
    lsr battle_wordvar60+1
    ;could be bcc and achieve the same function since the result
    ;should never be shifted out at all
    jmp @loop
    @break:
    lda battle_wordvar60+1
    rts

B23_0c49:
    jsr BANKSWAP_L00
    lda BATTLER_PLAYER_ID, y
    sta battle_wordvar64
    tax
    sec
    lda #$00
:   rol a
    dex
    bne :-
    sta battle_wordvar66+1
    ldy #$02
    lda (battle_wordvar62), y
    jsr BANKSWAP_L16
    and battle_wordvar66+1
    beq :+
    clc
    rts
:   sec
    rts

BattleTurnEngine:
    jsr ConcludeBattle
    bcs @TurnEngineReturn
    ldx #$08
@TurnEngineSort_LS:
    txa
    pha
    jsr SortTurnOrder
    jsr DoBattlerTurn
    lda #$ff
    ldy attacker_offset
    sta BATTLER_ACTION_ID, y
    jsr ConcludeBattle
    bcs :+                       ; turn engine loop break out
    pla
    tax
    dex
    bne @TurnEngineSort_LS
    dec turn_counter
    beq BattleDrawEffect
    clc
    rts
:   pla                         ; break out jumps here
@TurnEngineReturn:
    sec
    rts

; called when turn counter hits 0
BattleDrawEffect:
    lda battle_script
    cmp #BSCRIPT_TEDDY
    beq :+                      ; dont print draw msg if teddy script
    ldx #100
    jsr WaitXFrames
    lda #$92                    ; battle lingered on and on msg
    jsr DisplayText_battle
:   sec
    rts

SortTurnOrder:
    lda #$00
    sta battle_wordvar60
    sta battle_wordvar60+1
@SortTurnOrder_LS:
    ldy battle_wordvar60
    lda BATTLER_ACTION_ID, y
    cmp #BA_COMPLETE
    beq @SortTurnOrder_INC
    cmp #$5e
    beq @SortTurnOrder_End
    lda BATTLER_SPD, y
    jsr RNGifySpeed
    cmp battle_wordvar60+1
    bcc @SortTurnOrder_INC
    sta battle_wordvar60+1
    lda battle_wordvar60
    sta battle_wordvar62
@SortTurnOrder_INC:
    clc
    lda battle_wordvar60
    adc #$20
    sta battle_wordvar60
    bne @SortTurnOrder_LS
    ldy battle_wordvar62
@SortTurnOrder_End:
    sty attacker_offset
    rts

; Routine that runs a single battler's turn
; Turn can be interrupted by various status conditions
DoBattlerTurn:
    ldy attacker_offset
    lda BATTLER, y
    bne @CheckUncon
    lda #$00                    ; no msg
    jmp DisplayText_battle2

@CheckUncon:
    lda BATTLER_STATUS, y
    and #UNCON
    beq @CheckPetrified
    lda #$00                    ; no msg
    jmp DisplayText_battle2

@CheckPetrified:
    lda BATTLER_STATUS, y
    and #PETRIFICATION
    beq @CheckParalyzed
    lda #$47                    ; battler is petrified msg
    jmp DisplayText_battle2

@CheckParalyzed:
    lda BATTLER_STATUS, y
    and #PARALYSIS
    beq @CheckSleeped
    lda #$46                    ; battler is paralyzed msg
    jmp DisplayText_battle2

@CheckSleeped:
    lda BATTLER_STATUS, y
    and #SLEEP
    beq @CheckPuzzled
; Sleep Wake Up Check
    jsr RNG_BYTE
    and #$e0                    ; 1/8 chance of wake up (sleep is basically an ohko lmao)
    bne @SleepWakeupFail
    lda BATTLER_STATUS, y
    and #~SLEEP
    sta BATTLER_STATUS, y
    sty target_offset
    jsr B31_15e5
    lda #$8e                    ; battler wakes up msg
    jmp DisplayText_battle2

@SleepWakeupFail:
    lda #$3c                    ; battler continues to sleep msg
    jmp DisplayText_battle2

; puzzle is basically permanent sleep that gets cured by confuse curing item
; (that rare as shit drop from the Big Woodoh - atrocious game design)
@CheckPuzzled:
    lda BATTLER_STATUS, y
    and #PUZZLE
    beq @CheckAsthma
    lda #$68                    ; battler is puzzled msg
    jmp DisplayText_battle2

@CheckAsthma:
    lda BATTLER_MINOR_STATUS, y
    and #ASTHMA
    beq @CheckBound
    lda BATTLER_ACTION_ID, y
    cmp #BA_ASTHMA_SPRAY
    beq @CheckBound
    lda #$56                    ; battler has asthma msg
    jmp DisplayText_battle2

@CheckBound:
    lda BATTLER_MINOR_STATUS, y
    and #BIND
    beq @CheckConfuse
    jsr RNG_BYTE
    and #$c0                    ; 1/4 chance of escaping bind
    bne @BindBreakFail
    lda BATTLER_MINOR_STATUS, y
    and #~BIND
    sta BATTLER_MINOR_STATUS, y
    lda #$8b                    ; battler escaped bind msg
    jmp DisplayText_battle2

@BindBreakFail:
    lda #$1c                    ; battler is bound msg
    jmp DisplayText_battle2

; unlike the other status conditions, confuse still prints text but doesn't eat your turn
@CheckConfuse:
    lda BATTLER_STATUS, y
    and #CONFUSE
    beq @PerformBattlerAction
    lda #$3a                    ; battler is confused msg
    jsr DisplayText_battle

; (finally) performs the battler's BA!
@PerformBattlerAction:
    ldy attacker_offset
    lda BATTLER_ACTION_ID, y
    PerformBattleAction2:                      ; wip label
    ldy #$00
    sty battle_wordvar60+1
    asl a
    rol battle_wordvar60+1
    sta battle_wordvar60
    clc
    lda #.LOBYTE(BATTLE_ACTION_POINTERS)
    adc battle_wordvar60
    sta battle_wordvar60
    lda #.HIBYTE(BATTLE_ACTION_POINTERS)
    adc battle_wordvar60+1
    sta battle_wordvar60+1
    ldy #$00
    lda (battle_wordvar60), y
    sta battle_var5e
    iny
    lda (battle_wordvar60), y
    sta battle_var5f
    ; FALLTHROUGH

; Battle Instruction Interpreter
; MOTHER has its own instructions for Battle Actions (BAs).
; You can think of it as a custom scripting language.
; BA data is composed of these instructions, which call upon already programmed functions.
; They can take in .byte or .word as arguments depending on the script's "opcode."
BattleScriptInterpreter:
    ldy #$00
    lda (battle_var5e), y
    lsr a
    lsr a
    lsr a
    lsr a
    jsr JMPTable

    .addr BINST0_END          ; 0 : END
    .addr BINST1_VARIETY      ; 1 : Variety w/ no args
    .addr BINST2_LUTPSI       ; 2 : ReadPSI .byte PSI_ID
    .addr BINST3_LUTITEM      ; 3 : ReadItem .byte Item_ID
    .addr BINST4_EFFECT       ; 4 : Effect .byte LUT_ID (effect id, LUT located in this bank)
    .addr BINST5_TARGETING    ; 5 : Change attacker_offset's Target
    .addr BINST6_BYTEARG      ; 6 : Variety w/ .byte arg
    .addr BINST7_IFFALSE      ; 7 : Jump If Carry Clear .word ptr
    .addr BINST8_IFTRUE       ; 8 : Jump If Carry Set .word ptr
    .addr BINST9_JSR          ; 9 : Jump Subroutine .word ptr
    .addr BINSTA_JMP          ; A : Jump Unconditional .word ptr
    .addr BINSTB_REPEAT       ; B : Repeat lo times
    .addr BINSTC_ITEMSCRIPT   ; C : ItemScript .byte Item_ID

; $ADC1
DisplayText_battle2:
    jmp DisplayText_battle

; Battle Instruction 0 : End
BINST0_END:
    lda #$01                        ; advance script counter by 1
    jmp AdvanceScriptPtr

; Battle Instruction 1 : Variety Effects
; lo bits : argument
BINST1_VARIETY:
    ;jptbl based on battle_var5e[0] & 0xf
    ldy #0
    lda (battle_var5e), y
    and #%00001111 ; get lo nybble
    jsr JSRTable

    .addr BINST1_RETURN ; Return address
    .addr BINST10_ENEMYSPAWN
    .addr BINST11_RUN
    .addr BINST12_ANIMATE_NORMAL
    .addr BINST13_ANIMATE_LONG
    .addr BINST14_CALLHELP
    .addr BINST15_SPROUT
    .addr BINST16_DIMENSION_SLIP
    .addr BINST17_ANIMATE_FIRE
    .addr BINST18_ANIMATE_FREEZE
    .addr BINST19_ANIMATE_THUNDER
    .addr BINST1A_ANIMATE_BEAM
    .addr BINST1B_ANIMATE_CRIT

BINST1_RETURN:
    lda #1                        ; advance script counter by 1
    jmp AdvanceAndContinue

; Battle Instruction 2N ID (Lookup and use PSI ID)
; Registers Used:
;   battle_input_num    : Power Cost (hi byte set to 0)
;   battle_wordvar60     : ptr to PSI data table
; used to call bankswitch operation
;   bytevar_0590        : set to #$21
;   wordvar_0591        : ptr to attacker's name
;   bytevar_0593        : cleared
BINST2_LUTPSI:
    ;get battle_var5e[1] (psi)
    ldy #1
    lda (battle_var5e), y

    ldx #$00
    stx battle_wordvar60+1
    ldx #$03
:   asl a
    rol battle_wordvar60+1
    dex
    bne :-

    clc
    adc #$00
    sta battle_wordvar60
    lda battle_wordvar60+1
    adc #$9e
    sta battle_wordvar60+1         ; $60 = pointer to PSI data table
    jsr BANKSWAP_L00

    ldy #$07
    lda (battle_wordvar60), y
    sta battle_input_num            ; store power cost
    lda #$00
    sta battle_input_num+1

    lda #$21
    sta bytevar_0590
    ldy #$00
    lda (battle_wordvar60), y
    sta wordvar_0591
    iny
    lda (battle_wordvar60), y
    sta wordvar_0591+1
    lda #$00
    sta bytevar_0593
    jsr BANKSWAP_L16

    lda #$64                        ; Attacker tried PSI msg
    jsr DisplayText_battle

    jsr SetCarryAttackerNotBlocked
    bcc @PSIFailedBlock             ; branch when NOT Attacker NOT Blocked (Attacker is Blocked)

    jsr SubtractPP
    bcc @PSIFailedPowerCost         ; branch when Power cost is too high

    jsr DepletePower
    lda battle_bytevar58
    jsr PlayBattleSFX
    lda #$00
    sta battle_bytevar58

    lda #$02                        ; advance script counter by 2
    jmp AdvanceAndContinue

@PSIFailedBlock:
    lda #$51                        ; PSI was Blocked msg
    jmp DisplayText_battle

@PSIFailedPowerCost:
    lda #$54                        ; Not enough power msg
    jmp DisplayText_battle

; Battle Instruction 3N ID (Lookup and use Item ID)
BINST3_LUTITEM:
    ldy #$01
    lda (battle_var5e), y
    jsr GetItemPointer
    jsr StoreItemName
    ldy attacker_offset
    bmi @PrintUseItemMsg
    jsr EnablePRGRam
    ;get low nybble of 3N
    ldy #0
    lda (battle_var5e), y
    and #%00001111
    ;if nybble != 1, skip removal
    cmp #1
    bne @PrintUseItemMsg
    jsr OrganizeAttackerInv
    @PrintUseItemMsg:
    lda #$63                        ; Using item msg
    jsr DisplayText_battle
    lda battle_bytevar58
    jsr PlayBattleSFX
    lda #$00
    sta battle_bytevar58
    lda #$02                        ; advance script counter by 2
    jmp AdvanceAndContinue

; Battle Instruction CN ID (Run ItemScript w/ item ID)
BINSTC_ITEMSCRIPT:
    ldy #$01
    lda (battle_var5e), y
    jsr GetItemPointer
    jsr StoreItemName
    ldy attacker_offset
    bmi BINSTC_RETURN
    ldy #$00
    lda (battle_var5e), y
    and #$0f
    jsr JMPTable

    .addr BINSTC0_BREAKABLE
    .addr BINSTC1_PSISTONE
    .addr BINSTC2_BIGBAG

; Battle Instruction C0 ID (Run Breakable Script)
; Rolls Break chance and if unlucky, removes item from the inventory and prints msg saying it broke
BINSTC0_BREAKABLE:
    jsr RNG_BYTE
    and #$e0                        ; 1/8 chance of breakable breaking
    bne BINSTC_RETURN
    jsr OrganizeAttackerInv
    lda #$75                        ; Item broke msg
    jsr DisplayText_battle
    jmp BINSTC_RETURN

; Battle Instruction C1 ID (PSI Stone Script)
; Same as C0, but the breaking msg is different.
; Only used for PSI Stone in vanilla.
BINSTC1_PSISTONE:
    jsr RNG_BYTE
    and #$e0                        ; 1/8 chance of breakable breaking
    bne BINSTC_RETURN
    jsr OrganizeAttackerInv
    lda #$78                        ; PSI Stone died msg
    jsr DisplayText_battle
    jmp BINSTC_RETURN

; Battle Instruction C2 ID (Big Bag Script)
; Subtracts 1 from the Big Bag counter (global variable in SRAM)
; Deletes Big Bag from inventory if the counter hits 0
; Big Bag starts with 30 uses in vanilla, with no way to refill it
BINSTC2_BIGBAG:
    jsr EnablePRGRam
    dec big_bag_uses
    jsr WriteProtectPRGRam
    lda big_bag_uses
    bne BINSTC_RETURN
    jsr OrganizeAttackerInv
    lda #$91                        ; Big Bag was emptied msg
    jsr DisplayText_battle
    ; jmp BINSTC_RETURN

BINSTC_RETURN:
    lda #$02                        ; advance script counter by 2
    jmp AdvanceAndContinue

BINST5_TARGETING:
    ldy #$00
    lda (battle_var5e), y
    and #$0f
    jsr JSRTable

    .addr BINST5_RETURN               ; Return Address
    .addr BINST50_NOP
    .addr BINST51_TARGET_SELECTED
    .addr BINST52_TARGET_OPPOSING_LEADER
    .addr BINST53_TARGET_OUR_LEADER
    .addr BINST54_TARGET_SELF
    .addr BINST55_TARGET_OUR_LEADER_GUARANTEED
    .addr BINST56_TARGET_NEXT

BINST5_RETURN:
    lda #$01                        ; advance script counter by 1
    jmp AdvanceAndContinue

; Takes .byte as argument, stores into battle_var5e
; Stored into battle_wordvar64 ($64)
BINST6_BYTEARG:
    ldy #$01
    lda (battle_var5e), y
    sta battle_wordvar64
    dey
    lda (battle_var5e), y
    and #$0f
    jsr JSRTable

    .addr BINST6_RETURN               ; Return address
    .addr BINST60_SETNUMBASH
    .addr BINST61_SETNUMCRIT
    .addr BINST62_SETNUM
    .addr BINST63_GIEGUE_SPEECH
    .addr BINST64_DO_RESISTANCE
    .addr BINST65_CHECK
    .addr BINST66_PLAYATTACKSOUND
    .addr BINST67_LOADSOUND
    .addr BINST68_PRINTTEXT
    .addr BINST69_PLAYSOUND

BINST6_RETURN:
    lda #$02                        ; advance script counter by 2
    jmp AdvanceAndContinue

; runs when Carry is NOT set (clear)
BINST7_IFFALSE:
    jsr LUT_Conditionals
    bcc BINSTCONDITION_RUN
    jmp BINSTCONDITION_RETURN

; runs when Carry is set
BINST8_IFTRUE:
    jsr LUT_Conditionals
    bcc BINSTCONDITION_RETURN

; runs when output is True
; Jumps to the pointer provided by .word argument
BINSTCONDITION_RUN:
    ldy #$01
    lda (battle_var5e), y
    pha
    iny
    lda (battle_var5e), y
    sta battle_var5e+1
    pla
    sta battle_var5e
    jmp BattleScriptInterpreter

; runs when output is False
; does nothing and just advances the script counter
BINSTCONDITION_RETURN:
    lda #$03                        ; advance script counter by 3
    jmp AdvanceAndContinue


LUT_Conditionals:
    ldy #$00
    lda (battle_var5e), y
    and #$0f
    jsr JSRTable

    ; The way the conditionals are programmed are pretty sussy.
    ; For clarity & to match the code, when the carry is clear, that will be False. When the carry is set, that will be True.
    ; A lot of conditionals set carry when (in human language) condition is NOT met, which is just bizarre.
    .addr @ConditionalsRTS                          ; Return address
    .addr BINSTCONDITION0_NOT_ATTACKER_TARGET_ALIVE
    .addr BINSTCONDITION1_DODGED
    .addr BINSTCONDITION2_CRIT
    .addr BINSTCONDITION3_BLIND_MISS
    .addr BINSTCONDITION4_NOT_USING_TANK
    .addr BINSTCONDITION5_NO_BADGE
    .addr BINSTCONDITION6_NOT_TARGET_ALIVE
    .addr BINSTCONDITION7_NOT_INSECT
    .addr BINSTCONDITION8_50_50
    .addr BINSTCONDITION9_NOT_HAS_IMMUNITY
    .addr BINSTCONDITIONA_NOT_RESIST_MENTAL
    .addr BINSTCONDITIONB_NOT_TRIGGERED_BATTLE
    .addr BINSTCONDITIONC_NOT_TARGET_PLAYERCHAR
    .ifndef VER_JP
    .addr BINSTCONDITIOND_NOT_GIEGUE_FIGHT
    .endif



@ConditionalsRTS:
    rts

; Unconditional Jump to Subroutine
; Neat way to use JSR "directly" in the BA scriptcode without using raw assembly
BINST9_JSR:
    lda battle_var5e+1
    pha
    lda battle_var5e
    pha
    jsr ScriptJump
    jsr BattleScriptInterpreter
    pla
    sta battle_var5e
    pla
    sta battle_var5e+1
    lda #$03                        ; advance script counter by 3
    jmp AdvanceAndContinue

; Unconditonal Jump
BINSTA_JMP:
    jsr ScriptJump
    jmp BattleScriptInterpreter

; repeat times by lo 4 bits
; Uses END (0 series) as loop incrementer/end
BINSTB_REPEAT:
    ldy #$00
    lda (battle_var5e), y
    and #$0f
    tax
    lda #$01                        ; advance script counter by 1
    jsr AdvanceScriptPtr

:   txa
    pha
    lda battle_var5f
    pha
    lda battle_var5e
    pha
    jsr BattleScriptInterpreter
    lda battle_var5e
    sta battle_wordvar60
    lda battle_var5e+1
    sta battle_wordvar60+1
    pla
    sta battle_var5e
    pla
    sta battle_var5e+1
    pla
    tax
    dex
    bne :-

    lda battle_wordvar60
    sta battle_var5e
    lda battle_wordvar60+1
    sta battle_var5e+1
    jmp BattleScriptInterpreter

AdvanceAndContinue:
    jsr AdvanceScriptPtr
    jmp BattleScriptInterpreter

ScriptJump:
    ldy #$01
    lda (battle_var5e), y
    pha
    iny
    lda (battle_var5e), y
    sta battle_var5e+1
    pla
    sta battle_var5e
    rts

AdvanceScriptPtr:
    clc
    adc battle_var5e
    sta battle_var5e
    lda #$00
    adc battle_var5e+1
    sta battle_var5e+1
    rts

; Not called directly by any BAs. Used when fight starts.
BINST10_ENEMYSPAWN:
    ldy attacker_offset
    jmp EnemyLongFlashing

; Command for normal running. Has different animation based on which team is running. Enemies do the flashing effect they do when they die, players just have screenfade.
BINST11_RUN:
    ldy target_offset
    bpl :+
    jmp DoEnemyDeadAnimation
:   lda #ENDTYPE_RUN
    sta battle_endtype
    rts

; Animation used by most attacks
; Sets color to flash to background color (0F), effectively doing nothing visually
BINST12_ANIMATE_NORMAL:
    ldy target_offset
    bpl :+
    jmp ANIMATE_NORMAL_ENEMY
:   jmp ANIMATE_NORMAL_PLAYER

; Different Animation from ANIMATE BLACK
; Used for Long moves like Status moves
BINST13_ANIMATE_LONG:
    ldy target_offset
    bpl :+
    jmp ANIMATE_LONG_ENEMY
:   jmp ANIMATE_LONG_PLAYER

; Enemy move that calls for help
; Callable enemies are predefined by enemy groups.
; The only diff between them and normal enemies is that they don't spawn immediately in battle, and can only be called.
; If no more callables are avaliable, action prints fail msg
BINST14_CALLHELP:
    lda #$2d                    ; battler calls for help msg
    jsr DisplayText_battle
    jsr TryEnemyCall
    bcs :+
    lda #$40                    ; call failed msg
    jsr DisplayText_battle
:   rts

; Works the same as Call, but prints different messages
BINST15_SPROUT:
    lda #$2e                    ; battler sowed seeds msg
    jsr DisplayText_battle
    jsr TryEnemyCall
    bcs :+
    lda #$41                    ; sowed seeds failed msg
    jsr DisplayText_battle
:   rts

; has a different ending animation (fades screen after more delay) than the running endtype
BINST16_DIMENSION_SLIP:
    lda #ENDTYPE_DIMENSION_SLIP
    sta battle_endtype
    rts
; red
BINST17_ANIMATE_FIRE:
    ldy target_offset
    bpl :+
    jmp ANIMATE_FIRE_ENEMY
:   jmp ANIMATE_FIRE_PLAYER
; dark blue
BINST18_ANIMATE_FREEZE:
    ldy target_offset
    bpl :+
    jmp ANIMATE_FREEZE_ENEMY
:   jmp ANIMATE_FREEZE_PLAYER
; light blue
BINST19_ANIMATE_THUNDER:
    ldy target_offset
    bpl :+
    jmp ANIMATE_THUNDER_ENEMY
:   jmp ANIMATE_THUNDER_PLAYER
; yellow
BINST1A_ANIMATE_BEAM:
    ldy target_offset
    bpl :+
    jmp ANIMATE_BEAM_ENEMY
:   jmp ANIMATE_BEAM_PLAYER
; green, less frames of animation than the other ones
BINST1B_ANIMATE_CRIT:
    ldy target_offset
    bpl :+
    jmp ANIMATE_CRIT_ENEMY
:   jmp ANIMATE_CRIT_PLAYER

TryEnemyCall:
    ldy #ENEMY1_OFFSET
:   cpy attacker_offset             ; --
    beq :+                          ; +
    lda BATTLER_MINOR_STATUS, y
    and #CALLABLE
    bne EnemyJoins
:   tya                             ; +
    clc
    adc #BATTLER_DATASIZE
    tay
    bne :--                         ; --
    clc
    rts

; enemy successfully joined
EnemyJoins:
    sty target_offset
    jsr EnemyLongFlashing
    ldy target_offset
    lda BATTLER_MINOR_STATUS, y
    and #~CALLABLE
    sta BATTLER_MINOR_STATUS, y
    lda #BA_NONE
    sta BATTLER_ACTION_ID, y
    ldy attacker_offset
    lda BATTLER, y
    ldy target_offset
    sta BATTLER, y
    lda #$42                            ; enemy joined msg
    jsr DisplayText_battle
    sec
    rts

DepletePower:
    .ifdef VER_JP
    ldy attacker_offset
    sec
    lda BATTLER_CURR_PP,y
    sbc battle_input_num
    sta BATTLER_CURR_PP,y
    lda BATTLER_CURR_PP+1,y
    sbc battle_input_num+1
    sta BATTLER_CURR_PP+1,y
    bcs @exit
    lda #0
    sta BATTLER_CURR_PP,y
    sta BATTLER_CURR_PP+1,y
    @exit:
    .else
    lda #$19
    ldx #.LOBYTE(DepleteAttackerPP-1)
    ldy #.HIBYTE(DepleteAttackerPP-1)
    jsr TempUpperBankswitch
    .endif
    jmp B31_15e5

; Honestly completely useless and even negative, since there is logic in the battler turn routine to make them do nothing if they are deadge.
; The only effect this has is making group hitting moves stop hitting the player if the enemy died while using it. The only way this happens is from the enemy hitting a Barrier.
; I would honestly consider that bad behavior, since it makes no sense that the enemy's PK Fire just fizzles out if they die. It leads to unintuitive gameplay by making Barrier have hidden benefits (even if miniscule) if they are placed on the front of your party compared to the back.
BINSTCONDITION0_NOT_ATTACKER_TARGET_ALIVE:
    ldy attacker_offset
    lda BATTLER, y
    beq ConditionTrue
    lda BATTLER_STATUS, y
    bmi ConditionTrue


; The more sensible conditional that only checks for target being deadge.
BINSTCONDITION6_NOT_TARGET_ALIVE:
    ldy target_offset
    lda BATTLER, y
    beq ConditionTrue
    lda BATTLER_STATUS, y
    bmi ConditionTrue
; Condition False
    clc                         ; clears carry
    rts
    ConditionTrue:
    sec                         ; sets carry
    rts

; Used by Normal Attack and all its goons (various semi-clones) to determine if physical missed.
; Uses Fight in calculation. "Base chance" to dodge is ~10% (26/256).
; Certain status conditions prevent dodging alltogether.
; The tank being active also prevents dodging, which is good for you since the tank script sets Barrier on the whole party.
BINSTCONDITION1_DODGED:
    lda is_tank
    bne @DodgeFalse
    ldy target_offset
    lda BATTLER_STATUS, y
    and #PETRIFICATION | PARALYSIS | SLEEP
    bne @DodgeFalse
    lda BATTLER_MINOR_STATUS, y
    bmi @DodgeFalse
    lda BATTLER_CORES, y
    sta battle_wordvar60
    ldy attacker_offset
    lda BATTLER_CORES, y
    sta battle_wordvar62
    jsr DoFightEquation
    lda battle_wordvar60
    cmp battle_wordvar62
    bcs @DodgeTrue  ; why this doesn't branch/jump up to @ConditionTrue is beyond me
@DodgeFalse:
    clc
    rts
@DodgeTrue:
    sec
    rts

; Same calculation as chance to Dodge.
; The invincibility scripts being active prevent critical hits, which is purely visual since they all don't obey the normal rules of damage anyways.
BINSTCONDITION2_CRIT:
    jsr SEC_IsInvinciblityOn
    bcs :+
    ldy attacker_offset
    lda BATTLER_CORES, y
    sta battle_wordvar60
    ldy target_offset
    lda BATTLER_CORES, y
    sta battle_wordvar62
    jsr DoFightEquation
    lda battle_wordvar62
    cmp battle_wordvar60
:   rts

; Only runs 50-50 check if attacker_offset is blinded
BINSTCONDITION3_BLIND_MISS:
    ldy attacker_offset
    lda BATTLER_MINOR_STATUS, y
    and #BLIND
    eor #BLIND
    rol a
    bcs :+
    jsr RNG_BYTE
    and #$80                    ; 50-50
    rol a
:   rts

; checks if attacker does not have the tank
BINSTCONDITION4_NOT_USING_TANK:
    lda attacker_offset
    bmi :+                      ; enemies can never have tank
    lda is_tank                 ; check is_tank to see if set
    beq :+
    clc                         ; tank is active
    rts
:   sec                         ; tank is inactive
    rts

; famous condition used by Beam gamma to determine reflection
; This is the only way to reflect Beam gamma
BINSTCONDITION5_NO_BADGE:
    ldy target_offset
    bmi @NoBadgeTrue                   ; skip logic if target is an enemy
    ; load target's inventory
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1

    ldy #Inventory_Offset
 @loop:
    lda (battle_wordvar60), y
    cmp #ITEM_BADGE
    beq @NoBadgeFalse
    iny                                 ; inc inventory counter
    cpy #Inventory_Offset+8              ; past final inv slot
    bne @loop
 ;  jmp @NoBadgeTrue

@NoBadgeTrue:                           ; does not have badge
    sec
    rts
@NoBadgeFalse:                          ; has the franklin badge
    clc
    rts

; for some reason, enemies with immunity bit are not considered weak to bug spray even if they have the insect bit. This never happens in vanilla regardless.
BINSTCONDITION7_NOT_INSECT:
    ldy target_offset
    lda BATTLER_RESISTANCES, y
    and #IMMUNITY
    bne @NotInsectTrue
    lda BATTLER_RESISTANCES, y
    and #INSECT
    bne @NotInsectFalse
@NotInsectTrue:                         ; is not an insect
    sec
    rts
@NotInsectFalse:                        ; is an insect
    clc
    rts

; no requirement 50-50
BINSTCONDITION8_50_50:
    jsr RNG_BYTE
    asl a
    rts

; returns if immunity bit is NOT set
BINSTCONDITION9_NOT_HAS_IMMUNITY:
    ldy target_offset
    lda BATTLER_RESISTANCES, y
    and #IMMUNITY
    eor #IMMUNITY
    rol a
    rts

; returns if mental immunity bit is NOT set
BINSTCONDITIONA_NOT_RESIST_MENTAL:
    ldy target_offset
    lda BATTLER_RESISTANCES, y
    and #MENTAL
    eor #MENTAL
    cmp #$01
    rts

; sees if battle is triggered (not random).
; different from battle being scripted
BINSTCONDITIONB_NOT_TRIGGERED_BATTLE:
    lda is_scripted
    bne :+
    sec
    rts
:   clc
    rts

; must be non-NPC (not character ID 6 or 7)
BINSTCONDITIONC_NOT_TARGET_PLAYERCHAR:
    ldy target_offset
    lda BATTLER_PLAYER_ID, y
    and #EVE
    eor #EVE
    cmp #$01
    rts

.ifndef VER_JP
; checks for bscript 5 or 6
BINSTCONDITIOND_NOT_GIEGUE_FIGHT:
    lda battle_script
    cmp #BSCRIPT_GIEGUE_YAPPING
    beq :+
    cmp #BSCRIPT_GIEGUE_FIGHTING
    beq :+
    sec
    rts
:   clc
    rts
.endif

DoFightEquation:
    lda #$01
    sta battle_wordvar60+1
    sec
    lda battle_wordvar60
    sbc battle_wordvar62
    sta battle_wordvar60
    lda battle_wordvar60+1
    sbc #$00
    lsr a
    ror battle_wordvar60
    sec
    lda battle_wordvar60
    sbc #$66
    bcs :+
    lda #$00
:   sta battle_wordvar60
    jsr RNG_BYTE
    sta battle_wordvar62
    rts

; Sets Carry to NOT Blocked, i.e.
;   Carry Set   (True)  when Attacker is Not Blocked
;   Carry Clear (False) when Attacker is Blocked
SetCarryAttackerNotBlocked:
    ldy attacker_offset
    lda BATTLER_MINOR_STATUS, y
    and #BLOCK
    eor #BLOCK
    cmp #$01
    rts

SubtractPP:
    ldy attacker_offset
    sec
    lda BATTLER_CURR_PP, y
    sbc battle_input_num
    lda BATTLER_CURR_PP+1, y
    sbc battle_input_num+1
    rts

BINST50_NOP:
    rts

; Picks a completely random valid target if confused.
BINST51_TARGET_SELECTED:
    ldy attacker_offset
    lda BATTLER_STATUS, y
    and #CONFUSE
    bne @TARGET_WHILE_CONFUSED
    lda BATTLER_TARGET, y
    sta target_offset
    rts
@TARGET_WHILE_CONFUSED:
    jsr RNG_BYTE
    and #$e0
    tay
    lda BATTLER, y
    beq @TARGET_WHILE_CONFUSED
    lda BATTLER_STATUS, y
    bmi @TARGET_WHILE_CONFUSED
    sty target_offset
    rts

; Targets Opposing Leader
; Picks random leader if Confused
BINST52_TARGET_OPPOSING_LEADER:
    ldy attacker_offset
    lda BATTLER_STATUS, y
    and #CONFUSE
    beq TARGET_OPPOSING_LEADER
    jsr RNG_BYTE
    and #$80                            ; 50-50
    bne TARGET_OUR_LEADER
    TARGET_OPPOSING_LEADER:
    ldx #$80
    lda attacker_offset
    bpl :+
    ldx #$00
:   stx target_offset
    rts

; Targets Our Leader
; Picks random leader if Confused
BINST53_TARGET_OUR_LEADER:
    ldy attacker_offset
    lda BATTLER_STATUS, y
    and #$08
    beq TARGET_OUR_LEADER
    jsr RNG_BYTE
    and #$80
    bne TARGET_OPPOSING_LEADER
    TARGET_OUR_LEADER:
    ldx #$00
    ldy attacker_offset
    bpl :+
    ldx #$80
:   stx target_offset
    rts

BINST54_TARGET_SELF:
    lda attacker_offset
    sta target_offset
    rts

; Always targets our leader, unaffected by Confusion.
; Only used by PSI Shield beta in vanilla. Completely unnecessary imo. As if Confusion needed any kind of nerf.
BINST55_TARGET_OUR_LEADER_GUARANTEED:
    ldx #$00
    ldy attacker_offset
    bpl :+
    ldx #$80
:   stx target_offset
    rts

; Advances Targeting to next Battler slot
BINST56_TARGET_NEXT:
    clc
    lda target_offset
    adc #BATTLER_DATASIZE
    sta target_offset
    rts

; Normal Attack Damage = AttackerOFF - (DefenderDEF / 2)
; If DEF > OFF, Damage = (3 * AttackerOFF - DefenderDEF ) / 4
BINST60_SETNUMBASH:
    ldy target_offset
    lda BATTLER_DEF, y
    sta battle_wordvar64        ; $64,65 = target defense
    lda BATTLER_DEF+1, y
    sta battle_wordvar64+1
    sec

    ldy attacker_offset
    lda BATTLER_OFF, y
    sta battle_wordvar66            ; $66,67 = attacker offense
    sta battle_wordvar68
    sbc battle_wordvar64
    lda BATTLER_OFF+1, y
    sta battle_wordvar66+1

    sta battle_wordvar68+1        ; $68 = attacker offense
    sbc battle_wordvar64+1
    bcc @SETNUM_WeakBash
    lsr battle_wordvar64+1
    ror battle_wordvar64
    sec
    lda battle_wordvar66
    sbc battle_wordvar64
    sta battle_wordvar60
    lda battle_wordvar66+1
    sbc battle_wordvar64+1
    sta battle_wordvar60+1     ; $60 = offense + defense/2
    ; jmp @CheckTeddyScript

; check if Teddy Fight
; if so, setnum to random(1, 8)
@CheckTeddyScript:
    lda battle_script
    cmp #BSCRIPT_TEDDY
    bne :+
; do Teddy script setnum
    jsr RNG_BYTE
    and #$07
    ora #$04
    sta battle_wordvar60
    lda #$00
    sta battle_wordvar60+1

:   lda battle_wordvar60
    ora battle_wordvar60+1
    bne :+
    inc battle_wordvar60       ; min dmg = 1
:   lda battle_wordvar60
    sta battle_input_num
    lda battle_wordvar60+1
    sta battle_input_num+1
    rts

@SETNUM_WeakBash:
    asl battle_wordvar66
    rol battle_wordvar66+1
    clc
    lda battle_wordvar66
    adc battle_wordvar68
    sta battle_wordvar66
    lda battle_wordvar66+1
    adc battle_wordvar68+1
    sta battle_wordvar66+1              ; offense += defense/2
    sec
    lda battle_wordvar66
    sbc battle_wordvar64
    sta battle_wordvar60
    lda battle_wordvar66+1
    sbc battle_wordvar64+1
    sta battle_wordvar60+1
    bcs :+
    lda #$00
    sta battle_wordvar60
    sta battle_wordvar60+1
:   lsr battle_wordvar60+1
    ror battle_wordvar60
    lsr battle_wordvar60+1
    ror battle_wordvar60
    jmp @CheckTeddyScript


; Damage = AttackerOFF
; If Teddy Script, setnum to rand(1, 16)
BINST61_SETNUMCRIT:
    ldy attacker_offset
    lda BATTLER_OFF, y
    sta battle_input_num
    lda BATTLER_OFF+1, y
    sta battle_input_num+1
    lda battle_script
    cmp #BSCRIPT_TEDDY
    bne :+
    jsr RNG_BYTE
    and #$0f
    ora #$08
    sta battle_input_num
    lda #$00
    sta battle_input_num+1
:   rts

; Set Num to whatever the argument was (1 byte only)
; Clears input hi
BINST62_SETNUM:
    lda battle_wordvar64
    sta battle_input_num
    lda #$00
    sta battle_input_num+1
    rts

; Does Giegue Speech
; uses battle_bytevar55 as an incrementing counter to count his speeches
; Stops at hard coded value set to index of his final yap.
BINST63_GIEGUE_SPEECH:
    lda battle_script
    cmp #BSCRIPT_GIEGUE_YAPPING
    bne :++                     ; branch to rts
    lda battle_bytevar55
    jsr DisplayText_battle
    ldx battle_bytevar55
    inx
    cpx #$9e                    ; index of Giegue's final yap speech
    bne :+                      ; skip changing battle script from 5 to 6
    inc battle_script
:   stx battle_bytevar55
:   rts

; Divides SetNum by 2 if Resistance is set
; .byte Arg : Resistance (bitfield)
BINST64_DO_RESISTANCE:
    lda battle_bytevar57
    ora battle_wordvar64
    sta battle_bytevar57
    rts

BINST65_CHECK:
    lda #$6a                        ; attacker checked target msg
    jsr DisplayText_battle
;jp doesnt have battlescript checking
.ifdef VER_JP
    jsr SEC_IsInvinciblityOn
    bcs BINST_ILLEGAL_MOVE_EFFECT
.else
    lda battle_script
    cmp #BSCRIPT_GREYROBO
    bne @CheckRedRobo
; Invincibility descriptions
; no diff from normal description except that it doesn't print stats or resistances, only description text
; Multiple separate conditionals likely holdout from JP version, where normal enemies don't have descriptions. Needlessly complicated code in US version.
    lda #$95
    jmp DisplayText_battle

@CheckRedRobo:
    cmp #BSCRIPT_REDROBO
    bne @CheckBlueRobo
    lda #$94                        ; red robo desc
    jmp DisplayText_battle

@CheckBlueRobo:
    cmp #BSCRIPT_BLUEROBO
    bne @CheckGiegueYapping
    lda #$93                        ; blue robo desc
    jmp DisplayText_battle

@CheckGiegueYapping:
    cmp #BSCRIPT_GIEGUE_YAPPING
    bne @CheckGiegueFighting
    lda #$01                        ; giegue desc (Queen Mary yapping at you)
    jmp DisplayText_battle

@CheckGiegueFighting:
    cmp #BSCRIPT_GIEGUE_FIGHTING
    bne @CheckEnemy
    lda #$01                        ; ditto (why programmed in this way)
    jmp DisplayText_battle

@CheckEnemy:
    ldy target_offset
    bmi @DoCheck              ; Checking fails on player characters
    lda #$90                        ; Move failed msg
    jmp DisplayText_battle

@DoCheck:
.endif
    ; load target off and def & store to 0590~0593
    ldy target_offset
    ; offense -> $0590
    lda BATTLER_OFF, y
    sta wordvar_0590
    lda BATTLER_OFF+1, y
    sta wordvar_0590+1
    ; defense -> $0592
    lda BATTLER_DEF, y
    sta wordvar_0592
    lda BATTLER_DEF+1, y
    sta wordvar_0592+1

    lda #$24                        ; print offense msg
    jsr DisplayText_battle
    lda #$25                        ; print defense msg
    jsr DisplayText_battle

    ; load target resistances
    ldy target_offset
    lda BATTLER_RESISTANCES, y

    pha                             ; copy value to stack
    and #FIRE
    beq :+
    lda #$6b                        ; resists fire msg
    jsr DisplayText_battle

:   pla                             ; retrieve original value from stack
    pha                             ; put new copy back in
    and #ICE
    beq :+
    lda #$6c                        ; resists ice msg
    jsr DisplayText_battle

:   pla                             ; again
    pha
    and #ELECTRIC
    beq :+
    lda #$6d                        ; resists electric msg
    jsr DisplayText_battle

    ; ...yes. That's right. Infamously, MOTHER does not show Light resistance.
    ; It does not show status immunity or mental resistance either.

:   pla
    pha
    and #IMMUNITY
    bne :+          ; ??????
    ; They bothered to check for Immunity bit yet does nothing useful with it??

    pla
    pha
    and #INSECT
    beq :+
    lda #$6f                        ; weak to bug spray msg
    jsr DisplayText_battle

;jp simply exits.
;us displays a null message.
:   pla
    .ifdef VER_JP
    rts
    .else
    lda #$ff                        ; null msg

    jmp DisplayText_battle
    .endif

; Complete abomination. Several BAs have conditional jumps that point directly to this address, instead of being sane and using the scripts the devs programmed.
; This text is printed when "illegal" moves are used, like Powershield during scripted fight or Dimension Slip during triggered fight.
BINST_ILLEGAL_MOVE_EFFECT:
    lda #$90                        ; Move failed msg
    jmp DisplayText_battle

; plays normal attack sound depending on if player or enemy
BINST66_PLAYATTACKSOUND:
    ldx #SFX_EnemyAttack
    lda attacker_offset
    bmi :+
    ldx #SFX_PlayerAttack
:   txa
    jmp PlayBattleSFX

; really stupid waste of space & effort since all BAs that use LoadSound call PlaySound, and almost all BAs only load 1 sound at most
BINST67_LOADSOUND:
    lda battle_wordvar64
    sta battle_bytevar58
    rts

BINST68_PRINTTEXT:
    lda battle_wordvar64
    jmp DisplayText_battle

BINST69_PLAYSOUND:
    lda battle_wordvar64
    jmp PlayBattleSFX

; Parses the various Death Actions and does the appropriate action
; Used for Flames, Explode, and EVE Explosion
; Y should be set to target offset
DeathActionInterpreter:
    tya
    bmi @CheckFlames
; CheckEVE
    lda BATTLER_PLAYER_ID, y
    cmp #EVE
    bne @CheckFlames            ; ?? why not jump to return?? As if Players can Explode???
; EVE Death effect
    lda #BSCRIPT_NONE            ; sets battle script to 0, so the red robo dies to the ohko effect
    sta battle_script
    ldx #BA_EVEEXPLOSION         ; id of EVE Death effect
    jmp DoDeathActionInX
@CheckFlames:
    jsr GetDeathActionBits
    cmp #DEATHEFFECT_FLAMES
    bne @CheckExplode
; Flames death effect
    ldx #BA_FLAMES
    jmp DoDeathActionInX
@CheckExplode:
    cmp #DEATHEFFECT_EXPLODE
    bne :+
; Explode death effect
    ldx #BA_EXPLODE
    jmp DoDeathActionInX
; make target do the unalive
:   jsr KillTargetInY
    jmp PrintDeathMsg

; does BA in X and then kills self
DoDeathActionInX:
    lda target_offset
    pha
    lda attacker_offset
    pha
    lda battle_var5e+1
    pha
    lda battle_var5e
    pha
    sty attacker_offset
    txa
    jsr PerformBattleAction2
    pla
    sta battle_var5e
    pla
    sta battle_var5e+1
    pla
    sta attacker_offset
    pla
    sta target_offset
    tay
    jmp PrintDeathMsg

; kills whoever is in Y (offset)
KillTargetInY:
    tya
    pha
    lda #$00
    sta BATTLER_CURR_HP, y
    sta BATTLER_CURR_HP+1, y
    lda #UNCON
    sta BATTLER_STATUS, y
    tya
    bpl KillPlayerEffect
    lda #$00
    sta BATTLER, y
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1
    tya
    pha
    clc

    ;add defeated enemy exp
    ldy #enemy_struct::exp
    lda (battle_wordvar60), y
    adc battle_reward_vars
    sta battle_reward_vars
    iny
    lda (battle_wordvar60), y
    adc battle_reward_vars+1
    sta battle_reward_vars+1
    lda #0
    adc battle_reward_vars+2
    sta battle_reward_vars+2
    clc

    ;add defeated enemy money
    ldy #enemy_struct::money
    lda (battle_wordvar60), y
    adc battle_reward_vars+3
    sta battle_reward_vars+3
    iny
    lda (battle_wordvar60), y
    adc battle_reward_vars+4
    sta battle_reward_vars+4

    ;get defeated enemy item drop
    ldy #enemy_struct::item_drop
    lda (battle_wordvar60), y
    ;if item drop is 0, skip
    beq @no_item_to_drop
    ;else, write to enemy_group
    sta enemy_group
    @no_item_to_drop:
    lda #Noise_EnemyKilled
    sta soundqueue_noise
    pla
    tay
    jsr DoEnemyDeadAnimation
    jmp KillTargetReturn

KillPlayerEffect:
    lda #SFX_Unconned
    jsr PlayBattleSFX
    KillTargetReturn:
    jsr B31_15e5
    pla
    tay
    rts

PrintDeathMsg:
    tya
    pha
    bmi PrintDeathMsgEnemy              ; branch if enemy
    lda BATTLER_PLAYER_ID, y
    cmp #EVE                             ; eve has no death msg
    beq PrintDeathMsgReturn
; PrintDeathMsgPlayer
    lda #$10                            ; player died msg
    jsr DisplayText_battle
    jmp PrintDeathMsgReturn
PrintDeathMsgEnemy:
    lda battle_script
    cmp #BSCRIPT_GIEGUE_FIGHTING
    beq PrintDeathMsgReturn
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1
    ldy #$0a
    lda (battle_wordvar60), y
    and #$1c
    lsr a
    lsr a
    clc
    adc #$79                            ; enemy defeat msg starting offset id
    jsr DisplayText_battle
    PrintDeathMsgReturn:
    pla
    tay
    rts

; Gets the 2 death action bits from a battler's Offense-hi.
; for whatever reason, lower 2 bits of hi byte are the death action. These people must've been using some kind of macro or other higher level language, because this is insanity.
; Parameters:
;   Y                   : battler local offset
; Return:
;   battle_wordvar60    : .byte Death Action
;   A                   : "
GetDeathActionBits:
    tya
    pha
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1
    ldy #Off_Offset+1                    ; hi byte of Offense
    lda (battle_wordvar60), y
    and #$1c
    lsr a
    lsr a
    sta battle_wordvar60
    pla
    tay
    lda battle_wordvar60
    rts

; Organizes Inventory by pushing all items towards ID 0.
; i.e. there shouldn't be any empty spaces between items.
; Called after attacker's inventory is modified from using consumable, item breaking.
OrganizeAttackerInv:
    ; loads attacker's inventory
    ldy attacker_offset
    clc
    lda BATTLER_FULLDATA_PTR, y         ; offset $18
    adc #$20
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y       ; offset $1A
    adc #$00
    sta battle_wordvar60+1
    ldy attacker_offset
    lda BATTLER_TEMP_VARS, y
    tay
    ; jmp OrganizeInv

; Actually does logic of organizing inventory.
; Steal JMPs here since the defender's inventory is already loaded.
OrganizeInv:
    jsr EnablePRGRam
:   cpy #$07                            ; do (y = 7)
    beq :+
    iny
    lda (battle_wordvar60), y
    dey
    sta (battle_wordvar60), y
    iny
    bne :-                              ; while (y > 0) y--
:   lda #$00                            ; conclusion
    sta (battle_wordvar60), y
    jmp WriteProtectPRGRam

EnemyLongFlashing:
    jsr LoadEnemyLetterExtrabits
    lda BATTLER_STATUS, y
    and #~UNCON
    sta BATTLER_STATUS, y
    lda #$22
    sta battle_wordvar60
    lda #$ff
    sta battle_wordvar60+1
    lda #$ff
    sta battle_wordvar62
    jsr AnimateEnemyHitRoutine
    lda #$00
    sta $45
    tya
    pha
    lda BATTLER_LETTER, y
    and #$03                            ; lo 2 bits of BATTLER LETTER used for counters
    tax
    ldy #$1f
    lda (ptr_chara), y
    sta $40, x
    pla
    tay
    lda BATTLER_TARGET, y
    ldx battle_wordvar64+1
    sta bytevar_0300, x
    lda #$01
    sta $e5
    jsr WaitNMI
    lda #$80
    sta $e5
    rts

DoEnemyDeadAnimation:
    jsr LoadEnemyLetterExtrabits
    lda #$00
    ldx battle_wordvar64+1
    sta bytevar_0300, x
    lda #$01
    sta $e5
    jsr WaitNMI
    lda #$80
    sta $e5
    lda #$00
    sta BATTLER, y
    lda #$00
    sta battle_wordvar60
    lda #$23
    sta battle_wordvar60+1
    lda #$01
    sta battle_wordvar62
    jsr AnimateEnemyHitRoutine
    lda BATTLER_LETTER, y
    and #$03
    tax
    lda #$7c
    sta $40, x
    rts

AnimateEnemyHitRoutine:
    tya
    pha
    lda BATTLER_LETTER, y
    and #$03
    tax
    ldy #$1f
    lda (ptr_chara), y
    ora #$80
    sta $40, x
    pla
    tay
    lda #$80
    sta $45
    B23_159f:
    lda battle_wordvar60
    sta $44
    and #$01
    bne B23_15ad
    lda $45
    eor #$40
    sta $45
    B23_15ad:
    jsr WaitNMI
    clc
    lda battle_wordvar60
    adc battle_wordvar62
    sta battle_wordvar60
    cmp battle_wordvar60+1
    bne B23_159f
    rts

; load the extra 2 bits in enemy letter
LoadEnemyLetterExtrabits:
    lda BATTLER_FULLDATA_PTR, y
    sta ptr_chara
    lda BATTLER_FULLDATA_PTR+1, y
    sta $5d
    lda BATTLER_LETTER, y
    and #$03                        ; lo 2 bits of letter
    sta battle_wordvar64
    asl a
    asl a
    asl a
    sta battle_wordvar64+1
    rts

ANIMATE_NORMAL_ENEMY:
    lda #$0f                        ; transparent color
    ldx #$03
    jmp DoAnimateEnemyHit

ANIMATE_FIRE_ENEMY:
    lda #$16                        ; bright red
    ldx #$03
    jmp DoAnimateEnemyHit

ANIMATE_FREEZE_ENEMY:
    lda #$12                        ; dark blue
    ldx #$03
    jmp DoAnimateEnemyHit

ANIMATE_THUNDER_ENEMY:
    lda #$31                        ; light blue
    ldx #$03
    jmp DoAnimateEnemyHit

ANIMATE_BEAM_ENEMY:
    lda #$28                        ; bright yellow
    ldx #$03
    jmp DoAnimateEnemyHit

ANIMATE_CRIT_ENEMY:
    lda #$2a                        ; neon green
    ldx #$03
    jmp DoAnimateEnemyHit

AnimateGiegueDefeat:
    ldx #$03
:   txa                         ; --
    pha
    lda #Noise_Crit
    sta soundqueue_noise
    jsr RNG_BYTE
    and #$03
    tax
    inx
:   txa                         ; -
    pha
    lda #Noise_Hit
    sta soundqueue_noise
    pla
    pha
    ldx #$03
    jsr DoAnimateEnemyHit
    pla
    tax
    dex
    bne :-                      ; -
    pla
    tax
    dex
    bne :--                     ; --
    rts

DoAnimateEnemyHit:
    sta battle_wordvar60+1
    stx battle_wordvar60
    lda #SFX_Hit
    jsr PlayBattleSFX
    ldy target_offset
    jsr LoadEnemyLetterExtrabits
    jsr PpuSync
    ldx battle_wordvar60
:   txa                             ; animate loop start
    pha
    ldx battle_wordvar64+1
    lda bytevar_0300, x
    pha
    lda #$00
    sta bytevar_0300, x
    lda #$01
    sta $e5
    jsr WaitNMI
    lda #$7c
    ldx battle_wordvar64
    sta $40, x
    lda battle_wordvar60+1
    jsr SetBGColorA
    jsr WaitNMI
    pla
    ldx battle_wordvar64+1
    sta bytevar_0300, x
    lda #$01
    sta $e5
    jsr WaitNMI
    ldy #$1f
    lda (ptr_chara), y
    ldx battle_wordvar64
    sta $40, x
    jsr SetBGColorBlack
    jsr WaitNMI
    pla
    tax
    dex
    bne :-                          ; while condition
    rts

ANIMATE_LONG_ENEMY:
    lda #SFX_Hit
    jsr PlayBattleSFX
    jsr LoadEnemyLetterExtrabits
    ldy target_offset
    lda BATTLER_TARGET, y
    pha
    ldx battle_wordvar64+1
    lda bytevar_0300, x
    ldy target_offset
    sta BATTLER_TARGET, y
    lda #$00
    ldx battle_wordvar64+1
    sta bytevar_0300, x
    lda #$01
    sta $e5
    jsr WaitNMI
    lda #$80
    sta $e5
    ldy target_offset
    jsr EnemyLongFlashing
    pla
    ldy target_offset
    sta BATTLER_TARGET, y
    rts

ANIMATE_NORMAL_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake)
    ldy #.HIBYTE(battleanim_Generic_Shake)
    lda #$0f ; transparent color
    jmp DoAnimatePlayerHit

ANIMATE_FIRE_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake)
    ldy #.HIBYTE(battleanim_Generic_Shake)
    lda #$16 ; dark red
    jmp DoAnimatePlayerHit

ANIMATE_FREEZE_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake)
    ldy #.HIBYTE(battleanim_Generic_Shake)
    lda #$12 ; dark blue
    jmp DoAnimatePlayerHit

ANIMATE_THUNDER_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake)
    ldy #.HIBYTE(battleanim_Generic_Shake)
    lda #$31 ; light blue
    jmp DoAnimatePlayerHit

ANIMATE_BEAM_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake)
    ldy #.HIBYTE(battleanim_Generic_Shake)
    lda #$28 ; yellow
    jmp DoAnimatePlayerHit

ANIMATE_CRIT_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake2) ; faster animation than #$41
    ldy #.HIBYTE(battleanim_Generic_Shake2)
    lda #$2a ; green
    jmp DoAnimatePlayerHit

ANIMATE_FAST_PLAYER:
    ldx #.LOBYTE(battleanim_Generic_Shake2) ; faster animation than #$41
    ldy #.HIBYTE(battleanim_Generic_Shake2)
    lda #$0f ; transparent color
    jmp DoAnimatePlayerHit

ANIMATE_LONG_PLAYER:
    ldx #.LOBYTE(battleanim_Wobble)
    ldy #.HIBYTE(battleanim_Wobble)
    lda #$0f ; transparent color
    jmp DoAnimatePlayerHit ;epic fall through fail

;a == NES color
;y:x == animation pointer (bank 16)
DoAnimatePlayerHit:
    ;store color
    sta battle_wordvar64
    ;store animation pointer
    stx battle_wordvar60
    sty battle_wordvar60+1
    lda #$10
    jsr PlayBattleSFX
    jsr PpuSync

    ;battle_wordvar62 = loop
    ldy #0
    lda (battle_wordvar60), y
    sta battle_wordvar62
    ;battle_wordvar62+1 = length
    iny
    lda (battle_wordvar60), y
    sta battle_wordvar62+1

    clc

    ;move pointer into actual anim frames
    ;battle_wordvar60 += 2
    lda battle_wordvar60
    adc #2
    sta battle_wordvar60
    lda battle_wordvar60+1
    adc #0
    sta battle_wordvar60+1

    @new_loop:
    ldy #0
    @new_frame:
    ;store current index
    tya
    pha
    ;if urrent index % 2 == 0, set bg to black
    and #%00000010
    beq @setblack
    ;else, set bg to chosen color
    lda battle_wordvar64
    jsr SetBGColorA
    jmp @skip_setblack
    @setblack:
    jsr SetBGColorBlack
    @skip_setblack:

    ;restore current index
    pla
    tay

    ;set ymove
    lda (battle_wordvar60), y
    sta shift_y
    iny
    ;set xmove
    lda (battle_wordvar60), y
    sta shift_x
    iny

    lda #1
    sta nmi_flags
    jsr WaitNMI

    ;if y != length, keep going
    cpy battle_wordvar62+1
    bne @new_frame
    ;else, if --loopcount > 0, loop
    dec battle_wordvar62
    bne @new_loop

    ;reset ymove and xmove
    lda #0
    sta shift_x
    sta shift_y
    jsr WaitNMI

    ;bye bye
    jmp SetBGColorBlack

; Concludes the Fight.
; Multiple different endings depending on what kind of scenario. Covers everything from winning, losing, running, Dimension Slipping, losing to Blue Robo, etc.
ConcludeBattle:
    lda battle_endtype
    cmp #ENDTYPE_RUN
    beq @ConcludeBattleReturn
    cmp #ENDTYPE_DIMENSION_SLIP
    beq @ConcludeBattleReturn
    ldy #$00
; check for players losing (all non-NPCs are dead/petrify/para)
@CheckPlayersLose:
    ; ignore empty player slot
    lda BATTLER, y
    beq @SkipDeadgeCheck
    ; ignore NPCs EVE and Flying Man
    lda BATTLER_PLAYER_ID, y
    and #EVE
    eor #EVE
    beq @SkipDeadgeCheck
    ; see if every PC is deadge or equivalent in battle
    lda BATTLER_STATUS, y
    and #UNCON | PETRIFICATION | PARALYSIS
    beq PlayersWinRoutine
@SkipDeadgeCheck:
    ; check the next player
    tya
    clc
    adc #BATTLER_DATASIZE
    tay
    bpl @CheckPlayersLose           ; clever since enemies start at offset $80

    lda #$80
    sta BATTLER_STATUS
    sta $0621
    sta $0641
    sta $0661
    lda battle_script
    cmp #BSCRIPT_BLUEROBO
    bne @NormalL
    lda #ENDTYPE_BLUEROBO_SLIP
    sta battle_endtype ; set endtype so overworld knows to play the lloyd scene and teddy deadge flags
; Do BlueRobo defeat script (in-battle, overworld effects handled by overworld engine)
    lda #SFX_Thunder
    jsr PlayBattleSFX
    lda #$8f                        ; blue robo escapes msg
    jsr DisplayText_battle
    jmp @ConcludeBattleReturn
@NormalL:
    lda #$00
    sta attacker_offset             ; ?? useless
    lda #$0e                        ; defeat msg
    jsr DisplayText_battle
@ConcludeBattleReturn:
    sec
    rts

PlayersWinRoutine:
    lda BATTLER_ENEMY1
    ora BATTLER_ENEMY2
    ora BATTLER_ENEMY3
    ora BATTLER_ENEMY4
    bne SetCarryIsBSCRIPTTeddy         ; branch when enemies are still alive

    lda is_tank
    beq :+
    ; Print Tank Deadge msg
    ; funnily enough, the tank dies even if it never gets hit or used. it always dies immediately after the 1st fight since it always blows up at battle conclusion if active
    lda #$31 ; tank deadge msg
    jsr DisplayText_battle
    ; continue
:   lda battle_script
    cmp #BSCRIPT_GIEGUE_FIGHTING
    bne NormalWin
; Giegue Fight Win
; Full Restores Party
    lda #PLAYER1_OFFSET              ; 00
    sta target_offset
    jsr BINST_FullRestore
    lda #PLAYER2_OFFSET
    sta target_offset
    jsr BINST_FullRestore
    lda #PLAYER3_OFFSET
    sta target_offset
    jsr BINST_FullRestore
    jmp WinReturn

NormalWin:
    lda #MUSIC_WIN
    jsr ChangeMusic
    lda #$0d                        ; players win msg
    jsr DisplayText_battle
    WinReturn:
    sec
    rts

; Set Carry to is Teddy Script
SetCarryIsBSCRIPTTeddy:
    lda battle_script
    cmp #BSCRIPT_TEDDY
    bne :+
    ldy #$00
    jsr B31_1673
    bcs :+
    sec
    rts
:   clc
    rts

; Effects
;   Bolster     : additive raise by 100%
;   Cripple     : additive drop by 50%
;   Raise/Lower : additive variable modification by flat number
;   Restore     : additive raise by flat number
BINST4_EFFECT:
    ;jptl from battle_var5e[1]
    ldy #1
    lda (battle_var5e), y
    jsr JSRTable

    .addr BINST4_RETURN
    .addr BINST4_00_RestoreHP
    .addr BINST4_01_RestorePP
    .addr BINST4_02_RaiseSpd
    .addr BINST4_03_BolsterOff
    .addr BINST4_04_BolsterDef
    .addr BINST4_05_MaxHP
    .addr BINST4_06_DoDamage
    .addr BINST4_07_LowerDef
    .addr BINST4_08_LowerFit
    .addr BINST4_09_OHKO
    .addr BINST4_0A_Cryo
    .addr BINST4_0B_CrippleOff
    .addr BINST4_0C_CrippleDef
    .addr BINST4_0D_BonusEXP
    .addr BINST4_0E_Suicide
    .addr BINST4_0F_Recoil
    .addr BINST4_10_Approach
    .addr BINST4_11_RaiseOff
    .addr BINST4_12_Blind
    .addr BINST4_13_Poison
    .addr BINST4_14_Confuse
    .addr BINST4_15_Sleep
    .addr BINST4_16_Paralyze
    .addr BINST4_17_Block
    .addr BINST4_18_Guard
    .addr BINST4_19_Shield
    .addr BINST4_1A_Barrier
    .addr BINST4_1B_Bind
    .addr BINST4_1C_Petrify
    .addr BINST4_1D_Asthma
    .addr BINST4_1E_Puzzle
    .addr BINST4_1f_CurePoison
    .addr BINST4_20_CureSleep
    .addr BINST4_21_CureParalysis
    .addr BINST4_22_CureAsthma
    .addr BINST4_23_CureConfusePuzzle
    .addr BINST4_24_CureShield
    .addr BINST4_25_CureUncon
    .addr BINST4_26_CurePetrification
    .addr BINST4_27_Magnet
    .addr BINST4_28_Steal
    .addr BINST4_29_Sing
    .addr BINST4_2A_ConfuseSelf

BINST4_RETURN:
    lda #$02                        ; advance script counter by 2
    jmp AdvanceAndContinue

; restores HP by num
BINST4_00_RestoreHP:
    jsr MOV_input_output
    RestoreHPEffect:                   ; jump location used by MaxHP
    ldx target_offset
    ldy #HP_Offset
    jsr RaiseBigStatByNum
    ldx #SFX_Recovery
    lda #$3e                        ; restored hp text
    jmp PlaySFX_X_PrintText_A

; same for PP
BINST4_01_RestorePP:
    jsr MOV_input_output
    ldx target_offset
    ldy #PP_Offset
    jsr RaiseBigStatByNum
    ldx #SFX_Recovery
    lda #$3d                        ; restored pp text
    jmp PlaySFX_X_PrintText_A

; raises Off by arg
; ex. Rage
BINST4_11_RaiseOff:
    jsr MOV_input_output
    ldx target_offset
    ldy #Off_Offset
    jsr RaiseBigStat
    lda #$20                        ; off raised msg
    jmp DisplayText_battle

; raises Spd by arg
; BUG : Speed Cap can overflow, meaning Speed boosting moves fail if Base Spd is >127
; Off and Def effectively don't have this issue since they are 16-bit values
BINST4_02_RaiseSpd:
    jsr MOV_input_output
    ldx target_offset
    ldy #Spd_Offset
    jsr RaiseSmallStat
    ldx #SFX_StatBoost
    lda #$23                        ; spd raised msg
    jmp PlaySFX_X_PrintText_A

; kills battler in attacker_offset
BINST4_0E_Suicide:
    ldy attacker_offset
    jmp KillTargetInY

; The famously goated effect that makes Ninten the best character in the series.
; They knew this effect was broken, because no enemies have access to it.
BINST4_03_BolsterOff:
    ldx target_offset
    ldy #Off_Offset
    jsr BolsterBigStat
    ldx #SFX_StatBoost
    lda #$20                        ; off raised msg
    jmp PlaySFX_X_PrintText_A

; Defense boosting is great for Zoo & early game, but completely falls off a cliff after.
BINST4_04_BolsterDef:
    ldx target_offset
    ldy #Def_Offset
    jsr BolsterBigStat
    ldx #SFX_StatBoost
    lda #$22                        ; def raised msg
    jmp PlaySFX_X_PrintText_A

; Restores HP by 16-bit unsigned limit
BINST4_05_MaxHP:
    lda #$ff
    sta battle_input_num
    sta battle_input_num+1
    jmp RestoreHPEffect

; Effect only used at end of Giegue fight
; Full restores the target. Only diff from MaxHP & Heal Uncon is that it also cures all status.
BINST_FullRestore:
    lda #$ff
    sta battle_input_num
    sta battle_input_num+1
    lda #NO_STATUS
    ldx target_offset
    sta BATTLER_STATUS, x
    ldy #HP_Offset
    jsr RaiseBigStatByNum
    ldx #SFX_Recovery
    lda #$00                        ; doesn't print msg
    jsr PlaySFX_X_PrintText_A
    ldx #20                         ; add lag
    jmp WaitXFrames

; Does damage to self, with no message being printed at all
; The only move in vanilla that does recoil is Super Bomb (31 base)
BINST4_0F_Recoil:
    jsr MOV_input_output
    ldy attacker_offset
    sec
    lda BATTLER_CURR_HP, y
    sbc battle_wordvar60
    sta BATTLER_CURR_HP, y
    lda BATTLER_CURR_HP+1, y
    sbc battle_wordvar60+1
    sta BATTLER_CURR_HP+1, y
    bcc :+
    ora BATTLER_CURR_HP, y
    beq :+
    jmp B31_15e5
:   jmp DeathActionInterpreter

; Runs the damage routine
; In addition to lowering HP, it also runs cure chances for sleep, confuse, and puzzle
BINST4_06_DoDamage:
    lda battle_script
    cmp #BSCRIPT_GIEGUE_YAPPING
    beq DoDamage
    cmp #BSCRIPT_GIEGUE_FIGHTING
    beq DoDamage
    jsr SEC_IsInvinciblityOn
    bcc DoDamage
; sets damage number to fake arbitrary constants (not follow normal damage numbers)
; this is different from actually dealing HP damage, which is handled below.
; Giegue is a notable fight that obeys normal damage numbers; he just doesn't take HP damage.
DoFakeDamage:
    ldx #$03
    ldy attacker_offset
    lda BATTLER_PLAYER_ID, y
    cmp #EVE
    bne :+
    ldx #$3f
:   stx battle_wordvar60
    jsr RNG_BYTE
    and battle_wordvar60
    sta battle_input_num
    lda #$00
    sta battle_input_num+1

; does damage routine
DoDamage:
    lda target_offset
    pha
    jsr MOV_input_output
    ; check for barrier status
    ldy target_offset
    lda BATTLER_MINOR_STATUS, y
    and #BARRIER
    beq @DoDamageCont
; Barrier routine
    lda battle_wordvar60+1
    pha
    lda battle_wordvar60
    pha
    lda #$53                            ; barrier procced msg
    jsr DisplayText_battle
    pla
    sta battle_wordvar60
    pla
    sta battle_wordvar60+1
    ldy attacker_offset                 ; flip target to attacker!
    sty target_offset

@DoDamageCont:
    ; halve damage if shielded
    lda BATTLER_MINOR_STATUS, y
    and #SHIELD
    beq :+
    lsr battle_wordvar60+1
    ror battle_wordvar60
    ; halve damage if guarding (stacks)
:   lda BATTLER_MINOR_STATUS, y
    and #GUARD
    beq :+
    lsr battle_wordvar60+1
    ror battle_wordvar60
    ; apply resists if any (stacks)
:   jsr ApplyResistance
    lda battle_wordvar60
    ora battle_wordvar60+1
    bne :+
    inc battle_wordvar60
    ; copy dmg number to .word bytevar_0590
:   lda battle_wordvar60
    sta bytevar_0590
    pha
    lda battle_wordvar60+1
    sta bytevar_0591
    ; print dmg msg
    pha
    lda #$0c                            ; target took dmg msg
    jsr DisplayText_battle
    ; store dmg to battle_wordvar60
    pla
    sta battle_wordvar60+1
    pla
    sta battle_wordvar60
; @UpdateHP Start
    ; check for invincibility
    lda battle_script
    cmp #BSCRIPT_REDROBO
    beq :+
    jsr SEC_IsTargetEVE
    bcs @StatusCureOnHitRoutines
:   jsr SEC_IsInvinciblityOn
    bcs @StatusCureOnHitRoutines
; @UpdateHP Effect
    ldy target_offset
    sec
    lda BATTLER_CURR_HP, y
    sbc battle_wordvar60
    sta BATTLER_CURR_HP, y
    lda BATTLER_CURR_HP+1, y
    sbc battle_wordvar60+1
    sta BATTLER_CURR_HP+1, y
    bcc @DeathEffect
    ora BATTLER_CURR_HP, y
    beq @DeathEffect

@StatusCureOnHitRoutines:               ; try cure confuse & puzzle
    lda BATTLER_STATUS, y
    and #CONFUSE | PUZZLE
    beq @CheckSleepCure
    jsr RNG_BYTE
    and #$c0                            ; 1/4 chance of cure confuse & puzzle when hit
    bne @CheckSleepCure
    lda BATTLER_STATUS, y               ; confuse & puzzle cure success
    and #~(CONFUSE | PUZZLE)
    sta BATTLER_STATUS, y
    lda #$8d                            ; cure confuse msg
    jsr DisplayText_battle
@CheckSleepCure:                        ; try cure sleep
    lda BATTLER_STATUS, y
    and #SLEEP
    beq :+
    jsr RNG_BYTE
    and #$c0                            ; 1/4 chance of waking up when hit
    bne :+
    lda BATTLER_STATUS, y               ; sleep cure success
    and #~SLEEP
    sta BATTLER_STATUS, y
    lda #$61                            ; cure sleep msg
    jsr DisplayText_battle
; continue
:   pla
    sta target_offset
    jmp B31_15e5
@DeathEffect:
    jsr DeathActionInterpreter
    pla
    sta target_offset
    rts

; drops defense by arg
; resisted by mental resistance (halves effectiveness)
BINST4_07_LowerDef:
    jsr MOV_input_output
    ldy target_offset
    jsr ApplyResistance
    ldx target_offset
    ldy #Def_Offset
    jsr LowerBigStat
    lda #$27                            ; defense lowered msg
    jmp DisplayText_battle

; drops Fight by arg
BINST4_08_LowerFit:
    jsr MOV_input_output
    ldx target_offset
    ldy #Fit_Offset
    jsr LowerSmallStat
    lda #$26                            ; fight lowered msg
    jmp DisplayText_battle

; immediately kills target if invinciblity isn't active
BINST4_09_OHKO:
    jsr SEC_IsInvinciblityOn
    bcs :+
    ; funnily enough, it checks for EVE. The only way this procs in vanilla is if a confused player uses Fire omega or Super Bomb and hits the team. It would not hit EVE, but you would still die anyways & EVE dies if you die, making this check completely useless.
    jsr SEC_IsTargetEVE
    bcs :+
    ldy target_offset
    jmp DeathActionInterpreter
:   jmp DoFakeDamage

; sets target's HP to number between 1 and 4
; it can only fail on invincibility
BINST4_0A_Cryo:
    jsr SEC_IsInvinciblityOn
    bcs :+                              ; +
    jsr SEC_IsTargetEVE                 ; here the EVE check is relevant, since enemies on Holy Loly use Freeze gamma
    bcs :+                              ; +
    ldy target_offset
    jsr RNG_BYTE
    and #$03                            ; upper bound of random: 3
    tax
    inx
    txa
    sec
    sbc BATTLER_CURR_HP, y
    lda #$00
    sbc BATTLER_CURR_HP+1, y
    bcs :+
    txa
    sta BATTLER_CURR_HP, y
    lda #$00
    sta BATTLER_CURR_HP+1, y
    ldx #$00
    lda #$38                            ; target cryoed msg
    jmp PlaySFX_X_PrintText_A
:   jmp PrintNoEffect                   ; +

; drops off by ~50% additive
BINST4_0B_CrippleOff:
    ldx target_offset
    ldy #Off_Offset
    jsr CrippleBigStat
    lda #$21                            ; offense lowered msg
    jmp DisplayText_battle

; drops def by ~50% additive
BINST4_0C_CrippleDef:
    ldx target_offset
    ldy #Def_Offset
    jsr CrippleBigStat
    lda #$27                            ; defense lowered msg
    jmp DisplayText_battle

; One of THE most questionable elements of this game.
; The approach move used by gators & other foes is infamously bad game design.
; It prints flavor text, but completely hides the fact that it also boosts attack!
; Why this is is completely unfathomable, since Rage, an enemy move with the exact same effect and base power of 20, exists, yet that uses the normal Offense raise routine.
; This routine is completely a waste of space, as the code this routine takes up is way more than the amount of bytes (2) saved by the single move that uses it, AND has the atrocious game design element that it doesn't print the Offense raising while just doing it the same way as Rage would.
BINST4_10_Approach:
    jsr MOV_input_output
    ldx attacker_offset
    ldy #Off_Offset
    jsr RaiseBigStat
    lda #$5c                            ; print useless flavor text instead of telling the player why the hell the Zoo gators are slamming Ninten for double their base attack power
    jmp DisplayText_battle

; Used by the Bonus Swoosh to give EXP to its target
; Honestly, I would say this is also a complete waste of space considering the game needed more space to do important things like print Light resistance, but at least this has a unique effect.
; ...except it re-hardcodes everything, instead of reusing any code from the actual EXP giving codes in the battle conclusion section. As if the developers had space remaining (they didn't).
BINST4_0D_BonusEXP:
    jsr MOV_input_output
    ; skip if enemy
    ldy target_offset
    bmi @BonusEXP_Return
; get battler's exp from their full databank
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar62
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar62+1
    ldy #$11                            ; $11 is the offset where exp starts in full player data
    clc
    lda (battle_wordvar62), y
    adc battle_wordvar60
    sta battle_wordvar64
    iny
    lda (battle_wordvar62), y
    adc battle_wordvar60+1
    sta battle_wordvar64+1
    iny
    lda (battle_wordvar62), y
    adc #$00
    sta battle_wordvar66
    bcc :+
    lda #$ff
    sta battle_wordvar64
    sta battle_wordvar64+1
    sta battle_wordvar66
:   jsr EnablePRGRam
    ldy #$11
    lda battle_wordvar64
    sta (battle_wordvar62), y
    iny
    lda battle_wordvar64+1
    sta (battle_wordvar62), y
    iny
    lda battle_wordvar66
    sta (battle_wordvar62), y
    jsr WriteProtectPRGRam
@BonusEXP_Return:
    ldx #$0a
    lda #$2f                            ; target got bonus msg
    jmp PlaySFX_X_PrintText_A

; APPLY STATUS EFFECT MOVES
; The check for Invincibility is a huge waste of space as all of the apply Status routines fail if the target has immunity bit, and all Invincibie script enemies have immunity bit set (and if they didn't, there's no reason NOT to set it).
; Exports:
;       A : Success Msg
;       X : Effect to apply
;       Y : SFX to play
BINST4_12_Blind:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect1
    jsr SEC_StrengthResisted
    bcs BranchNoEffect1
    lda #$1b                            ; blinded target msg
    ldy #SFX_Nothing
    ldx #BLIND
    jmp GiveMinorStatus
    BranchNoEffect1:
    jmp PrintNoEffect

BINST4_13_Poison:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect1
    jsr SEC_StrengthResisted
    bcs BranchNoEffect1
    lda #$4b                            ; poisoned target msg
    ldy #SFX_Nothing
    ldx #POISON
    jmp GiveMajorStatus

BINST4_14_Confuse:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect1
    jsr SEC_IsTargetEVE
    bcs BranchNoEffect1
    jsr SEC_ForceResisted
    bcs BranchNoEffect1
    lda #$39                            ; confused target msg
    ldy #SFX_Nothing
    ldx #CONFUSE
    jmp GiveMajorStatus

BINST4_15_Sleep:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect1
    jsr SEC_IsTargetEVE
    bcs BranchNoEffect1
    jsr SEC_ForceResisted
    bcs BranchNoEffect1
    lda #$3b                            ; sleeped target msg
    ldy #SFX_Nothing
    ldx #SLEEP
    jmp GiveMajorStatus

BINST4_16_Paralyze:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect1
    jsr SEC_IsTargetEVE
    bcs BranchNoEffect1
    jsr SEC_StrengthResisted
    bcs BranchNoEffect1
    lda #$49                            ; paralyzed target msg
    ldy #SFX_Nothing
    ldx #PARALYSIS
    jmp GiveMajorStatus

BINST4_17_Block:
    jsr SEC_IsInvinciblityOn             ; this check is useless since all invincible foes have no power lol
    bcs BranchNoEffect1
    ldy target_offset                   ; get target's full data
    lda BATTLER_FULLDATA_PTR, y
    sta battle_wordvar60
    lda BATTLER_FULLDATA_PTR+1, y
    sta battle_wordvar60+1
    ldy #PP_Offset                       ; see if target has power; move fails if they don't
    lda (battle_wordvar60), y
    iny
    ora (battle_wordvar60), y
    beq BranchNoEffect1
    lda #$4d                            ; blocked target msg
    ldy #SFX_Nothing
    ldx #BLOCK
    jmp GiveMinorStatus

; This effect is completely useless as both Guarding moves have priority given to them via hard coding in the higher level main loops.
BINST4_18_Guard:
    ldy target_offset
    lda BATTLER_MINOR_STATUS, y
    ora #GUARD
    sta BATTLER_MINOR_STATUS, y
    rts

BINST4_19_Shield:
    lda #$4f                            ; shielded target msg
    ldy #SFX_Recovery
    ldx #SHIELD
    jmp GiveMinorStatus

BINST4_1A_Barrier:                         ; Powershield
    jsr SEC_IsBattleScriptOn
    bcs BranchNoEffect2
    lda #$17                            ; barriered target msg
    ldy #SFX_Recovery
    ldx #BARRIER
    jmp GiveMinorStatus
    BranchNoEffect2:
    jmp PrintNoEffect

BINST4_1B_Bind:
    jsr SEC_IsInvinciblityOn          ; This one's relevant since there is no normal way to be immune to bind. Rope is an incredibly broken item that would be worth using if the ropes weren't laced with silver.
    bcs BranchNoEffect2
    jsr SEC_IsTargetEVE                 ; I guess your confused party can't bind EVE? An astronomically niche scenario that I can bet nobody in the history of the world has accidently tried, despite this game being ancient.
    bcs BranchNoEffect2
    lda #$4e                            ; bound target msg
    ldy #SFX_Nothing
    ldx #BIND
    jmp GiveMinorStatus

; Petrify has a weird quirk where it doubles Defense. There is no mention of this mechanic anywhere in-game or even in the manuals afaik, a truly MOTHER series staple.
; It's not really beneficial to get your characters (Lloyd) petrified to use as a damage sponge, since being petrified means he can't Guard, which is just better.
BINST4_1C_Petrify:
    jsr SEC_IsInvinciblityOn
    bcs BranchNoEffect2
    jsr SEC_IsTargetEVE
    bcs BranchNoEffect2
    lda #$19                            ; petrified targetg msg
    ldy #SFX_Nothing
    ldx #PETRIFICATION
    jsr GiveMajorStatus
    bcs :+
    ldx target_offset
    ldy #Def_Offset
    jsr BolsterBigStat
:   rts

; hard coded to only work on Ninten, and never fails
; Honestly just a poor mechanic overall. The exhaust attack the vehicles use is super boosted anyways, dealing 30 flat to the entire party when you are under lv10. The entire stunlocking aspect just makes it even more imperitive to avoid any vehicle encounters Ninten can't oneshot.
BINST4_1D_Asthma:
    ldy target_offset
    lda BATTLER_PLAYER_ID, y
    cmp #NINTEN
    bne :+
    lda BATTLER_MINOR_STATUS, y
    and #ASTHMA
    bne :+
    lda BATTLER_MINOR_STATUS, y
    ora #ASTHMA
    sta BATTLER_MINOR_STATUS, y
    lda #$74                        ; asthmaed target msg
    jmp DisplayText_battle
:   rts

; Puzzle is such a bizarre status effect, and infamously broken and annoying as hell.
; It is a sleep clone, except there is no natural cure chance. It can only go away when hit (25% chance in vanilla).
; Suffice to say, it's a completely uncurable KO. There is no (actually valid) way to cure Confusion or Puzzling at all in this game. Truly immaculate.
BINST4_1E_Puzzle:
    jsr SEC_ForceResisted
    bcs BranchNoEffect2
    lda #$67                        ; target puzzled msg
    ldy #SFX_Nothing
    ldx #PUZZLE
    jmp GiveMajorStatus

; Poison literally does nothing in battle, so honestly, this effect could not exist. Even the developers' own Auto Fight routine doesn't bother curing poison.
; Cold isn't curable in battle, though. Because they forgot or something.
BINST4_1f_CurePoison:
    lda #$5d                        ; cured poison msg
    ldy #SFX_Recovery
    ldx #POISON
    jmp CureMajorStatus

; Infamous game design where Healings are a complete abomination.
; Waste of space programming logic for multiple healing types, picking which one in Auto as well. They could've saved a ton of space if they just programmed a Script series that takes 2 byte-sized arguments (1 for status and 1 for message), or literally any other better way to program this.
; In addition, the status they cure is completely illogical. Beta/Gamma/Pi cures Para/Petrify/Sleep. Shouldn't it be Sleep/Para/Petrify???
; Enemies barely fucking use status moves to begin with, the mental ones all have dogshit accuracy, and none of them except the most garbage status move by far (Brainshock) has a group targeting one.
; There is no logic for enemies to cure status either, meaning the fact that Para and Petrify don't count as dead on enemies when determining the end of a fight is dumb as hell. Oh, but they remembered to program that aspect for the players. Fun.
BINST4_20_CureSleep:
    lda #$61                        ; cured sleep msg
    ldy #SFX_Recovery
    ldx #SLEEP
    jmp CureMajorStatus

; There is literally only 1 enemy that uses Paralysis in the entire game (normal Mooks).
BINST4_21_CureParalysis:
    lda #$60                        ; cured paralysis msg
    ldy #SFX_Recovery
    ldx #PARALYSIS
    jmp CureMajorStatus

; I've probably done over 100 runs and I can't even remember the last time I bought the Inhaler. The single car encounters are so weak that Ninten can 1 or 2 tap them anyways, so this only has a chance of helping you against double car encounters. Except, the item is uber expensive & doesn't even stuff the stunlocking aspect of the exhaust attack. You can just use the free and infinitely more consistent option called Dimension Slip, or even just open running away.
BINST4_22_CureAsthma:
    lda #$70                        ; cured asthma msg
    ldy #SFX_Recovery
    ldx #ASTHMA
    jmp CureMinorStatus

; One of the most baffling and terrible decisions of all time in the series. Confuse and Puzzle are the only real status conditions in this game besides petrification, because the amount of enemies that sleep/paralyze you are countable on 1 hand, and Poison literally does nothing whatsoever.
; So, then, why in the world is one of the most useful status curing moves tied to an exceedingly rare, random-ass item drop you can only get from a single low-level enemy, the Big Woodoh??? It's possible to go the entire game without even seeing this thing, considering how small the actual walkable parts of the map are.
BINST4_23_CureConfusePuzzle:
    lda #$5e                        ; cured confuse & puzzle msg
    ldy #SFX_Recovery
    ldx #CONFUSE | PUZZLE
    jmp CureMajorStatus

; Named "Cure" for consistency, it removes Shields. Used by Shield Off.
; Shield Off is another one of those completely garbage moves. It costs 7 (??) PP, barely any foes use Shield to begin with, and if they do, they only know Alpha Shield which is garbage. Enemies don't really have HP either.
; Why this move is exclusive to Ana is beyond me. There's no animation to PSI Shield Off either, even though it targets one and makes the hit received sfx.
BINST4_24_CureShield:
    lda #$69                        ; shield broken msg
    ldy #SFX_Hit
    ldx #SHIELD
    jmp CureMinorStatus

; One of the only useful status Healing spells in this game, second only to Super Healing.
BINST4_26_CurePetrification:
    lda #$71                        ; cured petrify msg
    ldy #SFX_Recovery
    ldx #PETRIFICATION
    jmp CureMajorStatus

; Ana the GOAT support character for learning this, Shields, and Lifeup!
; It completely maxes out HP. This move is not programmed to work on enemies. It "cures" them, but there is no code for them respawning, so they just remain dead. For whatever reason, the way enemies die is different from players, and there is no logic to respawn them at all.
BINST4_25_CureUncon:
    ldy target_offset
    lda BATTLER_STATUS, y
    and #UNCON
    beq :+
    lda #NO_STATUS
    sta BATTLER_STATUS, y
    lda #$ff                        ; why they don't reuse the MaxHP effect??
    sta battle_input_num
    sta battle_input_num+1
    ldx target_offset
    ldy #HP_Offset
    jsr RaiseBigStatByNum
    ldx #SFX_Recovery
    lda #$62                        ; revived msg
    jmp PlaySFX_X_PrintText_A
:   jmp PrintNoEffect

; This effect is really unclean, unlike all the other effects. It's basically all hard-coding.
BINST4_29_Sing:
.ifndef VER_JP
    ldx battle_script
    cpx #BSCRIPT_GIEGUE_FIGHTING
    beq SingFighting
; SingYapping
; while Giegue is yapping, he doesn't "take damage" from the song. it still plays the animation, though.
; the check for not giegue fight is in the Sing BA. If that's true it just displays no effect msg
    lda #MUSIC_SING
    jsr ChangeMusic
    lda current_music
    pha
    ldx #$00
    jsr B31_126b
    lda #Noise_Thunder
    sta soundqueue_noise
    ldx #56
    jsr WaitXFrames
    pla
    cmp current_music
    beq :+
    sta soundqueue_track
:   rts
; "real" sing routine that runs after Giegue shuts up.
; advances the counter towards Giegue's demise (it's also used to determine what he says)
SingFighting:
.endif
    lda #MUSIC_SING
    jsr ChangeMusic
    sec
    lda battle_bytevar55
    sbc #$9e
    tax
    jsr B31_126b
    lda #Noise_Thunder
    sta soundqueue_noise
    jsr ANIMATE_FAST_PLAYER
    lda battle_bytevar55
    jsr DisplayText_battle
    lda #MUSIC_BATTLE_GIEGUE
    jsr ChangeMusic
    ldx battle_bytevar55
    inx
    cpx #$a9
    beq BINST_GIEGUELOSE
    stx battle_bytevar55
    rts

BINST_GIEGUELOSE:
    jsr AnimateGiegueDefeat
    lda #MUSIC_NONE
    jsr ChangeMusic
    ldx #200
    jsr WaitXFrames
    ldx #$a9                            ; 1st giegue defeat yap msg id
; @GiegueDefeatYap LoopStart
; for some reason, giegue's defeat yap is split into multiple text ids. this is completely useless and unnecessary as they could have been tied to 1 id
:   stx battle_bytevar55
    txa
    jsr DisplayText_battle
    ldx battle_bytevar55
    inx
    cpx #$ac
    bne :-
; @GiegueDefeatEffect
    ldy #ENEMY1_OFFSET
    jmp DeathActionInterpreter

; Unlike pretty much every single other number, Magnet has no randomness applied to it. It is hard coded to yoink 10 power. It can steal less only if the target doesn't have enough.
; It also cannot be blocked in any way, even by invincibility (although no invincibility foes have PP, so it fails on them anyways). The only move that uses this effect has 75% accuracy.
BINST4_27_Magnet:
    ldx #$0a                        ; hard coded value to steal
    ldy target_offset
    lda BATTLER_CURR_PP, y
    ora BATTLER_CURR_PP+1, y
    beq @MagnetFail
    sec
    lda BATTLER_CURR_PP, y
    tax
    sbc #$0a                        ; again
    lda BATTLER_CURR_PP+1, y
    sbc #$00
    bcc :+
    ldx #$0a                        ; again
:   stx bytevar_0590
    ldx #$00
    stx bytevar_0591
    sec
    lda BATTLER_CURR_PP, y
    sbc bytevar_0590
    sta BATTLER_CURR_PP, y
    lda BATTLER_CURR_PP+1, y
    sbc bytevar_0591
    sta BATTLER_CURR_PP+1, y
    lda #$48                        ; target lost power msg
    jsr DisplayText_battle
    lda bytevar_0590
    sta battle_wordvar60
    lda bytevar_0591
    sta battle_wordvar60+1
    ldx attacker_offset
    ldy #PP_Offset
    jsr RaiseBigStatByNum
    lda attacker_offset
    sta target_offset
    ldx #$0a
    lda #$3d
    jmp PlaySFX_X_PrintText_A
@MagnetFail:
    jmp PrintNoEffect

; Another questionable game design element.
; Steal is a move used by enemies; it ALWAYS works if the target has an edible item on them, and yoinks the top one off the stack.
; The questionable element is what happens if it fails; it prints the guarding msg, even though it doesn't enact guard.
BINST4_28_Steal:
    ldy target_offset
    bmi :+
    jsr CLC_FindFoodInInventory
    bcs :+
    jsr OrganizeInv
    jsr StoreItemName
    lda #$81                        ; steal msg
    jmp DisplayText_battle
:   lda #$59                        ; enemy guard msg
    jmp DisplayText_battle

; Used by Mr.Batty and Biobats as a meme
; The difference from the normal confuse effect is that this one always works
BINST4_2A_ConfuseSelf:
    ldy target_offset
    lda BATTLER_STATUS, y
    and #CONFUSE
    bne :+
    lda BATTLER_STATUS, y
    ora #CONFUSE
    sta BATTLER_STATUS, y
    lda #$39                        ; confused target msg
    jsr DisplayText_battle
:   rts

; Plays SFX in X and Prints Text in A
; both are indexes
PlaySFX_X_PrintText_A:
    pha
    txa
    beq :+
    jsr PlayBattleSFX
:   jsr B31_15e5
    pla
    jmp DisplayText_battle


; Parameters:
;   Y : sfx to play
;   X : target offset
;   A : status to add/remove
GiveMajorStatus:
    pha
    jsr ChangingStatusLoads
    lda BATTLER_STATUS, y
    and battle_wordvar60
    bne ChangingStatusFail
    lda BATTLER_STATUS, y
    ora battle_wordvar60
    sta BATTLER_STATUS, y
    jmp ChangingStatusSuccess

GiveMinorStatus:
    pha
    jsr ChangingStatusLoads
    lda BATTLER_MINOR_STATUS, y
    and battle_wordvar60
    bne ChangingStatusFail
    lda BATTLER_MINOR_STATUS, y
    ora battle_wordvar60
    sta BATTLER_MINOR_STATUS, y
    jmp ChangingStatusSuccess

CureMajorStatus:
    pha
    jsr ChangingStatusLoads
    lda BATTLER_STATUS, y
    and battle_wordvar60
    beq ChangingStatusFail
    lda BATTLER_STATUS, y
    and battle_wordvar60+1
    sta BATTLER_STATUS, y
    jmp ChangingStatusSuccess

CureMinorStatus:
    pha
    jsr ChangingStatusLoads
    lda BATTLER_MINOR_STATUS, y
    and battle_wordvar60
    beq ChangingStatusFail
    lda BATTLER_MINOR_STATUS, y
    and battle_wordvar60+1
    sta BATTLER_MINOR_STATUS, y
    ; jmp ChangingStatusSuccess

; successfully updates status and plays SFX + prints msg
ChangingStatusSuccess:
    ldx battle_bytevar58
    pla
    jsr PlaySFX_X_PrintText_A
    clc
    rts
; failed to change status cause it was already set or couldn't cure it
ChangingStatusFail:
    pla
    jsr PrintNoEffect
    sec
    rts

; shuffles around some digits & loads what ChangeStatus functions need
ChangingStatusLoads:
    stx battle_wordvar60
    txa
    eor #$ff
    sta battle_wordvar60+1
    sty battle_bytevar58
    ldy target_offset
    rts

PrintNoEffect:
    lda #$55                    ; no effect msg
    jmp DisplayText_battle

;varies number in n battle_input_num by ±24%
MOV_input_output:
    lda battle_input_num
    sta battle_wordvar60
    lda battle_input_num+1
    sta battle_wordvar60+1
    jmp RNG_WORD

RaiseBigStat:
    jsr GetValueFromBattlerFulldata
    RaiseBigStatAlreadyLoaded:
    clc
    lda BATTLER, x
    adc battle_wordvar60
    sta battle_wordvar66
    lda BATTLER_STATUS, x
    adc battle_wordvar60+1
    sta battle_wordvar66+1
    bcc :+
    lda #$ff
    sta battle_wordvar66
    sta battle_wordvar66+1
:   sec
    lda battle_wordvar64
    sbc battle_wordvar66
    lda battle_wordvar64+1
    sbc battle_wordvar66+1
    bcs :+
    lda battle_wordvar64
    sta battle_wordvar66
    lda battle_wordvar64+1
    sta battle_wordvar66+1
:   sec
    lda battle_wordvar66
    sbc BATTLER, x
    sta bytevar_0590
    lda battle_wordvar66+1
    sbc BATTLER_STATUS, x
    sta bytevar_0591
    bcc :+
    ora bytevar_0590
    beq :+
    lda battle_wordvar66
    sta BATTLER, x
    lda battle_wordvar66+1
    sta BATTLER_STATUS, x
    rts
:   jmp CLR_wordvar0590

; BUG : Stat cap can overflow if base stat is > 127.
; BigStat doesn't have this issue since it is 16-bit
RaiseSmallStat:
    jsr GetValueFromBattlerFulldata
    clc
    lda BATTLER, x
    adc battle_wordvar60
    sta battle_wordvar66
    bcc :+
    lda #$ff
    sta battle_wordvar66
:   sec
    lda battle_wordvar64
    sbc battle_wordvar66
    bcs :+
    lda battle_wordvar64
    sta battle_wordvar66
:   lda #$00
    sta bytevar_0591
    sec
    lda battle_wordvar66
    sbc BATTLER, x
    sta bytevar_0590
    bcc :+
    beq :+
    lda battle_wordvar66
    sta BATTLER, x
    rts
:   jmp CLR_wordvar0590

LowerBigStat:
    jsr GetValueFromBattlerFulldata
    sec
    lda BATTLER, x
    sbc battle_wordvar60
    sta battle_wordvar66
    lda BATTLER_STATUS, x
    sbc battle_wordvar60+1
    sta battle_wordvar66+1
    bcs :+
    lda #$00
    sta battle_wordvar66
    sta battle_wordvar66+1
:   cpy #$03
    beq :+
    cpy #$05
    beq :+
    lda battle_wordvar66
    ora battle_wordvar66+1
    bne :+
    lda #$01
    sta battle_wordvar66
:   sec
    lda BATTLER, x
    sbc battle_wordvar66
    sta bytevar_0590
    lda BATTLER_STATUS, x
    sbc battle_wordvar66+1
    sta bytevar_0591
    bcc :+
    ora bytevar_0590
    beq :+
    lda battle_wordvar66
    sta BATTLER, x
    lda battle_wordvar66+1
    sta BATTLER_STATUS, x
    rts
:   jmp CLR_wordvar0590

LowerSmallStat:
    jsr GetValueFromBattlerFulldata
    sec
    lda BATTLER, x
    sbc battle_wordvar60
    sta battle_wordvar66
    beq :+
    bcs :++
:   lda #$01
    sta battle_wordvar66
:   lda #$00
    sta bytevar_0591
    sec
    lda BATTLER, x
    sbc battle_wordvar66
    sta bytevar_0590
    beq :+
    bcc :+
    lda battle_wordvar66
    sta BATTLER, x
    rts
:   jmp CLR_wordvar0590

; raises big stat's value by flat number from input
RaiseBigStatByNum:
    jsr GetValueFromBattlerFulldata
    lda battle_wordvar62
    sta battle_wordvar64
    lda battle_wordvar62+1
    sta battle_wordvar64+1
    jmp RaiseBigStatAlreadyLoaded

; increases a 16-bit stat by 100% additive
; Ninten is the GOAT!
BolsterBigStat:
    txa
    pha
    jsr GetValueFromBattlerFulldata
    pla
    tax
    lda battle_wordvar62
    sta battle_wordvar60
    lda battle_wordvar62+1
    sta battle_wordvar60+1
    jsr RNG_WORD
    jmp RaiseBigStat

; drops a 16-bit stat by 50% additive
CrippleBigStat:
    txa
    pha
    jsr GetValueFromBattlerFulldata
    pla
    tax
    lda battle_wordvar62+1
    lsr a
    sta battle_wordvar60+1
    lda battle_wordvar62
    ror a
    sta battle_wordvar60
    jsr RNG_WORD
    jmp LowerBigStat

; not fully understood yet (assumed function)
GetValueFromBattlerFulldata:
    lda BATTLER_FULLDATA_PTR, x
    sta battle_wordvar66
    lda BATTLER_FULLDATA_PTR+1, x
    sta battle_wordvar66+1
    lda (battle_wordvar66), y
    sta battle_wordvar62
    asl a
    sta battle_wordvar64
    iny
    lda (battle_wordvar66), y
    and #$03
    sta battle_wordvar62+1
    rol a
    sta battle_wordvar64+1
    bcc :+
    lda #$ff
    sta battle_wordvar64
    sta battle_wordvar64+1
:   dey
    stx battle_wordvar68
    tya
    clc
    adc battle_wordvar68
    tax
    rts

; sets carry if strength resisting check was a success
; used for physical status conditions: blind, poison, para
SEC_StrengthResisted:
    ldy attacker_offset
    lda BATTLER_WIS, y
    tax
    ldy target_offset
    lda BATTLER_STR, y
    jmp StatResistingRoutine
; same but for force
; used for mental status conditions: confuse, sleep, puzzle
SEC_ForceResisted:
    ldy attacker_offset
    lda BATTLER_WIS, y
    tax
    ldy target_offset
    lda BATTLER_FCE, y
    jmp StatResistingRoutine

; Updates number with target's resistances
; Move type should be prestored in battle_bytevar57
; Y should be target offset
; Resistance = divides damage by 2
ApplyResistance:
    lda BATTLER_RESISTANCES, y
    and battle_bytevar57
    beq :+
    lsr battle_wordvar60+1
    ror battle_wordvar60
    lda battle_wordvar60
    ora battle_wordvar60+1
    bne :+
    inc battle_wordvar60
:   lda #$00                            ; clear battle_bytevar57 as we are done using it
    sta battle_bytevar57
    rts

; Does the math involved in resisting status conditions from STR or FCE vs Attacker's WIS
; Parameters:
;   X : unsigned attacker's digit (in vanilla, WIS)
;   A : unsigned defender's digit (in vanilla, STR or FCE)
StatResistingRoutine:

    lsr a
    sta battle_wordvar60
    stx battle_wordvar64
    txa
    sec
    sbc battle_wordvar60
    bcs :+
    lda #$00
:   sta battle_wordvar60+1
    lda #$00
    sta battle_wordvar60
    sta battle_wordvar62
    jsr B31_113d
    jsr RNG_BYTE
    cmp battle_wordvar60
    rts

CLC_FindFoodInInventory:
    jsr GetInventoryPointer_battle
    ldy #$00
@FindFood_LS:
    tya
    pha
    lda (battle_wordvar60), y
    beq @FindFood_SKIP
    jsr GetItemPointer
    jsr BANKSWAP_L00
    ldy #$05
    lda (battle_wordvar62), y
    tax
    ldy #$02
    lda (battle_wordvar62), y
    jsr BANKSWAP_L16
    and #$40
    bne @FindFoodSuccess
@FindFood_SKIP:
    pla
    tay
; increment
    iny
    cpy #$08
    bne @FindFood_LS
; find food fail (set carry)
    sec
    rts
@FindFoodSuccess:       ; find food success (clear carry)
    pla
    tay
    clc
    rts

; clears wordvar0590
CLR_wordvar0590:
    lda #$00
    sta wordvar0590
    sta wordvar0590+1
    clc
    rts

; Sets Carry to boolean is target Invincible
SEC_IsInvinciblityOn:
    lda target_offset
    bpl :+
    SEC_IsBattleScriptOn:          ; used by cast barrier routine to see if move is valid
    lda battle_script
    lsr a
    bne :++
:   clc
    rts
:   sec
    rts

; Sets Carry to boolean IsTargetEVE
SEC_IsTargetEVE:
    ldy target_offset
    bmi :+
    lda BATTLER_PLAYER_ID, y
    cmp #EVE
    bne :+
    sec
    rts
:   clc
    rts

; 2 bytes of freespace in vanilla us