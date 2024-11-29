.segment        "PRG1F": absolute
incbinRange "../../split/us/prg/bank1f/unk0.bin", 0, $c5d


; $EC5D
All_Bits:
.byte $80, $40, $20, $10, 8, 4, 2, 1

incbinRange "../../split/us/prg/bank1f/unk0.bin", $c65, $e7f


; Restore color palette from backup
RestorePalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda $0520, x
    sta $0500, x
    dex
    bpl @loop
    rts

; Backup up current color palette
BackupPalette:
    jsr PpuSync
    ldx #$1f
    @loop:
    lda $0500, x
    sta $0520, x
    dex
    bpl @loop
    rts

LoadPalette:
    sta $60
    stx $61
    jsr PpuSync
    ldy #$1f
    @loop:
    lda ($60), y
    sta $0500, y
    dey
    bpl @loop
    bmi UpdatePalette

RestoreAndUpdatePalette:
    jsr RestorePalette
UpdatePalette:
    ldx #1
    lda #4
    sta $0400
    lda #0
    sta $0401
    sta $e6
    lda #$80
    sta $e5
    jmp WaitXFrames_Min1

ResetScroll:
    ldx #0
    ldy #0
SetScroll:
    jsr PpuSync
    lda #0
    sta $e8
    sta $e9
    sta $ec
    lda #$fc
    and ram_PPUCTRL
    sta ram_PPUCTRL
    stx scroll_y
    sty scroll_x
    jmp WaitFrame
incbinRange "../../split/us/prg/bank1f/unk0.bin", $ee4, $10f1

; $F0F1 - 16x8 multiply
;  $60 = 16-bit multiplicand
;  $64 = 8-bit multiplier
Mult16x8:
    lda #$00
    ldx #$10
B31_10f5:
    ror $61
    ror $60
    bcc B31_10fe
    clc
    adc $64
B31_10fe:
    ror a
    dex
    bne B31_10f5
    sta $62
    ror $61
    ror $60
    rts

; $F109 - 32x8 multiply
;  $60 = 24-bit multiplicand
;  $64 = 8-bit multiplier
Mult24x8:
    lda #$00
    ldx #$18
B31_110d:
    ror $62
    ror $61
    ror $60
    bcc B31_1118
    clc
    adc $64
B31_1118:
    ror a
    dex
    bne B31_110d
    sta $63
    ror $62
    ror $61
    ror $60
    rts

; $F125 - 8x8 multiply
;  A = 8-bit multiplicand
;  X = 8-bit multiplier
Mult8x8:
    sta $60
    stx $64
    lda #$00
    ldx #$08
B31_112d:
    ror $60
    bcc B31_1134
    clc
    adc $64
B31_1134:
    ror a
    dex
    bne B31_112d
    tax
    lda $60
    ror a
    rts

incbinRange "../../split/us/prg/bank1f/unk0.bin", $113d, $1255

; $F255 - Change music track (without restarting and without waiting next frame)
ChangeMusic:
    cmp current_music
    beq @end
    sta new_music
    @end:
    rts

WaitXFrames:
    txa
    beq @end
    pha
    jsr WaitFrame
    pla
    tax
    dex
    bne WaitXFrames
    @end:
    rts

B31_126b:
    inx
B31_126c:
    txa
    pha
    jsr $f27c
    pla
    tax
    dex
    bne B31_126c
    jsr $f27c
    jmp $f4b6

B31_127c:
    ldx #$2f
B31_127e:
    txa
    pha
    and #$0f
    lsr a
    tax
    lda B31_1296, x
    jsr $f4b8
    jsr WaitFrame
    jsr WaitFrame
    pla
    tax
    dex
    bne B31_127e
    rts

B31_1296:
    .byte $21, $22, $23, $24, $25, $24, $23, $22

WaitABPressed:
    ldx #0
    stx pad1_forced
    @loop:
    jsr WaitFrame
    lda pad1_forced
    stx pad1_forced
    and #%11000000
    beq @loop
    rts

incbinRange "../../split/us/prg/bank1f/unk0.bin", $12ae, $1d28

; $FD28 - Play music track (without restarting, but wait next frame)
PlayMusic:
    cmp current_music                ; cd 8c 07
    beq @unchanged                   ; f0 03
    sta new_music                    ; 8d f5 07
    @unchanged:
    jmp WaitFrame                    ; 4c 41 fd

PpuSync:
    lda $e5
    ora $e0
    bne PpuSync
    rts

WaitXFrames_Min1:
    jsr WaitFrame
    dex
    bne WaitXFrames_Min1
    rts

WaitFrame:
    lda #1
    sta nmi_flag
    @loop:
    lda nmi_flag
    bne @loop
    rts

incbinRange "../../split/us/prg/bank1f/unk0.bin", $1d4a, $1de7

EnablePRGRam:
    lda #$80
    sta PRGRAMPROTECT
    rts

WriteProtectPRGRam:
    lda #$c0
    sta PRGRAMPROTECT
    rts

.incbin "../../split/us/prg/bank1f/unk0.bin", $1df3

.segment "VECTORS"
Reset_Vector:
unk_jsr1 := $FCEE
unk_jsr2 := $FD14
unk_jmp := $CB44
        lda #PPUC_SPR_TableF
        sta PPUCTRL

        sei
        cld

        lda #0
        sta PPUMASK
        sta SND_CHN
        sta DMC_FREQ
        sta IRQDISABLE

        lda #$40
        sta FRAME_COUNTER
        sta PRGRAMPROTECT

        ldx #2
        jump1:
        bit PPUSTATUS
        bpl jump1
        dex
        bne jump1

        bit PPUSTATUS
        ldy #$3F
        ldx #0
        sty PPUADDR
        stx PPUADDR

        ldx #$20
        lda #$F
        jump2:
        sta PPUDATA
        dex
        bne jump2

        sty PPUADDR
        stx PPUADDR
        stx PPUADDR
        stx PPUADDR

        lda #$1E
        sta PPUMASK

        bit PPUSTATUS
        lda #$10
        tax
        jump3:
        sta PPUADDR
        sta PPUADDR
        eor #0
        dex
        bne jump3

        ldx #$FF
        txs

        lda #0
        sta BANKSELECT

        jsr unk_jsr1
        jsr unk_jsr2

        ldx #BANK::PRGA000
        lda #$13

        jsr BANK_SWAP

        bit PPUSTATUS

        lda $FF
        ora #$80
        sta $FF

        sta PPUCTRL

        cli

        jmp unk_jmp

        lda 7
        ldx #BANK::PRG8000
        jsr BANK_SWAP

        lda #$1D
        ldx #7

BANK_SWAP:
        stx $EE
        sta $F0,X
        txa
        ora $EF
        sta BANKSELECT
        lda $F0,X
        sta BANKDATA
        rts

        .literal "EARTH BOUND 1.00"
        .byte $00,$00,$00,$00,$03,$00,$01,$0F,$01,$00

        ;vectors
        ; NMI
        .word $F79F
        ; Reset
        .word Reset_Vector
        ; IRQ/BRK
        .word $FE13
