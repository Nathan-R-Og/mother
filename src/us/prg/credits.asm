.segment        "CREDITS": absolute

B26_0000:
    ldx #120
    jsr WaitXFrames_Min1
    jsr B26_00b1
    jsr PpuSync
    lda #$00
    sta $a000
    lda #$00
    sta $ec
    lda $e7
    and #$bf
    sta $e7
    lda #$00
    sta $e8
    sta $e9
    lda ram_PPUCTRL
    and #$fc
    ldx #$10
    ldy #$08
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x
    lda #$ff
    jsr PlayMusic
    lda #$1b
    sta $07
    jsr WaitFrame
    lda #<B26_02d3
    sta $40
    lda #>B26_02d3
    sta $41
    B26_0042:
    ldy #$00
    lda ($40), y
    beq B26_005a
    jsr B26_005d
    clc
    tya
    adc $40
    sta $40
    lda #$00
    adc $41
    sta $41
    jmp B26_0042

B26_005a:
    jmp B26_005a

B26_005d:
    asl a
    tax
    lda B26_0068+1, x
    pha
    lda B26_0068, x
    pha
    rts

B26_0068:
    .addr B26_005a-1 ; [00]                      - END, locks up the game
    .addr B26_0090-1 ; [01 XX]                   - Wait XX frames
    .addr B26_00a0-1 ; [02 XX]                   - Waits for a specific input??
    .addr B26_00b1-1 ; [03]                      - Fades out
    .addr B26_00cd-1 ; [04 AA BB CC DD]          - CHR bankswitch (R2, R3, R0, R1)
    .addr B26_00f3-1 ; [05 AA BB CC DD (XX*BB)]  - Load nametable tile data
    .addr B26_00ef-1 ; [06 AA BB CC DD (XX*BB)]  - Load metatile properites
    .addr B26_0152-1 ; [07 (XX*10)]              - Set color palette
    .addr B26_0206-1 ; [08 XXXX]                 - Unconditional jump
    .addr B26_018a-1 ; [09 AA BB CC DD EE FF GG] - Init "Sprite" object
    .addr B26_01c4-1 ; [0A AA BB CC DD EE]       - Edit "Sprite" object
    .addr B26_01f0-1 ; [0B XX]                   - Play music XX? Sfx? idk
    .addr B26_00e5-1 ; [0C XX]                   - CHR bankswitch (R1)
    .addr B26_00bd-1 ; [0D AA BB CC DD EE FF]    - CHR bankswitch (R4, R5, R2, R3, R0, R1)
    .addr B26_01f8-1 ; [0E XX]                   - Set $47 loop variable
    .addr B26_01ff-1 ; [0F XXXX]                 - Conditional branch on $47. Decrement it and branch if still not zero
    .addr B26_0215-1 ; [10 XX]                   - Wait frame then remove OAM entry?
    .addr B26_0226-1 ; [11 AA BB (CC*??)]        - Display text
    .addr B26_029a-1 ; [12 AA BB CC DD]          - Display text with a position
    .addr B26_02bd-1 ; [13]                      - Fades in

B26_0090:
    iny
    lda ($40), y
    tax
    @loop:
    jsr PpuSync
    lda #$01
    sta $e5
    dex
    bne @loop
    iny
    rts

B26_00a0:
    lda #$00
    sta pad1_forced
    iny
    lda ($40), y
    B26_00a7:
    bit pad1_forced
    beq B26_00a7
    lda #$00
    sta pad1_forced
    iny
    rts

B26_00b1:
    jsr B31_0ddc
    jsr B31_1d5e
    jsr B31_1d80
    ldy #$01
    rts

B26_00bd:
    iny
    lda ($40), y
    ldx #$04
    jsr BANK_SWAP
    iny
    lda ($40), y
    ldx #$05
    jsr BANK_SWAP
    B26_00cd:
    iny
    lda ($40), y
    ldx #$02
    jsr BANK_SWAP
    iny
    lda ($40), y
    ldx #$03
    jsr BANK_SWAP
    iny
    lda ($40), y
    ldx #$00
    jsr BANK_SWAP
    B26_00e5:
    iny
    lda ($40), y
    ldx #$01
    jsr BANK_SWAP
    iny
    rts

B26_00ef:
    lda #$08
    bne B26_00f5
    B26_00f3:
    lda #$20
    B26_00f5:
    sta $43
    jsr PpuSync
    lda #$05
    sta $0400 ; TODO: UNKNOWN NMI COMMAND
    ldy #$04
    lda ($40), y
    sta $42
    dey
    lda ($40), y
    sta $0401
    dey
    lda ($40), y
    sta $0402
    dey
    lda ($40), y
    sta $0403
    ldy #$05
    B26_0119:
    ldx #$00
    B26_011b:
    lda ($40), y
    sta $0404, x
    iny
    bne B26_0125
    inc $41
    B26_0125:
    inx
    cpx $0401
    bne B26_011b
    lda #$00
    sta $0404, x
    sta $e6
    lda #$80
    sta $e5
    dec $42
    beq B26_0151
    jsr PpuSync
    clc
    lda $43
    adc $0403
    sta $0403
    lda #$00
    adc $0402
    sta $0402
    jmp B26_0119
    B26_0151:
    rts

B26_0152:
    jsr PpuSync
    ldy #$10
    ldx #$0f
    B26_0159:
    lda ($40), y
    sta $0500, x
    lda B26_02c3, x
    sta $0510, x
    dey
    dex
    bpl B26_0159
    lda $0500
    sta $0510
    sta $0514
    sta $0518
    sta $051c
    lda #$04
    sta $0400 ; UPDATE_PALETTE
    lda #$00
    sta $0401 ; END
    sta $e6
    lda #$80
    sta $e5
    ldy #$11
    rts

B26_018a:
    jsr PpuSync
    iny
    lda ($40), y
    asl a
    asl a
    asl a
    tax
    lda ($40), y
    and #$80
    sta $0301, x
    iny
    lda ($40), y
    sta $0300, x
    iny
    lda ($40), y
    sta $0302, x
    iny
    lda ($40), y
    sta $0303, x
    iny
    lda ($40), y
    sta $0306, x
    iny
    lda ($40), y
    sta $0307, x
    lda #$00
    sta $0304, x
    sta $0305, x
    ldy #$07
    rts

B26_01c4:
    jsr PpuSync
    iny
    lda ($40), y
    asl a
    asl a
    asl a
    tax
    clc
    iny
    lda ($40), y
    adc $0306, x
    sta $0306, x
    iny
    lda ($40), y
    adc $0307, x
    sta $0307, x
    iny
    lda ($40), y
    sta $0304, x
    iny
    lda ($40), y
    sta $0305, x
    ldy #$06
    rts

B26_01f0:
    iny
    lda ($40), y
    jsr PlayMusic
    iny
    rts

B26_01f8:
    iny
    lda ($40), y
    sta $47
    iny
    rts

B26_01ff:
    dec $47
    bne B26_0206
    ldy #$03
    rts

B26_0206:
    iny
    lda ($40), y
    pha
    iny
    lda ($40), y
    sta $41
    pla
    sta $40
    ldy #$00
    rts

B26_0215:
    jsr PpuSync
    iny
    lda ($40), y
    asl a
    asl a
    asl a
    tax
    lda #$00
    sta $0300, x
    iny
    rts

B26_0226:
    iny
    lda ($40), y
    sta $74
    iny
    lda ($40), y
    sta $73
    lda #$02
    sta $76
    lda #$13
    sta $77
    lda #$1c
    sta $70
    lda #$00
    sta $71
    B26_0240:
    jsr GetTextData
    jsr B30_06db
    cmp #$00
    beq B26_0252
    ldy #$00
    lda ($74), y
    cmp #$00
    bne B26_0240
    B26_0252:
    jsr PpuSync
    lda #$08
    sta $0400 ; PPU_FILL
    lda #$07
    sta $0401 ; Fill 7 bytes...
    lda #<$23e9
    sta $0403
    lda #>$23e9
    sta $0402 ; at $23E9...
    lda #$ff
    sta $0404 ; with $FF
    lda #$00
    sta $0405 ; END
    ldx #$02
    B26_0275:
    lda #$00
    sta $e6
    lda #$80
    sta $e5
    dex
    beq B26_0297
    jsr PpuSync
    clc
    lda #$08
    adc $0403
    sta $0403
    lda #$00
    adc $0402
    sta $0402
    jmp B26_0275

