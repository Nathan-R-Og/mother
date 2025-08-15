.segment        "ANTIPIRACY": absolute

;anti-piracy
ANTI_PIRACY:
    ;if scroll_x != 0, jump
    ;if scroll_y != 0, jump
    ;if ram_PPUCTRL != %10001000, jump
    lda scroll_x
    cmp #0
    bne B25_0074
    lda scroll_y
    cmp #0
    bne B25_0074
    lda ram_PPUCTRL
    cmp #%10001000
    bne B25_0074

    jsr PpuSync

    ;add nmi queue
    ;PPU_READ $12 ($2307)
    lda #9
    ldx #$12
    sta nmi_queue ; READ_PPU_HIGH_BYTE (TODO: NEEDS A BETTER NAME)
    stx nmi_queue+1 ; Read 0x12 values
    lda #.LOBYTE($2307) ; PPUADDR = $2307
    ldx #.HIBYTE($2307)
    stx nmi_queue+2
    sta nmi_queue+3

    lda #0
    sta nmi_queue+$16

    sta UNK_E5+1
    lda #.HIBYTE($8000)
    sta UNK_E5

    jsr PpuSync

    ldx #0

    ;check if nmi_queue[4:$16] == B25_00c6
    @check_nmi_queue:
    lda nmi_queue+4, x
    cmp nmi_check_1, x
    bne B25_0074
    inx
    cpx #nmi_check_1_END-nmi_check_1
    bcc @check_nmi_queue

    ;modify previous nmi command
    ;[09 10 ($2307)]
    lda #$10
    sta nmi_queue+1
    ;insert zero???
    lda #0
    sta nmi_queue+$14

    ;UNK_60 <- B25_00d8
    lda #.LOBYTE(nmi_check_2)
    sta UNK_60
    lda #.HIBYTE(nmi_check_2)
    sta UNK_60+1
    lda #$43
    ldx #$05
    jsr B25_0079

    ;if not passed, jump
    bne B25_0074

    lda #$69
    ldx #$08
    jsr B25_0079

    ;if not passed, jump
    bne B25_0074
    lda #$53
    ldx #$05
    jsr B25_0079

    ;if not passed, jump
    bne B25_0074

    ;all checks passed. congratular
    rts

;piracy flag???
B25_0074:
    lda #$e5
    sta UNK_6
    rts

;nmi_check????
;returns zero flag (z) if safe.
;returns !zero flag (z) if pirated(?)
B25_0079:
    ; nmi_queue[2:3] = a << 4
    pha
    asl a
    asl a
    asl a
    asl a
    sta nmi_queue+3
    pla
    lsr a
    lsr a
    lsr a
    lsr a
    sta nmi_queue+2

    @loop:

    lda #.LOBYTE($8000)
    sta UNK_E5+1
    lda #.HIBYTE($8000)
    sta UNK_E5

    jsr PpuSync

    ;verify NMI queue
    ldy #0
    @check:
    lda nmi_queue+4, y
    cmp (UNK_60), y
    ;return zero flag off
    bne @exit
    iny
    cpy #nmi_check_2_END-nmi_check_2
    bcc @check

    ;clear carry
    clc

    ;UNK_60 += $10
    lda #$10
    adc UNK_60
    sta UNK_60
    lda #0
    adc UNK_60+1
    sta UNK_60+1

    dex

    ;exit if x == 0
    beq @exit

    clc

    ; nmi_queue[2:3] += $10
    lda #$10
    adc nmi_queue+3
    sta nmi_queue+3
    lda #0
    adc nmi_queue+2
    sta nmi_queue+2

    ;if nmi_queue[2:3] overflow, exit
    ;else, loop

    bcc @loop
    @exit:
    rts

nmi_check_1:
    .byte $43, $44, $45, $46, $47, $70, $69, $6a
    .byte $6b, $6c, $6d, $6e, $6f, $53, $54, $55
    .byte $56, $57
nmi_check_1_END:

nmi_check_2:
    .byte $00, $00, $00, $00, $00, $00, $00, $00
    .byte $00, $38, $44, $ba, $a2, $ba, $44, $38
nmi_check_2_END:

B25_00e8:
incbinRange "../../split/us/antipiracy.bin", $e8, $1f8

