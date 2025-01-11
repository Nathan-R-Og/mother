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

;[A-Za-z0-9]+_[A-Za-z0-9]+:\s+
;;(.|\n)*?\n

; $A000
; Battle engine
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
    B23_0015:
    sta battlers, x
    inx
    bne B23_0015
    ldx #$1f
    B23_001d:
    sta $0580, x
    dex
    bpl B23_001d
    lda #$00
    sta attacker_offset
    ldx #$00
    B23_0029:
    txa
    pha
    lda party_members, x
    beq B23_003a
    jsr InitializePlayerBattler
    clc
    lda attacker_offset
    adc #$20
    sta attacker_offset
    B23_003a:
    pla
    tax
    inx
    cpx #$04
    bne B23_0029
    jsr GetEnemyGroupPointer
    lda #$80
    sta attacker_offset
    ldy #$00
    B23_004a:
    lda ($5c), y
    sta $60
    iny
    lda ($5c), y
    sta $61
    iny
    tya
    pha
    lda $60
    cmp #$ff
    beq B23_005f
    jsr B23_022d
    B23_005f:
    clc
    lda attacker_offset
    adc #$20
    sta attacker_offset
    pla
    tay
    cpy #$08
    bne B23_004a
    lda ($5c), y
    and #$e0
    ldx #$05
    B23_0072:
    lsr a
    dex
    bne B23_0072
    sta $56
    lda ($5c), y
    and #$1f
    sta $5a
    iny
    lda ($5c), y
    and #$0f
    sta $60
    lda #$00
    ldx #$05
    B23_0089:
    asl $60
    rol a
    dex
    bne B23_0089
    sta $61
    clc

    lda #.LOBYTE(Battle_Palettes)
    adc $60
    sta $60
    lda #.HIBYTE(Battle_Palettes)
    adc $61
    sta $61
    jsr BankswitchLower_Bank00_Preserve
    jsr LoadPaletteFrom

    jsr BankswitchLower_Bank22
    ldx #$23
    ldy #$c0
    jsr ClearNametableAttribute
    ldx #$2b
    ldy #$c0
    jsr ClearNametableAttribute
    jsr B31_15e5
    lda #$00
    sta $5b
    lda #$80
    sta attacker_offset
    B23_00c0:
    ldx attacker_offset
    lda battlers, x
    beq B23_00ca
    jsr B23_028a
    B23_00ca:
    inc $5b
    clc
    lda attacker_offset
    adc #$20
    sta attacker_offset
    bcc B23_00c0
    ldy #$00
    ldx #$00
    B23_00d9:
    lda $0580, y
    iny
    ora $0580, y
    sta $60
    iny
    lda $0580, y
    iny
    ora $0580, y
    asl a
    asl a
    ora $60
    sta $60
    asl a
    asl a
    asl a
    asl a
    ora $60
    sta $0580, x
    iny
    inx
    cpx #$08
    bne B23_00d9
    jsr PpuSync
    lda #$05
    sta $0400 ; TODO: NMI command
    lda #$10
    sta $0401
    ldy #$00
    ldx #$04
    B23_0110:
    lda $0580, y
    sta $0400, x
    sta $0408, x
    iny
    inx
    cpy #$08
    bne B23_0110
    lda #$00
    sta $0408, x
    lda #$80
    sta $e5
    lda #$23
    sta $0402
    lda #$d8
    sta $0403
    lda #$00
    sta $e6
    lda #$00
    sta $47
    sta enemy_group
    ldx #$80
    B23_013e:
    txa
    pha
    ldy #$04
    B23_0142:
    lda battlers+HP+1, x
    and #$03
    sta battlers+HP+1, x
    inx
    inx
    dey
    bne B23_0142
    pla
    clc
    adc #$20
    tax
    bne B23_013e
    ldx #$00
    lda $56
    cmp #$01
    bne B23_0173
    ldx #$04
    lda #$ff
    sta $0683
    sta $0684
    lda #$00
    sta $0620
    sta $0640
    sta $0660
    B23_0173:
    stx $5b
    lda is_in_tank
    beq B23_018c
    ldy #$00
    sty $56
    B23_017d:
    lda battlers+BATTLE_STATUS, y
    ora #$04
    sta battlers+BATTLE_STATUS, y
    tya
    clc
    adc #$20
    tay
    bpl B23_017d
    B23_018c:
    lda $56
    cmp #$05
    bne B23_019c
    lda #$96
    sta $55
    lda battlers+SPEED
    sta battlers+SPEED+$80
    B23_019c:
    ldx #20
    jsr WaitXFrames
    jsr B31_174c
    B23_01a4:
    lda #$00
    jsr B31_14ce
    jsr B23_0c6a
    bcs B23_01d3
    ldx #20
    jsr WaitXFrames
    lda #$07
    jsr B31_14ce
    lda #$00
    sta $52
    jsr B31_0cff
    jsr B31_1765
    jsr B23_050a
    jsr B31_1760
    lda #$03
    jsr B31_14ce
    jsr B31_0cfc
    jmp B23_01a4

B23_01d3:
    jsr B31_1759
    lda #$00
    sta pad1_forced
    sta pad2_forced
    rts

; $A1DD
InitializePlayerBattler:
    sta $62
    tax
    lda #.LOBYTE(party_data-$40)
    sta $60
    lda #.HIBYTE(party_data-$40)
    sta $61
    B23_01e8:
    clc
    lda $60
    adc #$40
    sta $60
    lda $61
    adc #$00
    sta $61
    dex
    bne B23_01e8
    ldy #$01
    ldx attacker_offset
    B23_01fc:
    lda ($60), y
    sta battlers+1, x
    iny
    inx
    cpy #$10
    bne B23_01fc
    ldy #$14
    ldx attacker_offset
    B23_020b:
    lda ($60), y
    sta battlers+3, x
    inx
    iny
    cpy #$18
    bne B23_020b
    ldx attacker_offset
    lda #$ff
    sta battlers, x
    lda $62
    sta battlers+ALLY_ID, x
    lda $60
    sta battlers+DATA_POINTER, x
    lda $61
    sta battlers+DATA_POINTER+1, x
    rts

B23_022d:
    ldx attacker_offset
    lda $61
    asl a
    asl a
    sta $061a, x
    lda $60
    sta $62
    lda #$00
    ldx #$05
    B23_023e:
    asl $62
    rol a
    dex
    bne B23_023e
    sta $63
    clc
    lda #$00
    adc $62
    sta $62
    lda #$80
    adc $63
    sta $63
    ldy #$01
    ldx attacker_offset
    B23_0257:
    lda ($62), y
    sta battlers+1, x
    iny
    inx
    cpy #$18
    bne B23_0257
    ldx attacker_offset
    ldy enemy_group
    iny
    tya
    sta battlers, x
    lda $62
    sta battlers+DATA_POINTER, x
    lda $63
    sta battlers+DATA_POINTER+1, x
    ldy #$5e
    lda $61
    bpl B23_0285
    lda battlers+BATTLE_STATUS, x
    ora #$01
    sta battlers+BATTLE_STATUS, x
    ldy #$00
    B23_0285:
    tya
    sta battlers+ACTION_ID, x
    rts

B23_028a:
    lda battlers+BATTLE_STATUS, x
    and #$01
    beq B23_0296
    lda #$00
    sta battlers, x
    B23_0296:
    lda $061a, x
    ora $5b
    sta $061a, x
    lda battlers+HP+1, x
    and #$f0
    lsr a
    lsr a
    lsr a
    tay
    lda $960a, y
    sta $60
    lda $960b, y
    sta $61
    lda battlers+OFFENSE+1, x
    and #$e0
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    sta $66
    ldy #$00
    lda ($60), y
    sta $62
    iny
    lda ($60), y
    sta $63
    iny
    sec
    lda ($60), y
    sbc $66
    tay
    iny
    lda #$e0
    B23_02d2:
    clc
    adc #$20
    dey
    bne B23_02d2
    sta $64
    lda $5a
    asl a
    asl a
    adc $5b
    tay
    lda $8f40, y
    sta $65
    lda battlers+HP+1, x
    and #$0c
    lsr a
    lsr a
    ldy $65
    ldx #$00
    B23_02f1:
    sta $0580, y
    iny
    inx
    cpx $63
    bne B23_02f1
    clc
    lda $65
    adc $64
    adc #$80
    sta $64
    lda #$00
    adc #$21
    sta $65
    lda $64
    and #$e0
    sta $68
    lda $65
    and #$03
    lsr a
    ror $68
    lsr a
    ror $68
    sec
    lda $68
    sbc #$19
    sta $68
    lda $64
    asl a
    asl a
    asl a
    sec
    sbc #$10
    sta $69
    ldx $5b
    inx
    lda #$c0
    B23_032f:
    clc
    adc #$40
    dex
    bne B23_032f
    sta $66
    ldy #$02
    B23_0339:
    jsr PpuSync
    ldx #$00
    lda #$05
    sta $0400, x ; TODO: NMI command
    inx
    lda $63
    sta $0400, x
    sta $67
    inx
    lda $65
    sta $0400, x
    inx
    lda $64
    sta $0400, x
    B23_0357:
    iny
    lda ($60), y
    clc
    adc $66
    inx
    sta $0400, x
    dec $67
    bne B23_0357
    lda #$00
    inx
    sta $0400, x
    clc
    lda $64
    adc #$20
    sta $64
    lda $65
    adc #$00
    sta $65
    lda #$00
    sta $e6
    lda #$80
    sta $e5
    dec $62
    bne B23_0339
    ldx attacker_offset
    lda battlers+PP+1, x
    and #$fc
    beq B23_03d1
    lsr a
    lsr a
    sta $60
    asl a
    adc $60
    clc
    adc #$c8
    sta $60
    lda #$00
    adc #$97
    sta $61
    ldy #$00
    lda ($60), y
    sta battlers+ACTION_TARGET, x
    lda $5b
    asl a
    asl a
    asl a
    tax
    lda #$00
    sta $0300, x
    sta $0301, x
    sta $0304, x
    sta $0305, x
    lda $69
    sta $0302, x
    lda $68
    sta $0303, x
    ldy #$01
    lda ($60), y
    sta $0306, x
    iny
    lda ($60), y
    sta $0307, x
    B23_03d1:
    rts

; Fill 64 bytes at PPU address in YX with 0xFF
ClearNametableAttribute:
    jsr PpuSync
    stx $0400+2
    sty $0400+3
    lda #$08
    sta $0400 ; PPU_FILL
    lda #$40
    sta $0400+1 ; Fill 64 bytes
    lda #$ff
    sta $0400+4 ; With $FF
    lda #$00
    sta $0400+5 ; END
    lda #$80
    sta $e5
    lda #$00
    sta $e6
    rts

; $A3F8
DisplayText_battle:
    cmp #$00
    beq B23_0478
    pha
    jsr B23_04bb
    jsr BankswitchLower_Bank00_Preserve
    pla
    cmp #$ff
    bne B23_042d
    sec
    ldy target_offset
    lda battlers+DATA_POINTER, y
    sbc #$00
    sta $74
    lda battlers+DATA_POINTER+1, y
    sbc #$80
    asl $74
    rol a
    asl $74
    rol a
    asl $74
    rol a
    clc
    adc #$14
    sta $74
    lda #$00
    adc #$05
    sta $73
    bcc B23_044a
    B23_042d:
    ldy #$00
    sty $61
    asl a
    rol $61
    clc
    adc #$81
    sta $60
    lda $61
    adc #$90
    sta $61
    ldy #$00
    lda ($60), y
    sta $74
    iny
    lda ($60), y
    sta $73
    B23_044a:
    jsr GetTextData
    lda $74
    sta $50
    lda $75
    sta $51
    lda $52
    cmp #$03
    bne B23_0462
    ldx #$03
    jsr B30_07c1
    dec $52
    B23_0462:
    jsr B23_0479
    cmp #$02
    beq B23_046f
    inc $52
    cmp #$00
    bne B23_044a
    B23_046f:
    jsr BankswitchLower_Bank22
    ldx battle_message_speed
    jsr WaitXFrames
    B23_0478:
    rts

