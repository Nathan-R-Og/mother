.segment        "ANTIPIRACY": absolute

;anti-piracy
;this is ran before transitioning to the save select
TITLE_ANTI_PIRACY:
    ;if scroll_x != 0, jump
    lda scroll_x
    cmp #0
    bne @fail

    ;if scroll_y != 0, jump
    lda scroll_y
    cmp #0
    bne @fail

    ;if ram_PPUCTRL != %10001000, jump
    lda ram_PPUCTRL
    cmp #%10001000
    bne @fail

    jsr PpuSync

    ;add nmi queue
    ;PPU_READ $12 ($2307)
    lda #NMI_COMMANDS::PPU_READ
    ldx #$12
    sta nmi_queue ; PPU_READ
    stx nmi_queue+1 ; Read $12 values
    lda #.LOBYTE($2307) ; PPUADDR = $2307
    ldx #.HIBYTE($2307)
    stx nmi_queue+2
    sta nmi_queue+3

    lda #0
    sta nmi_queue+$16

    ;nmi_data_offset = 0
    sta nmi_data_offset
    ;nmi_flags = $80
    lda #$80
    sta nmi_flags

    ;wait for NMI to complete
    jsr PpuSync

    ;check if nmi_queue[4:$16] == nmi_check_1
    ;;;this quite literally checks if the
    ;;;copyright text at the bottom of the title screen
    ;;;was altered :)
    ldx #0
    @check_nmi_queue:
    lda nmi_queue+4, x
    cmp nmi_check_1, x
    bne @fail
    inx
    cpx #nmi_check_1_END-nmi_check_1
    bcc @check_nmi_queue

    ;modify previous nmi command
    ;[09 10 ($2307)]
    lda #$10
    sta nmi_queue+1
    ;insert end
    lda #0
    sta nmi_queue+$14

    ;UNK_60 <- B25_00d8
    lda #.LOBYTE(nmi_check_2)
    sta UNK_60
    lda #.HIBYTE(nmi_check_2)
    sta UNK_60+1

    ;if not passed, jump
    lda #$430 >> 4
    ldx #($480 - $430) >> 4
    jsr @checkppu
    bne @fail

    ;if not passed, jump
    lda #$690 >> 4
    ldx #($710 - $690) >> 4
    jsr @checkppu
    bne @fail

    ;if not passed, jump
    lda #$530 >> 4
    ldx #($580 - $530) >> 4
    jsr @checkppu
    bne @fail

    ;all checks passed. congratular
    rts


    ;check has failed.
    ;piracy flag???
    @fail:
    lda #$e5
    sta UNK_6
    rts

    ;ppu check
    ;a == ppu addr >> 4
    ;x == addr length >> 4
    ;returns zero flag (z) if safe.
    ;returns !zero flag (z) if pirated(?)
    @checkppu:
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

    ;this loop is ran per x
    @loop:
    ;nmi_data_offset = 0
    lda #0
    sta nmi_data_offset
    ;nmi_flags = $80
    lda #$80
    sta nmi_flags

    jsr PpuSync

    ;verify NMI queue
    ldy #0
    @check:
    lda nmi_queue+4, y
    cmp (UNK_60), y
    ;return zero flag off
    bne @exit
    iny
    ;tile size ($10 bytes per tile)
    cpy #$10
    bcc @check

    ;clear carry
    clc

    ;UNK_60 += $10
    ;could be a tya? probably?
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

    ;shift nmi forward to read more bytes
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

;this is taken straight from title.asm
    ;c 1989/1990
    ;SHIGESATO ITOI / NINTENDO
nmi_check_1:
    .byte $43,$44,$45,$46,$47,$70
    .byte $69,$6A,$6B,$6C,$6D,$6E,$6F,$53,$54,$55,$56,$57
nmi_check_1_END:

;the same tiles as ^, just as the actual 2bpp
nmi_check_2:
    .incbin "../../split/us/nmi_check_2.bin"
nmi_check_2_END:


;this is checked every time the 'warp to magicant' transition happens
;namely the onyx hook, shells and gravestone
ShowAntipiracy:
    ;fade to black
    jsr OT0_DefaultTransition

    ;clear everything
    jsr Refresh_SpriteObjects
    jsr ClearSprites
    jsr ClearTilemaps

    ShowAntipiracy_noclear_useless:
    jsr PpuSync

    ;irq_count = 0
    ;scroll_y = 0
    ;scroll_x = 0
    lda #0
    sta irq_count
    sta scroll_y
    sta scroll_x

    ;stop music
    lda #$ff
    jsr PlayMusic

    ShowAntipiracy_nomute_useless:
    ;swap chr
    lda #$7e
    ldx #BANK::CHR1800
    jsr BANK_SWAP
    lda #$7f
    ldx #BANK::CHR1C00
    jsr BANK_SWAP

    ;load antipiracy message
    lda #.LOBYTE(UMSG::ANTIPIRACY)
    sta UNK_73+1
    lda #.HIBYTE(UMSG::ANTIPIRACY)
    sta UNK_73

    ;UNK_76 = 2
    lda #2
    sta UNK_76
    ;UNK_77 = 2
    lda #2
    sta UNK_77

    ;could be
    ;lda #2
    ;sta UNK_76
    ;sta UNK_77

    ;UNK_70 = 0
    ;UNK_71 = 0
    lda #0
    sta UNK_70
    sta UNK_71

    ;load the text manually
    @B25_0238:
    jsr GetTextData
    jsr DrawTilepackClear

    cmp #0
    beq @B25_024a
    ldy #0
    lda (tilepack_ptr), y
    cmp #0
    bne @B25_0238

    @B25_024a:
    jsr PpuSync

    ;load generic palette
    ldx #$1f
    @B25_024f:
    lda ANTIPIRACY_PALETTE, x
    sta palette_queue, x
    dex
    bpl @B25_024f

    lda #NMI_COMMANDS::UPDATE_PALETTE
    sta nmi_queue ; UPDATE_PALETTE

    lda #0
    sta nmi_queue+1 ; END
    sta nmi_data_offset

    lda #$80
    sta nmi_flags

    @inf_loop:
    jmp @inf_loop

ANTIPIRACY_PALETTE:
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
    .import __NAMING_SCREEN_1_LOAD__
    ;set read address
    lda #.LOBYTE(__NAMING_SCREEN_1_LOAD__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_LOAD__)
    sta UNK_60 ; $60 = 0xB800
    stx UNK_60+1

    ;set write address
    .import __NAMING_SCREEN_1_RUN__
    lda #.LOBYTE(__NAMING_SCREEN_1_RUN__)
    ldx #.HIBYTE(__NAMING_SCREEN_1_RUN__)
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

;updates the screen with attr data at UNK_A4
SetMenu_ScreenAttr:
    clc

    ;UNK_AA = (player_x + $40) & $FF80
    lda player_x
    adc #$40
    and #$80
    sta UNK_AA
    lda player_x+1
    adc #0
    sta UNK_AA+1

    ;UNK_AC = player_y
    lda player_y
    sta UNK_AC
    lda player_y+1
    sta UNK_AC+1

    ;???
    jsr B30_155d

    ;a = (player_x << 2) << 1 + c
    ;x = a & 1
    lda player_x
    asl a
    asl a
    rol a
    and #%00000001
    tax

    ldy UNK_A1

    ;UNK_7A = $10
    lda #$10
    sta UNK_7A

    jsr EnablePRGRam

    @B25_02de:

    tya
    ora #$f0
    sta UNK_7B

    ;OVERWORLD_attrbuffer[x] = UNK_A4[y]
    @attrbuffer_loop:
    lda (UNK_A4), y
    sta OVERWORLD_attrbuffer, x
    iny
    inx
    inc UNK_7B
    bne @attrbuffer_loop

    ;y -= $10
    tya
    sec
    sbc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    lda UNK_A1
    and #$0f
    beq @skip_loop2
    sta UNK_7B

    @attrbuffer_loop2:
    lda (UNK_A4), y
    sta OVERWORLD_attrbuffer, x
    iny
    inx
    dec UNK_7B
    bne @attrbuffer_loop2

    @skip_loop2:

    ;y += $10
    tya
    clc
    adc #$10
    tay

    ;UNK_A5 ^= 1
    lda UNK_A5
    eor #%00000001
    sta UNK_A5

    dec UNK_7A
    bne @B25_02de

    jmp WriteProtectPRGRam