B26_0297:
    ldy #$03
    rts

B26_029a:
    iny
    lda ($40), y
    sta $74
    iny
    lda ($40), y
    sta $73
    iny
    lda ($40), y
    sta $76
    iny
    lda ($40), y
    sta $77
    lda #$00
    sta $70
    sta $71
    jsr GetTextData
    jsr B30_06db
    ldy #$05
    rts

B26_02bd:
    jsr RestoreAndUpdatePalette
    ldy #$01
    rts

B26_02c3:
    .byte $0f, $0f, $00, $30
    .byte $0f, $0f, $16, $37
    .byte $0f, $0f, $24, $37
    .byte $0f, $0f, $12, $37

.define ENDING_CMD_00_END .byte $00

.define ENDING_CMD_01_DELAY(frames) .byte $01, frames

.define ENDING_CMD_02(arg1) .byte $02, arg1

.define ENDING_CMD_03_FADEOUT .byte $03

.macro ENDING_CMD_04_LOADTILESETS arg1, arg2, arg3, arg4
    .byte $04
    .byte arg1
    .byte arg2
    .byte arg3
    .byte arg4
.endmacro

.macro ENDING_CMD_05_LOADBG2MAP arg1, arg2, arg3
    .byte $05
    .addr arg1
    .byte arg2, arg3
.endmacro

.macro ENDING_CMD_06_SETMETATILEPROPERTIES arg1, arg2, arg3
    .byte $06
    .addr arg1
    .byte arg2, arg3
.endmacro

.define ENDING_CMD_07_SETPAL .byte $07

.macro ENDING_CMD_08 arg1
    .byte $08
    .word arg1
.endmacro

.macro ENDING_CMD_09_INITSPRITE id, tiles, arg_x, arg_y, sprite_pointer
    .byte $09, id, tiles
    .byte arg_x,arg_y
    .addr sprite_pointer
.endmacro

.macro ENDING_CMD_0A_MOVESPRITE id, arg2, arg3, arg4
    .byte $0A, id
    .word arg2
    .byte arg3, arg4
.endmacro

.define ENDING_CMD_0B_PLAYSFX(arg1) .byte $0B, arg1

.define ENDING_CMD_0C_LOADSECONDARYSPRITETILES(arg1) .byte $0C, arg1

.macro ENDING_CMD_0D_SETALLTILESETS arg1, arg2, arg3, arg4, arg5, arg6
    .byte $0D
    .byte arg1, arg2
    .byte arg3, arg4
    .byte arg5, arg6
.endmacro

.define ENDING_CMD_0E_BEGINLOOP(iterations) .byte $0E, iterations

.macro ENDING_CMD_0F_ENDLOOP pointer
    .byte $0F
    .addr pointer
.endmacro

.define ENDING_CMD_10_CLEARSPRITE(arg1) .byte $10, arg1

.macro ENDING_CMD_11_DRAWTEXT stringId
    .byte $11
    .word stringId
.endmacro

.macro ENDING_CMD_12_DRAWTEXTXY stringId, arg_x, arg_y
    .byte $12
    .word stringId
    .byte arg_x,arg_y
.endmacro

.define ENDING_CMD_13_FADEIN .byte $13