B23_0479:
    lda $52
    asl a
    adc #$03
    sta $77
    ldy #$00
    lda ($50), y
    cmp #$03
    bne B23_049d
    lda #$0f
    sta $76
    jsr B31_15c2
    inc $50
    bne B23_0495
    inc $51
    B23_0495:
    ldy #$00
    lda ($50), y
    cmp #$02
    beq B23_04ba
    B23_049d:
    lda #$16
    sta $70
    lda #$05
    sta $76
    jsr PpuSync
    lda $50
    sta $74
    lda $51
    sta $75
    jsr B30_0707
    lda #$01
    jsr B30_07af
    lda $72
    B23_04ba:
    rts

B23_04bb:
    lda #$21
    sta $0580
    sta $0588
    lda #$80
    sta $62
    lda #$05
    sta $63
    ldx attacker_offset
    jsr B23_04da
    lda #$88
    sta $62
    lda #$05
    sta $63
    ldx target_offset
    B23_04da:
    lda battlers+DATA_POINTER, x
    sta $60
    lda battlers+DATA_POINTER+1, x
    sta $61
    ldy #$18
    lda ($60), y
    pha
    iny
    lda ($60), y
    ldy #$02
    sta ($62), y
    pla
    dey
    sta ($62), y
    iny
    iny
    lda $061a, x
    and #$1c
    beq B23_0505
    lsr a
    lsr a
    clc
    adc #$40
    sta ($62), y
    iny
    B23_0505:
    lda #$00
    sta ($62), y
    rts

B23_050a:
    lda #$00
    sta attacker_offset
    B23_050e:
    ldy attacker_offset
    lda #$00
    sta battlers+ACTION_ID, y
    lda battlers+BATTLE_STATUS, y
    and #~$08
    sta battlers+BATTLE_STATUS, y
    lda battlers, y
    beq B23_0535
    lda battlers+AILMENTS, y
    and #$f4
    bne B23_0535
    lda battlers+BATTLE_STATUS, y
    and #$20
    bne B23_0535
    jsr B23_053f
    bcs B23_050e
    B23_0535:
    clc
    lda attacker_offset
    adc #$20
    sta attacker_offset
    bne B23_050e
    rts

B23_053f:
    lda $59
    bne B23_0559
    ldy attacker_offset
    bmi B23_0559
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_0559
    jsr B23_07da
    bcs B23_0572
    lda $59
    beq B23_055c
    B23_0559:
    jsr B23_0573
    B23_055c:
    ldy attacker_offset
    lda battlers+ACTION_ID, y
    cmp #$53
    beq B23_0569
    cmp #$59
    bne B23_0571
    B23_0569:
    lda battlers+BATTLE_STATUS, y
    ora #$08
    sta battlers+BATTLE_STATUS, y
    B23_0571:
    clc
    B23_0572:
    rts

B23_0573:
    lda attacker_offset
    bmi B23_057a
    jmp B23_057d
    B23_057a:
    jmp B23_0723

B23_057d:
    ldy #$00
    B23_057f:
    sty target_offset
    lda battlers, y
    beq B23_0594
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_0594
    lda battlers+AILMENTS, y
    bmi B23_059d
    B23_0594:
    tya
    clc
    adc #$20
    tay
    bpl B23_057f
    bmi B23_05a0
    B23_059d:
    jmp B23_06b0
    B23_05a0:
    ldy #$00
    B23_05a2:
    sty target_offset
    lda battlers, y
    beq B23_05bc
    lda battlers+AILMENTS, y
    bmi B23_05bc
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_05bc
    jsr B31_1673
    bcc B23_05c5
    B23_05bc:
    tya
    clc
    adc #$20
    tay
    bpl B23_05a2
    bmi B23_05e9
    B23_05c5:
    ldx #$00
    ldy #$00
    B23_05c9:
    lda battlers, y
    beq B23_05db
    lda battlers+AILMENTS, y
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
    bcc B23_0611
    jmp B23_0623
    B23_05e9:
    ldy #$00
    B23_05eb:
    sty target_offset
    lda battlers, y
    beq B23_0604
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_0604
    lda battlers+AILMENTS, y
    bmi B23_0604
    and #$70
    bne B23_060e
    B23_0604:
    tya
    clc
    adc #$20
    tay
    bpl B23_05eb
    jmp B23_0690
    B23_060e:
    jmp B23_0659
    B23_0611:
    lda #$0c
    jsr B23_06c2
    bcc B23_0622
    lda #$0b
    jsr B23_06c2
    bcc B23_0622
    jmp B23_0623
    B23_0622:
    rts

B23_0623:
    lda #$0a
    jsr B23_06c2
    bcc B23_0651
    lda #$09
    jsr B23_06c2
    bcc B23_0651
    lda #$08
    jsr B23_06c2
    bcc B23_0651
    ldy attacker_offset
    jsr B23_1faa
    bcs B23_05e9
    cpx #$7c
    beq B23_05e9
    cpx #$84
    beq B23_05e9
    tya
    ldy attacker_offset
    sta $0610, y
    txa
    sta battlers+ACTION_ID, y
    B23_0651:
    lda target_offset
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_0659:
    ldy target_offset
    lda battlers+AILMENTS, y
    tax
    and #$20
    bne B23_0670
    txa
    and #$10
    bne B23_0677
    txa
    and #$40
    bne B23_067e
    jmp B23_0685
    B23_0670:
    lda #$11
    jsr B23_06c2
    bcc B23_0688
    B23_0677:
    lda #$13
    jsr B23_06c2
    bcc B23_0688
    B23_067e:
    lda #$12
    jsr B23_06c2
    bcc B23_0688
    B23_0685:
    jmp B23_0690
    B23_0688:
    lda target_offset
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_0690:
    ldy attacker_offset
    lda #$01
    sta battlers+ACTION_ID, y
    B23_0697:
    jsr Rand
    and #$e0
    ora #$80
    tay
    lda battlers, y
    beq B23_0697
    lda battlers+AILMENTS, y
    bmi B23_0697
    tya
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_06b0:
    lda #$14
    jsr B23_06c2
    bcc B23_06ba
    jmp B23_05a0
    B23_06ba:
    ldy attacker_offset
    lda target_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_06c2:
    sta $60
    jsr B23_086b
    lda $60
    lsr a
    lsr a
    lsr a
    tay
    lda $60
    and #$07
    tax
    inx
    sec
    lda #$00
    B23_06d6:
    ror a
    dex
    bne B23_06d6
    sta $61
    lda ($5c), y
    and $61
    beq B23_0721
    lda #$00
    asl $60
    rol a
    asl $60
    rol a
    asl $60
    rol a
    sta $61
    clc
    lda $60
    adc #$00
    sta $60
    lda $61
    adc #$9e
    sta $61
    jsr BankswitchLower_Bank00_Preserve
    ldy #$05
    lda ($60), y
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    ldy #$07
    lda ($60), y
    sta $4e
    lda #$00
    sta $4f
    jsr BankswitchLower_Bank22
    jsr SubtractPP
    bcc B23_0721
    jsr B23_11c5
    bcc B23_0721
    clc
    rts
    B23_0721:
    sec
    rts

B23_0723:
    jsr Rand
    and #$07
    clc
    adc attacker_offset
    tay
    lda $0610, y
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    jsr B23_0c23
    jsr JMPTable

    .addr B23_07a3
    .addr B23_0740
    .addr B23_074a

B23_0740:
    jsr B23_07ab
    lda target_offset
    bpl B23_0740
    jmp B23_07a3

B23_074a:
    lda attacker_offset
    bpl B23_0796
    lda $56
    cmp #$03
    bne B23_0760
    ldx #$03
    B23_0756:
    lda #$06
    jsr B23_07be
    bcs B23_07a0
    dex
    bpl B23_0756
    B23_0760:
    lda $56
    cmp #$04
    bne B23_078a
    ldx #$03
    B23_0768:
    lda #$01
    jsr B23_07be
    bcs B23_07a0
    dex
    bpl B23_0768
    ldx #$03
    B23_0774:
    lda #$02
    jsr B23_07be
    bcs B23_07a0
    dex
    bpl B23_0774
    ldx #$03
    B23_0780:
    lda #$04
    jsr B23_07be
    bcs B23_07a0
    dex
    bpl B23_0780
    B23_078a:
    ldx #$03
    B23_078c:
    lda #$07
    jsr B23_07be
    bcs B23_07a0
    dex
    bpl B23_078c
    B23_0796:
    jsr B23_07ab
    lda target_offset
    bmi B23_0796
    jmp B23_07a3
    B23_07a0:
    jmp B23_07a3

B23_07a3:
    lda target_offset
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_07ab:
    jsr Rand
    and #$e0
    tay
    lda battlers, y
    beq B23_07ab
    lda battlers+AILMENTS, y
    bmi B23_07ab
    sty target_offset
    rts

B23_07be:
    cmp party_members, x
    bne B23_07d8
    txa
    asl a
    asl a
    asl a
    asl a
    asl a
    tay
    lda battlers, y
    beq B23_07d8
    lda battlers+AILMENTS, y
    bmi B23_07d8
    sty target_offset
    sec
    rts
    B23_07d8:
    clc
    rts

B23_07da:
    jsr B23_0c06
    B23_07dd:
    lda #$02
    ldx event_flags+28
    bpl B23_07e6
    lda #$13
    B23_07e6:
    jsr B31_14ce
    jsr B23_090d
    jsr JMPTable

    .addr B23_0802
    .addr B23_0814
    .addr B23_0847
    .addr B23_087d
    .addr B23_0888
    .addr B23_08ba
    .addr B23_08bf
    .addr B23_08e2
    .addr B23_08e7

B23_0801:
    rts

B23_0802:
    lda #$01
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    jsr B23_0962
    bcc B23_0811
    jmp B23_07dd
    B23_0811:
    jmp B23_0801

B23_0814:
    jsr PpuSync
    lda #$01
    sta $59
    lda #$14
    sta $03e6
    lda #$97
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
    jmp B23_0801

B23_0847:
    jsr B23_086b
    lda #$00
    sta $60
    ldy #$07
    B23_0850:
    lda ($5c), y
    ora $60
    sta $60
    dey
    bne B23_0850
    lda $60
    beq B23_0868
    jsr B23_0b10
    bcs B23_0865
    jmp B23_0801
    B23_0865:
    jmp B23_07da
    B23_0868:
    jmp B23_07dd

B23_086b:
    ldy attacker_offset
    clc
    lda battlers+DATA_POINTER, y
    adc #$30
    sta $5c
    lda battlers+DATA_POINTER+1, y
    adc #$00
    sta $5d
    rts

B23_087d:
    lda #$59
    B23_087f:
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    clc
    jmp B23_0801

B23_0888:
    ldy attacker_offset
    clc
    lda battlers+DATA_POINTER, y
    adc #$20
    sta $5c
    lda battlers+DATA_POINTER+1, y
    adc #$00
    sta $5d
    lda #$00
    sta $60
    ldy #$07
    B23_089f:
    lda ($5c), y
    ora $60
    sta $60
    dey
    bpl B23_089f
    lda $60
    beq B23_08b7
    jsr B23_0a08
    bcs B23_08b4
    jmp B23_0801
    B23_08b4:
    jmp B23_07da
    B23_08b7:
    jmp B23_07dd

B23_08ba:
    lda #$48
    jmp B23_087f

B23_08bf:
    lda #$80
    sta target_offset
    jsr B23_0991
    bcs B23_08df
    ldx $82
    lda $0591, x
    tax
    dex
    txa
    sta target_offset
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    lda #$6f
    sta battlers+ACTION_ID, y
    jmp B23_0801
    B23_08df:
    jmp B23_07dd

B23_08e2:
    lda #$1c
    jmp B23_087f

B23_08e7:
    sec
    lda attacker_offset
    beq B23_0909
    sbc #$20
    sta attacker_offset
    tay
    lda battlers, y
    beq B23_08e7
    lda battlers+AILMENTS, y
    bmi B23_08e7
    lda battlers+AILMENTS, y
    and #$f4
    bne B23_08e7
    lda battlers+BATTLE_STATUS, y
    and #$20
    bne B23_08e7
    B23_0909:
    sec
    jmp B23_0801