;hides all relevant sprites when you open a menu
HideSpritesForMenu:
    sec
    ror oam_and_300_clear_flag

    ;UNK_78 = UNK_76 << 3
    ;;;UNK_78 is now the top left of a panel
    lda UNK_76
    asl a
    asl a
    asl a
    sta UNK_78

    ;UNK_79 = ((UNK_76 + char_count) << 3) - 4
    ;;;UNK_79 is now the top right of a panel
    clc
    lda UNK_76
    adc char_count
    asl a
    asl a
    asl a
    sec
    sbc #4
    sta UNK_79

    ;UNK_7C = (UNK_77 & 0x1E) << 3
    ;;;UNK_7C is now the bottom left of a panel
    lda UNK_77
    clc
    and #%00011110
    asl a
    asl a
    asl a
    sta UNK_7C

    ;UNK_7D = UNK_7C + 12
    ;;;UNK_7D is now the bottom right of a panel
    clc
    adc #12
    sta UNK_7D

    ldx #0
    @loop:
    ;if shadow_oam[x] (sprite y) < UNK_7D, skip
    lda shadow_oam, x
    cmp UNK_7D
    bcs @no_match

    ;if shadow_oam[x] (sprite y) + 4 >= UNK_7C, skip
    adc #4
    cmp UNK_7C
    bcc @no_match

    ;if shadow_oam[x]+3 (sprite x) < UNK_79, skip
    lda shadow_oam+3, x
    cmp UNK_79
    bcs @no_match

    ;if shadow_oam[x]+3 (sprite x) + 4 >= UNK_78, skip
    adc #4
    cmp UNK_78
    bcc @no_match

    ;set tile offscreen
    lda #$f0
    sta shadow_oam, x

    @no_match:
    inx
    inx
    inx
    inx
    bne @loop

    asl oam_and_300_clear_flag
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
    jsr PRINT_CURR_CHOICER

    @main_loop:
    ;if !PAD_A, jump
    bit menucursor_pos+1
    bpl @exit

    ;x = pos
    lda menucursor_pos
    tax
    ;y = pos >> 3
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

.define UNK_61 UNK_60+1
.define checksum UNK_61
ValidateBanks:
    lda current_banks+6

    pha

    ldx #0
    @bank_loop:
    stx UNK_60

    ;get bank number
    lda Bank_Checksum, x
    ;if msb, exit
    bmi @exit

    ;swap to bank in $8000
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;UNK_64 = $8000
    lda #.LOBYTE($8000)
    ldx #.HIBYTE($8000)
    sta UNK_64
    stx UNK_64+1


    lda #0
    sta checksum
    sta checksum+1

    ;loop over $2000 bytes :)
    ldx #$20
    @word_loop:
    ldy #0
    @byte_loop:
    clc

    ;get rom byte
    ;checksum += byte
    lda (UNK_64), y
    adc checksum
    sta checksum
    lda #0
    adc checksum+1
    sta checksum+1
    iny
    bne @byte_loop

    inc UNK_64+1
    dex
    bne @word_loop

    ;pop checksum id
    ldx UNK_60
    inx

    ;get checksum value
    lda Bank_Checksum, x
    cmp checksum+1
    bne @show_antipiracy
    inx
    lda Bank_Checksum, x
    cmp checksum
    bne @show_antipiracy

    ;passed
    inx
    bne @bank_loop
    @exit:

    ;restore old bank
    pla
    ldx #BANK::PRG8000
    jmp BANK_SWAP

    @show_antipiracy:
    ;why isnt this just a jmp
    jsr OT0_DefaultTransition
    jsr Refresh_SpriteObjects
    jsr ClearSprites
    jsr ClearTilemaps
    jmp ShowAntipiracy_noclear_useless

; $A48F
; ANTI-TAMPERING MEASURE?
;  00 -> bank
;  01 -> checksum (16-bit)
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

    ;null entry
    .byte $FF
    .word $3857 ; wtf lol



RepelRing_Effect:
    ;if repel_counter == 0, leave
    lda repel_counter
    beq @exit

    ;get Repel_LevelTable[Repel_BattleDifficultyTable[battle]]
    ldy enemy_group
    ldx Repel_BattleDifficultyTable, y
    lda Repel_LevelTable, x

    ;if Ninten's level is >= the repel level, leave
    cmp Ninten_Data+party_info::level
    bcs @exit
    ;else, expend a repel
    jsr EnablePRGRam
    dec repel_counter
    jsr WriteProtectPRGRam
    lda #0
    sta enemy_group

    ;if repel_counter == 0, jump
    lda repel_counter
    beq @out_of_repels

    @exit:
    rts

    @out_of_repels:
    ;UNK_73 = UMSG::REPEL_RING_BREAK (big endian)
    lda #.LOBYTE(UMSG::REPEL_RING_BREAK)
    sta UNK_73+1
    lda #.HIBYTE(UMSG::REPEL_RING_BREAK)
    sta UNK_73

    lda #.BANK(O_PrintText)
    ldx #.LOBYTE(O_PrintText-1)
    ldy #.HIBYTE(O_PrintText-1)
    jsr TempUpperBankswitch

    lda #.BANK(OINST_END)
    ldx #.LOBYTE(OINST_END-1)
    ldy #.HIBYTE(OINST_END-1)
    jsr TempUpperBankswitch

    ;????
    lda #$13
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch

    ;rts
    jmp BANKSET_H14