B25_01f8:
    jsr OT0_DefaultTransition
    jsr B31_1dc0
    jsr B31_1d5e
    jsr B31_1d80
    B25_0204:
    jsr PpuSync
    lda #$00
    sta $ec
    sta scroll_y
    sta scroll_x
    lda #$ff
    jsr PlayMusic
    B25_0214:
    lda #$7e
    ldx #$04
    jsr BANK_SWAP
    lda #$7f
    ldx #$05
    jsr BANK_SWAP
    lda #$f4
    sta $74
    lda #$06
    sta $73
    lda #$02
    sta $76
    lda #$02
    sta $77
    lda #$00
    sta $70
    sta $71
    B25_0238:
    jsr GetTextData
    jsr B30_06db
    cmp #$00
    beq B25_024a
    ldy #$00
    lda ($74), y
    cmp #$00
    bne B25_0238
    B25_024a:
    jsr PpuSync
    ldx #$1f
    B25_024f:
    lda B25_026b, x
    sta $0500, x
    dex
    bpl B25_024f
    lda #$04
    sta $0400 ; UPDATE_PALETTE
    lda #$00
    sta $0401 ; END
    sta $e6
    lda #$80
    sta $e5
    B25_0268:
    jmp B25_0268

B25_026b:
    .byte $0f, $00, $30, $10
    .byte $0f, $00, $30, $10
    .byte $0f, $00, $30, $10
    .byte $0f, $00, $30, $10
    .byte $0f, $0f, $00, $30
    .byte $0f, $0f, $16, $37
    .byte $0f, $0f, $24, $37
    .byte $0f, $0f, $12, $37

;$A28B
;loads naming_screen_1
LoadNamingScreen1:
    ;is this considered a workaround if this is what the game does
    ;id only say it is if it was possible to reference the bank address
    ;of naming_screen_1 but i dont think that's possible.
    ;genuinely. and wholeheartedly. whatevs.
    .import __ANTIPIRACY_SIZE__
    .import __ANTIPIRACY_START__
    naming_screen_1_in_this_bank = __ANTIPIRACY_START__ + __ANTIPIRACY_SIZE__

    ;set read address
    lda #.LOBYTE(naming_screen_1_in_this_bank)
    ldx #.HIBYTE(naming_screen_1_in_this_bank)
    sta UNK_60 ; $60 = 0xB800
    stx UNK_60+1

    ;set write address
    .import __NAMING_SCREEN_1_START__
    lda #.LOBYTE(__NAMING_SCREEN_1_START__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_START__)
    sta UNK_64 ; $64 = 0x6000
    stx UNK_64+1

    jsr EnablePRGRam

    ; Copy 0x0800 bytes from $B800 into $6000
    ldx #8
    @loop:
    ldy #0
    @copy:
    ;one iteration of this copies a full $100 bytes.
    lda (UNK_60), y
    sta (UNK_64), y
    iny
    bne @copy
    inc UNK_60+1
    inc UNK_64+1
    dex
    bne @loop

    jmp WriteProtectPRGRam

B25_02b3:
    clc
    lda player_x
    adc #$40
    and #$80
    sta $aa
    lda player_x+1
    adc #$00
    sta $ab
    lda player_y
    sta $ac
    lda player_y+1
    sta $ad
    jsr B30_155d
    lda player_x
    asl a
    asl a
    rol a
    and #$01
    tax
    ldy $a1
    lda #$10
    sta $7a
    jsr EnablePRGRam
    B25_02de:
    tya
    ora #$f0
    sta $7b
    B25_02e3:
    lda ($a4), y
    sta $6600, x
    iny
    inx
    inc $7b
    bne B25_02e3
    tya
    sec
    sbc #$10
    tay
    lda $a5
    eor #$01
    sta $a5
    lda $a1
    and #$0f
    beq B25_030c
    sta $7b
    B25_0301:
    lda ($a4), y
    sta $6600, x
    iny
    inx
    dec $7b
    bne B25_0301
    B25_030c:
    tya
    clc
    adc #$10
    tay
    lda $a5
    eor #$01
    sta $a5
    dec $7a
    bne B25_02de
    jmp WriteProtectPRGRam

B25_031e:
    sec
    ror $e2
    lda $76
    asl a
    asl a
    asl a
    sta $78
    clc
    lda $76
    adc $7e
    asl a
    asl a
    asl a
    sec
    sbc #$04
    sta $79
    lda $77
    clc
    and #$1e
    asl a
    asl a
    asl a
    sta $7c
    clc
    adc #$0c
    sta $7d
    ldx #$00
    B25_0346:
    lda $0200, x
    cmp $7d
    bcs B25_0365
    adc #$04
    cmp $7c
    bcc B25_0365
    lda $0203, x
    cmp $79
    bcs B25_0365
    adc #$04
    cmp $78
    bcc B25_0365
    lda #$f0
    sta $0200, x
    B25_0365:
    inx
    inx
    inx
    inx
    bne B25_0346
    asl $e2
    rts