B23_090d:
    ldx #$73
    ldy #$9f
    lda $56
    cmp #$01
    bne B23_091e
    ldx #$83
    ldy #$9f
    jmp B23_0927
    B23_091e:
    lda event_flags+28
    bpl B23_0927
    ldx #$7b
    ldy #$9f
    B23_0927:
    stx $84
    sty $85
    ldx #$6b
    ldy #$9f
    stx $80
    sty $81
    jsr B31_0f3f
    bit $83
    bvs B23_0942
    lda #$09
    jsr B23_0945
    lda $82
    rts

B23_0942:
    lda #$08
    rts

B23_0945:
    sta $60
    lda $82
    lsr a
    asl a
    clc
    adc $77
    sta $77
    lda $82
    and #$01
    beq B23_095d
    clc
    lda $76
    adc $60
    sta $76
    B23_095d:
    lda #$0d
    jmp B31_14ce
    B23_0962:
    jsr B23_0c23
    beq B23_098d
    ldx #$80
    cmp #$02
    beq B23_096f
    ldx #$00
    B23_096f:
    stx $60
    lda attacker_offset
    and #$80
    eor $60
    sta target_offset
    jsr B23_0991
    bcs B23_098f
    ldx $82
    lda $0591, x
    tax
    dex
    txa
    sta target_offset
    ldy attacker_offset
    sta battlers+ACTION_TARGET, y
    B23_098d:
    clc
    rts
    B23_098f:
    sec
    rts

B23_0991:
    lda #$0b
    jsr B31_14ce
    jsr B23_09b3
    lda #.LOBYTE(B22_1f8b)
    sta $80
    lda #.HIBYTE(B22_1f8b)
    sta $81
    jsr B31_0f34
    bit $83
    bvs B23_09b1
    bmi B23_09ad
    jmp B23_0991

B23_09ad:
    lda $82
    clc
    rts
    B23_09b1:
    sec
    rts

B23_09b3:
    lda #$12
    sta $77
    ldx #$00
    stx $0591
    stx $0592
    stx $0593
    stx $0594
    inx
    stx $0590
    lda target_offset
    pha
    ldy #$04
    B23_09ce:
    tya
    pha
    ldy target_offset
    lda battlers, y
    beq B23_09f8
    ldy target_offset
    bmi B23_09e4
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_09f8
    B23_09e4:
    iny
    tya
    sta $0590, x
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
    lda $82
    sta $0610, y
    ldy $82
    lda ($5c), y
    jsr GetItemPointer
    ldy attacker_offset
    jsr B23_0c49
    bcs B23_0a43
    jsr BankswitchLower_Bank00_Preserve
    ldy #$05
    lda ($62), y
    jsr BankswitchLower_Bank22
    cmp #$00
    beq B23_0a4c
    ldy attacker_offset
    sta battlers+ACTION_ID, y
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
    jsr BankswitchLower_Bank00_Preserve
    ldy #$03
    lda ($62), y
    jsr BankswitchLower_Bank22
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
    lda $9fb2, x
    sta $76
    tya
    lsr a
    tax
    lda $9fb4, x
    sta $77
    lda ($5c), y
    beq B23_0a9c
    jsr GetItemPointer
    jsr BankswitchLower_Bank00_Preserve
    lda #$04
    sta $0588
    ldy #$00
    lda ($62), y
    sta $0589
    iny
    lda ($62), y
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
    stx $63
    ldx #$03
    B23_0aaa:
    asl a
    rol $63
    dex
    bne B23_0aaa
    clc
    adc #.LOBYTE(Item_Data)
    sta $62
    lda $63
    adc #.HIBYTE(Item_Data)
    sta $63
    rts

; $AABC
GetInventoryPointer_battle:
    clc
    lda battlers+DATA_POINTER, y
    adc #$20
    sta $60
    lda battlers+DATA_POINTER+1, y
    adc #$00
    sta $61
    rts

; $AACC
StoreItemName:
    jsr BankswitchLower_Bank00_Preserve
    lda #$21
    sta $0590
    ldy #$00
    lda ($62), y
    sta $0591
    iny
    lda ($62), y
    sta $0592
    lda #$00
    sta $0593
    jmp BankswitchLower_Bank22

B23_0ae9:
    lda #$95
    sta $80
    lda #$9f
    sta $81
    lda $5c
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
    lda $82
    clc
    rts
    B23_0b0e:
    sec
    rts

B23_0b10:
    ldy #$01
    B23_0b12:
    lda ($5c), y
    beq B23_0b32
    tya
    pha
    lda #$0e
    jsr B31_14ce
    lda #$12
    jsr B31_14ce
    jsr B23_0b61
    jsr B23_0bc2
    pla
    tay
    cpx #$01
    beq B23_0b39
    cpx #$02
    beq B23_0b5f
    B23_0b32:
    iny
    cpy #$08
    beq B23_0b10
    bne B23_0b12
    B23_0b39:
    ldy $82
    lda $0580, y
    jsr GetPsiDataPointer
    jsr BankswitchLower_Bank00_Preserve
    ldy #$05
    lda ($62), y
    beq B23_0b57
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    pha
    jsr BankswitchLower_Bank22
    pla
    jmp B23_0962

B23_0b57:
    lda #$10
    jsr B31_14ce
    jsr WaitABPressed
    B23_0b5f:
    sec
    rts

B23_0b61:
    tya
    asl a
    asl a
    asl a
    sta $60
    lda #$80
    sta $61
    ldx #$00
    B23_0b6d:
    lda #$00
    sta $0580, x
    lda ($5c), y
    and $61
    beq B23_0b7d
    lda $60
    sta $0580, x
    B23_0b7d:
    inc $60
    inx
    lsr $61
    bcc B23_0b6d
    ldy #$00
    B23_0b86:
    tya
    pha
    and #$01
    tax
    lda $9fb2, x
    sta $76
    tya
    lsr a
    tax
    lda $9fb4, x
    sta $77
    lda $0580, y
    beq B23_0bba
    jsr GetPsiDataPointer
    jsr BankswitchLower_Bank00_Preserve
    lda #$04
    sta $0588
    ldy #$00
    lda ($62), y
    sta $0589
    iny
    lda ($62), y
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

B23_0bc2:
    lda #.LOBYTE(B22_1fa7)
    sta $80
    lda #.HIBYTE(B22_1fa7)
    sta $81
    jsr B31_0f34
    lda $83
    and #$06
    bne B23_0be6
    lda $83
    and #$81
    bne B23_0be0
    bit $83
    bvs B23_0be3
    jmp B23_0bc2

B23_0be0:
    ldx #$00
    rts

B23_0be3:
    ldx #$02
    rts

B23_0be6:
    lda #.LOBYTE(B22_1f9d)
    sta $80
    lda #.HIBYTE(B22_1f9d)
    sta $81
    jsr B31_0f34
    lda $83
    and #$08
    bne B23_0bc2
    bit $83
    bvs B23_0c03
    bmi B23_0c00
    jmp B23_0bc2

B23_0c00:
    ldx #$01
    rts

B23_0c03:
    ldx #$02
    rts

B23_0c06:
    lda #$0a
    jsr B31_14ce
    jsr B23_04bb
    jsr BankswitchLower_Bank00_Preserve
    lda #$00
    sta $70
    lda #$7a
    sta $74
    lda #$8e
    sta $75
    jsr B30_06db
    jmp BankswitchLower_Bank22

B23_0c23:
    pha
    and #$03
    tax
    inx
    lda #$01
    sec
    B23_0c2b:
    ror a
    ror a
    dex
    bne B23_0c2b
    sta $60
    pla
    lsr a
    lsr a
    tay
    lda B22_1ec7, y
    and $60
    sta $61
    B23_0c3d:
    lsr $60
    bcs B23_0c46
    lsr $61
    jmp B23_0c3d
    B23_0c46:
    lda $61
    rts

B23_0c49:
    jsr BankswitchLower_Bank00_Preserve
    lda battlers+ALLY_ID, y
    sta $64
    tax
    sec
    lda #$00
    B23_0c55:
    rol a
    dex
    bne B23_0c55
    sta $67
    ldy #$02
    lda ($62), y
    jsr BankswitchLower_Bank22
    and $67
    beq B23_0c68
    clc
    rts
    B23_0c68:
    sec
    rts

B23_0c6a:
    jsr B23_175a
    bcs B23_0c91
    ldx #$08
    B23_0c71:
    txa
    pha
    jsr B23_0ca5
    jsr B23_0cd6
    lda #$ff
    ldy attacker_offset
    sta battlers+ACTION_ID, y
    jsr B23_175a
    bcs B23_0c90
    pla
    tax
    dex
    bne B23_0c71
    dec $5b
    beq B23_0c93
    clc
    rts
    B23_0c90:
    pla
    B23_0c91:
    sec
    rts

B23_0c93:
    lda $56
    cmp #$01
    beq B23_0ca3
    ldx #100
    jsr WaitXFrames
    lda #$92
    jsr DisplayText_battle
    B23_0ca3:
    sec
    rts

B23_0ca5:
    lda #$00
    sta $60
    sta $61
    B23_0cab:
    ldy $60
    lda battlers+ACTION_ID, y
    cmp #$ff
    beq B23_0cc8
    cmp #$5e
    beq B23_0cd3
    lda battlers+SPEED, y
    jsr B31_13fd
    cmp $61
    bcc B23_0cc8
    sta $61
    lda $60
    sta $62
    B23_0cc8:
    clc
    lda $60
    adc #$20
    sta $60
    bne B23_0cab
    ldy $62
    B23_0cd3:
    sty attacker_offset
    rts

B23_0cd6:
    ldy attacker_offset
    lda battlers, y
    bne B23_0ce2
    lda #$00
    jmp DisplayText_battle2

B23_0ce2:
    lda battlers+AILMENTS, y
    and #$80
    beq B23_0cee
    lda #$00
    jmp DisplayText_battle2

B23_0cee:
    lda battlers+AILMENTS, y
    and #$40
    beq B23_0cfa
    lda #$47
    jmp DisplayText_battle2

B23_0cfa:
    lda battlers+AILMENTS, y
    and #$20
    beq B23_0d06
    lda #$46
    jmp DisplayText_battle2

B23_0d06:
    lda battlers+AILMENTS, y
    and #$10
    beq B23_0d2b
    jsr Rand
    and #$e0
    bne B23_0d26
    lda battlers+AILMENTS, y
    and #$ef
    sta battlers+AILMENTS, y
    sty target_offset
    jsr B31_15e5
    lda #$8e ; "[attacker] woke up!"
    jmp DisplayText_battle2

B23_0d26:
    lda #$3c
    jmp DisplayText_battle2 ; "[attacker] sleeps..."

B23_0d2b:
    lda battlers+AILMENTS, y
    and #$04
    beq B23_0d37
    lda #$68
    jmp DisplayText_battle2

B23_0d37:
    lda battlers+BATTLE_STATUS, y
    and #$02
    beq B23_0d4a
    lda battlers+ACTION_ID, y
    cmp #$76
    beq B23_0d4a
    lda #$56
    jmp DisplayText_battle2 ; "[attacker] had an asthma attack!"

B23_0d4a:
    lda battlers+BATTLE_STATUS, y
    and #$20
    beq B23_0d6a
    jsr Rand
    and #$c0
    bne B23_0d65
    lda battlers+BATTLE_STATUS, y
    and #~$20
    sta battlers+BATTLE_STATUS, y
    lda #$8b
    jmp DisplayText_battle2 ; "[attacker] escaped from the rope!"

B23_0d65:
    lda #$1c
    jmp DisplayText_battle2 ; "[attacker] is tied."

B23_0d6a:
    lda battlers+AILMENTS, y
    and #$08
    beq B23_0d76
    lda #$3a
    jsr DisplayText_battle ; "[attacker]'s confused..."
    B23_0d76:
    ldy attacker_offset
    lda battlers+ACTION_ID, y
    B23_0d7b:
    ldy #$00
    sty $61
    asl a
    rol $61
    sta $60
    clc
    lda #.LOBYTE(BATTLE_ACTION_POINTERS)
    adc $60
    sta $60
    lda #.HIBYTE(BATTLE_ACTION_POINTERS)
    adc $61
    sta $61
    ldy #$00
    lda ($60), y
    sta $5e
    iny
    lda ($60), y
    sta $5f
    ; FALLTHROUGH