Repel_LevelTable:
.byte 0,3,5,7,10,12,16,18,19,21,23,26,28,30,35,36,37,-1

Repel_BattleDifficultyTable:
.byte $00,$01,$03,$01,$03,$01,$03,$03,$01,$03,$01,$01,$07,$01,$01,$02
.byte $11,$11,$11,$11,$02,$02,$03,$03,$11,$03,$03,$03,$03,$03,$03,$11
.byte $03,$11,$03,$03,$11,$03,$06,$11,$06,$06,$11,$08,$04,$11,$11,$11
.byte $04,$04,$04,$04,$05,$05,$05,$04,$05,$05,$04,$04,$04,$05,$05,$11
.byte $11,$11,$11,$11,$11,$11,$11,$11,$06,$08,$08,$11,$11,$11,$07,$07
.byte $07,$07,$07,$11,$06,$06,$11,$11,$06,$11,$02,$09,$11,$11,$11,$09
.byte $09,$11,$09,$09,$11,$11,$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$11
.byte $11,$11,$0B,$0B,$0B,$0B,$0B,$0D,$0D,$0B,$0B,$0B,$0B,$0B,$11,$11
.byte $11,$0B,$11,$11,$11,$11,$11,$11,$11,$0B,$0B,$0C,$0C,$0C,$0C,$0C
.byte $11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11
.byte $11,$11,$11,$11,$11,$0E,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10,$10
.byte $10,$10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00

Tombstone_AntiPiracy:
    ;checksum
    jsr ValidateBanks2_Useless

    ;UNK_2C = 0
    lda #0
    sta UNK_2C

    ;???
    lda #$13
    ldx #.LOBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    ldy #.HIBYTE(CLEAR_TEXTBOXES_ROUTINE-1)
    jsr TempUpperBankswitch

    ;swap gfx
    lda #$6a
    ldx #BANK::CHR0800
    jsr BANK_SWAP

    jsr PpuSync

    ;move all sprite objects $20 forward
    ldx #$df
    @move:
    lda SPRITE_OBJECTS, x
    sta SPRITE_OBJECTS+$20, x
    dex
    cpx #$ff
    bne @move

    ;write the sparkles
    ldx #$1f
    @write:
    lda tombstone_spritedata, x
    sta SPRITE_OBJECTS, x
    dex
    bpl @write

    ;UNK_60 = (player_x + $60) - object_pointer->xpos
    clc
    lda player_x
    adc #$60
    sta UNK_60
    lda player_x+1
    adc #0
    sta UNK_60+1
    sec
    ldy #object_m_xpos
    lda (object_pointer), y
    sbc UNK_60
    sta UNK_60
    iny
    lda (object_pointer), y
    sbc UNK_60+1
    sta UNK_60+1

    ;UNK_60 >>= 2
    lsr UNK_60+1
    ror UNK_60
    lsr UNK_60+1
    ror UNK_60

    ;UNK_64 = (player_y + $a4) - object_pointer->ypos
    clc
    lda player_y
    adc #$a4
    sta UNK_64
    lda player_y+1
    adc #0
    sta UNK_64+1
    sec
    ldy #object_m_ypos
    lda (object_pointer), y
    sbc UNK_64
    sta UNK_64
    iny
    lda (object_pointer), y
    sbc UNK_64+1
    sta UNK_64+1

    ;UNK_64 >>= 2
    lsr UNK_64+1
    ror UNK_64
    lsr UNK_64+1
    ror UNK_64

    ;first four objects.x = UNK_60
    lda UNK_60
    sta SPRITE_OBJECTS+(0*8)+2
    sta SPRITE_OBJECTS+(1*8)+2
    sta SPRITE_OBJECTS+(2*8)+2
    sta SPRITE_OBJECTS+(3*8)+2

    ;first four objects.y = UNK_64
    lda UNK_64
    sta SPRITE_OBJECTS+(0*8)+3
    sta SPRITE_OBJECTS+(1*8)+3
    sta SPRITE_OBJECTS+(2*8)+3
    sta SPRITE_OBJECTS+(3*8)+3

    ;nmi_flags = 90
    ;wait for 90 frames
    lda #90
    sta nmi_flags

    ;fill palette with color $30
    lda #$30
    jsr BackupAndFillPalette

    jsr PpuSync

    ;remove sparkles
    lda #0
    sta SPRITE_OBJECTS+4
    sta SPRITE_OBJECTS+5
    sta SPRITE_OBJECTS+(1*8)
    sta SPRITE_OBJECTS+(2*8)
    sta SPRITE_OBJECTS+(3*8)

    ;place crystal
    lda UNK_60
    sta SPRITE_OBJECTS+2
    lda UNK_64
    sta SPRITE_OBJECTS+3
    lda #.LOBYTE(SPRITEDEF_CREDITS_UNK1)
    sta SPRITE_OBJECTS+6
    lda #.HIBYTE(SPRITEDEF_CREDITS_UNK1)
    sta SPRITE_OBJECTS+7

    ;one frame wait
    lda #1
    sta nmi_flags

    ;then resotre palette
    jsr RestoreAndUpdatePalette

    ldx #60
    jmp WaitXFrames_Min1

