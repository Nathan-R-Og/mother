.segment        "ANTIPIRACY": absolute

;anti-piracy
ANTI_PIRACY:
    lda scroll_x
    cmp #$00
    bne B25_0074
    lda scroll_y
    cmp #$00
    bne B25_0074
    lda ram_PPUCTRL
    cmp #$88
    bne B25_0074
    jsr PpuSync
    lda #$09
    ldx #$12
    sta $0400 ; READ_PPU_HIGH_BYTE (TODO: NEEDS A BETTER NAME)
    stx $0401 ; Read 0x12 values
    lda #$07
    ldx #$23
    stx $0402
    sta $0403 ; PPUADDR = $2307
    lda #$00
    sta $0404+$12
    sta $e6
    lda #$80
    sta $e5
    jsr PpuSync
    ldx #$00
    B25_0039:
    lda $0404, x
    cmp B25_00c6, x
    bne B25_0074
    inx
    cpx #$12
    bcc B25_0039
    lda #$10
    sta $0401
    lda #$00
    sta $0414
    lda #.LOBYTE(B25_00d8)
    sta $60
    lda #.HIBYTE(B25_00d8)
    sta $61
    lda #$43
    ldx #$05
    jsr B25_0079
    bne B25_0074
    lda #$69
    ldx #$08
    jsr B25_0079
    bne B25_0074
    lda #$53
    ldx #$05
    jsr B25_0079
    bne B25_0074
    rts

B25_0074:
    lda #$e5
    sta $06
    rts

B25_0079:
    pha
    asl a
    asl a
    asl a
    asl a
    sta $0403
    pla
    lsr a
    lsr a
    lsr a
    lsr a
    sta $0402
    B25_0089:
    lda #$00
    sta $e6
    lda #$80
    sta $e5
    jsr PpuSync
    ldy #$00
    B25_0096:
    lda $0404, y
    cmp ($60), y
    bne B25_00c5
    iny
    cpy #$10
    bcc B25_0096
    clc
    lda #$10
    adc $60
    sta $60
    lda #$00
    adc $61
    sta $61
    dex
    beq B25_00c5
    clc
    lda #$10
    adc $0403
    sta $0403
    lda #$00
    adc $0402
    sta $0402
    bcc B25_0089
    B25_00c5:
    rts

; $0404 check
B25_00c6:
    .byte $43, $44, $45, $46, $47
    .byte $70, $69, $6a, $6b, $6c
    .byte $6d, $6e, $6f, $53, $54
    .byte $55, $56, $57
B25_00d8:
    .byte $00, $00, $00, $00, $00
    .byte $00, $00, $00, $00, $38
    .byte $44, $ba

B25_00e4:
incbinRange "../../split/us/antipiracy.bin", $e4, $1f8

B25_01f8:
    jsr B31_0ddc
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

B25_1800 := $b800
; $A28B
; Unknown, called from bank 20 $9400
B25_028b:
    lda #.LOBYTE(B25_1800)
    ldx #.HIBYTE(B25_1800)
    sta $60
    stx $61 ; $60 = 0xB800
    lda #$00
    ldx #$60
    sta $64
    stx $65 ; $64 = 0x6000
    jsr EnablePRGRam
; Copy 0x0800 bytes from $B800 into $6000
    ldx #$08
    B25_02a0:
    ldy #$00
    B25_02a2:
    lda ($60), y
    sta ($64), y
    iny
    bne B25_02a2
    inc $61
    inc $65
    dex
    bne B25_02a0
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

B25_036e:
    jsr B30_03ed
    ldy #$00
    B25_0373:
    tya
    pha
    jsr B25_03cd
    pla
    tay
    iny
    cpy #$04
    bcc B25_0373
    lda #$01
    sta $d6
    lda #.LOBYTE(B25_03fa)
    ldx #.HIBYTE(B25_03fa)
    sta $80
    stx $81
    jsr B31_0f34
    B25_038e:
    bit $83
    bpl B25_03c8
    lda $82
    tax
    lsr a
    lsr a
    lsr a
    tay
    jsr EnablePRGRam
    lda B25_0408, x
    sta $743c, y
    cpy #$03
    bne B25_03b0
    txa
    and #$07
    tax
    lda B25_0428, x
    sta battle_message_speed
    B25_03b0:
    jsr WriteProtectPRGRam
    lda $76
    pha
    lda $77
    pha
    jsr B25_03cd
    pla
    sta $77
    pla
    sta $76
    jsr B31_0f7c
    jmp B25_038e

B25_03c8:
    lda #$00
    sta $d6
    rts

B25_03cd:
    tya
    asl a
    asl a
    adc #$0d
    sta $77
    lda $743c, y
    sta $60
    lda B25_0404, y
    sta $61
    ldx #$05
    B25_03e0:
    stx $76
    lda #$94
    asl $60
    adc #$00
    asl $61
    bcc B25_03ef
    jsr B30_068b
    B25_03ef:
    clc
    lda $76
    adc #$04
    tax
    cpx #$19
    bcc B25_03e0
    rts

B25_03fa:
    .byte $08, $04, $04, $04, $c0, $3a, $04, $0d, $08, $a4

B25_0404:
    .byte $a8, $a8, $a8, $f8

B25_0408:
incbinRange "../../split/us/antipiracy.bin", $408, $428

B25_0428:
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
    jsr B31_0ddc
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
    ldx #.LOBYTE(B19_0d1a-1)
    ldy #.HIBYTE(B19_0d1a-1)
    jsr TempUpperBankswitch
    lda #19
    ldx #.LOBYTE(B19_0b30-1)
    ldy #.HIBYTE(B19_0b30-1)
    jsr TempUpperBankswitch
    lda #19
    ldx #.LOBYTE(B30_03f4-1)
    ldy #.HIBYTE(B30_03f4-1)
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
    ldx #.LOBYTE(B30_03f4-1)
    ldy #.HIBYTE(B30_03f4-1)
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
    sta new_music
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
    jsr B31_0ddc
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