Interpret:
    ldy #$00
    lda ($5e), y
    lsr a
    lsr a
    lsr a
    lsr a
    jsr JMPTable

    .addr B23_0dc4 ; 00
    .addr B23_0dc9 ; 01
    .addr B23_0df1 ; 02
    .addr B23_0e5d ; 03
    .addr B23_1804 ; 04
    .addr B23_0eea ; 05
    .addr B23_0f08 ; 06
    .addr B23_0f31 ; 07
    .addr B23_0f39 ; 08
    .addr B23_0f7b ; 09
    .addr B23_0f92 ; 0A
    .addr B23_0f98 ; 0B
    .addr B23_0e8e ; 0C

; $ADC1
DisplayText_battle2:
    jmp DisplayText_battle

; Battle action command 0X
B23_0dc4:
    lda #$01
    jmp AdvanceScriptPtr

; Battle action command 1X
B23_0dc9:
    ldy #$00
    lda ($5e), y
    and #$0f
    jsr JSRTable

    .addr B23_0dec  ; Return address
    .addr B23_0fed  ; 00
    .addr B23_0ff2  ; 01
    .addr B23_0ffe  ; 02
    .addr B23_1008  ; 03
    .addr B23_1012  ; 04
    .addr B23_1022  ; 05
    .addr B23_1032  ; 06
    .addr B23_1037  ; 07
    .addr B23_1041  ; 08
    .addr B23_104b  ; 09
    .addr B23_1055  ; 0A
    .addr B23_105f  ; 0B

B23_0dec:
    lda #$01
    jmp AdvanceAndContinue

; Battle action command 2X YY (Use PSI YY)
B23_0df1:
    ldy #$01
    lda ($5e), y
    ldx #$00
    stx $61
    ldx #$03
    B23_0dfb:
    asl a
    rol $61
    dex
    bne B23_0dfb
    clc
    adc #$00
    sta $60
    lda $61
    adc #$9e
    sta $61 ; $60 = pointer to PSI data table
    jsr BankswitchLower_Bank00_Preserve
    ldy #$07
    lda ($60), y
    sta $4e
    lda #$00
    sta $4f ; $4E = PP cost
    lda #$21
    sta $0590
    ldy #$00
    lda ($60), y
    sta $0591 ; Name pointer lo
    iny
    lda ($60), y
    sta $0592 ; Name pointer hi
    lda #$00
    sta $0593
    jsr BankswitchLower_Bank22
    lda #$64
    jsr DisplayText_battle ; "[attacker] tried [move]!"
    jsr B23_11c5
    bcc B23_0e53
    jsr SubtractPP
    bcc B23_0e58
    jsr B23_10a4
    lda $58
    jsr B31_141f
    lda #$00
    sta $58
    lda #$02
    jmp AdvanceAndContinue

B23_0e53:
    lda #$51
    jmp DisplayText_battle ; "It was blocked!"

B23_0e58:
    lda #$54
    jmp DisplayText_battle ; "Not enough PP!"

; Battle action command 3X YY (use item YY?)
B23_0e5d:
    ldy #$01
    lda ($5e), y
    jsr GetItemPointer
    jsr StoreItemName
    ldy attacker_offset
    bmi B23_0e7b
    jsr EnablePRGRam
    ldy #$00
    lda ($5e), y
    and #$0f
    cmp #$01
    bne B23_0e7b
    jsr B23_14e5
    B23_0e7b:
    lda #$63
    jsr DisplayText_battle ; "[attacker] used the [move]!"
    lda $58
    jsr B31_141f
    lda #$00
    sta $58
    lda #$02
    jmp AdvanceAndContinue

; Battle action command CX
B23_0e8e:
    ldy #$01
    lda ($5e), y
    jsr GetItemPointer
    jsr StoreItemName
    ldy attacker_offset
    bmi B23_0ee5
    ldy #$00
    lda ($5e), y
    and #$0f
    jsr JMPTable

    .addr B23_0eab
    .addr B23_0ebd
    .addr B23_0ecf

; Battle action command C0
B23_0eab:
    jsr Rand
    and #$e0
    bne B23_0ee5
    jsr B23_14e5
    lda #$75
    jsr DisplayText_battle ; "The [move] broke..."
    jmp B23_0ee5

; Battle action command C1
B23_0ebd:
    jsr Rand
    and #$e0
    bne B23_0ee5
    jsr B23_14e5
    lda #$78
    jsr DisplayText_battle ; "The [move] turned into an ordinary stone..."
    jmp B23_0ee5

; Battle action command C2
B23_0ecf:
    jsr EnablePRGRam
    dec big_bag_uses
    jsr WriteProtectPRGRam
    lda big_bag_uses
    bne B23_0ee5
    jsr B23_14e5
    lda #$91
    jsr DisplayText_battle ; "The [move] was fully emptied..."
    B23_0ee5:
    lda #$02
    jmp AdvanceAndContinue

; Battle action command 5X
B23_0eea:
    ldy #$00
    lda ($5e), y
    and #$0f
    jsr JSRTable

    .addr B23_0f03 ; Return pointer
    .addr B23_11df ; 00 - NOP
    .addr B23_11e0 ; 01
    .addr B23_1202 ; 02
    .addr B23_121d ; 03
    .addr B23_1238 ; 04
    .addr B23_123d ; 05
    .addr B23_1248 ; 06

B23_0f03:
    lda #$01
    jmp AdvanceAndContinue

; Battle action command 6X
B23_0f08:
    ldy #$01
    lda ($5e), y
    sta $64
    dey
    lda ($5e), y
    and #$0f
    jsr JSRTable

    .addr B23_0f2c ; Return address
    .addr B23_1250 ; 00
    .addr B23_12d9 ; 01
    .addr B23_12f9 ; 02
    .addr B23_1302 ; 03
    .addr B23_1319 ; 04
    .addr B23_1320 ; 05
    .addr B23_13c2 ; 06
    .addr B23_13ce ; 07
    .addr B23_13d3 ; 08
    .addr B23_13d8 ; 09

B23_0f2c:
    lda #$02
    jmp AdvanceAndContinue

; Battle action command 7X
B23_0f31:
    jsr B23_0f53
    bcc B23_0f3e
    jmp B23_0f4e

; Battle action command 8X
B23_0f39:
    jsr B23_0f53
    bcc B23_0f4e
    B23_0f3e:
    ldy #$01
    lda ($5e), y
    pha
    iny
    lda ($5e), y
    sta $5f
    pla
    sta $5e
    jmp Interpret
    B23_0f4e:
    lda #$03
    jmp AdvanceAndContinue

B23_0f53:
    ldy #$00
    lda ($5e), y
    and #$0f
    jsr JSRTable

    .addr B23_0f7a  ; Return address
    .addr B23_10b0  ; 00
    .addr B23_10cc  ; 01
    .addr B23_10f7  ; 02
    .addr B23_1112  ; 03
    .addr B23_1125  ; 04
    .addr B23_1131  ; 05
    .addr B23_10bc  ; 06
    .addr B23_1150  ; 07
    .addr B23_1164  ; 08
    .addr B23_1169  ; 09
    .addr B23_1174  ; 0A
    .addr B23_1180  ; 0B
    .addr B23_1188  ; 0C
    .addr B23_1194  ; 0D

B23_0f7a:
    rts

; Battle action command 9X (subroutine call)
B23_0f7b:
    lda $5f
    pha
    lda $5e
    pha
    jsr ScriptJump
    jsr Interpret
    pla
    sta $5e
    pla
    sta $5f
    lda #$03
    jmp AdvanceAndContinue

; Battle action command AX (unconditional jump)
B23_0f92:
    jsr ScriptJump
    jmp Interpret

; Battle action command BX (repeat?)
B23_0f98:
    ldy #$00
    lda ($5e), y
    and #$0f
    tax
    lda #$01
    jsr AdvanceScriptPtr
    B23_0fa4:
    txa
    pha
    lda $5f
    pha
    lda $5e
    pha
    jsr Interpret
    lda $5e
    sta $60
    lda $5f
    sta $61
    pla
    sta $5e
    pla
    sta $5f
    pla
    tax
    dex
    bne B23_0fa4
    lda $60
    sta $5e
    lda $61
    sta $5f
    jmp Interpret

AdvanceAndContinue:
    jsr AdvanceScriptPtr
    jmp Interpret

ScriptJump:
    ldy #$01
    lda ($5e), y
    pha
    iny
    lda ($5e), y
    sta $5f
    pla
    sta $5e
    rts

AdvanceScriptPtr:
    clc
    adc $5e
    sta $5e
    lda #$00
    adc $5f
    sta $5f
    rts

; Battle action command 10
B23_0fed:
    ldy attacker_offset
    jmp B23_1513

; Battle action command 11
B23_0ff2:
    ldy target_offset
    bpl B23_0ff9
    jmp B23_1555
    B23_0ff9:
    lda #$01
    sta $47
    rts

; Battle action command 12
B23_0ffe:
    ldy target_offset
    bpl B23_1005
    jmp B23_15d3
    B23_1005:
    jmp B23_16b2

; Battle action command 13
B23_1008:
    ldy target_offset
    bpl B23_100f
    jmp B23_167c
    B23_100f:
    jmp B23_16f1

; Battle action command 14 - Call for help
B23_1012:
    lda #$2d
    jsr DisplayText_battle  ; "[attacker] called for help!"
    jsr B23_1069
    bcs B23_1021
    lda #$40
    jsr DisplayText_battle  ; "But no one came."
    B23_1021:
    rts

; Battle action command 15
B23_1022:
    lda #$2e
    jsr DisplayText_battle ; "[attacker] sowed some seeds!"
    jsr B23_1069
    bcs B23_1031
    lda #$41
    jsr DisplayText_battle ; "(silence...)"
    B23_1031:
    rts

; Battle action command 16
B23_1032:
    lda #$02
    sta $47
    rts

; Battle action command 17
B23_1037:
    ldy target_offset
    bpl B23_103e
    jmp B23_15da
    B23_103e:
    jmp B23_16bb

; Battle action command 18
B23_1041:
    ldy target_offset
    bpl B23_1048
    jmp B23_15e1
    B23_1048:
    jmp B23_16c4

; Battle action command 19
B23_104b:
    ldy target_offset
    bpl B23_1052
    jmp B23_15e8
    B23_1052:
    jmp B23_16cd

; Battle action command 1A
B23_1055:
    ldy target_offset
    bpl B23_105c
    jmp B23_15ef
    B23_105c:
    jmp B23_16d6

; Battle action command 1B
B23_105f:
    ldy target_offset
    bpl B23_1066
    jmp B23_15f6
    B23_1066:
    jmp B23_16df

B23_1069:
    ldy #$80
    B23_106b:
    cpy attacker_offset
    beq B23_1076
    lda battlers+BATTLE_STATUS, y
    and #$01
    bne B23_107f
    B23_1076:
    tya
    clc
    adc #$20
    tay
    bne B23_106b
    clc
    rts
    B23_107f:
    sty target_offset
    jsr B23_1513
    ldy target_offset
    lda battlers+BATTLE_STATUS, y
    and #~$01
    sta battlers+BATTLE_STATUS, y
    lda #$00
    sta battlers+ACTION_ID, y
    ldy attacker_offset
    lda battlers, y
    ldy target_offset
    sta battlers, y
    lda #$42
    jsr DisplayText_battle ; "[target] joined!"
    sec
    rts

B23_10a4:
    lda #$19
    ldx #.LOBYTE(DepleteAttackerPP-1)
    ldy #.HIBYTE(DepleteAttackerPP-1)
    jsr TempUpperBankswitch
    jmp B31_15e5

; Battle action command 70/80
B23_10b0:
    ldy attacker_offset
    lda battlers, y
    beq B23_10ca
    lda battlers+AILMENTS, y
    bmi B23_10ca
; Battle action command 76/86
B23_10bc:
    ldy target_offset
    lda battlers, y
    beq B23_10ca
    lda battlers+AILMENTS, y
    bmi B23_10ca
    clc
    rts
    B23_10ca:
    sec
    rts