SetupMenu:
    jsr Draw_SetupMenu

    ;display all 4 choices
    ldy #0
    @load_your_choices:
    tya
    pha
    jsr Display_SetupMenuChoices
    pla
    tay
    iny
    cpy #4
    bcc @load_your_choices

    ;yeah man
    lda #1
    sta UNK_D6

    ;do menu choicer
    lda #.LOBYTE(SetupMenu_Choicer)
    ldx #.HIBYTE(SetupMenu_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr B31_0f34


    @main_loop:
    ;if !PAD_A, jump
    bit menucursor_pos+1
    bpl @exit

    ;pos
    lda menucursor_pos
    tax
    ;y = a >> 3
    lsr a
    lsr a
    lsr a
    tay

    jsr EnablePRGRam

    ;write value
    lda SetupMenu_Choices, x
    sta preferences, y

    ;if y != 3, jump
    cpy #3
    bne @B25_03b0

    txa
    and #$07
    tax
    lda SetupMenu_MessageSpeeds, x
    sta battle_message_speed
    @B25_03b0:
    jsr WriteProtectPRGRam

    ;re-run the displaying script to add the new choice
    lda UNK_76
    pha
    lda UNK_76+1
    pha
    jsr Display_SetupMenuChoices

    ;reset UNK_76
    pla
    sta UNK_76+1
    pla
    sta UNK_76

    jsr B31_0f7c
    jmp @main_loop

    @exit:
    lda #0
    sta UNK_D6
    rts

;y = preference index
Display_SetupMenuChoices:
    ;UNK_77 = (y << 2) + 13
    tya
    asl a
    asl a
    adc #13 ;y pos offset?
    sta UNK_77

    ;get preferences[y]
    lda preferences, y
    sta UNK_60
    ;get preference_limits[y]
    lda SetupBitfields, y
    sta UNK_60+1

    ldx #5
    @loop:
    stx UNK_76

    ;get tile value from `preferences` boolean
    ;radial_empty + 0 or 1
    lda #radial_empty
    asl UNK_60
    adc #0

    ;;;check if should bother
    ;UNK_60+1 <<= 1
    ;if not carry, skip
    asl UNK_60+1
    bcc @no_add
    ;if carry, display value
    jsr AddTileViaNMI
    @no_add:
    clc

    ;x = UNK_76+4
    lda UNK_76
    adc #4
    tax
    ;if x == 25, break
    cpx #25
    bcc @loop

    rts

;self explanatory
SetupMenu_Choicer:
    .byte 8, 4 ; choicer array size
    .byte 4, 4 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3a ; Tile
    .byte 4, 13 ;X/Y start
    .addr SetupMenu_Choices ; choices

;used to determine when things are displayed/checked
SetupBitfields:
    .byte %10101000
    .byte %10101000
    .byte %10101000
    .byte %11111000

;bits that get written to save meta's 'preferences'
SetupMenu_Choices:
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,  0,$20,  0, 8, 0, 0, 0
    .byte $80,$40,$20,$10, 8, 0, 0, 0

;indexed from ^
SetupMenu_MessageSpeeds:
    .byte $41, $31, $21, $11, $01

B25_042d:
    lda $f6
    pha
    ldx #$00
    B25_0432:
    stx $60
    lda Bank_Checksum, x
    bmi B25_047a
    ldx #$06
    jsr BANK_SWAP
    lda #$00
    ldx #$80
    sta $64
    stx $65
    lda #$00
    sta $61
    sta $62
    ldx #$20
    B25_044e:
    ldy #$00
    B25_0450:
    clc
    lda ($64), y
    adc $61
    sta $61
    lda #$00
    adc $62
    sta $62
    iny
    bne B25_0450
    inc $65
    dex
    bne B25_044e
    ldx $60
    inx
    lda Bank_Checksum, x
    cmp $62
    bne B25_0480
    inx
    lda Bank_Checksum, x
    cmp $61
    bne B25_0480
    inx
    bne B25_0432
    B25_047a:
    pla
    ldx #$06
    jmp BANK_SWAP

B25_0480:
    jsr OT0_DefaultTransition
    jsr B31_1dc0
    jsr B31_1d5e
    jsr B31_1d80
    jmp B25_0204

; $A48F
; ANTI-TAMPERING MEASURE?
;  00 -> bank
;  01 -> checksum? (16-bit)
Bank_Checksum:
    .byte $13
    .word $952C

    .byte $14
    .word $820B

    .byte $17
    .word $EBED

    .byte $19
    .word $A8C7

    .byte $1C
    .word $D5AC

    .byte $1E
    .word $CF1C

    .byte $1F
    .word $FA36

    ;null entry???
    .byte $FF
    .word $3857 ; wtf lol