;byte code begin
;TODO: link sprite.asm pointers
B26_02d3:
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0B_PLAYSFX $2D
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0D_SETALLTILESETS $7E, $7F, $0A, $09, $D0, $D4
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $2E,$2E,$09,$0D,$55,$4D,$4E,$4E,$4E,$4F,$55,$4D,$4E,$4F,$4D,$4E,$4E,$59,$0A,$2E
        .byte $2E,$2E,$09,$0E,$56,$4F,$50,$51,$62,$66,$56,$4F,$50,$51,$4F,$51,$51,$59,$08,$2E
        .byte $2E,$0B,$55,$4D,$4E,$59,$4E,$58,$40,$40,$55,$4E,$4E,$59,$4D,$4E,$0E,$03,$06,$2E
        .byte $2E,$09,$56,$4F,$51,$59,$51,$59,$76,$76,$56,$4D,$51,$59,$4F,$51,$06,$2E,$2E,$2E
        .byte $2E,$07,$02,$12,$55,$4D,$51,$5A,$6D,$6D,$57,$4E,$50,$51,$50,$51,$0A,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$07,$56,$4E,$5A,$6D,$6E,$6E,$6D,$57,$53,$54,$53,$54,$08,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$0B,$51,$5A,$36,$37,$6E,$6E,$36,$37,$6D,$6D,$6D,$6D,$0E,$0A,$2E,$2E
        .byte $2E,$2E,$0B,$13,$5A,$6D,$38,$39,$6E,$6E,$38,$39,$6E,$6D,$6E,$6E,$10,$08,$2E,$2E
        .byte $0B,$0C,$4D,$4E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$55,$4D,$0A,$2E
        .byte $10,$0F,$4F,$51,$2E,$2E,$2E,$2E,$2E,$2E,$2D,$2D,$2E,$2E,$2E,$2E,$56,$4F,$10,$0C
        .byte $4D,$4E,$4E,$59,$2E,$2E,$2E,$2E,$2E,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$4E,$59,$55,$4D
        .byte $4F,$51,$51,$59,$2E,$2E,$2E,$2D,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$51,$59,$56,$4E
        .byte $4D,$4E,$4E,$4E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$55,$4D,$4E,$58
        .byte $4F,$51,$50,$51,$2E,$2E,$2E,$2E,$2D,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$56,$4F,$51,$59
        .byte $4E,$4E,$4E,$59,$2E,$2E,$2E,$2E,$2D,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$55,$4D,$55,$4D
        .byte $50,$51,$51,$59,$2E,$2E,$2D,$2E,$2E,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$56,$4F,$56,$4E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $00,$00,$00,$00,$00
        .byte $00,$80,$80,$00,$00
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $70, $60, SPRITEDEF_0
    ENDING_CMD_09_INITSPRITE $01, $04, $60, $60, SPRITEDEF_8
    ENDING_CMD_09_INITSPRITE $02, $04, $50, $60, SPRITEDEF_10
    ENDING_CMD_09_INITSPRITE $03, $04, $60, $30, SPRITEDEF_CREDITS_UNK24
    ENDING_CMD_09_INITSPRITE $04, $04, $60, $10, SPRITEDEF_CREDITS_UNK55
    ENDING_CMD_09_INITSPRITE $05, $04, $80, $20, SPRITEDEF_CREDITS_UNK63
    ENDING_CMD_09_INITSPRITE $06, $04, $50, $2F, SPRITEDEF_CREDITS_UNK69
    ENDING_CMD_09_INITSPRITE $07, $04, $70, $2F, SPRITEDEF_CREDITS_UNK81
    ENDING_CMD_09_INITSPRITE $08, $04, $90, $30, SPRITEDEF_CREDITS_UNK57
    ENDING_CMD_09_INITSPRITE $09, $04, $40, $40, SPRITEDEF_CREDITS_UNK85
    ENDING_CMD_09_INITSPRITE $0A, $04, $80, $40, SPRITEDEF_CREDITS_UNK97
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_1
    ENDING_CMD_07_SETPAL
        .byte $0F,$38,$18,$17
        .byte $0F,$38,$18,$28
        .byte $0F,$38,$00,$27
        .byte $0F,$38,$30,$22
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $02
    CREDITS_loop_unk29:
        ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_9-SPRITEDEF_8, 0, -1
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_8-SPRITEDEF_9, 0, -1
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk29
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_01_DELAY 48
    ENDING_CMD_0A_MOVESPRITE 9, SPRITEDEF_CREDITS_UNK86-SPRITEDEF_CREDITS_UNK85, 1, 0
    ENDING_CMD_0A_MOVESPRITE 10, SPRITEDEF_CREDITS_UNK97-SPRITEDEF_CREDITS_UNK96, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 9, SPRITEDEF_CREDITS_UNK85-SPRITEDEF_CREDITS_UNK86, 1, 0
    ENDING_CMD_0A_MOVESPRITE 10, SPRITEDEF_CREDITS_UNK96-SPRITEDEF_CREDITS_UNK97, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 9, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 10, 0, 0, 0
    ENDING_CMD_01_DELAY 16
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_1-SPRITEDEF_0, 0, -1
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11-SPRITEDEF_10, 0, -1
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_0-SPRITEDEF_1, 0, -1
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_10-SPRITEDEF_11, 0, -1
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $1A, $00, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3F,$3D,$01,$02,$02,$02,$02,$02,$02,$02,$02,$03,$34,$3F,$3F,$3F,$04
        .byte $05,$3F,$3F,$3D,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$33,$34,$3F,$3F,$04
        .byte $05,$3F,$3D,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$33,$34,$3F,$04
        .byte $05,$3D,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$33,$34,$04
        .byte $05,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$33,$04
        .byte $03,$06,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$08,$01
        .byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$3F,$2C,$2D,$3F,$3F,$3F,$3F,$3F,$3F,$2C,$2D,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$3F,$2E,$2F,$3F,$3F,$3F,$3F,$3F,$3F,$2E,$2F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$2C,$2D,$3F,$3F,$3F,$3F,$3F,$3F,$2C,$2D,$3F,$3F
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $70, $50, SPRITEDEF_0
    ENDING_CMD_09_INITSPRITE $01, $04, $90, $60, SPRITEDEF_8
    ENDING_CMD_09_INITSPRITE $02, $04, $60, $60, SPRITEDEF_10
    ENDING_CMD_09_INITSPRITE $03, $09, $70, $30, SPRITEDEF_CREDITS_UNK46
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_2
    ENDING_CMD_07_SETPAL
        .byte $0F,$04,$03,$23
        .byte $0F,$04,$27,$30
        .byte $0F,$04,$05,$30
        .byte $0F,$04,$30,$34
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $07
    CREDITS_loop_unk2A:
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK47-SPRITEDEF_CREDITS_UNK46, 0, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK46-SPRITEDEF_CREDITS_UNK47, 0, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2A
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK49-SPRITEDEF_CREDITS_UNK46, 0, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK48-SPRITEDEF_CREDITS_UNK49, 0, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0E_BEGINLOOP $07
    CREDITS_loop_unk2B:
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK49-SPRITEDEF_CREDITS_UNK48, 0, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK48-SPRITEDEF_CREDITS_UNK49, 0, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2B
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK50-SPRITEDEF_CREDITS_UNK48, 0, -1
    ENDING_CMD_01_DELAY 16
    ENDING_CMD_0A_MOVESPRITE 3, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $08, $00, $D0, $D4
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $2E,$2E,$27,$28,$39,$3A,$05,$05,$07,$08,$05,$3B,$05,$05,$3D,$3E,$2E,$2E,$27,$28
        .byte $25,$0D,$29,$2A,$22,$23,$23,$0A,$0B,$0C,$08,$3F,$23,$23,$3C,$20,$2E,$2E,$29,$2A
        .byte $27,$28,$2B,$2C,$11,$2D,$0E,$0B,$1C,$1D,$0F,$10,$2D,$12,$14,$21,$27,$28,$29,$2A
        .byte $29,$2A,$27,$28,$11,$2D,$26,$2D,$2D,$2D,$12,$1E,$2D,$12,$24,$13,$29,$2A,$2B,$2C
        .byte $29,$2A,$29,$2A,$11,$15,$26,$2D,$18,$19,$12,$1F,$15,$16,$17,$2E,$29,$2A,$2E,$2E
        .byte $2B,$2C,$2B,$2C,$2E,$2E,$11,$15,$1A,$1B,$16,$17,$2E,$2E,$2E,$2E,$2B,$2C,$2E,$2E
        .byte $27,$28,$27,$28,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$25,$0D,$27,$28,$27,$28
        .byte $29,$2A,$29,$2A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$25,$0D,$2E,$29,$2A,$29,$2A
        .byte $2B,$2C,$29,$2A,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$27,$28,$29,$2A,$29,$2A
        .byte $27,$28,$2B,$2C,$2E,$2E,$2E,$2E,$25,$0D,$2E,$2E,$2E,$2E,$29,$2A,$2B,$2C,$2B,$2C
        .byte $29,$2A,$2E,$2E,$2E,$2E,$25,$0D,$25,$0D,$2E,$2E,$25,$0D,$29,$2A,$2E,$2E,$27,$28
        .byte $2B,$2C,$25,$0D,$2E,$2E,$2E,$25,$0D,$2E,$2E,$2E,$2E,$2E,$2B,$2C,$27,$28,$29,$2A
        .byte $0D,$2E,$25,$0D,$25,$0D,$25,$0D,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$29,$2A,$29,$2A
        .byte $25,$0D,$2E,$2E,$2E,$25,$0D,$2E,$25,$0D,$25,$0D,$25,$0D,$25,$0D,$2B,$2C,$2B,$2C
        .byte $25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E,$25,$0D,$2E,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $AA,$FF,$FF,$FF,$A8
        .byte $AA,$AF,$AD,$AF,$A2
        .byte $AA,$AA,$AA,$AA,$AA
        .byte $AA,$AA,$AA,$AA,$AA
    ENDING_CMD_09_INITSPRITE $00, $04, $60, $30, SPRITEDEF_NINTENDOWN1
    ENDING_CMD_09_INITSPRITE $01, $04, $50, $30, SPRITEDEF_E
    ENDING_CMD_09_INITSPRITE $02, $04, $70, $20, SPRITEDEF_12
    ENDING_CMD_09_INITSPRITE $03, $04, $60, $50, SPRITEDEF_CREDITS_UNK85
    ENDING_CMD_09_INITSPRITE $04, $04, $70, $50, SPRITEDEF_CREDITS_UNK105
    ENDING_CMD_09_INITSPRITE $05, $04, $40, $30, SPRITEDEF_CREDITS_UNK109
    ENDING_CMD_09_INITSPRITE $06, $04, $80, $30, SPRITEDEF_CREDITS_UNK99
    ENDING_CMD_09_INITSPRITE $07, $04, $80, $20, SPRITEDEF_CREDITS_UNK57
    ENDING_CMD_09_INITSPRITE $08, $04, $40, $40, SPRITEDEF_CREDITS_UNK59
    ENDING_CMD_09_INITSPRITE $09, $04, $30, $50, SPRITEDEF_CREDITS_UNK69
    ENDING_CMD_09_INITSPRITE $0A, $04, $90, $50, SPRITEDEF_CREDITS_UNK81
    ENDING_CMD_09_INITSPRITE $0B, $04, $90, $60, SPRITEDEF_CREDITS_UNK97
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_3
    ENDING_CMD_07_SETPAL
        .byte $0F,$3A,$18,$38
        .byte $0F,$3A,$00,$20
        .byte $0F,$3A,$25,$1A
        .byte $0F,$3A,$30,$12
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $02
    CREDITS_loop_unk2C:
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK106-SPRITEDEF_CREDITS_UNK105, -1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK109, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK87-SPRITEDEF_CREDITS_UNK85, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK106, -1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK111-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK111, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK89-SPRITEDEF_CREDITS_UNK87, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK101-SPRITEDEF_CREDITS_UNK100, -1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK109-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK101, 1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK109, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK87-SPRITEDEF_CREDITS_UNK89, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK111-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK106-SPRITEDEF_CREDITS_UNK99, 1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK110-SPRITEDEF_CREDITS_UNK111, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK100-SPRITEDEF_CREDITS_UNK99, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK85-SPRITEDEF_CREDITS_UNK87, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK105-SPRITEDEF_CREDITS_UNK106, 1, -1
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK109-SPRITEDEF_CREDITS_UNK110, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK99-SPRITEDEF_CREDITS_UNK100, 1, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2C
    ENDING_CMD_0A_MOVESPRITE 4, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 6, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $09, $01, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$0B,$0E,$19,$1A,$2D,$6E,$6E,$6E,$77,$78,$6E,$69,$6A
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$09,$11,$19,$2D,$2E,$6E,$6E,$6E,$79,$7A,$44,$6B,$6C
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$07,$03,$06,$05,$2E,$6E,$6E,$45,$46,$43,$43,$47,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$05,$6E,$48,$49,$4A,$46,$4B,$4C,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$0B,$4D,$5C,$5D,$6D,$4E,$4F,$60,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$09,$51,$7B,$7B,$7B,$52,$5E,$61,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$0B,$0E,$51,$7B,$7C,$7D,$52,$5F,$53,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$0B,$0C,$18,$19,$54,$55,$7E,$7F,$56,$57,$6E,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$0B,$0E,$19,$11,$10,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$0B,$19,$11,$19,$13,$1A,$2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$0B,$0C,$0C,$0E,$0E,$11,$13,$2D,$2E,$2E,$2E,$2E,$2F,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$0B,$10,$0E,$0E,$10,$11,$1A,$2D,$2E,$2E,$2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$09,$0E,$11,$10,$13,$1A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2F
        .byte $2E,$2E,$07,$11,$13,$1A,$2D,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2F,$2E,$2E,$2E
        .byte $2E,$2E,$0B,$18,$2D,$2D,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$0B,$19,$19,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2F,$2E,$2E,$2E,$2E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $00,$00,$00,$FC,$FB
        .byte $00,$00,$00,$FF,$FF
        .byte $00,$00,$00,$88,$00
        .byte $00,$00,$00,$A0,$0A
    ENDING_CMD_09_INITSPRITE $00, $04, $A0, $40, SPRITEDEF_6
    ENDING_CMD_09_INITSPRITE $01, $04, $90, $40, SPRITEDEF_A
    ENDING_CMD_09_INITSPRITE $02, $04, $80, $40, SPRITEDEF_12
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_4
    ENDING_CMD_07_SETPAL
        .byte $0F,$20,$20,$10
        .byte $0F,$20,$20,$10
        .byte $0F,$20,$20,$28
        .byte $0F,$20,$30,$3B
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_E-SPRITEDEF_A, 0, 0
    ENDING_CMD_01_DELAY 16
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_A-SPRITEDEF_E, 0, 0
    ENDING_CMD_01_DELAY 16
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_E-SPRITEDEF_A, 0, 0
    ENDING_CMD_01_DELAY 32
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_C-SPRITEDEF_E, 0, -1
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_D-SPRITEDEF_C, 0, -1
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_0-SPRITEDEF_6, 0, 0
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_10-SPRITEDEF_12, 0, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $1A, $19, $D0, $D4
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$06,$07,$07,$07,$07,$07,$07,$08,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$09,$3E,$3E,$3E,$3E,$3E,$3E,$0A,$3F,$3F,$05,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$04,$3F,$3F,$0B,$0C,$0C,$0C,$0C,$0C,$0C,$0D,$3F,$0E,$0F,$10,$3F,$3F
        .byte $45,$3F,$3D,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$11,$12,$13,$3F,$3F
        .byte $46,$3D,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$30,$31,$32,$34,$3F
        .byte $47,$14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$20,$21,$3F,$3F,$33,$34
        .byte $14,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$22,$23,$3F,$3F,$3F,$33
        .byte $3F,$3F,$79,$7A,$79,$7A,$3F,$3F,$7D,$24,$3F,$3F,$3F,$3F,$20,$21,$3F,$3F,$3F,$3F
        .byte $3F,$3F,$7B,$7C,$7B,$7C,$3F,$3F,$7E,$25,$3F,$3F,$3F,$3F,$22,$23,$3F,$3F,$3F,$3F
        .byte $79,$7A,$3F,$3F,$79,$7A,$79,$7A,$3F,$7D,$24,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$20,$21
        .byte $7B,$7C,$79,$7A,$7B,$7C,$7B,$7C,$3F,$7E,$25,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$22,$23
        .byte $3F,$3F,$7B,$7C,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
        .byte $01,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $30, $40, SPRITEDEF_2
    ENDING_CMD_09_INITSPRITE $01, $04, $60, $30, SPRITEDEF_CREDITS_UNK10
    ENDING_CMD_09_INITSPRITE $02, $04, $50, $30, SPRITEDEF_CREDITS_UNK18
    ENDING_CMD_09_INITSPRITE $03, $04, $60, $30, SPRITEDEF_CREDITS_UNK12
    ENDING_CMD_09_INITSPRITE $04, $04, $70, $30, SPRITEDEF_CREDITS_UNK16
    ENDING_CMD_09_INITSPRITE $05, $04, $58, $40, SPRITEDEF_CREDITS_UNK14
    ENDING_CMD_09_INITSPRITE $06, $04, $68, $40, SPRITEDEF_CREDITS_UNK20
    ENDING_CMD_09_INITSPRITE $07, $04, $80, $60, SPRITEDEF_CREDITS_UNK99
    ENDING_CMD_09_INITSPRITE $08, $04, $90, $60, SPRITEDEF_CREDITS_UNK113
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_5
    ENDING_CMD_07_SETPAL
        .byte $0F,$38,$18,$1C
        .byte $0F,$38,$10,$3B
        .byte $0F,$38,$25,$1A
        .byte $0F,$38,$30,$00
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $02
    CREDITS_loop_unk2D:
        ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_UNK11-SPRITEDEF_CREDITS_UNK10, 0, -1
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK19-SPRITEDEF_CREDITS_UNK18, 0, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK13-SPRITEDEF_CREDITS_UNK12, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK17-SPRITEDEF_CREDITS_UNK16, 0, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK15-SPRITEDEF_CREDITS_UNK14, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK21-SPRITEDEF_CREDITS_UNK20, 0, 0
        ENDING_CMD_01_DELAY 32
        ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_UNK10-SPRITEDEF_CREDITS_UNK11, 0, 1
        ENDING_CMD_01_DELAY 32
        ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK18-SPRITEDEF_CREDITS_UNK19, 0, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK12-SPRITEDEF_CREDITS_UNK13, 0, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK16-SPRITEDEF_CREDITS_UNK17, 0, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK14-SPRITEDEF_CREDITS_UNK15, 0, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK20-SPRITEDEF_CREDITS_UNK21, 0, 0
        ENDING_CMD_01_DELAY 32
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2D
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_UNK11-SPRITEDEF_CREDITS_UNK10, 0, -1
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK19-SPRITEDEF_CREDITS_UNK18, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CREDITS_UNK13-SPRITEDEF_CREDITS_UNK12, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK17-SPRITEDEF_CREDITS_UNK16, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK15-SPRITEDEF_CREDITS_UNK14, 0, 0
    ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_CREDITS_UNK21-SPRITEDEF_CREDITS_UNK20, 0, 0
    ENDING_CMD_01_DELAY 32
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $02, $00, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $6E,$6E,$69,$6A,$69,$6A,$67,$68,$6E,$6E,$63,$46,$43,$43,$47,$6E,$69,$6A,$67,$68
        .byte $6E,$6E,$6B,$6C,$6B,$6C,$69,$6A,$6E,$48,$49,$4A,$46,$4B,$4C,$6E,$6B,$6C,$69,$6A
        .byte $6E,$6E,$75,$76,$6E,$6E,$69,$6A,$4D,$49,$62,$62,$4E,$4F,$60,$6E,$6E,$6E,$69,$6A
        .byte $6E,$6E,$77,$78,$6E,$6E,$6B,$6C,$51,$54,$54,$54,$52,$5E,$61,$6E,$67,$68,$6B,$6C
        .byte $6E,$6F,$6E,$6E,$6E,$6E,$6E,$6F,$51,$54,$7E,$7F,$52,$5F,$53,$6E,$69,$6A,$6E,$6E
        .byte $6F,$6E,$6E,$6E,$6E,$6E,$6F,$6E,$51,$55,$5A,$5B,$56,$57,$6E,$6E,$6B,$6C,$6E,$6E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2F,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2F,$2E,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$30,$2D,$33,$2E,$2E,$2E,$2E,$2E,$2E,$2F,$2E
        .byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2E,$2F,$2E,$2F,$2E,$2E,$2E,$36,$37,$2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $2E,$2E,$2F,$2E,$2E,$2E,$2E,$2E,$3B,$2D,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $0C,$0C,$07,$09,$09,$0A,$2E,$2E,$3B,$2D,$37,$2E,$2E,$2E,$2E,$2F,$07,$09,$09,$09
        .byte $0C,$0C,$08,$09,$09,$0B,$2E,$2E,$2E,$32,$2D,$31,$2E,$2F,$2F,$2E,$08,$09,$09,$09
        .byte $27,$28,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
        .byte $29,$2A,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$36,$2D,$3A,$2E,$2E,$2E,$2E,$2E,$2E,$2E
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $C8,$8A,$55,$55,$AA
        .byte $22,$08,$05,$05,$22
        .byte $80,$20,$00,$20,$08
        .byte $20,$00,$00,$0A,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $70, $60, SPRITEDEF_0
    ENDING_CMD_09_INITSPRITE $01, $04, $70, $20, SPRITEDEF_CREDITS_UNK6
    ENDING_CMD_09_INITSPRITE $02, $04, $60, $20, SPRITEDEF_CREDITS_UNK30
    ENDING_CMD_09_INITSPRITE $03, $04, $80, $20, SPRITEDEF_CREDITS_UNK30
    ENDING_CMD_09_INITSPRITE $04, $04, $30, $40, SPRITEDEF_CREDITS_UNK36
    ENDING_CMD_09_INITSPRITE $05, $04, $A0, $60, SPRITEDEF_CREDITS_UNK44
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_6
    ENDING_CMD_07_SETPAL
        .byte $0F,$3A,$18,$38
        .byte $0F,$3A,$00,$20
        .byte $0F,$3A,$24,$1A
        .byte $0F,$3A,$30,$12
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_UNK7-SPRITEDEF_CREDITS_UNK6, 0, 1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK37-SPRITEDEF_CREDITS_UNK36, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 1, SPRITEDEF_CREDITS_UNK6-SPRITEDEF_CREDITS_UNK7, 0, 1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK36-SPRITEDEF_CREDITS_UNK37, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 1, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK41-SPRITEDEF_CREDITS_UNK36, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK40-SPRITEDEF_CREDITS_UNK41, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_1-SPRITEDEF_0, 0, -1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK37-SPRITEDEF_CREDITS_UNK40, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_0-SPRITEDEF_1, 0, -1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK36-SPRITEDEF_CREDITS_UNK37, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_1-SPRITEDEF_0, 0, -1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK41-SPRITEDEF_CREDITS_UNK36, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_0-SPRITEDEF_1, 0, -1
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK40-SPRITEDEF_CREDITS_UNK41, -1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 0, 0, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK37-SPRITEDEF_CREDITS_UNK40, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK36-SPRITEDEF_CREDITS_UNK37, 1, 0
    ENDING_CMD_01_DELAY 8
    ENDING_CMD_0E_BEGINLOOP $03
    CREDITS_loop_unk2E:
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK41-SPRITEDEF_CREDITS_UNK36, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK40-SPRITEDEF_CREDITS_UNK41, -1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK37-SPRITEDEF_CREDITS_UNK40, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_CREDITS_UNK36-SPRITEDEF_CREDITS_UNK37, 1, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2E
    ENDING_CMD_0A_MOVESPRITE 4, 0, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $14, $00, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $3F,$0A,$3F,$3F,$04,$0A,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$3F,$3F,$04,$0A,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$16,$17,$04,$0A,$3F,$04,$3F,$13,$3F,$3F,$13,$3F,$3F,$13,$3F,$3F,$13,$3F
        .byte $3F,$0A,$18,$19,$04,$0A,$3F,$04,$3F,$14,$3F,$3F,$14,$3F,$3F,$14,$3F,$3F,$14,$3F
        .byte $3F,$0A,$1A,$1B,$04,$0A,$3F,$04,$3F,$14,$3F,$3F,$14,$3F,$3F,$14,$3F,$3F,$14,$3F
        .byte $3F,$0A,$1A,$1B,$04,$0A,$3F,$04,$3F,$15,$3F,$3F,$15,$3F,$3F,$15,$3F,$3F,$15,$3F
        .byte $3F,$0A,$1C,$1D,$04,$0A,$3F,$04,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$1E,$3F,$04,$0A,$08,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
        .byte $3F,$0A,$3F,$3F,$04,$0A,$09,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$3F,$08,$01,$0B,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$08,$09,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$09,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$0A,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $08,$0B,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $09,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .byte $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, 5, 4
        .byte $40,$00,$50,$50,$50
        .byte $44,$00,$05,$05,$05
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $70, $50, SPRITEDEF_CREDITS_UNK42
    ENDING_CMD_09_INITSPRITE $01, $28, $88, $30, SPRITEDEF_CREDITS_UNK45
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_7
    ENDING_CMD_07_SETPAL
        .byte $0F,$38,$18,$00
        .byte $0F,$38,$24,$2B
        .byte $0F,$12,$31,$02
        .byte $0F,$21,$30,$00
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $03
    CREDITS_loop_unk2F:
        ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK43-SPRITEDEF_CREDITS_UNK42, 0, 0
        ENDING_CMD_01_DELAY 16
        ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK42-SPRITEDEF_CREDITS_UNK43, 0, 0
        ENDING_CMD_01_DELAY 48
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2F
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK43-SPRITEDEF_CREDITS_UNK42, 0, 0
    ENDING_CMD_01_DELAY 16
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK42-SPRITEDEF_CREDITS_UNK43, 0, 0
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_04_LOADTILESETS $19, $1A, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $2088, 20, 16
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$5C,$5D,$7F,$7F,$7F,$7F,$5C,$5D,$7F,$7F
        .byte $7F,$7F,$7F,$7F,$7F,$7F,$7F,$44,$7F,$7F,$5E,$5F,$7F,$7F,$7F,$7F,$5E,$5F,$4E,$4F
        .byte $7F,$7F,$7F,$7F,$08,$7F,$7D,$41,$42,$42,$42,$42,$42,$42,$42,$42,$42,$42,$51,$52
        .byte $3F,$3F,$3F,$09,$0A,$01,$02,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$70,$71
        .byte $3F,$3F,$3F,$0B,$0C,$02,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$66,$68,$7F,$7F,$7F
        .byte $3F,$3F,$3F,$0D,$0E,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$69,$6B,$7F,$7F,$7F
        .byte $3F,$10,$11,$0F,$3F,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $3F,$12,$13,$14,$15,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $01,$16,$17,$18,$19,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $02,$3F,$3F,$3F,$3F,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
        .byte $3F,$3F,$3F,$3F,$3F,$3F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
    ENDING_CMD_06_SETMETATILEPROPERTIES $23CA, $05, $04
        .byte $00,$00,$00,$00,$00
        .byte $00,$00,$44,$00,$11
        .byte $00,$00,$00,$88,$22
        .byte $00,$00,$00,$00,$00
    ENDING_CMD_09_INITSPRITE $00, $04, $30, $50, SPRITEDEF_CREDITS_UNK22
    ENDING_CMD_09_INITSPRITE $01, $02, $50, $50, SPRITEDEF_CREDITS_UNK25
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_8
    ENDING_CMD_07_SETPAL
        .byte $0F,$37,$18,$31
        .byte $0F,$37,$10,$3B
        .byte $0F,$37,$30,$24
        .byte $0F,$37,$30,$27
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0E_BEGINLOOP $03
    CREDITS_loop_unk1:
        ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK23-SPRITEDEF_CREDITS_UNK22, 0, 0
        ENDING_CMD_01_DELAY 80
        ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK22-SPRITEDEF_CREDITS_UNK23, 0, 0
        ENDING_CMD_01_DELAY 96
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK23-SPRITEDEF_CREDITS_UNK22, 0, 0
    ENDING_CMD_01_DELAY 80
    ENDING_CMD_0A_MOVESPRITE 0, SPRITEDEF_CREDITS_UNK22-SPRITEDEF_CREDITS_UNK23, 0, 0
    ENDING_CMD_07_SETPAL
        .byte $02,$11,$0C,$0C
        .byte $02,$11,$0C,$0C
        .byte $02,$11,$0C,$0C
        .byte $02,$11,$02,$0C
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $60

    ;pippi walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_CREDITS_UNK125
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk2:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK126-SPRITEDEF_CREDITS_UNK125, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK125-SPRITEDEF_CREDITS_UNK126, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk2
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK127-SPRITEDEF_CREDITS_UNK125, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK125-SPRITEDEF_CREDITS_UNK127, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk3:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK126-SPRITEDEF_CREDITS_UNK125, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_CREDITS_UNK125-SPRITEDEF_CREDITS_UNK126, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk3
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $68

    ;pippi mom walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_16C
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk4:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16D-SPRITEDEF_16C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16C-SPRITEDEF_16D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk4
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16E-SPRITEDEF_16C, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16C-SPRITEDEF_16E, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk5:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16D-SPRITEDEF_16C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_16C-SPRITEDEF_16D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk5
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120

    ;canaries and canary guy walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B8, $80, SPRITEDEF_164
    ENDING_CMD_09_INITSPRITE $03, $84, $C8, $80, SPRITEDEF_185
    ENDING_CMD_09_INITSPRITE $04, $84, $D8, $80, SPRITEDEF_164
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk6:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_165-SPRITEDEF_164, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_186-SPRITEDEF_185, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_165-SPRITEDEF_164, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_164-SPRITEDEF_165, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_185-SPRITEDEF_186, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_164-SPRITEDEF_165, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk6
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_166-SPRITEDEF_164, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_187-SPRITEDEF_185, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_166-SPRITEDEF_164, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_164-SPRITEDEF_166, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_185-SPRITEDEF_187, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_164-SPRITEDEF_166, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk7:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_165-SPRITEDEF_164, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_186-SPRITEDEF_185, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_165-SPRITEDEF_164, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_164-SPRITEDEF_165, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_185-SPRITEDEF_186, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_164-SPRITEDEF_165, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk7
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $64

    ;janitor walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_104
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk8:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_105-SPRITEDEF_104, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_104-SPRITEDEF_105, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk8
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_106-SPRITEDEF_104, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_104-SPRITEDEF_106, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk9:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_105-SPRITEDEF_104, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_104-SPRITEDEF_105, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk9
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120

    ;school kids walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B0, $80, SPRITEDEF_EC
    ENDING_CMD_09_INITSPRITE $03, $84, $C0, $80, SPRITEDEF_F4
    ENDING_CMD_09_INITSPRITE $04, $84, $D0, $80, SPRITEDEF_FC
    ENDING_CMD_09_INITSPRITE $05, $84, $E0, $80, SPRITEDEF_C4
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkA:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_ED-SPRITEDEF_EC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F5-SPRITEDEF_F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FD-SPRITEDEF_FC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C5-SPRITEDEF_C4, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_EC-SPRITEDEF_ED, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F4-SPRITEDEF_F5, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FC-SPRITEDEF_FD, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C4-SPRITEDEF_C5, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkA
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_EE-SPRITEDEF_EC, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F6-SPRITEDEF_F4, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FE-SPRITEDEF_FC, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C6-SPRITEDEF_C4, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_EC-SPRITEDEF_EE, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F4-SPRITEDEF_F6, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FC-SPRITEDEF_FE, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C4-SPRITEDEF_C6, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkB:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_ED-SPRITEDEF_EC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F5-SPRITEDEF_F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FD-SPRITEDEF_FC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C5-SPRITEDEF_C4, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_EC-SPRITEDEF_ED, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_F4-SPRITEDEF_F5, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_FC-SPRITEDEF_FD, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_C4-SPRITEDEF_C5, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkB
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_10_CLEARSPRITE $05
    ENDING_CMD_01_DELAY 120

    ;rosemary's walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C0, $80, SPRITEDEF_DC
    ENDING_CMD_09_INITSPRITE $03, $84, $D0, $80, SPRITEDEF_CC
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkC:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DD-SPRITEDEF_DC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CD-SPRITEDEF_CC, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DC-SPRITEDEF_DD, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CC-SPRITEDEF_CD, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkC
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DE-SPRITEDEF_DC, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CE-SPRITEDEF_CC, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DC-SPRITEDEF_DE, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CC-SPRITEDEF_CE, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkD:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DD-SPRITEDEF_DC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CD-SPRITEDEF_CC, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_DC-SPRITEDEF_DD, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_CC-SPRITEDEF_CD, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkD
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $62

    ;cop walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_74
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkE:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_75-SPRITEDEF_74, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_74-SPRITEDEF_75, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkE
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_76-SPRITEDEF_74, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_74-SPRITEDEF_76, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unkF:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_75-SPRITEDEF_74, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_74-SPRITEDEF_75, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unkF
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120

    ;towns people walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B8, $80, SPRITEDEF_8C
    ENDING_CMD_09_INITSPRITE $03, $84, $C8, $80, SPRITEDEF_94
    ENDING_CMD_09_INITSPRITE $04, $84, $D8, $80, SPRITEDEF_6C
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk10:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8D-SPRITEDEF_8C, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_95-SPRITEDEF_94, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6D-SPRITEDEF_6C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8C-SPRITEDEF_8D, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_94-SPRITEDEF_95, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6C-SPRITEDEF_6D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk10
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8E-SPRITEDEF_8C, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_96-SPRITEDEF_94, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6E-SPRITEDEF_6C, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8C-SPRITEDEF_8E, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_94-SPRITEDEF_96, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6C-SPRITEDEF_6E, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk11:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8D-SPRITEDEF_8C, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_95-SPRITEDEF_94, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6D-SPRITEDEF_6C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_8C-SPRITEDEF_8D, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_94-SPRITEDEF_95, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_6C-SPRITEDEF_6D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk11
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_01_DELAY 120

    ;towns people 2 walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B8, $80, SPRITEDEF_9C
    ENDING_CMD_09_INITSPRITE $03, $84, $C8, $80, SPRITEDEF_A4
    ENDING_CMD_09_INITSPRITE $04, $84, $D8, $80, SPRITEDEF_84
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk12:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9D-SPRITEDEF_9C, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A5-SPRITEDEF_A4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_85-SPRITEDEF_84, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9C-SPRITEDEF_9D, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A4-SPRITEDEF_A5, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_84-SPRITEDEF_85, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk12
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9E-SPRITEDEF_9C, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A6-SPRITEDEF_A4, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_86-SPRITEDEF_84, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9C-SPRITEDEF_9E, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A4-SPRITEDEF_A6, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_84-SPRITEDEF_86, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk13:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9D-SPRITEDEF_9C, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A5-SPRITEDEF_A4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_85-SPRITEDEF_84, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_9C-SPRITEDEF_9D, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_A4-SPRITEDEF_A5, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_84-SPRITEDEF_85, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk13
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $66

    ;inn guy walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_12C
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk14:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12D-SPRITEDEF_12C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12C-SPRITEDEF_12D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk14
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12E-SPRITEDEF_12C, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12C-SPRITEDEF_12E, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk15:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12D-SPRITEDEF_12C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12C-SPRITEDEF_12D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk15
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120

    ;doctor and nurse walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C0, $80, SPRITEDEF_124
    ENDING_CMD_09_INITSPRITE $03, $84, $D0, $80, SPRITEDEF_134
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk16:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_125-SPRITEDEF_124, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_135-SPRITEDEF_134, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_124-SPRITEDEF_125, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_134-SPRITEDEF_135, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk16
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_126-SPRITEDEF_124, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_136-SPRITEDEF_134, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_124-SPRITEDEF_126, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_134-SPRITEDEF_136, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk17:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_125-SPRITEDEF_124, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_135-SPRITEDEF_134, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_124-SPRITEDEF_125, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_134-SPRITEDEF_135, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk17
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_01_DELAY 120

    ;bouncer girl walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_11C
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk18:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11D-SPRITEDEF_11C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11C-SPRITEDEF_11D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk18
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11E-SPRITEDEF_11C, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11C-SPRITEDEF_11E, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk19:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11D-SPRITEDEF_11C, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_11C-SPRITEDEF_11D, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk19
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $6A

    ;airplane guy walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_1C1
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1A:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C2-SPRITEDEF_1C1, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C1-SPRITEDEF_1C2, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1A
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C3-SPRITEDEF_1C1, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C1-SPRITEDEF_1C3, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1B:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C2-SPRITEDEF_1C1, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1C1-SPRITEDEF_1C2, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1B
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $6C

    ;zoo walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B0, $80, SPRITEDEF_1F3
    ENDING_CMD_09_INITSPRITE $03, $84, $C0, $80, SPRITEDEF_1F3
    ENDING_CMD_09_INITSPRITE $04, $84, $D0, $80, SPRITEDEF_213
    ENDING_CMD_09_INITSPRITE $05, $84, $E0, $80, SPRITEDEF_1F3
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1C:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_214-SPRITEDEF_213, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_213-SPRITEDEF_214, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1C
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F5-SPRITEDEF_1F3, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F5-SPRITEDEF_1F3, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_215-SPRITEDEF_213, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F5-SPRITEDEF_1F3, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F3-SPRITEDEF_1F5, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F3-SPRITEDEF_1F5, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_213-SPRITEDEF_215, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F3-SPRITEDEF_1F5, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1D:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_214-SPRITEDEF_213, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F4-SPRITEDEF_1F3, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_213-SPRITEDEF_214, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_1F3-SPRITEDEF_1F4, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1D
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_10_CLEARSPRITE $05
    ENDING_CMD_01_DELAY 120

    ;magicantians walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C0, $80, SPRITEDEF_1EB
    ENDING_CMD_09_INITSPRITE $03, $84, $D0, $80, SPRITEDEF_203
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1E:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1EC-SPRITEDEF_1EB, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_204-SPRITEDEF_203, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1EB-SPRITEDEF_1EC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_203-SPRITEDEF_204, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1E
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1ED-SPRITEDEF_1EB, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_205-SPRITEDEF_203, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1EB-SPRITEDEF_1ED, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_203-SPRITEDEF_205, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk1F:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1EC-SPRITEDEF_1EB, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_204-SPRITEDEF_203, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_1EB-SPRITEDEF_1EC, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_203-SPRITEDEF_204, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk1F
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $6E

    ;magicant court walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C0, $80, SPRITEDEF_242
    ENDING_CMD_09_INITSPRITE $03, $84, $D0, $80, SPRITEDEF_25B
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk20:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_243-SPRITEDEF_242, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25C-SPRITEDEF_25B, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_242-SPRITEDEF_243, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25B-SPRITEDEF_25C, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk20
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_244-SPRITEDEF_242, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25D-SPRITEDEF_25B, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_242-SPRITEDEF_244, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25B-SPRITEDEF_25D, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk21:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_243-SPRITEDEF_242, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25C-SPRITEDEF_25B, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_242-SPRITEDEF_243, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_25B-SPRITEDEF_25C, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk21
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_01_DELAY 120

    ;magicant guitar guy walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_253
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk22:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_254-SPRITEDEF_253, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_253-SPRITEDEF_254, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk22
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_255-SPRITEDEF_253, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_253-SPRITEDEF_255, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk23:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_254-SPRITEDEF_253, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_253-SPRITEDEF_254, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk23
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120

    ;flying men walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C0, $80, SPRITEDEF_52
    ENDING_CMD_09_INITSPRITE $03, $84, $D0, $80, SPRITEDEF_52
    ENDING_CMD_09_INITSPRITE $04, $84, $B8, $90, SPRITEDEF_52
    ENDING_CMD_09_INITSPRITE $05, $84, $C8, $90, SPRITEDEF_52
    ENDING_CMD_09_INITSPRITE $06, $84, $D8, $90, SPRITEDEF_52
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk24:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk24
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_54-SPRITEDEF_52, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_54-SPRITEDEF_52, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_54-SPRITEDEF_52, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_54-SPRITEDEF_52, 0, 0
    ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_54-SPRITEDEF_52, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_52-SPRITEDEF_54, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_52-SPRITEDEF_54, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_52-SPRITEDEF_54, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_52-SPRITEDEF_54, 0, 0
    ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_52-SPRITEDEF_54, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk25:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_53-SPRITEDEF_52, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_0A_MOVESPRITE 6, SPRITEDEF_52-SPRITEDEF_53, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk25
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_10_CLEARSPRITE $03
    ENDING_CMD_10_CLEARSPRITE $04
    ENDING_CMD_10_CLEARSPRITE $05
    ENDING_CMD_10_CLEARSPRITE $06
    ENDING_CMD_01_DELAY 120

    ;queen mary walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $C8, $80, SPRITEDEF_24A
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk26:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24B-SPRITEDEF_24A, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24A-SPRITEDEF_24B, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk26
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24C-SPRITEDEF_24A, 0, 0
    ENDING_CMD_01_DELAY 90
    ;walk out
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24A-SPRITEDEF_24C, 0, 0
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk27:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24B-SPRITEDEF_24A, 2, 0
        ENDING_CMD_01_DELAY 4
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_24A-SPRITEDEF_24B, 2, 0
        ENDING_CMD_01_DELAY 4
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk27
    ENDING_CMD_10_CLEARSPRITE $02
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_0C_LOADSECONDARYSPRITETILES $60

    ;squad walk in
    ENDING_CMD_09_INITSPRITE $02, $84, $B0, $80, SPRITEDEF_12
    ENDING_CMD_09_INITSPRITE $03, $84, $C0, $80, SPRITEDEF_2
    ENDING_CMD_09_INITSPRITE $04, $84, $D0, $80, SPRITEDEF_A
    ENDING_CMD_09_INITSPRITE $05, $84, $E0, $80, SPRITEDEF_CREDITS_UNK117
    ENDING_CMD_0E_BEGINLOOP $0A
    CREDITS_loop_unk28:
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_13-SPRITEDEF_12, 1, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_3-SPRITEDEF_2, 1, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_B-SPRITEDEF_A, 1, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK118-SPRITEDEF_CREDITS_UNK117, 1, 0
        ENDING_CMD_01_DELAY 8
        ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_12-SPRITEDEF_13, 1, 0
        ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_2-SPRITEDEF_3, 1, 0
        ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_A-SPRITEDEF_B, 1, 0
        ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK117-SPRITEDEF_CREDITS_UNK118, 1, 0
        ENDING_CMD_01_DELAY 8
    ENDING_CMD_0F_ENDLOOP CREDITS_loop_unk28
    ;stand
    ENDING_CMD_0A_MOVESPRITE 2, SPRITEDEF_14-SPRITEDEF_12, 0, 0
    ENDING_CMD_0A_MOVESPRITE 3, SPRITEDEF_NINTENDOWN1-SPRITEDEF_2, 0, 0
    ENDING_CMD_0A_MOVESPRITE 4, SPRITEDEF_C-SPRITEDEF_A, 0, 0
    ENDING_CMD_0A_MOVESPRITE 5, SPRITEDEF_CREDITS_UNK119-SPRITEDEF_CREDITS_UNK117, 0, 0
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 140
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 60
    ENDING_CMD_0B_PLAYSFX $33
    ENDING_CMD_01_DELAY 96
    ENDING_CMD_0D_SETALLTILESETS $4A, $4B, $48, $49, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $218A, 5, 1
        ;DIRECTOR
        .byte $01,$02,$03,$04,$05
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_SHIGESATO_ITOI, 8, 12
    ENDING_CMD_07_SETPAL
        .byte $0F,$12,$30,$16
        .byte $0F,$10,$30,$00
        .byte $0F,$17,$28,$16
        .byte $0F,$38,$30,$00
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $216A, 8, 1
        ;GAME DESIGNERS
        .byte $06,$07,$08,$09,$0A,$0B,$0C,$0D
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_SHIGESATO_ITOI, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_MIYUKI_KURE, 8, 13
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $216A, 9, 1
        ;MUSIC PRODUCERS
        .byte $0E,$0F,$10,$11,$12,$13,$14,$15,$16
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_AKIO_OHMORI, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_RITSUO_KAMIMURA, 8, 13
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $216A, 8, $01
        ;MUSICAL EFFECTS
        .byte $0E,$0F,$17,$18,$19,$1A,$1B,$1C
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_KEIICHI_SUZUKI, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_HIROKAZU_TANAKA, 8, 13
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $216A, 11, $01
        ;CHARACTER DESIGNERS
        .byte $1D,$1E,$1F,$03,$0C,$20,$21,$22,$23,$15,$16
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_SHINBO_MINAMI, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TATSUYA_ISHII, 8, 13
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $218A, 8, 1
        ;FIGURE MODELING
        .byte $24,$25,$26,$27,$28,$09,$29,$2A
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TOTTORI, 8, 12
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $214A, 7, 1
        ;PROGRAMMERS
        .byte $11,$2B,$2C,$2D,$2E,$2F,$30
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_KAZUYA_NAKATANI, 8, 10
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TAKAYUKI_ONODERA, 8, 12
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_MOTOO_YASUMA, 8, 14
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $212A, 10, 1
        ;SCENARIO ASSISTANTS
        .byte $31,$32,$1E,$33,$34,$35,$36,$37,$38,$1C
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_MASAYUKI_KAMEYAMA, 8, 9
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_HIDEO_KON, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_KATSUTOMO_MAEIWA, 8, 13
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_KUNIKO_SAKURAI, 8, 15
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $20EA, 7, 1
        ;COORDINATORS
        .byte $39,$3A,$3B,$3C,$3D,$04,$3E
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_MASAHIRO_TATEMOTO, 8, 7
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TAKASHI_KAWAGUCHI, 8, 9
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_KEIZOH_KATOH, 8, 11
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_MOTOHIRO_ISHII, 8, 13
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_AKIHITO_TODA, 8, 15
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_YUKARI_SAITOH, 8, 17
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $218A, 11, 1
        ;ENGLISH SCRIPT WRITERS
        .byte $32,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$3F
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_PHIL_SANDHOP, 8, 12
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $214A, 6, 1
        ;TRANSLATORS
        .byte $53,$54,$55,$56,$57,$15
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TOSHIKO_WATSON, 8, 10
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_YUKA_NAKATA, 8, 12
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_HIROKO_FAULKNER, 8, 14
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $20ca, 9, 1
        ;SPECIAL THANKS TO
        .byte $58,$59,$5A,$5B,$5C,$5D,$5E,$5F,$60
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TONY_HARMAN, 8, 6
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_DAYV_BROOKS, 8, 8
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_NORIYUKI_MINAMI, 8, 10
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_BIN_OHGAWARA, 8, 12
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_YOSHIHISA_WADA, 8, 14
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_HIKONORI_SUZUKI, 8, 16
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_TAKAO_SHIMIZU, 8, 18
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $218a, 5, 1
        ;PRODUCER
        .byte $11,$12,$13,$14,$3F
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_SHIGERU_MIYAMOTO, 8, 12
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $218a, 10, 1
        ;EXECUTIVE PRODUCER
        .byte $40,$41,$42,$43,$44,$45,$46,$47,$48,$49
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_HIROSHI_YAMAUCHI, 8, 12
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 120
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $218a, 8, 1
        ;"PLAYER"
        .byte $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7
    ENDING_CMD_06_SETMETATILEPROPERTIES $23DA, 3, 1
        .byte $0A,$0A,$0A
    ENDING_CMD_12_DRAWTEXTXY UMSG::CREDITS_PLAYERNAME, 8, 12
    ENDING_CMD_13_FADEIN
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 144
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 30
    ENDING_CMD_05_LOADBG2MAP $214d, 10, 3
        ;Nintendo Logo
        .byte $72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B
        .byte $82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B
        .byte $00,$7D,$7E,$7E,$7E,$7E,$7E,$7E,$7F,$00
    ENDING_CMD_05_LOADBG2MAP $21A9, 18, 1
        ;Tokyo Research & Development Products
        .byte $61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71,$7C
    ENDING_CMD_05_LOADBG2MAP $220E, 9, 3
        ;APE inc.
        .byte $00,$90,$91,$92,$93,$94,$95,$00,$00
        .byte $00,$96,$97,$98,$99,$9A,$9B,$00,$00
        .byte $9C,$9D,$9E,$9F,$8C,$8D,$8E,$80,$81
    ENDING_CMD_06_SETMETATILEPROPERTIES $23E3, $03, $01
        .byte $FF,$FF,$FF
    ENDING_CMD_07_SETPAL
        .byte $0F,$12,$30,$00
        .byte $0F,$10,$30,$00
        .byte $0F,$17,$28,$16
        .byte $0F,$38,$30,$00
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_01_DELAY 240
    ENDING_CMD_03_FADEOUT
    ENDING_CMD_01_DELAY 180
    ENDING_CMD_0D_SETALLTILESETS $7E, $7F, $D6, $D7, $D0, $D2
    ENDING_CMD_05_LOADBG2MAP $208C, 12, 16
        .byte $00,$00,$00,$00,$02,$03,$04,$05,$06,$00,$00,$00
        .byte $00,$00,$00,$00,$12,$13,$14,$15,$16,$17,$00,$00
        .byte $00,$00,$00,$21,$22,$23,$24,$25,$26,$27,$00,$00
        .byte $00,$00,$30,$31,$32,$33,$34,$35,$36,$37,$00,$00
        .byte $00,$00,$40,$41,$42,$43,$44,$45,$46,$47,$00,$00
        .byte $00,$00,$50,$51,$52,$53,$54,$55,$56,$57,$00,$00
        .byte $00,$00,$60,$61,$62,$63,$64,$65,$66,$67,$00,$00
        .byte $00,$00,$70,$71,$72,$73,$74,$75,$76,$77,$00,$00
        .byte $00,$00,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$00,$00
        .byte $00,$00,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$00,$00
        .byte $00,$00,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,$00,$00
        .byte $00,$00,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,$00,$00
        .byte $00,$00,$48,$49,$4A,$4B,$4C,$4D,$4E,$00,$00,$00
        .byte $00,$00,$58,$59,$5A,$5B,$5C,$5D,$5E,$00,$00,$00
        .byte $00,$00,$68,$69,$6A,$6B,$6C,$6D,$6E,$00,$00,$00
        .byte $00,$00,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,$00,$00
    ENDING_CMD_11_DRAWTEXT UMSG::CREDITS_9
    ENDING_CMD_07_SETPAL
        .byte $0F,$18,$38,$08
        .byte $0F,$18,$38,$08
        .byte $0F,$18,$38,$08
        .byte $0F,$18,$30,$08
    ENDING_CMD_00_END