; Battle action command 71/81
B23_10cc:
    lda is_in_tank
    bne B23_10f3
    ldy target_offset
    lda battlers+AILMENTS, y
    and #$70
    bne B23_10f3
    lda battlers+BATTLE_STATUS, y
    bmi B23_10f3
    lda battlers+FIGHT, y
    sta $60
    ldy attacker_offset
    lda battlers+FIGHT, y
    sta $62
    jsr B23_11a2
    lda $60
    cmp $62
    bcs B23_10f5
    B23_10f3:
    clc
    rts
    B23_10f5:
    sec
    rts

; Battle action command 72/82
B23_10f7:
    jsr B23_1fe2
    bcs B23_1111
    ldy attacker_offset
    lda battlers+FIGHT, y
    sta $60
    ldy target_offset
    lda battlers+FIGHT, y
    sta $62
    jsr B23_11a2
    lda $62
    cmp $60
    B23_1111:
    rts

; Battle action command 73/83
B23_1112:
    ldy attacker_offset
    lda battlers+BATTLE_STATUS, y
    and #$80
    eor #$80
    rol a
    bcs B23_1124
    jsr Rand
    and #$80
    rol a
    B23_1124:
    rts

; Battle action command 74/84
B23_1125:
    lda attacker_offset
    bmi B23_112f
    lda is_in_tank
    beq B23_112f
    clc
    rts
    B23_112f:
    sec
    rts

; Battle action command 75/85
B23_1131:
    ldy target_offset
    bmi B23_114c
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    ldy #$20
    B23_1141:
    lda ($60), y
    cmp #$68
    beq B23_114e
    iny
    cpy #$28
    bne B23_1141
    B23_114c:
    sec
    rts
    B23_114e:
    clc
    rts

; Battle action command 77/87
B23_1150:
    ldy target_offset
    lda battlers+RESISTANCES, y
    and #$80
    bne B23_1160
    lda battlers+RESISTANCES, y
    and #$01
    bne B23_1162
    B23_1160:
    sec
    rts
    B23_1162:
    clc
    rts

; Battle action command 78/88
B23_1164:
    jsr Rand
    asl a
    rts

; Battle action command 79/89
B23_1169:
    ldy target_offset
    lda battlers+RESISTANCES, y
    and #$80
    eor #$80
    rol a
    rts

; Battle action command 7A/8A
B23_1174:
    ldy target_offset
    lda battlers+RESISTANCES, y
    and #$04
    eor #$04
    cmp #$01
    rts

; Battle action command 7B/8B
B23_1180:
    lda is_scripted_battle
    bne B23_1186
    sec
    rts
    B23_1186:
    clc
    rts

; Battle action command 7C/8C
B23_1188:
    ldy target_offset
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    cmp #$01
    rts

; Battle action command 7D/8D
B23_1194:
    lda $56
    cmp #$05
    beq B23_11a0
    cmp #$06
    beq B23_11a0
    sec
    rts
    B23_11a0:
    clc
    rts

B23_11a2:
    lda #$01
    sta $61
    sec
    lda $60
    sbc $62
    sta $60
    lda $61
    sbc #$00
    lsr a
    ror $60
    sec
    lda $60
    sbc #$66
    bcs B23_11bd
    lda #$00
    B23_11bd:
    sta $60
    jsr Rand
    sta $62
    rts

B23_11c5:
    ldy attacker_offset
    lda battlers+BATTLE_STATUS, y
    and #$40
    eor #$40
    cmp #$01
    rts

; $B1D1
SubtractPP:
    ldy attacker_offset
    sec
    lda battlers+PP, y
    sbc $4e
    lda battlers+PP+1, y
    sbc $4f
    rts

; Battle action command 50
B23_11df:
    rts

; Battle action command 51
B23_11e0:
    ldy attacker_offset
    lda battlers+AILMENTS, y
    and #$08
    bne B23_11ef
    lda battlers+ACTION_TARGET, y
    sta target_offset
    rts
    B23_11ef:
    jsr Rand
    and #$e0
    tay
    lda battlers, y
    beq B23_11ef
    lda battlers+AILMENTS, y
    bmi B23_11ef
    sty target_offset
    rts

; Battle action command 52
B23_1202:
    ldy attacker_offset
    lda battlers+AILMENTS, y
    and #$08
    beq B23_1212
    jsr Rand
    and #$80
    bne B23_122d
    B23_1212:
    ldx #$80
    lda attacker_offset
    bpl B23_121a
    ldx #$00
    B23_121a:
    stx target_offset
    rts

; Battle action command 53
B23_121d:
    ldy attacker_offset
    lda battlers+AILMENTS, y
    and #$08
    beq B23_122d
    jsr Rand
    and #$80
    bne B23_1212
    B23_122d:
    ldx #$00
    ldy attacker_offset
    bpl B23_1235
    ldx #$80
    B23_1235:
    stx target_offset
    rts

; Battle action command 54
B23_1238:
    lda attacker_offset
    sta target_offset
    rts

; Battle action command 55
B23_123d:
    ldx #$00
    ldy attacker_offset
    bpl B23_1245
    ldx #$80
    B23_1245:
    stx target_offset
    rts

; Battle action command 56
B23_1248:
    clc
    lda target_offset
    adc #$20
    sta target_offset
    rts

; Battle action command 60
B23_1250:
    ldy target_offset
    lda battlers+DEFENSE, y
    sta $64
    lda battlers+DEFENSE+1, y
    sta $65 ; $64 = target->defense
    sec
    ldy attacker_offset
    lda battlers+OFFENSE, y
    sta $66
    sta $68
    sbc $64
    lda battlers+OFFENSE+1, y
    sta $67 ; $66 = attacker->offense
    sta $69 ; $68 = attacker->offense
    sbc $65
    bcc B23_12a8
    lsr $65
    ror $64
    sec
    lda $66
    sbc $64
    sta $60
    lda $67
    sbc $65
    sta $61 ; $60 = offense + defense/2
    B23_1284:
    lda $56
    cmp #$01
    bne B23_1297
    jsr Rand
    and #$07
    ora #$04
    sta $60
    lda #$00
    sta $61
    B23_1297:
    lda $60
    ora $61
    bne B23_129f
    inc $60
    B23_129f:
    lda $60
    sta $4e
    lda $61
    sta $4f
    rts
    B23_12a8:
    asl $66
    rol $67
    clc
    lda $66
    adc $68
    sta $66
    lda $67
    adc $69
    sta $67 ; offense += defense/2
    sec
    lda $66
    sbc $64
    sta $60
    lda $67
    sbc $65
    sta $61
    bcs B23_12ce
    lda #$00
    sta $60
    sta $61
    B23_12ce:
    lsr $61
    ror $60
    lsr $61
    ror $60
    jmp B23_1284

; Battle action command 61
B23_12d9:
    ldy attacker_offset
    lda battlers+OFFENSE, y
    sta $4e
    lda battlers+OFFENSE+1, y
    sta $4f
    lda $56
    cmp #$01
    bne B23_12f8
    jsr Rand
    and #$0f
    ora #$08
    sta $4e
    lda #$00
    sta $4f
    B23_12f8:
    rts

; Battle action command 62
B23_12f9:
    lda $64
    sta $4e
    lda #$00
    sta $4f
    rts

; Battle action command 63 - Giegue's speech
B23_1302:
    lda $56
    cmp #$05
    bne B23_1318
    lda $55
    jsr DisplayText_battle
    ldx $55
    inx
    cpx #$9e
    bne B23_1316
    inc $56
    B23_1316:
    stx $55
    B23_1318:
    rts

; Battle action command 64
B23_1319:
    lda $57
    ora $64
    sta $57
    rts

; Battle action command 65 - Check
B23_1320:
    lda #$6a
    jsr DisplayText_battle ; "[attacker] checked [target]!"
    lda $56
    cmp #$02
    bne B23_1330
    lda #$95
    jmp DisplayText_battle ; "- Resists light\n- Immune to status\nThis thing is HUGE!"

B23_1330:
    cmp #$03
    bne B23_1339
    lda #$94
    jmp DisplayText_battle ; TODO: Text 0x058C (not in the dump??)

B23_1339:
    cmp #$04
    bne B23_1342
    lda #$93
    jmp DisplayText_battle ; TODO: Text 0x0517 (not in the dummp??)

B23_1342:
    cmp #$05
    bne B23_134b
    lda #$01
    jmp DisplayText_battle ; "From somewhere, [leader] heard Queen Mary's voice...)\nYou can't beat Giegue with blabla..."

B23_134b:
    cmp #$06
    bne B23_1354
    lda #$01
    jmp DisplayText_battle ; "From somewhere, [leader] heard Queen Mary's voice...)\nYou can't beat Giegue with blabla..."

B23_1354:
    ldy target_offset
    bmi B23_135d
    lda #$90
    jmp DisplayText_battle ; "But there was no effect!"

B23_135d:
    ldy target_offset
    lda battlers+OFFENSE, y
    sta $0590
    lda battlers+OFFENSE+1, y
    sta $0591
    lda battlers+DEFENSE, y
    sta $0592
    lda battlers+DEFENSE+1, y
    sta $0593
    lda #$24
    jsr DisplayText_battle ; "Offense [number]"
    lda #$25
    jsr DisplayText_battle ; "Defense [number]"
    ldy target_offset
    lda battlers+RESISTANCES, y
    pha
    and #$40
    beq B23_1390
    lda #$6b
    jsr DisplayText_battle ; "- Resists Fire"
    B23_1390:
    pla
    pha
    and #$20
    beq B23_139b
    lda #$6c
    jsr DisplayText_battle ; "- Resists Freeze"
    B23_139b:
    pla
    pha
    and #$10
    beq B23_13a6
    lda #$6d
    jsr DisplayText_battle ; "- Resists Thunder"
    B23_13a6:
    pla
    pha
    and #$80
    bne B23_13b7
    pla
    pha
    and #$01
    beq B23_13b7
    lda #$6f
    jsr DisplayText_battle ; "- Weak to Bug Spray"
    B23_13b7:
    pla
    ; FALLTHROUGH
; Battle action command 69
B23_13b8:
    lda #$ff
    jmp DisplayText_battle

B23_13bd:
    lda #$90
    jmp DisplayText_battle ; "But there was no effect!"

; Battle action command 66
B23_13c2:
    ldx #$0f
    lda attacker_offset
    bmi B23_13ca
    ldx #$01
    B23_13ca:
    txa
    jmp B31_141f

; Battle action command 67
B23_13ce:
    lda $64
    sta $58
    rts

; Battle action command 68 (display text)
B23_13d3:
    lda $64
    jmp DisplayText_battle

B23_13d8:
    lda $64
    jmp B31_141f

B23_13dd:
    tya
    bmi B23_13f0
    lda battlers+ALLY_ID, y
    cmp #$06
    bne B23_13f0
    lda #$00
    sta $56
    ldx #$88
    jmp B23_140b
    B23_13f0:
    jsr B23_14ca
    cmp #$01
    bne B23_13fc
    ldx #$19
    jmp B23_140b
    B23_13fc:
    cmp #$02
    bne B23_1405
    ldx #$1a
    jmp B23_140b
    B23_1405:
    jsr B23_142d
    jmp B23_1496

B23_140b:
    lda target_offset
    pha
    lda attacker_offset
    pha
    lda $5f
    pha
    lda $5e
    pha
    sty attacker_offset
    txa
    jsr B23_0d7b
    pla
    sta $5e
    pla
    sta $5f
    pla
    sta attacker_offset
    pla
    sta target_offset
    tay
    jmp B23_1496

B23_142d:
    tya
    pha
    lda #$00
    sta battlers+HP, y
    sta battlers+HP+1, y
    lda #$80
    sta battlers+AILMENTS, y
    tya
    bpl B23_148b
    lda #$00
    sta battlers, y
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    tya
    pha
    clc
    ldy #$1a
    lda ($60), y
    adc $49
    sta $49
    iny
    lda ($60), y
    adc $4a
    sta $4a
    lda #$00
    adc $4b
    sta $4b
    clc
    ldy #$1c
    lda ($60), y
    adc $4c
    sta $4c
    iny
    lda ($60), y
    adc $4d
    sta $4d
    ldy #$1e
    lda ($60), y
    beq B23_147e
    sta enemy_group
    B23_147e:
    lda #$06
    sta $07f0
    pla
    tay
    jsr B23_1555
    jmp B23_1490