B25_04a7:
    lda $7419
    beq B25_04cb
    ldy enemy_group
    ldx B25_0504, y
    lda B25_04f2, x
    cmp party_data+$10
    bcs B25_04cb
    jsr EnablePRGRam
    dec $7419
    jsr WriteProtectPRGRam
    lda #$00
    sta enemy_group
    lda $7419
    beq B25_04cc
    B25_04cb:
    rts

B25_04cc:
    lda #$d1
    sta $74
    lda #$06
    sta $73
    lda #19
    ldx #.LOBYTE(O_PrintText-1)
    ldy #.HIBYTE(O_PrintText-1)
    jsr TempUpperBankswitch
    lda #19
    ldx #.LOBYTE(OINST_END-1)
    ldy #.HIBYTE(OINST_END-1)
    jsr TempUpperBankswitch
    lda #19
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch
    jmp BankswitchLower_Bank20

B25_04f2:
incbinRange "../../split/us/antipiracy.bin", $4f2, $504

B25_0504:
incbinRange "../../split/us/antipiracy.bin", $504, $5cc

B25_05cc:
    jsr B25_081a
    lda #$00
    sta $2c
    lda #19
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch
    lda #$6a
    ldx #$01
    jsr BANK_SWAP
    jsr PpuSync
    ldx #$df
    B25_05e8:
    lda $0300, x
    sta $0320, x
    dex
    cpx #$ff
    bne B25_05e8
    ldx #$1f
    B25_05f5:
    lda B25_06a1, x
    sta $0300, x
    dex
    bpl B25_05f5
    clc
    lda player_x
    adc #$60
    sta $60
    lda player_x+1
    adc #$00
    sta $61
    sec
    ldy #$04
    lda (object_pointer), y
    sbc $60
    sta $60
    iny
    lda (object_pointer), y
    sbc $61
    sta $61
    lsr $61
    ror $60
    lsr $61
    ror $60
    clc
    lda player_y
    adc #$a4
    sta $64
    lda player_y+1
    adc #$00
    sta $65
    sec
    ldy #$06
    lda (object_pointer), y
    sbc $64
    sta $64
    iny
    lda (object_pointer), y
    sbc $65
    sta $65
    lsr $65
    ror $64
    lsr $65
    ror $64
    lda $60
    sta $0302
    sta $030a
    sta $0312
    sta $031a
    lda $64
    sta $0303
    sta $030b
    sta $0313
    sta $031b
    lda #$5a
    sta $e5
    lda #$30
    jsr BackupAndFillPalette
    jsr PpuSync
    lda #$00
    sta $0304
    sta $0305
    sta $0308
    sta $0310
    sta $0318
    lda $60
    sta $0302
    lda $64
    sta $0303
    lda #$fc
    sta $0306
    lda #$99
    sta $0307
    lda #$01
    sta $e5
    jsr RestoreAndUpdatePalette
    ldx #60
    jmp WaitXFrames_Min1


B25_06a1:
    .byte $04, $00, $32, $32
    .byte $01, $01, $f8, $99
    .byte $04, $00, $42, $32
    .byte $01, $ff, $f8, $99
    .byte $04, $00, $32, $42
    .byte $ff, $01, $f8, $99
    .byte $04, $00, $42, $42
    .byte $ff, $ff, $f8, $99

B25_06c1:
    rts

B25_06c2:
    jsr B25_042d
    jsr B31_1dc0
    lda #$ff
    jsr PlayMusic
    ldx #60
    jsr WaitXFrames_Min1
    lda #$23
    sta soundqueue_track
    lda #$f8
    ldx #$ff
    jsr B25_075e
    lda #$10
    ldx #$00
    jsr B25_075e
    jsr B25_07ad
    jsr B25_07ad
    jsr B25_071f
    jsr B25_0723
    jsr B25_071f
    jsr B25_0723
    jsr B25_07ad
    jsr B25_0727
    jsr B25_072b
    jsr B25_0727
    jsr B25_072b
    jsr PpuSync
    ldx #96
    jsr WaitXFrames_Min1
    jsr B25_071f
    jsr B25_0723
    jsr B25_071f
    jsr B25_07b0
    ldx #120
    jmp WaitXFrames_Min1

B25_071f:
    ldy #$00
    bpl B25_072d

B25_0723:
    ldy #$08
    bpl B25_072d

B25_0727:
    ldy #$10
    bpl B25_072d