;sparkles :)
tombstone_spritedata:
    .byte 4, 0, 50, 50,  1,  1
    .addr SPRITEDEF_CREDITS_UNK0
    .byte 4, 0, 66, 50,  1, -1
    .addr SPRITEDEF_CREDITS_UNK0
    .byte 4, 0, 50, 66, -1,  1
    .addr SPRITEDEF_CREDITS_UNK0
    .byte 4, 0, 66, 66, -1, -1
    .addr SPRITEDEF_CREDITS_UNK0

;yeah man
Rts_Antipiracy:
    rts

Livehouse_Antipiracy:
    jsr ValidateBanks

    jsr Refresh_SpriteObjects
    ;mute music
    lda #$ff
    jsr PlayMusic

    ;wait a second
    ldx #60
    jsr WaitXFrames_Min1

    ;play music
    lda #$23
    sta soundqueue_track

    ;party spr pointer -= 8
    lda #.LOBYTE(-8)
    ldx #.HIBYTE(-8)
    jsr LIVEHOUSE_setupParty

    ;party spr pointer += 16
    lda #.LOBYTE(16)
    ldx #.HIBYTE(16)
    jsr LIVEHOUSE_setupParty

    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_domotionStopTwice
    jsr LIVEHOUSE_setmotion10
    jsr LIVEHOUSE_setmotion18
    jsr LIVEHOUSE_setmotion10
    jsr LIVEHOUSE_setmotion18
    jsr PpuSync
    ldx #96
    jsr WaitXFrames_Min1
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_setmotion8
    jsr LIVEHOUSE_setmotion0
    jsr LIVEHOUSE_domotionStop
    ldx #120
    jmp WaitXFrames_Min1

LIVEHOUSE_setmotion0:
    ldy #0
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion8:
    ldy #8
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion10:
    ldy #$10
    bpl LIVEHOUSE_setmotionloop

LIVEHOUSE_setmotion18:
    ldy #$18
    LIVEHOUSE_setmotionloop:
    lda LIVEHOUSE_motions, y
    ldx LIVEHOUSE_motions+1, y
    jsr LIVEHOUSE_domotion
    iny
    iny
    tya
    and #%00000111
    bne LIVEHOUSE_setmotionloop
    rts

; $A73E
; Used by $A71F
LIVEHOUSE_motions:
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


;in
;a = UNK_60
;x = UNK_60+1
;todo: verify
LIVEHOUSE_setupParty:
    sta UNK_60
    stx UNK_60+1

    ;loop over SPRITE_OBJECTS 1-4 exclusive
    ldx #(1*8)
    @loop:
    jsr LIVEHOUSE_movesprUnk60

    lda #$30
    sta nmi_flags

    jsr LIVEHOUSE_movex8

    cpx #$20
    bcc @loop

    jsr PpuSync

    lda #$30
    sta nmi_flags

    rts