B23_148b:
    lda #$15
    jsr B31_141f
    B23_1490:
    jsr B31_15e5
    pla
    tay
    rts

B23_1496:
    tya
    pha
    bmi B23_14a9
    lda battlers+ALLY_ID, y
    cmp #$06
    beq B23_14c7
    lda #$10
    jsr DisplayText_battle ; "[target] got tired and collapsed..."
    jmp B23_14c7
    B23_14a9:
    lda $56
    cmp #$06
    beq B23_14c7
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    ldy #$0a
    lda ($60), y
    and #$1c
    lsr a
    lsr a
    clc
    adc #$79
    jsr DisplayText_battle ; Enemy defeated text
    B23_14c7:
    pla
    tay
    rts

B23_14ca:
    tya
    pha
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    ldy #$08
    lda ($60), y
    and #$1c
    lsr a
    lsr a
    sta $60
    pla
    tay
    lda $60
    rts

B23_14e5:
    ldy attacker_offset
    clc
    lda battlers+DATA_POINTER, y
    adc #$20
    sta $60
    lda battlers+DATA_POINTER+1, y
    adc #$00
    sta $61
    ldy attacker_offset
    lda $0610, y
    tay
    B23_14fc:
    jsr EnablePRGRam
    B23_14ff:
    cpy #$07
    beq B23_150c
    iny
    lda ($60), y
    dey
    sta ($60), y
    iny
    bne B23_14ff
    B23_150c:
    lda #$00
    sta ($60), y
    jmp WriteProtectPRGRam

B23_1513:
    jsr B23_15bc
    lda battlers+AILMENTS, y
    and #$7f
    sta battlers+AILMENTS, y
    lda #$22
    sta $60
    lda #$ff
    sta $61
    lda #$ff
    sta $62
    jsr B23_1589
    lda #$00
    sta $45
    tya
    pha
    lda $061a, y
    and #$03
    tax
    ldy #$1f
    lda ($5c), y
    sta $40, x
    pla
    tay
    lda battlers+ACTION_TARGET, y
    ldx $65
    sta $0300, x
    lda #$01
    sta $e5
    jsr WaitFrame
    lda #$80
    sta $e5
    rts

B23_1555:
    jsr B23_15bc
    lda #$00
    ldx $65
    sta $0300, x
    lda #$01
    sta $e5
    jsr WaitFrame
    lda #$80
    sta $e5
    lda #$00
    sta battlers, y
    lda #$00
    sta $60
    lda #$23
    sta $61
    lda #$01
    sta $62
    jsr B23_1589
    lda $061a, y
    and #$03
    tax
    lda #$7c
    sta $40, x
    rts

B23_1589:
    tya
    pha
    lda $061a, y
    and #$03
    tax
    ldy #$1f
    lda ($5c), y
    ora #$80
    sta $40, x
    pla
    tay
    lda #$80
    sta $45
    B23_159f:
    lda $60
    sta $44
    and #$01
    bne B23_15ad
    lda $45
    eor #$40
    sta $45
    B23_15ad:
    jsr WaitFrame
    clc
    lda $60
    adc $62
    sta $60
    cmp $61
    bne B23_159f
    rts

B23_15bc:
    lda battlers+DATA_POINTER, y
    sta $5c
    lda battlers+DATA_POINTER+1, y
    sta $5d
    lda $061a, y
    and #$03
    sta $64
    asl a
    asl a
    asl a
    sta $65
    rts

B23_15d3:
    lda #$0f
    ldx #$03
    jmp B23_1626

B23_15da:
    lda #$16
    ldx #$03
    jmp B23_1626

B23_15e1:
    lda #$12
    ldx #$03
    jmp B23_1626

B23_15e8:
    lda #$31
    ldx #$03
    jmp B23_1626

B23_15ef:
    lda #$28
    ldx #$03
    jmp B23_1626

B23_15f6:
    lda #$2a
    ldx #$03
    jmp B23_1626

B23_15fd:
    ldx #$03
    B23_15ff:
    txa
    pha
    lda #$05
    sta $07f0
    jsr Rand
    and #$03
    tax
    inx
    B23_160d:
    txa
    pha
    lda #$01
    sta $07f0
    pla
    pha
    ldx #$03
    jsr B23_1626
    pla
    tax
    dex
    bne B23_160d
    pla
    tax
    dex
    bne B23_15ff
    rts

B23_1626:
    sta $61
    stx $60
    lda #$02
    jsr B31_141f
    ldy target_offset
    jsr B23_15bc
    jsr PpuSync
    ldx $60
    B23_1639:
    txa
    pha
    ldx $65
    lda $0300, x
    pha
    lda #$00
    sta $0300, x
    lda #$01
    sta $e5
    jsr WaitFrame
    lda #$7c
    ldx $64
    sta $40, x
    lda $61
    jsr B31_14b8
    jsr WaitFrame
    pla
    ldx $65
    sta $0300, x
    lda #$01
    sta $e5
    jsr WaitFrame
    ldy #$1f
    lda ($5c), y
    ldx $64
    sta $40, x
    jsr B31_14b6
    jsr WaitFrame
    pla
    tax
    dex
    bne B23_1639
    rts

B23_167c:
    lda #$02
    jsr B31_141f
    jsr B23_15bc
    ldy target_offset
    lda battlers+ACTION_TARGET, y
    pha
    ldx $65
    lda $0300, x
    ldy target_offset
    sta battlers+ACTION_TARGET, y
    lda #$00
    ldx $65
    sta $0300, x
    lda #$01
    sta $e5
    jsr WaitFrame
    lda #$80
    sta $e5
    ldy target_offset
    jsr B23_1513
    pla
    ldy target_offset
    sta battlers+ACTION_TARGET, y
    rts

B23_16b2:
    ldx #$41
    ldy #$9f
    lda #$0f
    jmp B23_16fa

B23_16bb:
    ldx #$41
    ldy #$9f
    lda #$16
    jmp B23_16fa

B23_16c4:
    ldx #$41
    ldy #$9f
    lda #$12
    jmp B23_16fa

B23_16cd:
    ldx #$41
    ldy #$9f
    lda #$31
    jmp B23_16fa

B23_16d6:
    ldx #$41
    ldy #$9f
    lda #$28
    jmp B23_16fa

B23_16df:
    ldx #$61
    ldy #$9f
    lda #$2a
    jmp B23_16fa

B23_16e8:
    ldx #$61
    ldy #$9f
    lda #$0f
    jmp B23_16fa

B23_16f1:
    ldx #$4b
    ldy #$9f
    lda #$0f
    jmp B23_16fa

B23_16fa:
    sta $64
    stx $60
    sty $61
    lda #$10
    jsr B31_141f
    jsr PpuSync
    ldy #$00
    lda ($60), y
    sta $62
    iny
    lda ($60), y
    sta $63
    clc
    lda $60
    adc #$02
    sta $60
    lda $61
    adc #$00
    sta $61
    B23_1720:
    ldy #$00
    B23_1722:
    tya
    pha
    and #$02
    beq B23_1730
    lda $64
    jsr B31_14b8
    jmp B23_1733
    B23_1730:
    jsr B31_14b6
    B23_1733:
    pla
    tay
    lda ($60), y
    sta $e9
    iny
    lda ($60), y
    sta $e8
    iny
    lda #$01
    sta $e5
    jsr WaitFrame
    cpy $63
    bne B23_1722
    dec $62
    bne B23_1720
    lda #$00
    sta $e8
    sta $e9
    jsr WaitFrame
    jmp B31_14b6
    B23_175a:
    lda $47
    cmp #$01
    beq B23_17b0
    cmp #$02
    beq B23_17b0
    ldy #$00
    B23_1766:
    lda battlers, y
    beq B23_177b
    lda battlers+ALLY_ID, y
    and #$06
    eor #$06
    beq B23_177b
    lda battlers+AILMENTS, y
    and #$e0
    beq B23_17b2
    B23_177b:
    tya
    clc
    adc #$20
    tay
    bpl B23_1766
    lda #$80
    sta battlers+AILMENTS
    sta $0621
    sta $0641
    sta $0661
    lda $56
    cmp #$04
    bne B23_17a7
    lda #$03
    sta $47
    lda #$04
    jsr B31_141f
    lda #$8f
    jsr DisplayText_battle ; "[attacker] tore a hole through space!"
    jmp B23_17b0
    B23_17a7:
    lda #$00
    sta attacker_offset
    lda #$0e
    jsr DisplayText_battle ; "[ninten] was defeated..."
    B23_17b0:
    sec
    rts

B23_17b2:
    lda $0680
    ora $06a0
    ora $06c0
    ora $06e0
    bne B23_17f3
    lda is_in_tank
    beq B23_17c9
    lda #$31
    jsr DisplayText_battle ; "The tank was scrapped..."
    B23_17c9:
    lda $56
    cmp #$06
    bne B23_17e7
    lda #$00
    sta target_offset
    jsr B23_18d4
    lda #$20
    sta target_offset
    jsr B23_18d4
    lda #$40
    sta target_offset
    jsr B23_18d4
    jmp B23_17f1
    B23_17e7:
    lda #$05
    jsr ChangeMusic
    lda #$0d
    jsr DisplayText_battle ; "YOU WIN"
    B23_17f1:
    sec
    rts

B23_17f3:
    lda $56
    cmp #$01
    bne B23_1802
    ldy #$00
    jsr B31_1673
    bcs B23_1802
    sec
    rts
    B23_1802:
    clc
    rts

; Battle action command 4X
B23_1804:
    ldy #$01
    lda ($5e), y
    jsr JSRTable

    .addr B23_1863  ; Return address
    .addr B23_1868  ; 00
    .addr B23_1879  ; 01
    .addr B23_1899  ; 02
    .addr B23_18af  ; 03
    .addr B23_18bd  ; 04
    .addr B23_18cb  ; 05
    .addr B23_1915  ; 06
    .addr B23_1a07  ; 07
    .addr B23_1a1b  ; 08
    .addr B23_1a2a  ; 09
    .addr B23_1a3c  ; 0A
    .addr B23_1a6e  ; 0B
    .addr B23_1a7a  ; 0C
    .addr B23_1a95  ; 0D
    .addr B23_18aa  ; 0E
    .addr B23_18f2  ; 0F
    .addr B23_1a86  ; 10
    .addr B23_188a  ; 11
    .addr B23_1ae4  ; 12
    .addr B23_1afa  ; 13
    .addr B23_1b0d  ; 14
    .addr B23_1b25  ; 15
    .addr B23_1b3d  ; 16
    .addr B23_1b55  ; 17
    .addr B23_1b78  ; 18
    .addr B23_1b83  ; 19
    .addr B23_1b8c  ; 1A
    .addr B23_1b9d  ; 1B
    .addr B23_1bb0  ; 1C
    .addr B23_1bcd  ; 1D
    .addr B23_1beb  ; 1E
    .addr B23_1bf9  ; 1F
    .addr B23_1c02  ; 20
    .addr B23_1c0b  ; 21
    .addr B23_1c14  ; 22
    .addr B23_1c1d  ; 23
    .addr B23_1c26  ; 24
    .addr B23_1c38  ; 25
    .addr B23_1c2f  ; 26
    .addr B23_1cd0  ; 27
    .addr B23_1d2b  ; 28
    .addr B23_1c5d  ; 29
    .addr B23_1d44  ; 2A

B23_1863:
    lda #$02
    jmp AdvanceAndContinue

; Battle action command 4X 00
B23_1868:
    jsr B23_1ddd
    B23_186b:
    ldx target_offset
    ldy #$03
    jsr B23_1ef2
    ldx #$0a
    lda #$3e
    jmp B23_1d5b

; Battle action command 4X 01
B23_1879:
    jsr B23_1ddd
    ldx target_offset
    ldy #$05
    jsr B23_1ef2
    ldx #$0a
    lda #$3d
    jmp B23_1d5b

; Battle action command 4X 11 - Offense up
B23_188a:
    jsr B23_1ddd
    ldx target_offset
    ldy #$07
    jsr B23_1de8
    lda #$20
    jmp DisplayText_battle ; "[target]'s Offense went up by [number]!"

; Battle action command 4X 02 - Speed up
B23_1899:
    jsr B23_1ddd
    ldx target_offset
    ldy #$0c
    jsr B23_1e3b
    ldx #$09
    lda #$23
    jmp B23_1d5b ; "[target]'s Speed went up by [number]!"