B25_072b:
    ldy #$18
    B25_072d:
    lda B25_073e, y
    ldx B25_073e+1, y
    jsr B25_07b4
    iny
    iny
    tya
    and #$07
    bne B25_072d
    rts

; $A73E
; Used by $A71F
B25_073e:
    .byte 1, 0
    .byte -1, 0
    .byte 1, 0
    .byte -1, 0
    ; Used by $A723
    .byte 1, -1
    .byte -1, 0
    .byte 1, 1
    .byte -1, 0
    ; Used by $A727
    .byte 0, -1
    .byte 0, -1
    .byte 0, -1
    .byte 0, -1
    ; Usd by $A72B
    .byte 1, 1
    .byte -1, 1
    .byte 1, 1
    .byte -1, 1


B25_075e:
    sta $60
    stx $61
    ldx #$08
    B25_0764:
    jsr B25_077a
    lda #$30
    sta $e5
    jsr B25_07a7
    cpx #$20
    bcc B25_0764
    jsr PpuSync
    lda #$30
    sta $e5
    rts

B25_077a:
    jsr PpuSync
    clc
    lda $60
    adc $0306, x
    sta $0306, x
    lda $61
    adc $0307, x
    sta $0307, x
    rts

B25_078f:
    cpx #$20
    bcs B25_079e
    lda $64
    sta $0304, x
    lda $65
    sta $0305, x
    rts

B25_079e:
    lda #$00
    sta $0304, x
    sta $0305, x
    rts

B25_07a7:
    clc
    txa
    adc #$08
    tax
    rts

B25_07ad:
    jsr B25_07b0
    B25_07b0:
    lda #$00
    ldx #$00
    B25_07b4:
    sta $64
    stx $65
    jsr B25_07bb

B25_07bb:
    lda #$04
    ldx #$00
    sta $60
    stx $61
    ldx #$08
    B25_07c5:
    jsr B25_077a
    jsr B25_078f
    jsr B25_07a7
    bcc B25_07c5
    lda #$02
    sta $e5
    ldx #$08
    B25_07d6:
    jsr PpuSync
    jsr B25_079e
    jsr B25_07a7
    bcc B25_07d6
    lda #$16
    sta $e5
    lda #$fc
    ldx #$ff
    sta $60
    stx $61
    ldx #$08
    B25_07ef:
    jsr B25_077a
    jsr B25_07a7
    bcc B25_07ef
    lda #$18
    sta $e5
    rts

DepleteAttackerPP:
    ldy attacker_offset
    sec
    lda BATTLER_CURR_PP, y
    sbc $4e
    sta BATTLER_CURR_PP, y
    lda BATTLER_CURR_PP+1, y
    sbc $4f
    sta BATTLER_CURR_PP+1, y
    bcs B25_0819
    lda #$00
    sta BATTLER_CURR_PP, y
    sta BATTLER_CURR_PP+1, y
    B25_0819:
    rts

B25_081a:
    lda $f6
    pha
    ldx #$00
    B25_081f:
    stx $60
    lda Bank_Checksum_2, x
    bmi B25_0867
    ldx #$06
    jsr BANK_SWAP
    lda #$00
    ldx #$80
    sta $64
    stx $65
    lda #$00
    sta $61
    sta $62
    ldx #$20
    B25_083b:
    ldy #$00
    B25_083d:
    clc
    lda ($64), y
    adc $61
    sta $61
    lda #$00
    adc $62
    sta $62
    iny
    bne B25_083d
    inc $65
    dex
    bne B25_083b
    ldx $60
    inx
    lda Bank_Checksum_2, x
    cmp $62
    bne B25_086d
    inx
    lda Bank_Checksum_2, x
    cmp $61
    bne B25_086d
    inx
    bne B25_081f
    B25_0867:
    pla
    ldx #$06
    jmp BANK_SWAP

B25_086d:
    jsr OT0_DefaultTransition
    jsr B31_1dc0
    jsr B31_1d5e
    jsr B31_1d80
    jsr PpuSync
    lda #$00
    sta $ec
    sta scroll_y
    sta scroll_x
    lda #$ff
    jsr PlayMusic
    jmp B25_0214

; $A88C
; ANTI-TAMPERING MEASURE?
;  00 -> bank
;  01 -> checksum? (16-bit)
Bank_Checksum_2:
    .byte $13
    .word $952C

    .byte $14
    .word $820B

    .byte $17
    .word $EBED

    .byte $19
    .word $A8C7

    .byte $1C
    .word $D5AC

    .byte $1E
    .word $CF1C

    .byte $1F
    .word $FA36

    ;null entry???
    .byte $FF
    .word $3857 ; wtf lol