;move sprite object at SPRITE_OBJECT[x] by UNK_60
LIVEHOUSE_movesprUnk60:
    jsr PpuSync

    ;SPRITE_OBJECTS[x].spritedef += UNK_60
    clc
    lda UNK_60
    adc SPRITE_OBJECTS+6, x
    sta SPRITE_OBJECTS+6, x
    lda UNK_60+1
    adc SPRITE_OBJECTS+7, x
    sta SPRITE_OBJECTS+7, x

    rts

;check if sprite object >= $20, if so zero out the velocity
;else, set velocity from UNK_64
LIVEHOUSE_checksetvel:
    cpx #$20
    bcs LIVEHOUSE_zerovel

    lda UNK_64
    sta SPRITE_OBJECTS+4, x
    lda UNK_64+1
    sta SPRITE_OBJECTS+5, x

    rts

LIVEHOUSE_zerovel:
    lda #0
    sta SPRITE_OBJECTS+4, x
    sta SPRITE_OBJECTS+5, x

    rts

;x += 8
LIVEHOUSE_movex8:
    clc
    txa
    adc #8
    tax

    rts

;this is basically an alias for
;jsr LIVEHOUSE_domotionStop
;jsr LIVEHOUSE_domotionStop
LIVEHOUSE_domotionStopTwice:
    jsr LIVEHOUSE_domotionStop
    ;fallthrough

LIVEHOUSE_domotionStop:
    lda #0
    ldx #0
    LIVEHOUSE_domotion:
    sta UNK_64
    stx UNK_64+1

    ;run B25_07bb twice
    jsr @B25_07bb
    @B25_07bb:
    ;UNK_60 = 4
    lda #.LOBYTE(4)
    ldx #.HIBYTE(4)
    sta UNK_60
    stx UNK_60+1

    ldx #(1*8)
    @loop_all:
    jsr LIVEHOUSE_movesprUnk60
    jsr LIVEHOUSE_checksetvel
    jsr LIVEHOUSE_movex8
    bcc @loop_all

    lda #2
    sta nmi_flags

    ldx #8
    @loop_all2:
    jsr PpuSync
    jsr LIVEHOUSE_zerovel
    jsr LIVEHOUSE_movex8
    bcc @loop_all2

    lda #$16
    sta nmi_flags

    lda #.LOBYTE(-4)
    ldx #.HIBYTE(-4)
    sta UNK_60
    stx UNK_60+1

    ldx #8
    @loop_all3:
    jsr LIVEHOUSE_movesprUnk60
    jsr LIVEHOUSE_movex8
    bcc @loop_all3

    lda #$18
    sta nmi_flags

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
    bcs @exit
    lda #$00
    sta BATTLER_CURR_PP, y
    sta BATTLER_CURR_PP+1, y
    @exit:
    rts

ValidateBanks2_Useless:
    lda current_banks+6

    pha

    ldx #0
    @bank_loop:
    stx UNK_60

    ;get bank number
    lda Bank_Checksum_2, x
    ;if msb, exit
    bmi @exit

    ;swap to bank in $8000
    ldx #BANK::PRG8000
    jsr BANK_SWAP

    ;UNK_64 = $8000
    lda #.LOBYTE($8000)
    ldx #.HIBYTE($8000)
    sta UNK_64
    stx UNK_64+1

    lda #0
    sta checksum
    sta checksum+1

    ;loop over $2000 bytes :)
    ldx #$20
    @word_loop:
    ldy #0
    @byte_loop:
    clc

    ;get rom byte
    ;checksum += byte
    lda (UNK_64), y
    adc checksum
    sta checksum
    lda #0
    adc checksum+1
    sta checksum+1
    iny
    bne @byte_loop

    inc UNK_64+1
    dex
    bne @word_loop

    ;pop checksum id
    ldx UNK_60
    inx

    ;get checksum value
    lda Bank_Checksum_2, x
    cmp checksum+1
    bne @show_antipiracy
    inx
    lda Bank_Checksum_2, x
    cmp checksum
    bne @show_antipiracy

    ;passed
    inx
    bne @bank_loop
    @exit:

    ;restore old bank
    pla
    ldx #BANK::PRG8000
    jmp BANK_SWAP

    @show_antipiracy:
    ;why isnt this just a jmp
    jsr OT0_DefaultTransition
    jsr Refresh_SpriteObjects
    jsr ClearSprites
    jsr ClearTilemaps
    jsr PpuSync
    lda #$00
    sta irq_count
    sta scroll_y
    sta scroll_x
    lda #$ff
    jsr PlayMusic
    jmp ShowAntipiracy_nomute_useless

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