; Battle action command 4X 0E
B23_18aa:
    ldy attacker_offset
    jmp B23_142d

; Battle action command 4X 03
B23_18af:
    ldx target_offset
    ldy #$07
    jsr B23_1f00
    ldx #$09
    lda #$20
    jmp B23_1d5b ; "[target]'s Offense went up by [number]!"

; Battle action command 4X 04
B23_18bd:
    ldx target_offset
    ldy #$09
    jsr B23_1f00
    ldx #$09
    lda #$22
    jmp B23_1d5b ; "[target]'s Defense went up by [number]!"

; Battle action command 4X 05
B23_18cb:
    lda #$ff
    sta $4e
    sta $4f
    jmp B23_186b

B23_18d4:
    lda #$ff
    sta $4e
    sta $4f
    lda #$00
    ldx target_offset
    sta battlers+AILMENTS, x
    ldy #$03
    jsr B23_1ef2
    ldx #$0a
    lda #$00
    jsr B23_1d5b
    ldx #20
    jmp WaitXFrames

; Battle action command 4X 0F
B23_18f2:
    jsr B23_1ddd
    ldy attacker_offset
    sec
    lda battlers+HP, y
    sbc $60
    sta battlers+HP, y
    lda battlers+HP+1, y
    sbc $61
    sta battlers+HP+1, y
    bcc B23_1912
    ora battlers+HP, y
    beq B23_1912
    jmp B31_15e5
    B23_1912:
    jmp B23_13dd

; Battle action command 4X 06
B23_1915:
    lda $56
    cmp #$05
    beq B23_193e
    cmp #$06
    beq B23_193e
    jsr B23_1fe2
    bcc B23_193e
    B23_1924:
    ldx #$03
    ldy attacker_offset
    lda battlers+ALLY_ID, y
    cmp #$06
    bne B23_1931
    ldx #$3f
    B23_1931:
    stx $60
    jsr Rand
    and $60
    sta $4e
    lda #$00
    sta $4f
    B23_193e:
    lda target_offset
    pha
    jsr B23_1ddd
    ldy target_offset
    lda battlers+BATTLE_STATUS, y
    and #$04
    beq B23_1962
    lda $61
    pha
    lda $60
    pha
    lda #attacker_offset
    jsr DisplayText_battle ; "[target] reflects!"
    pla
    sta $60
    pla
    sta $61
    ldy attacker_offset
    sty target_offset
    B23_1962:
    lda battlers+BATTLE_STATUS, y
    and #$10
    beq B23_196d
    lsr $61
    ror $60
    B23_196d:
    lda battlers+BATTLE_STATUS, y
    and #$08
    beq B23_1978
    lsr $61
    ror $60
    B23_1978:
    jsr B23_1f74
    lda $60
    ora $61
    bne B23_1983
    inc $60
    B23_1983:
    lda $60
    sta $0590
    pha
    lda $61
    sta $0591
    pha
    lda #$0c
    jsr DisplayText_battle ; TODO: took [number] damage?
    pla
    sta $61
    pla
    sta $60
    lda $56
    cmp #$03
    beq B23_19a5
    jsr B23_1fef
    bcs B23_19c4
    B23_19a5:
    jsr B23_1fe2
    bcs B23_19c4
    ldy target_offset
    sec
    lda battlers+HP, y
    sbc $60
    sta battlers+HP, y
    lda battlers+HP+1, y
    sbc $61
    sta battlers+HP+1, y
    bcc B23_1a00
    ora battlers+HP, y
    beq B23_1a00
    B23_19c4:
    lda battlers+AILMENTS, y
    and #$0c
    beq B23_19df
    jsr Rand
    and #$c0
    bne B23_19df
    lda battlers+AILMENTS, y
    and #$f3
    sta battlers+AILMENTS, y
    lda #$8d
    jsr DisplayText_battle ; "[target]'s confusion went away!"
    B23_19df:
    lda battlers+AILMENTS, y
    and #$10
    beq B23_19fa
    jsr Rand
    and #$c0
    bne B23_19fa
    lda battlers+AILMENTS, y
    and #$ef
    sta battlers+AILMENTS, y
    lda #$61
    jsr DisplayText_battle ; 20 f8 a3 ; "[target] woke up!"
    B23_19fa:
    pla
    sta target_offset
    jmp B31_15e5
    B23_1a00:
    jsr B23_13dd
    pla
    sta target_offset
    rts

; Battle action command 4X 07 - Defense down
B23_1a07:
    jsr B23_1ddd
    ldy target_offset
    jsr B23_1f74
    ldx target_offset
    ldy #$09
    jsr B23_1e72
    lda #$27
    jmp DisplayText_battle ; "[target]'s defense went down by [number]!"

; Battle action command 4X 08 - Fight down
B23_1a1b:
    jsr B23_1ddd
    ldx target_offset
    ldy #$0b
    jsr B23_1ec4
    lda #$26
    jmp DisplayText_battle ; "[target]'s Fight went down by [number]!"

; Battle action command 4X 09
B23_1a2a:
    jsr B23_1fe2
    bcs B23_1a39
    jsr B23_1fef
    bcs B23_1a39
    ldy target_offset
    jmp B23_13dd
    B23_1a39:
    jmp B23_1924

; Battle action command 4X 0A
B23_1a3c:
    jsr B23_1fe2
    bcs B23_1a6b
    jsr B23_1fef
    bcs B23_1a6b
    ldy target_offset
    jsr Rand
    and #$03
    tax
    inx
    txa
    sec
    sbc battlers+HP, y
    lda #$00
    sbc battlers+HP+1, y
    bcs B23_1a6b
    txa
    sta battlers+HP, y
    lda #$00
    sta battlers+HP+1, y
    ldx #$00
    lda #$38
    jmp B23_1d5b ; "Cryoed [target]!"
    B23_1a6b:
    jmp DisplayNoEffectOnTarget

; Battle action command 4X 0B - Offense down
B23_1a6e:
    ldx target_offset
    ldy #$07
    jsr B23_1f15
    lda #$21
    jmp DisplayText_battle ; "[target]'s Offense went down by [number]!"

; Battle action command 4X 0C - Defense down
B23_1a7a:
    ldx target_offset
    ldy #$09
    jsr B23_1f15
    lda #$27
    jmp DisplayText_battle ; "[target]'s Defense went down by [number]!"

; Battle action command 4X 10 - Edge closer (offense up)
B23_1a86:
    jsr B23_1ddd
    ldx attacker_offset
    ldy #$07
    jsr B23_1de8
    lda #$5c
    jmp DisplayText_battle ; "[target] edged closer!"

; Battle action command 4X 0D
B23_1a95:
    jsr B23_1ddd
    ldy target_offset
    bmi B23_1add
    lda battlers+DATA_POINTER, y
    sta $62
    lda battlers+DATA_POINTER+1, y
    sta $63
    ldy #$11
    clc
    lda ($62), y
    adc $60
    sta $64
    iny
    lda ($62), y
    adc $61
    sta $65
    iny
    lda ($62), y
    adc #$00
    sta $66
    bcc B23_1ac7
    lda #$ff
    sta $64
    sta $65
    sta $66
    B23_1ac7:
    jsr EnablePRGRam
    ldy #$11
    lda $64
    sta ($62), y
    iny
    lda $65
    sta ($62), y
    iny
    lda $66
    sta ($62), y
    jsr WriteProtectPRGRam
    B23_1add:
    ldx #$0a
    lda #$2f
    jmp B23_1d5b ; "For some reason, [target]'s experience points went up!"

; Battle action command 4X 12 - Blind
B23_1ae4:
    jsr B23_1fe2
    bcs B23_1af7
    jsr B23_1f58
    bcs B23_1af7
    lda #$1b
    ldy #$00
    ldx #$80
    jmp B23_1d7f ; "Blinded [target]!"
    B23_1af7:
    jmp DisplayNoEffectOnTarget

; Battle action command 4X 13 - Poison
B23_1afa:
    jsr B23_1fe2
    bcs B23_1af7
    jsr B23_1f58
    bcs B23_1af7
    lda #$4b
    ldy #$00
    ldx #$02
    jmp B23_1d69 ; "[target] was poisoned!"

; Battle action command 4X 14 - Confuse
B23_1b0d:
    jsr B23_1fe2
    bcs B23_1af7
    jsr B23_1fef
    bcs B23_1af7
    jsr B23_1f66
    bcs B23_1af7
    lda #$39
    ldy #$00
    ldx #$08
    jmp B23_1d69 ; "[target] became confused!"

; Battle action command 4X 15 - Put to sleep
B23_1b25:
    jsr B23_1fe2
    bcs B23_1af7
    jsr B23_1fef
    bcs B23_1af7
    jsr B23_1f66
    bcs B23_1af7
    lda #$3b
    ldy #$00
    ldx #$10
    jmp B23_1d69 ; "Sleeped [target]!"

; Battle action command 4X 16 - Paralyze
B23_1b3d:
    jsr B23_1fe2
    bcs B23_1af7
    jsr B23_1fef
    bcs B23_1af7
    jsr B23_1f58
    bcs B23_1af7
    lda #$49
    ldy #$00
    ldx #$20
    jmp B23_1d69 ; "Numbed [target]!"

; Battle action command 4X 17 - Block
B23_1b55:
    jsr B23_1fe2
    bcs B23_1af7
    ldy target_offset
    lda battlers+DATA_POINTER, y
    sta $60
    lda battlers+DATA_POINTER+1, y
    sta $61
    ldy #$05
    lda ($60), y
    iny
    ora ($60), y
    beq B23_1af7
    lda #$4d
    ldy #$00
    ldx #$40
    jmp B23_1d7f ; "Blocked [target]!"

; Battle action command 4X 18
B23_1b78:
    ldy target_offset
    lda battlers+BATTLE_STATUS, y
    ora #$08
    sta battlers+BATTLE_STATUS, y
    rts

; Battle action command 4X 19
B23_1b83:
    lda #$4f
    ldy #$0a
    ldx #$10
    jmp B23_1d7f ; "Shielded [target]!"

; Battle action command 4X 1A
B23_1b8c:
    jsr B23_1fe6
    bcs B23_1b9a
    lda #$17
    ldy #$0a
    ldx #$04
    jmp B23_1d7f ; "Barriered [target]!"
    B23_1b9a:
    jmp DisplayNoEffectOnTarget

; Battle action command 4X 1B
B23_1b9d:
    jsr B23_1fe2
    bcs B23_1b9a
    jsr B23_1fef
    bcs B23_1b9a
    lda #$4e
    ldy #$00
    ldx #$20
    jmp B23_1d7f ; "Roped [target]!"

; Battle action command 4X 1C
B23_1bb0:
    jsr B23_1fe2
    bcs B23_1b9a
    jsr B23_1fef
    bcs B23_1b9a
    lda #$19
    ldy #$00
    ldx #$40
    jsr B23_1d69 ; "Petrified [target]!"
    bcs B23_1bcc
    ldx target_offset
    ldy #$09
    jsr B23_1f00
    B23_1bcc:
    rts

; Battle action command 4X 1D
B23_1bcd:
    ldy target_offset
    lda battlers+ALLY_ID, y
    cmp #$01
    bne B23_1bea
    lda battlers+BATTLE_STATUS, y
    and #$02
    bne B23_1bea
    lda battlers+BATTLE_STATUS, y
    ora #$02
    sta battlers+BATTLE_STATUS, y
    lda #$74
    jmp DisplayText_battle ; "[target] had an asthma attack!"
    B23_1bea:
    rts

; Battle action command 4X 1E
B23_1beb:
    jsr B23_1f66
    bcs B23_1b9a
    lda #$67
    ldy #$00
    ldx #$04
    jmp B23_1d69 ; "[attacker] did something strange!"

; Battle action command 4X 1F
B23_1bf9:
    lda #$5d
    ldy #$0a
    ldx #$02
    jmp B23_1d95 ; "[target] was cured!"

; Battle action command 4X 20
B23_1c02:
    lda #$61
    ldy #$0a
    ldx #$10
    jmp B23_1d95 ; "[target] woke up!"

; Battle action command 4X 21
B23_1c0b:
    lda #$60
    ldy #$0a
    ldx #$20
    jmp B23_1d95 ; "[target] can move!"

; Battle action command 4X 22
B23_1c14:
    lda #$70
    ldy #$0a
    ldx #$02
    jmp B23_1dab ; "[target]'s asthma attack went away!"

; Battle action command 4X 23
B23_1c1d:
    lda #$5e
    ldy #$0a
    ldx #$0c
    jmp B23_1d95 ; "[target] went back to normal!"

; Battle action command 4X 24
B23_1c26:
    lda #$69
    ldy #$02
    ldx #$10
    jmp B23_1dab ; "[target]'s shield was destroyed!"

; Battle action command 4X 26
B23_1c2f:
    lda #$71
    ldy #$0a
    ldx #$40
    jmp B23_1d95 ; "[target] can move!"

; Battle action command 4X 25 - Revive (may fail)
B23_1c38:
    ldy target_offset
    lda battlers+AILMENTS, y
    and #$80
    beq B23_1c5a
    lda #$00
    sta battlers+AILMENTS, y
    lda #$ff
    sta $4e
    sta $4f
    ldx target_offset
    ldy #$03
    jsr B23_1ef2
    ldx #$0a
    lda #$62
    jmp B23_1d5b ; "[target] was revived!"
    B23_1c5a:
    jmp DisplayNoEffectOnTarget

; Battle action command 4X 29 - Sing
B23_1c5d:
    ldx $56
    cpx #$06
    beq B23_1c85
    lda #$19
    jsr ChangeMusic
    lda current_music
    pha
    ldx #$00
    jsr B31_126b
    lda #$03
    sta $07f0
    ldx #56
    jsr WaitXFrames
    pla
    cmp current_music
    beq B23_1c84
    sta new_music
    B23_1c84:
    rts
    B23_1c85:
    lda #$19
    jsr ChangeMusic
    sec
    lda $55
    sbc #$9e
    tax
    jsr B31_126b
    lda #$03
    sta $07f0
    jsr B23_16e8
    lda $55
    jsr DisplayText_battle
    lda #$2c
    jsr ChangeMusic
    ldx $55
    inx
    cpx #$a9
    beq B23_1caf
    stx $55
    rts
    B23_1caf:
    jsr B23_15fd
    lda #$ff
    jsr ChangeMusic
    ldx #200
    jsr WaitXFrames
    ldx #$a9
    B23_1cbe:
    stx $55
    txa
    jsr DisplayText_battle ; Giegue's defeat text
    ldx $55
    inx
    cpx #$ac
    bne B23_1cbe
    ldy #$80
    jmp B23_13dd

; Battle action command 4X 27 - TODO: PSI Magnet?
B23_1cd0:
    ldx #$0a
    ldy target_offset
    lda battlers+PP, y
    ora battlers+PP+1, y
    beq B23_1d28
    sec
    lda battlers+PP, y
    tax
    sbc #$0a
    lda battlers+PP+1, y
    sbc #$00
    bcc B23_1cec
    ldx #$0a
    B23_1cec:
    stx $0590
    ldx #$00
    stx $0591
    sec
    lda battlers+PP, y
    sbc $0590
    sta battlers+PP, y
    lda battlers+PP+1, y
    sbc $0591
    sta battlers+PP+1, y
    lda #$48
    jsr DisplayText_battle ; TODO: target lost PP
    lda $0590
    sta $60
    lda $0591
    sta $61
    ldx attacker_offset
    ldy #$05
    jsr B23_1ef2
    lda attacker_offset
    sta target_offset
    ldx #$0a
    lda #$3d
    jmp B23_1d5b
    B23_1d28:
    jmp DisplayNoEffectOnTarget

; Battle action command 4X 28 - Guard (acts as steal item for enemies?)
B23_1d2b:
    ldy target_offset
    bmi B23_1d3f
    jsr B23_1faa
    bcs B23_1d3f
    jsr B23_14fc
    jsr StoreItemName
    lda #$81
    jmp DisplayText_battle ; "[attacker] stole [target]'s [item]!"
    B23_1d3f:
    lda #$59
    jmp DisplayText_battle ; "[attacker] guards."

; Battle action command 4X 2A - Inflict Confuse
B23_1d44:
    ldy target_offset
    lda battlers+AILMENTS, y
    and #$08
    bne B23_1d5a
    lda battlers+AILMENTS, y
    ora #$08
    sta battlers+AILMENTS, y
    lda #$39
    jsr DisplayText_battle ; "[target] became confused!"
    B23_1d5a:
    rts

B23_1d5b:
    pha
    txa
    beq B23_1d62
    jsr B31_141f
    B23_1d62:
    jsr B31_15e5
    pla
    jmp DisplayText_battle

B23_1d69:
    pha
    jsr B23_1dcc
    lda battlers+AILMENTS, y
    and $60
    bne B23_1dc6
    lda battlers+AILMENTS, y
    ora $60
    sta battlers+AILMENTS, y
    jmp B23_1dbe

B23_1d7f:
    pha
    jsr B23_1dcc
    lda battlers+BATTLE_STATUS, y
    and $60
    bne B23_1dc6
    lda battlers+BATTLE_STATUS, y
    ora $60
    sta battlers+BATTLE_STATUS, y
    jmp B23_1dbe

B23_1d95:
    pha
    jsr B23_1dcc
    lda battlers+AILMENTS, y
    and $60
    beq B23_1dc6
    lda battlers+AILMENTS, y
    and $61
    sta battlers+AILMENTS, y
    jmp B23_1dbe

B23_1dab:
    pha
    jsr B23_1dcc
    lda battlers+BATTLE_STATUS, y
    and $60
    beq B23_1dc6
    lda battlers+BATTLE_STATUS, y
    and $61
    sta battlers+BATTLE_STATUS, y
    B23_1dbe:
    ldx $58
    pla
    jsr B23_1d5b
    clc
    rts
    B23_1dc6:
    pla
    jsr DisplayNoEffectOnTarget
    sec
    rts

B23_1dcc:
    stx $60
    txa
    eor #$ff
    sta $61
    sty $58
    ldy target_offset
    rts

DisplayNoEffectOnTarget:
    lda #$55
    jmp DisplayText_battle

B23_1ddd:
    lda $4e
    sta $60
    lda $4f
    sta $61
    jmp B31_12ed

B23_1de8:
    jsr B23_1f2c
    B23_1deb:
    clc
    lda battlers, x
    adc $60
    sta $66
    lda battlers+AILMENTS, x
    adc $61
    sta $67
    bcc B23_1e02
    lda #$ff
    sta $66
    sta $67
    B23_1e02:
    sec
    lda $64
    sbc $66
    lda $65
    sbc $67
    bcs B23_1e15
    lda $64
    sta $66
    lda $65
    sta $67
    B23_1e15:
    sec
    lda $66
    sbc battlers, x
    sta $0590
    lda $67
    sbc battlers+AILMENTS, x
    sta $0591
    bcc B23_1e38
    ora $0590
    beq B23_1e38
    lda $66
    sta battlers, x
    lda $67
    sta battlers+AILMENTS, x
    rts
    B23_1e38:
    jmp B23_1fd8

B23_1e3b:
    jsr B23_1f2c
    clc
    lda battlers, x
    adc $60
    sta $66
    bcc B23_1e4c
    lda #$ff
    sta $66
    B23_1e4c:
    sec
    lda $64
    sbc $66
    bcs B23_1e57
    lda $64
    sta $66
    B23_1e57:
    lda #$00
    sta $0591
    sec
    lda $66
    sbc battlers, x
    sta $0590
    bcc B23_1e6f
    beq B23_1e6f
    lda $66
    sta battlers, x
    rts
    B23_1e6f:
    jmp B23_1fd8

B23_1e72:
    jsr B23_1f2c
    sec
    lda battlers, x
    sbc $60
    sta $66
    lda battlers+AILMENTS, x
    sbc $61
    sta $67
    bcs B23_1e8c
    lda #$00
    sta $66
    sta $67
    B23_1e8c:
    cpy #$03
    beq B23_1e9e
    cpy #$05
    beq B23_1e9e
    lda $66
    ora $67
    bne B23_1e9e
    lda #$01
    sta $66
    B23_1e9e:
    sec
    lda battlers, x
    sbc $66
    sta $0590
    lda battlers+AILMENTS, x
    sbc $67
    sta $0591
    bcc B23_1ec1
    ora $0590
    beq B23_1ec1
    lda $66
    sta battlers, x
    lda $67
    sta battlers+AILMENTS, x
    rts
    B23_1ec1:
    jmp B23_1fd8

B23_1ec4:
    jsr B23_1f2c
    sec
    lda battlers, x
    sbc $60
    sta $66
    beq B23_1ed3
    bcs B23_1ed7
    B23_1ed3:
    lda #$01
    sta $66
    B23_1ed7:
    lda #$00
    sta $0591
    sec
    lda battlers, x
    sbc $66
    sta $0590
    beq B23_1eef
    bcc B23_1eef
    lda $66
    sta battlers, x
    rts
    B23_1eef:
    jmp B23_1fd8

B23_1ef2:
    jsr B23_1f2c
    lda $62
    sta $64
    lda $63
    sta $65
    jmp B23_1deb

B23_1f00:
    txa
    pha
    jsr B23_1f2c
    pla
    tax
    lda $62
    sta $60
    lda $63
    sta $61
    jsr B31_12ed
    jmp B23_1de8

B23_1f15:
    txa
    pha
    jsr B23_1f2c
    pla
    tax
    lda $63
    lsr a
    sta $61
    lda $62
    ror a
    sta $60
    jsr B31_12ed
    jmp B23_1e72

B23_1f2c:
    lda battlers+DATA_POINTER, x
    sta $66
    lda battlers+DATA_POINTER+1, x
    sta $67
    lda ($66), y
    sta $62
    asl a
    sta $64
    iny
    lda ($66), y
    and #$03
    sta $63
    rol a
    sta $65
    bcc B23_1f4f
    lda #$ff
    sta $64
    sta $65
    B23_1f4f:
    dey
    stx $68
    tya
    clc
    adc $68
    tax
    rts

B23_1f58:
    ldy attacker_offset
    lda battlers+WISDOM, y
    tax
    ldy target_offset
    lda battlers+STRENGTH, y
    jmp B23_1f8c

B23_1f66:
    ldy attacker_offset
    lda battlers+WISDOM, y
    tax
    ldy target_offset
    lda battlers+FORCE, y
    jmp B23_1f8c

B23_1f74:
    lda battlers+RESISTANCES, y
    and $57
    beq B23_1f87
    lsr $61
    ror $60
    lda $60
    ora $61
    bne B23_1f87
    inc $60
    B23_1f87:
    lda #$00
    sta $57
    rts

B23_1f8c:
    lsr a
    sta $60
    stx $64
    txa
    sec
    sbc $60
    bcs B23_1f99
    lda #$00
    B23_1f99:
    sta $61
    lda #$00
    sta $60
    sta $62
    jsr B31_113d
    jsr Rand
    cmp $60
    rts

B23_1faa:
    jsr GetInventoryPointer_battle
    ldy #$00
    B23_1faf:
    tya
    pha
    lda ($60), y
    beq B23_1fcb
    jsr GetItemPointer
    jsr BankswitchLower_Bank00_Preserve
    ldy #$05
    lda ($62), y
    tax
    ldy #$02
    lda ($62), y
    jsr BankswitchLower_Bank22
    and #$40
    bne B23_1fd4
    B23_1fcb:
    pla
    tay
    iny
    cpy #$08
    bne B23_1faf
    sec
    rts
    B23_1fd4:
    pla
    tay
    clc
    rts

B23_1fd8:
    lda #$00
    sta $0590
    sta $0591
    clc
    rts

B23_1fe2:
    lda target_offset
    bpl B23_1feb
    B23_1fe6:
    lda $56
    lsr a
    bne B23_1fed
    B23_1feb:
    clc
    rts
    B23_1fed:
    sec
    rts

B23_1fef:
    ldy target_offset
    bmi B23_1ffc
    lda battlers+ALLY_ID, y
    cmp #$06
    bne B23_1ffc
    sec
    rts
    B23_1ffc:
    clc
    rts
