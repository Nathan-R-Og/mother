; variables for music engine
; defined in ram.asm
; sfx_framecounter = unk_7e0

; end


;Oct  C  C#   D  D#   E   F  F#   G  G#   A  A#   B  Max Detune at B
;1:                                       0*         0.96 cents
;2:   2   3   4   5   6   7   8   9   a   b   c   d  1.91 cents
;3:   e   f  10  11  12  13  14  15  16  17  18  19  3.83 cents
;4:  1a  1b  1c  1d  1e  1f  20  21  22  23  24  25  7.69 cents
;5:  26  27  28  29  2a  2b  2c  2d  2e  2f  30  31  15.49 cents
;6:  32  33  34  35  36  37  38  39  3a  3b  3c  3d  31.41 cents
;7:  3e  3f  40  41  42

.define note_offset(octave, note) .byte (((octave-2) *$c) + note) * 2

.define Note_C(octave) note_offset octave, 2
.define Note_CS(octave) note_offset octave, 3
.define Note_D(octave) note_offset octave, 4
.define Note_DS(octave) note_offset octave, 5
.define Note_E(octave) note_offset octave, 6
.define Note_F(octave) note_offset octave, 7
.define Note_FS(octave) note_offset octave, 8
.define Note_G(octave) note_offset octave, 9
.define Note_GS(octave) note_offset octave, 10
.define Note_A(octave) note_offset octave, 11
.define Note_AS(octave) note_offset octave, 12
.define Note_B(octave) note_offset octave, 13

.define Note_Repeat(amount) .byte $C0 + amount
.define Note_End_Repeat .byte $FF

;'rest'
.define Note_Rest .byte $2 ; == 1

.define Note_Noise(dmc_cmd, noise_cmd) .byte (dmc_cmd << 6) | noise_cmd
.define Noise_Rest Note_Noise 0, 1

.define nl_sixteenth 0
.define nl_eighth 1
.define nl_quarter 2
.define nl_half 3
.define nl_whole 4
.define nl_d_quarter 5
.define nl_d_half 6
.define nl_d_eighth 7
.define nl_t_quarter 8 ;!
.define nl_t_eighth 9 ;!
.define nl_thirtysecond $a ;!
.define nl_sixtyfourth $b ;!

.define Note_Length(length) .byte $B0 | length
.define Track_End .byte 0

.define Set_Transpose(sign, transpose) .byte $9C, (sign << 7) | transpose

.define Set_NLT(tempo) .byte $9E, tempo

;for everything that isnt pulse V
;.define Set_Timbre(autorelease, autorelease_time, cc) .byte $9F, ((autorelease << 5) | autorelease_time), cc
.define Set_Timbre(pitchenv, volumeenv, cc) .byte $9F, ((pitchenv << 5) | volumeenv), cc
;for pulse ^

;square duty enum
.define SQTD_12_5 0
.define SQTD_25 1
.define SQTD_50 2
.define SQTD_75 3

;square vol_or_decay enum
.define SQTV_ISDECAY 0
.define SQTV_ISVOL 1

.define timbre_c_square(duty, no_length, vol_or_decay, v) (duty << 6) | (no_length << 5) | (vol_or_decay << 4) | v
.define timbre_c_triangle(autodisable, frames) (autodisable << 7) | frames

; control registers macro for 2a03 channels ($4000-$4013, 4 each)
; Pulse
;   DDLC VVVV - Duty, Length Freeze, Constant Volume, Volume
;   EPPP NSSS - Sweep Enabled, Period, Negate, Shift
;   TTTT TTTT - Timer Low
;   LLLL LTTT - Length Counter, Timer High
.macro SQ_CTRL duty, length_freeze, constant_volume, volume_decay, sweep_enabled, period, negate, shift, timer, length_counter_load
    timer_lo = (timer & $ff)
    timer_hi = ((timer >> 8) & $07)
    .byte (duty << 6) | (length_freeze << 5) | (constant_volume << 4) | volume_decay
    .byte (sweep_enabled << 7) | (period << 4) | (negate << 3) | shift
    .byte timer_lo
    .byte (length_counter_load << 3) | timer_hi
.endmacro

; Triangle
;   CRRR RRRR - Linear Counter Control, Linear Counter Load
;   ---- ---- - unused
;   TTTT TTTT - Timer Low
;   LLLL LTTT - Length Counter Load, Timer High
.macro TRI_CTRL linear_counter_control, linear_counter_load, timer, length_counter_load
    timer_lo = (timer & $ff)
    timer_hi = ((timer >> 8) & $07)
    .byte (linear_counter_control << 7) | linear_counter_load
    .byte 0
    .byte timer_lo
    .byte (length_counter_load << 3) | timer_hi
.endmacro

; Noise
;   --LC VVVV - LC Halt, Constant Volume, Volume
;   ---- ---- - unused
;   M--- PPPP - noise Mode, noise Period
;   LLLL L--- - Length counter load
.macro NOI_CTRL lc_halt, constant_vol, volume, mode, period, load
    .byte (lc_halt << 5) | (constant_vol << 4) | volume
    .byte 0
    .byte (mode << 7) | period
    .byte (load << 5)
.endmacro

; dmc ...

.segment        "MUSIC": absolute
;.segment        "PRG1C": absolute

; $8000
; Sound driver
B28_0000: ;tick
    jmp B28_0277

B28_0003:
    jmp B28_0299

B28_0006: ;init
    jmp B28_0216


SFXPointerTables:
    NoiseSFXTable_SetUp:
        .addr NoiseSFX_Hit_SetUp ; 01
        .addr NoiseSFX_Bomb_SetUp ; 02
        .addr NoiseSFX_Thunder_SetUp ; 03
        .addr NoiseSFX_Fire_SetUp ; 04
        .addr NoiseSFX_Crit_SetUp ; 05
        .addr NoiseSFX_EnemyKilled_SetUp ; 06
        .addr NoiseSFX_Unk07_SetUp ; 07
        .addr NoiseSFX_Stairs_SetUp ; 08
        .addr NoiseSFX_Rocket_SetUp ; 09
        .addr NoiseSFX_RocketLand_SetUp ; 0A
    NoiseSFXTable_Continue:
        .addr NoiseSFX_Hit_Continue ; 01
        .addr NoiseSFX_Bomb_Continue ; 02
        .addr NoiseSFX_Thunder_Continue ; 03
        .addr NoiseSFX_Fire_Continue ; 04
        .addr NoiseSFX_Crit_Continue ; 05
        .addr NoiseSFX_EnemyKilled_Continue ; 06
        .addr NoiseSFX_Unk07_RocketLand_Continue ; 07
        .addr NoiseSFX_Stairs_Continue ; 08
        .addr NoiseSFX_Rocket_Continue ; 09
        .addr NoiseSFX_Unk07_RocketLand_Continue ; 0A

    PulseGroup0SFXTable_SetUp:
        .addr PulseGroup0SFX_EnemyAttack_SetUp ; 01
        .addr PulseGroup0SFX_Beam_SetUp ; 02
        .addr PulseGroup0SFX_StatBoost_SetUp ; 03
        .addr PulseGroup0SFX_TakeDamage_SetUp ; 04
        .addr PulseGroup0SFX_MenuBloop_SetUp ; 05
        .addr PulseGroup0SFX_ItemDropGet_SetUp ; 06
        .addr PulseGroup0SFX_Recovery_SetUp ; 07
        .addr PulseGroup0SFX_Canary_SetUp ; 08
        .addr PulseGroup0SFX_LearnedPSI_SetUp ; 09
        .addr PulseGroup0SFX_PlayerAttack_SetUp ; 0A
        .addr PulseGroup0SFX_Purchase_SetUp ; 0B
        .addr PulseGroup0SFX_Dodge_SetUp ; 0C
        .addr PulseGroup0SFX_Unk0D_SetUp ; 0D
        .addr PulseGroup0SFX_Unk0E_SetUp ; 0E
        .addr PulseGroup0SFX_Miss_SetUp ; 0F
        .addr PulseGroup0SFX_MagicantWarp_SetUp ; 10
        .addr PulseGroup0SFX_Laura_SetUp ; 11
        .ifndef VER_JP
            .addr PulseGroup0SFX_XXStone_SetUp ; 12
        .endif
    PulseGroup0SFXTable_Continue:
        .addr PulseGroup0SFX_EnemyAttack_Continue ; 01
        .addr PulseGroup0SFX_Beam_Continue ; 02
        .addr PulseGroup0SFX_StatBoost_Continue ; 03
        .addr PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue ; 04
        .addr PulseGroup0SFX_MenuBloop_Continue ; 05
        .addr PulseGroup0SFX_ItemDropGet_Continue ; 06
        .addr PulseGroup0SFX_Recovery_Continue ; 07
        .addr PulseGroup0SFX_Canary_Laura_Continue ; 08
        .addr PulseGroup0SFX_LearnedPSI_Continue ; 09
        .addr PulseGroup0SFX_PlayerAttack_Continue ; 0A
        .addr PulseGroup0SFX_Purchase_Continue ; 0B
        .addr PulseGroup0SFX_Dodge_Continue ; 0C
        .addr PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue ; 0D
        .addr PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue ; 0E
        .addr PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue ; 0F
        .addr PulseGroup0SFX_MagicantWarp_Continue ; 10
        .addr PulseGroup0SFX_Canary_Laura_Continue ; 11
        .ifndef VER_JP
            .addr PulseGroup0SFX_XXStone_Continue ; 12
        .endif

    TriangleSFXTable_SetUp:
        .addr TriangleSFX_Freeze_SetUp ; 01
        .addr TriangleSFX_Unk02_SetUp ; 02
        .addr TriangleSFX_PlayerKilled_SetUp ; 03
        .addr TriangleSFX_Equip_SetUp ; 04
    TriangleSFXTable_Continue:
        .addr TriangleSFX_Freeze_Continue ; 01
        .addr TriangleSFX_Unk02_Continue ; 02
        .addr TriangleSFX_PlayerKilled_Continue ; 03
        .addr TriangleSFX_Equip_Continue ; 04

    PulseGroup1SFXTable_SetUp:
        .addr PulseG1SFX_DimensionSlip_SetUp ; 01
        .addr PulseG1SFX_Status_SetUp ; 02
        .addr PulseG1SFX_GiegueAttack_SetUp ; 03
    PulseGroup1SFXTable_Continue:
        .addr PulseG1SFX_DimensionSlip_Continue ; 01
        .addr PulseG1SFX_Status_GiegueAttack_Continue ; 02
        .addr PulseG1SFX_Status_GiegueAttack_Continue ; 03


SetSQ1Registers:
    lda #<SQ1
    beq B28_00a3

SetTRIRegisters:
    lda #<TRI
    bne B28_00a3

SetNOISERegisters:
    lda #<NOISE
    bne B28_00a3

SetSQ2Registers:
    lda #<SQ2
    ; fallthrough

;Inputs:
;  A: low byte to a pointer to sound registers for a given channel (in page $40xx)
;  Y: low byte to a pointer to values to set the sound registers to (in the SFXInstrumentInitData page)
;Effects:
;  Copy 4 bytes of sound channel data from *Y to *A
;  Z flag = 0
;Clobbers:
;  A, Y, $B0-$B3
B28_00a3:
    sta unk_b0
    lda #$40
    sta unk_b1
    sty unk_b2
    lda #>SFXInstrumentInitData
    sta unk_b3
    ldy #$00
    B28_00b1:
    lda (unk_b2), y
    sta (unk_b0), y
    iny
    tya
    cmp #$04
    bne B28_00b1
    rts

.ifdef VER_JP
;Inputs:
;  A:   a 1-based index into a pointer table, up to 0x11
;  $B0: the low byte of a sound effect pointer table in $80XX
;Outputs:
;  $B2: the pointer at index A in the table, or a dummy function if A is out of range
;  $BF: the original value of A
;Clobbers:
;  Y
SFXTablePtrRead:
    ; Save the value of A
    sta unk_bf
    pha
    ldy #>SFXPointerTables
    sty unk_b1
    ; Set y to (index - 1) * 2, that is, the offset to add to the table
    ldy #$00
@double_index_loop:
    dec unk_bf
    beq @load_ptr
    iny
    iny
    tya
    ; But check if the index was actually in range, too...
    cmp #$22
    bne @double_index_loop
    ; The table index was too big.
    ; Fill in a dummy code pointer instead that immediately returns.
    lda #<@oops
    sta unk_b2
    lda #>@oops
    sta unk_b3
@return:
    pla
    sta unk_bf
@oops:
    rts
@load_ptr:
    ; The index is set up, so read from the table
    lda (unk_b0),Y
    sta unk_b2
    iny
    lda (unk_b0),Y
    sta unk_b3
    jmp @return
.endif

;Effects:
;  Advances the RNG state at unk_bb used for sound purposes.
;  The RNG is a Fibonacci LFSR with taps on bits 1 and 8 (or going by the conventions on Wikipedia, bits 15 and 7).
;  The state is stored big-endian.
;Clobbers:
;  A, unk_7ff
TickRNG:
    lda unk_bb
    and #%00000010
    sta unk_7ff

    lda unk_bb+1
    and #%00000010
    eor unk_7ff

    clc
    beq @shift_in_carry
    sec
    @shift_in_carry:
    ror unk_bb
    ror unk_bb+1
    rts

B28_00d3:
    ldx unk_bd
    inc unk_7da, x
    lda unk_7da, x
    cmp unk_7d5, x
    bne B28_00e5
    lda #$00
    sta unk_7da, x
    B28_00e5:
    rts

.ifndef VER_JP
; $80E6 - Ocarina "melody missing" music pointers
Ocarina_Missing_List:
.addr B28_1353
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr 0

B28_00fa:
.byte $A4,$AC,$A3,$AC,$A4,$AC
.endif

SFXInstrumentInitData:

.byte $16,$7F,$0E,$80
noi_instrument_rockettakeoff:
.byte $3E,$7F,$0E,$08
noi_instrument_bomb: ; used for hit, crit, bomb
.byte $1F,$7F,$0F,$C0
noi_instrument_thunder:
.byte $3F,$7F,$00,$B0
noi_instrument_fire:
.byte $11,$7F,$0E,$30
noi_instrument_stairs:
.byte $9B,$7F,$0C,$28
noi_instrument_enemyko:
.byte $10,$7F,$87,$B0
noi_instrument_rocketland:
.byte $0A,$7F,$0F,$08
sq2_instrument_teleporting:
.byte $B0,$7F,$1C,$40   ; Bb7 - B7
sq1_instrument_teleporting:
.byte $B0,$7F,$32,$40   ; B6
B28_0128:
.byte $B1,$7F,$40,$40
B28_012c:
.byte $B1,$7F,$42,$40
B28_0130:
.byte $B1,$8E,$A0,$47
B28_0134:
.byte $B1,$7F,$FF,$47
.ifndef VER_JP
sq1_instrument_xxstone:
.byte $1F,$7F,$30,$08
.endif
sq1_instrument_magicant:
.byte $1F,$BB,$D4,$08
sq1_instrument_learnedpsi:
.byte $81,$A7,$E1,$88
sq1_instrument_canarychirp:
.byte $99,$7F,$15,$88
B28_0148:
.byte $9B,$7F,$1F,$88
sq1_instrument_menubloop:
.byte $D8,$7F,$20,$28
sq1_instrument_menubloop_echo:
.byte $D1,$7F,$20,$28
sq1_instrument_itemget:
.byte $D9,$7F,$54,$28
sq1_instrument_statboost:
.byte $9E,$9D,$C0,$08
sq1_instrument_recovery:
.byte $9C,$9A,$E8,$08
sq1_instrument_beam:
.byte $9E,$7F,$40,$08
sq1_instrument_playerattack:
.byte $94,$C6,$67,$28
sq1_instrument_playerattack_cont:
.byte $96,$CE,$47,$28
sq1_instrument_enemyattack:
.byte $D9,$A5,$7B,$F9
B28_0170:
.byte $D6,$A5,$90,$F9
B28_0174:
.byte $DA,$96,$46,$F9
sq1_instrument_buy:
.byte $96,$7F,$76,$20
sq1_instrument_buy_cont:
.byte $82,$7F,$27,$F8
sq1_instrument_dodge:
.byte $94,$A5,$89,$48
B28_0184:
.byte $96,$AD,$7A,$58
sq1_instrument_dodge_cont:
.byte $93,$A5,$99,$28
sq1_instrument_takedmg:
.byte $9F,$84,$80,$FA
sq1_instrument_unused0D:
.byte $94,$84,$24,$18
sq1_instrument_textprinting:
.byte $94,$7F,$94,$18
sq1_instrument_blindmiss:
.byte $95,$B4,$57,$F8
B28_019c:
.byte $02,$7F,$67,$09
B28_01a0:
.byte $7F,$7F,$E1,$0A
B28_01a4:
.byte $7F,$7F,$21,$09
B28_01a8:
.byte $04,$7F,$5D,$28
B28_01ac:
.byte $03,$7F,$38,$28

.assert >B28_01ac = >SFXInstrumentInitData, error, "SFX init data not all in same page"

HandleTriangleSFX:
    ldx #$03
    lda #<TriangleSFXTable_SetUp
    ldy #<TriangleSFXTable_Continue
    bne B28_01d3

HandlePulseGroup1SFX:
    ldx #$04
    lda #<PulseGroup1SFXTable_SetUp
    ldy #<PulseGroup1SFXTable_Continue
    bne B28_01d3 ;Jump pointer table shenanigans

HandlePulseGroup0SFX:
    ; "Group 1" sound effects take priority; ignore and drop group 0 sound effects when they would interfere.
    lda soundactive_pulseg1
    bne B28_0237 ;Return
    ldx #$01
    lda #<PulseGroup0SFXTable_SetUp
    ldy #<PulseGroup0SFXTable_Continue
    bne B28_01d3; Jump pointer table shenanigans

HandleNoiseSFX:
    ldx #$00
    lda #<NoiseSFXTable_SetUp
    ldy #<NoiseSFXTable_Continue
    ; fallthrough
B28_01d3:
    sta unk_b0          ; $B0 = in_A
    stx unk_bd          ; $BD = in_X
    ; If there's a new sound effect cued to play in this slot, then set it up.
    lda soundqueue, x
    beq @B28_020d
    @B28_01dc:
    .ifdef VER_JP
    jsr SFXTablePtrRead
    .else
    sta unk_bf
    sta unk_b2
    ; Set the high byte of the pointer to the page that all the SFX pointer tables are in
    ldy #>SFXPointerTables
    sty unk_b1
    ; Turn the index into an offset.
    ; But make it look really complicated and difficult.
    ; (...Why is this not just `DEC : ASL : TAY`? What's the difference, processor flags?)
    and #$07
    tay
    lda @B28_0205, y
    tay
    dec unk_b2
    lda unk_b2
    and #$f8
    sta unk_b2
    asl unk_b2
    tya
    ora unk_b2
    tay
    ; Load the pointer for this sound effect from its table and call its code.
    lda (unk_b0), y
    sta unk_b2
    iny
    lda (unk_b0), y
    sta unk_b3
    .endif
    jmp (unk_b2)

.ifndef VER_JP
@B28_0205:
    .byte $0e, $00, $02, $04, $06, $08, $0a, $0c
.endif

@B28_020d:
    ; If no sound effect is playing, return.
    lda soundactive, x
    beq B28_0237
    ; There's a sound effect currently playing. Continue it.
    sty unk_b0
    bne @B28_01dc

B28_0216:
    ;SND_CHN = $f
    lda #$f
    sta SND_CHN

    ;unk_bb = $55
    lda #$55
    sta unk_bb

    ;unk_786 = 0
    ;unk_78b = 0
    lda #0
    sta currptr_pulse1_blank
    sta unk_78b

    ;copy Ocarina_Missing_List to unk_76c
    tay
    @copy:
    lda Ocarina_Missing_List, y
    sta unk_76c, y
    iny
    tya
    cmp #10*2
    bne @copy

    jsr B28_0299
    B28_0237:
    rts

.ifdef VER_JP
; $80E6 - Ocarina "melody missing" music pointers
Ocarina_Missing_List:
.addr B28_1353
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr mus_ocarina_missing
.addr 0
.endif

; $8238 - Ocarina "melody present" music pointers
B28_0238:
    .addr mus_eightmelodies_first
    .addr mus_eightmelodies_second
    .addr mus_eightmelodies_third
    .addr mus_eightmelodies_fourth
    .addr mus_eightmelodies_fifth
    .addr mus_eightmelodies_sixth
    .addr mus_eightmelodies_seventh
    .addr mus_eightmelodies_eighth

B28_0248:
    lda learned_melodies
    sta unk_b0
    ldy #$00
    beq B28_025d
    B28_0251:
    lda #<mus_ocarina_missing
    sta unk_76e, y
    iny
    lda #>mus_ocarina_missing
    sta unk_76e, y
    iny
    B28_025d:
    tya
    cmp #$10
    beq B28_0276
    lsr unk_b0
    bcc B28_0251
    lda B28_0238, y
    sta unk_76e, y
    iny
    lda B28_0238, y
    sta unk_76e, y
    iny
    bne B28_025d
    B28_0276:
    rts

.ifdef VER_JP
; Overrides the song for learning melody 2 to instead begin with a tweet sound effect.
; (A generic Canary sound effect is added to the script in EB:B instead.)
InsertLauraPreMelodyTweeting:
    lda soundqueue_track
    cmp #$25
    bne @B27_0090
    jsr B28_0299
    sta soundqueue_track
    lda #PulseG0_Laura
    sta soundqueue_pulseg0
    @B27_0090:
    rts
.endif

; PLAY entry point
B28_0277:
    lda #$c0
    sta FRAME_COUNTER ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
    jsr TickRNG
    .ifdef VER_JP
    jsr InsertLauraPreMelodyTweeting
    .endif
    jsr HandleNoiseSFX
    jsr HandlePulseGroup1SFX
    jsr HandleTriangleSFX
    jsr HandlePulseGroup0SFX
    jsr HandleMusic
    lda #$00
    ldx #$06
    B28_0292:
    sta soundqueue-1, x ; Clear $07F0-$07F5
    dex
    bne B28_0292
    rts

;End song?
B28_0299:
    jsr B28_02a8
    ; fallthrough
B28_029c:
    jsr B28_02c6
    lda #$00
    sta DMC_RAW
    sta ME_Envelopes0+2
    rts

B28_02a8:
    lda #0
    sta unk_7c8
    sta unk_7c8+1
    sta unk_7c8+2

    sta current_music
    sta unk_78a
    ; Set all sounds and music to be inactive
    tay
    @loop:
    lda #$00
    sta soundactive, y
    iny
    tya
    cmp #$06
    bne @loop
    rts

B28_02c6:
    lda #$00
    sta DMC_RAW
    lda #$10
    sta SQ1_VOL
    sta SQ2_VOL
    sta NOISE_VOL
    lda #$00
    sta TRI_LINEAR
    rts

; need A, Y set before calling
SFX_SetupContinue:
    ldx unk_bd
    sta unk_7d5, x
    txa
    sta unk_7c7, x
    tya
    beq SetupCHANNEL
    txa
    beq SetupNOI
    cmp #$01
    beq SetupSQ1
    cmp #$02
    beq SetupSQ2
    cmp #$03
    beq SetupTRI
    rts
SetupSQ1:
    jsr SetSQ1Registers
    beq SetupCHANNEL ; unconditional branch
SetupSQ2:
    jsr SetSQ2Registers
    beq SetupCHANNEL ; unconditional branch
SetupTRI:
    jsr SetTRIRegisters
    beq SetupCHANNEL ; unconditional branch
SetupNOI:
    jsr SetNOISERegisters
    ; fallthrough
SetupCHANNEL:
    lda unk_bf
    sta soundactive, x
    lda #$00
    sta unk_7da, x
    ; fallthrough
StoreCHANNELVariables:
    sta unk_7df, x
    sta unk_7e3, x
    sta unk_7e7, x
    sta unk_78a
B28_0320:
    rts

NoiseSFX_RocketLand_SetUp:
    lda #$30
    ldy #<noi_instrument_rocketland
    jmp SFX_SetupContinue

NoiseSFX_Stairs_SetUp:
    lda #$0c
    ldy #<noi_instrument_stairs
    jmp SFX_SetupContinue

NoiseSFX_Stairs_Continue:
    jsr B28_00d3
    bne B28_0320
    ldy #<noi_instrument_stairs
    jsr SetNOISERegisters
    inc unk_7df
    lda unk_7df
    cmp #$04
    bne B28_0320
    jmp EndNoiseSFX

NoiseSFX_Unk07_SetUp:
    lda #$04
    ldy #<noi_instrument_stairs
    jsr SFX_SetupContinue
    lda #$02
    sta soundqueue_triangle

    lda unk_bb
    and #%11110111
    ; fallthrough
SFX_SetNoisePeriod:
    and #%00001111
    sta NOISE_LO
    rts

NoiseSFX_EnemyKilled_SetUp:
    lda #$06
    ldy #<noi_instrument_enemyko
    jsr SFX_SetupContinue
    lda noi_instrument_enemyko+2
    sta unk_7df
    lda noi_instrument_enemyko
    sta unk_7e3
    B28_036f:
    rts

B28_0370:
    lda #$86
    bne B28_038f

NoiseSFX_EnemyKilled_Continue:
    jsr B28_00d3
    bne B28_036f
    inc unk_7df
    inc unk_7e3
    lda unk_7e3
    cmp #$19
    bne B28_0389
    jmp EndNoiseSFX
    B28_0389:
    sta NOISE_VOL
    lda unk_7df
    B28_038f:
    sta NOISE_LO
    rts

NoiseSFX_Thunder_SetUp:
    lda #$05
    ldy #<noi_instrument_thunder
    jsr SFX_SetupContinue
    lda noi_instrument_thunder+2
    sta unk_7df
    B28_03a0:
    rts

NoiseSFX_Thunder_Continue:
    lda unk_7e7
    cmp #$02
    beq @B28_03b1
    jsr B28_00d3
    bne B28_03a0
    inc unk_7e7
    rts
@B28_03b1:
    jsr B28_00d3
    bne @B28_03cc
    dec unk_7df
    dec unk_7df
    dec unk_7df
    inc unk_7e3
    lda unk_7e3
    cmp #$0f
    bne B28_03a0
    jmp B28_0436
    @B28_03cc:
    inc unk_7df
    lda unk_7df
    B28_03d2:
    sta NOISE_LO
    B28_03d5:
    rts

SFX_SetNoisePeriodFromC1Table:
    jsr SFX_ReadNybbleFromC1Table
    jmp B28_03d2

NoiseSFX_Fire_SetUp:
    lda #$03
    ldy #<noi_instrument_fire
    jmp SFX_SetupContinue

NoiseSFX_Fire_Continue:
    jsr B28_00d3
    bne B28_03d5
    inc unk_7df
    lda unk_7df
    ora #$10
    sta NOISE_VOL
    cmp #$10
    bne B28_03d5
    jmp EndNoiseSFX

NoiseSFX_Hit_SetUp:
    lda #$10
    ldy #<noi_instrument_bomb
    jmp SFX_SetupContinue

; $8009 table, entry 0A
NoiseSFX_Hit_Continue:
    jsr B28_00d3
    beq EndNoiseSFX
    ldx #<B30_0181
    jsr SFX_SetNoisePeriodFromC1Table
    ldx #<B30_0189
    jmp SFX_SetNoiseVolumeFromC1TableAndTickIndex

NoiseSFX_Unk07_RocketLand_Continue:
    jsr B28_00d3
    bne B28_041f
    EndNoiseSFX:
    lda #$00
    sta soundactive_noise
    lda #$10
    sta NOISE_VOL
    B28_041f:
    rts

NoiseSFX_Crit_SetUp:
    lda #$20
    ldy #<noi_instrument_bomb
    jmp SFX_SetupContinue

NoiseSFX_Crit_Continue:
    jsr B28_00d3
    beq EndNoiseSFX
    ldx #<B30_0191
    jsr SFX_SetNoisePeriodFromC1Table
    ldx #<B30_01A1
    jmp SFX_SetNoiseVolumeFromC1TableAndTickIndex

B28_0436:
    lda #$02
    sta unk_bf

NoiseSFX_Bomb_SetUp:
    .ifdef VER_JP
    lda #$30
    .else
    lda #$40
    .endif
    ldy #<noi_instrument_bomb
    jmp SFX_SetupContinue

NoiseSFX_Bomb_Continue:
    jsr B28_00d3
    bne B28_0449
    jmp EndNoiseSFX
    B28_0449:
    ldx #<B30_01B1
    jsr SFX_SetNoisePeriodFromC1Table
    ldx #<B30_01D1
    ; fallthrough
SFX_SetNoiseVolumeFromC1TableAndTickIndex:
    jsr SFX_ReadNybbleFromC1Table
    ; $10 = constant volume (no envelope), because we're handling the envelope in software
    ora #$10
    sta NOISE_VOL
    inc unk_7df
    rts

;Inputs:
;  X: pointer in page C1 (ptr = $C100 + X) to a table of nybble values
;  unk_7df: index of the nybble to read
;Outputs:
;  A:     The value of the nybble at that index
;Clobbers:
;  X, Y, unk_b0, unk_b1, unk_b4
SFX_ReadNybbleFromC1Table:
    stx unk_b0
    ldy #>C1NybbleTables
    sty unk_b1
    ; There are two nybbles in a byte, so divide by 2 to get the correct byte address
    ldx unk_7df
    txa
    lsr a
    tay
    lda (unk_b0), y
    sta unk_b4
    ; If the index is even, use the most significant nybble
    txa
    and #%00000001
    beq @use_high_nybble
    ; Otherwise, the index is odd, so use the least significant nybble
    lda unk_b4
    and #%00001111
    rts
@use_high_nybble:
    lda unk_b4
    lsr a
    lsr a
    lsr a
    lsr a
    B28_047c:
    rts

NoiseSFX_Rocket_SetUp:
    lda #$08
    ldy #<noi_instrument_rockettakeoff
    jmp SFX_SetupContinue

NoiseSFX_Rocket_Continue:
    jsr B28_00d3
    bne B28_047c
    lda unk_7df
    inc unk_7df
    .ifdef VER_JP
    cmp #$10
    beq B28_04b9
    jmp SFX_SetNoisePeriod
    .else
    cmp #$28
    beq B28_04b9
    cmp #$10
    beq B28_04ae
    cmp #$18
    beq B28_04aa
    cmp #$20
    beq B28_04a6
    cmp #$10
    bcs B28_047c
    jmp SFX_SetNoisePeriod
B28_04a6:
    lda #$31
    bne B28_04b0
B28_04aa:
    lda #$32
    bne B28_04b0
B28_04ae:
    lda #$33
B28_04b0:
    sta NOISE_VOL
    lda #$0f
    sta NOISE_LO
    rts
    .endif
B28_04b9:
    jmp EndNoiseSFX

DoDoublePulseSFX:
    sta unk_7d9
    jsr SetSQ2Registers
    lda unk_bf
    sta soundactive_pulseg1

    ldx #1
    stx unk_7c8
    inx
    stx unk_7c8+1

    lda #$00
    sta unk_7de
    sta soundactive_pulseg0
    ldx #$01
    jmp StoreCHANNELVariables

B28_04dd:
    jsr EndPulseGroup0SFX
    jsr B28_0840
    inc unk_78a
    lda #$00
    sta soundactive_pulseg1
    ldx #$01
    lda #$7f
B28_04ef:
    sta SQ1, x
    sta SQ2, x
    rts

PulseG1SFX_DimensionSlip_SetUp:
    ldy #<sq1_instrument_teleporting
    jsr SetSQ1Registers
    lda #$0a
    ldy #<sq2_instrument_teleporting
    jsr DoDoublePulseSFX
    lda sq2_instrument_teleporting
    sta sfx_framecounter
    B28_0508:
    rts

PulseG1SFX_DimensionSlip_Continue:
    jsr B28_00d3
    bne B28_0533
    lda unk_7e4
    beq B28_0518
    dec sfx_framecounter
    bne B28_051b
    B28_0518:
    inc sfx_framecounter
    B28_051b:
    lda sfx_framecounter
    cmp #$b0
    bne B28_0525
    jmp B28_04dd
    B28_0525:
    sta SQ1_VOL
    sta SQ2_VOL
    cmp #$bf
    bne B28_0508
    inc unk_7e4
    rts

B28_0533:
    ldy #$1a
    lda unk_7de
    and #$01
    bne B28_053e
    ldy #$1b
    B28_053e:
    sty SQ1_LO
    rts

PulseG1SFX_GiegueAttack_SetUp:
    ldy #<B28_0130
    jsr SetSQ1Registers
    lda #$08
    ldy #<B28_0134
    bne B28_0556

PulseG1SFX_Status_SetUp:
    ldy #<B28_012c
    jsr SetSQ1Registers
    lda #$03
    ldy #<B28_0128
    B28_0556:
    jmp DoDoublePulseSFX

PulseG1SFX_Status_GiegueAttack_Continue:
    jsr B28_057e
    jsr B28_00d3
    bne B28_057e
    ldx #$00
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$12
    beq B28_0576
    cmp #$0e
    bcc B28_0579
    lda #$be
    jmp B28_04ef
    B28_0576:
    jmp B28_04dd
    B28_0579:
    ora #$b0
    jmp B28_04ef

B28_057e:
    inc unk_7e4
    lda unk_7e4
    and #$07
    tay
    lda GiegueAttack_PeriodDifferences, y
    clc
    adc B28_0128+2
    sta SQ1_LO
    lda GiegueAttack_PeriodDifferences, y
    clc
    adc B28_012c+2
    sta SQ2_LO
    B28_059b:
    rts


.ifndef VER_JP
GiegueAttack_PeriodDifferences:
incbinRange "../../split/us/music.bin", $59c, $5a4
.endif

PulseGroup0SFX_Miss_SetUp:
    lda #$0A
    ldy #<sq1_instrument_blindmiss
    jmp SFX_SetupContinue

.ifndef VER_JP
Purchase_Volumes:
.byte $14,$93,$94,$d3
.endif

PulseGroup0SFX_Purchase_Continue:
    lda unk_7e4
    beq B28_05c1
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$16
    bne B28_059b
    jmp EndPulseGroup0SFX

B28_05c1:
    lda sfx_framecounter
    and #$03
    tay
    lda Purchase_Volumes, y
    sta SQ1_VOL
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$08
    bne B28_059b
    inc unk_7e4
    ldy #<sq1_instrument_buy_cont
    jmp SetSQ1Registers


PulseGroup0SFX_Unk0D_SetUp:
    lda #$02
    ldy #<sq1_instrument_unused0D
    jmp SFX_SetupContinue

PulseGroup0SFX_Purchase_SetUp:
    ldy #<sq1_instrument_buy
    jmp SFX_SetupContinue

PulseGroup0SFX_PlayerAttack_SetUp:
    lda #$04
    ldy #<sq1_instrument_playerattack
    jmp SFX_SetupContinue

PulseGroup0SFX_PlayerAttack_Continue:
    jsr B28_00d3
    bne B28_066d
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$01
    beq @B28_0608
    cmp #$04
    bne B28_066d
    jmp EndPulseGroup0SFX
@B28_0608:
    ldy #<sq1_instrument_playerattack_cont
    jmp SetSQ1Registers

PulseGroup0SFX_Laura_SetUp:
    inc unk_78b
    ; fallthrough
PulseGroup0SFX_Canary_SetUp:
    lda #$0f
    ldy #<sq1_instrument_canarychirp
    jsr SFX_SetupContinue
    lda sq1_instrument_canarychirp+2
    B28_061a:
    sta unk_7e8
    rts

PulseGroup0SFX_Canary_Laura_Continue:
    jsr B28_00d3
    bne B28_0661
    inc unk_7e4
    lda unk_7e4
    cmp #$08
    beq B28_065a
    cmp #$24
    beq B28_0648
    B28_0631:
    and #$01
    beq B28_063c
    lda B28_0148+2
    ldy #<B28_0148
    bne B28_0641
    B28_063c:
    lda sq1_instrument_canarychirp+2
    ldy #<sq1_instrument_canarychirp
    B28_0641:
    pha
    jsr SetSQ1Registers
    pla
    bne B28_061a
    B28_0648:
    lda unk_78b
    beq B28_0657
    lda #$00
    sta unk_78b
    lda #$25
    sta soundqueue_track
    B28_0657:
    jmp EndPulseGroup0SFX
B28_065a:
    lda #$02
    sta unk_7d6
    bne B28_0631
    B28_0661:
    dec unk_7e8
    dec unk_7e8
    lda unk_7e8
    sta SQ1_LO
    B28_066d:
    rts


PulseGroup0SFX_Unk0E_SetUp:
    lda soundactive_pulseg0
    cmp #PulseG0_Recovery
    beq B28_066d
    lda #$02
    ldy #<sq1_instrument_textprinting
    jmp SFX_SetupContinue

PulseGroup0SFX_TakeDamage_SetUp:
    lda #$10
    ldy #<sq1_instrument_takedmg
    jmp SFX_SetupContinue

PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue:
    jsr B28_00d3
    bne B28_0698
    ; fallthrough
EndPulseGroup0SFX:
    lda #$10
    sta SQ1_VOL

    lda #0
    sta unk_7c8
    sta soundactive_pulseg0
    inc unk_78a
    B28_0698:
    rts

PulseGroup0SFX_Dodge_SetUp:
    lda #$06
    ldy #<sq1_instrument_dodge
    jmp SFX_SetupContinue

PulseGroup0SFX_Dodge_Continue:
    jsr B28_00d3
    bne B28_0698
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$01
    beq B28_06ba
    cmp #$02
    beq B28_06bf
    cmp #$03
    bne B28_0698
    jmp EndPulseGroup0SFX
    B28_06ba:
    ldy #<B28_0184
    jmp SetSQ1Registers
    B28_06bf:
    ldy #<sq1_instrument_dodge_cont
    jmp SetSQ1Registers


.ifdef VER_JP
B28_00fa:
incbinRange "../../split/jp/music.bin", $69e, $6A4
.endif

PulseGroup0SFX_EnemyAttack_SetUp:
    lda #$08
    ldy #<sq1_instrument_enemyattack
    jmp SFX_SetupContinue

PulseGroup0SFX_EnemyAttack_Continue:
    jsr B28_00d3
    beq B28_06ed
    lda unk_7e8
    cmp #$02
    bne B28_06e9
    lda #$00
    sta unk_7e8
    ldy unk_7e4
    inc unk_7e4
    lda B28_00fa, y
    sta SQ1_SWEEP
    rts
B28_06e9:
    inc unk_7e8
    rts
B28_06ed:
    lda #$00
    sta unk_7e4
    lda sfx_framecounter
    beq B28_0702
    cmp #$01
    beq B28_0706
    cmp #$02
    bne B28_070e
    jmp EndPulseGroup0SFX
    B28_0702:
    ldy #<B28_0170
    bne B28_0708
    B28_0706:
    ldy #<B28_0174
    B28_0708:
    jsr SetSQ1Registers
    inc sfx_framecounter
    B28_070e:
    rts

PulseGroup0SFX_MenuBloop_Continue:
    jsr B28_00d3
    bne B28_070e
    inc sfx_framecounter
    lda sfx_framecounter
    cmp #$02
    bne B28_0721
    jmp EndPulseGroup0SFX
    B28_0721:
    ldy #<sq1_instrument_menubloop_echo
    jmp SetSQ1Registers

PulseGroup0SFX_MenuBloop_SetUp:
    .ifndef VER_JP
    lda soundactive_pulseg0
    cmp #PulseG0_Recovery
    beq B28_070e
    .endif
    lda #$03
    ldy #<sq1_instrument_menubloop
    bne SFX_SetupContinue_Local

PulseGroup0SFX_MagicantWarp_SetUp:
    lda #$10
    ldy #<sq1_instrument_magicant
    jsr SFX_SetupContinue_Local
    lda #$18
    bne B28_077b

PulseGroup0SFX_MagicantWarp_Continue:
    jsr B28_00d3
    bne B28_077e
    ldy #<sq1_instrument_magicant
    bne SQ1SFX_PKBeamValues

PulseGroup0SFX_StatBoost_SetUp:
    lda #$06
    ldy #<sq1_instrument_statboost
    jsr SFX_SetupContinue_Local
    lda #$10
    bne B28_077b

PulseGroup0SFX_StatBoost_Continue:
    jsr B28_00d3
    bne B28_077e
    ldy #<sq1_instrument_statboost
    bne SQ1SFX_PKBeamValues

; local jmp to sfx setup continue
SFX_SetupContinue_Local:
    jmp SFX_SetupContinue

PulseGroup0SFX_Recovery_SetUp:
    lda #$05
    ldy #<sq1_instrument_recovery
    jsr SFX_SetupContinue_Local
    lda #$08
    bne B28_077b

PulseGroup0SFX_Recovery_Continue:
    jsr B28_00d3
    bne B28_077e
    ldy #<sq1_instrument_recovery
    bne SQ1SFX_PKBeamValues

PulseGroup0SFX_Beam_SetUp:
    lda #$06
    ldy #<sq1_instrument_beam
    jsr SFX_SetupContinue_Local
    lda #$00
    B28_077b:
    sta unk_7e4
    B28_077e:
    rts

PulseGroup0SFX_Beam_Continue:
    jsr B28_00d3
    bne B28_077e
    ldy #<sq1_instrument_beam
SQ1SFX_PKBeamValues:
    jsr SetSQ1Registers
    clc
    lda unk_7e4
    adc sfx_framecounter
    tay
    lda PKBeam_Periods, y
    sta SQ1_LO
    ldy sfx_framecounter
    lda PKBeam_Volumes, y
    sta SQ1_VOL
    bne B28_07a5
    jmp EndPulseGroup0SFX
B28_07a5:
    inc sfx_framecounter
    B28_07a8:
    rts

PulseGroup0SFX_ItemDropGet_SetUp:
    lda #$04
    ldy #<sq1_instrument_itemget
    jsr SFX_SetupContinue
    lda sq1_instrument_itemget+2
    sta sfx_framecounter
    rts

PulseGroup0SFX_ItemDropGet_Continue:
    jsr B28_00d3
    bne B28_07a8
    inc unk_7e4
    lda unk_7e4
    cmp #$05
    bne @B28_07c9
    jmp EndPulseGroup0SFX
    @B28_07c9:
    lda sfx_framecounter
    lsr a
    lsr a
    lsr a
    sta unk_7e8
    lda sfx_framecounter
    clc
    sbc unk_7e8
    sta sfx_framecounter
    sta SQ1_LO
    lda #$28
    B28_07e1:
    sta SQ1_HI
    B28_07e4:
    rts
; "magic" oscilating pulse channel effect used for Beam, Hook, Recovery sfx, etc.
PKBeam_Volumes:
.byte $9E,$9B,$99,$96,$94,$93,$92,$91,$00
PKBeam_Periods: ; frequencies
.byte $20,$40,$20,$40,$20,$40,$20,$40,$90,$60,$90,$90,$60,$80,$90,$60
.byte $B0,$79,$A8,$58,$90,$40,$80,$30,$76,$9F,$58,$76,$42,$58,$31,$42

PulseGroup0SFX_LearnedPSI_Continue:
    jsr B28_00d3
    bne B28_07e4
    ldy sfx_framecounter
    inc sfx_framecounter
    lda LearnedPSI_Periods, y
    beq B28_0826
    sta SQ1_LO
    lda #$88
    jmp B28_07e1
    B28_0826:
    jmp EndPulseGroup0SFX

PulseGroup0SFX_LearnedPSI_SetUp:
    lda #$04
    ldy #<sq1_instrument_learnedpsi
    jmp SFX_SetupContinue

LearnedPSI_Periods:
.byte     $A8,$96,$70,$53,$4A,$37,$29
.byte $E1,$A8,$96,$70,$53,$4A,$37,$29,$00


B28_0840:
    lda #$10
    sta SQ2_VOL
    lda #$00
    sta unk_7c8+1
    sta soundactive_unknown
    rts

TriangleSFX_Unk02_SetUp:
    lda #$04
    ldy #<B28_01a0
    jsr SFX_SetupContinue

    lda unk_bb
    sta TRI_LO

    lda #$0a
    bne B28_08b0

TriangleSFX_Freeze_SetUp:
    lda #$04
    ldy #<B28_019c
    jsr SFX_SetupContinue
    lda #$08
    sta unk_7e6
    rts

.ifndef VER_JP
Freeze_Periods:
incbinRange "../../split/us/music.bin", $86b, $87e
.endif

TriangleSFX_Freeze_Continue:
    jsr B28_00d3
    bne B28_08b3
    @loop:
    ldy unk_7e2
    lda Freeze_Periods,Y
    beq @inc_period_high_byte
    cmp #$FF
    beq EndTriangleSFX
    inc unk_7e2
    sta TRI_LO
    lda unk_7e6
    jmp B28_08b0
    @inc_period_high_byte:
    inc unk_7e6
    inc unk_7e2
    bne @loop
EndTriangleSFX:
    lda #$00
    sta TRI_LINEAR
    sta unk_7c8+2
    sta soundactive_triangle
    lda #$18
    B28_08b0:
    sta TRI_HI
    B28_08b3:
    rts

TriangleSFX_Unk02_Continue:
    jsr B28_00d3
    beq EndTriangleSFX
    B28_08b9:
    rts

TriangleSFX_PlayerKilled_Continue:
    jsr B28_00d3
    bne B28_08b9
    ldy unk_7e2
    inc unk_7e2
    lda PlayerKilled_Periods, y
    beq EndTriangleSFX
    sta TRI_LO
    lda B28_01a4+3
    sta TRI_HI
    rts

TriangleSFX_PlayerKilled_SetUp:
    lda #$03
    ldy #<B28_01a4
    jmp SFX_SetupContinue

PlayerKilled_Periods:
    .byte $3f,$48,$52,$6d,$78,$84,$91,$ae,$bd,$00

TriangleSFX_Equip_SetUp:
    lda #$08
    ldy #<B28_01a8
    jmp SFX_SetupContinue

TriangleSFX_Equip_Continue:
    jsr B28_00d3
    bne B28_08b3
    inc unk_7e2
    lda unk_7e2
    cmp #$02
    bne @B28_08fe
    jmp EndTriangleSFX
    @B28_08fe:
    ldy #<B28_01ac
    jmp SetTRIRegisters

B28_0903:
    jsr B28_0248
    lda #$01
    sta current_music
    jmp B28_0946

B28_090e:
    jmp B28_0299

HandleMusic:
    lda soundqueue_track
    tay
    .ifdef VER_JP
    cmp #$ff
    beq B28_090e
    .else
    cmp #$3f
    bcs B28_090e
    .endif
    cmp #$01
    beq B28_0903
    tya
    beq B28_095c
    sta current_music
    cmp #$19
    beq B28_092b
    cmp #$19
    bcc B28_0936
    B28_092b:
    sta unk_bf
    sec
    sbc #$19
    sta music_id
    jmp B28_094e
    B28_0936:
    cmp #$06
    bne B28_0946
    lda pc_count
    cmp #$01
    beq B28_0945
    lda #$07
    bne B28_0946
    B28_0945:
    tya
    B28_0946:
    sta unk_bf
    sta music_id
    dec music_id
    B28_094e:
    lda #$7f
    sta UNK_7C0
    sta UNK_7C0+1
    jsr B28_0aec
    B28_0959:
    jmp B28_0c7b
    B28_095c:
    lda soundactive_track
    bne B28_0959
    rts

.ifndef VER_JP
PulseGroup0SFX_XXStone_SetUp:
    lda #$03
    ldy #<sq1_instrument_xxstone
    jsr SFX_SetupContinue
    jmp PulseGroup0SFX_XXStone_Common

PulseGroup0SFX_XXStone_Continue:
    jsr B28_00d3
    bne B28_0995
    ; fallthrough
PulseGroup0SFX_XXStone_Common:
    lda sfx_framecounter
    and #$07
    tay
    lda sfx_framecounter
    lsr a
    lsr a
    lsr a
    tax
    inc sfx_framecounter
    lda XXStone_Volumes, x
    beq B28_0996
    sta SQ1_VOL
    lda XXStone_PeriodLowBytes, y
    sta SQ1_LO
    lda sq1_instrument_xxstone+3
    sta SQ1_HI
    B28_0995:
    rts

B28_0996:
    jmp EndPulseGroup0SFX

XXStone_PeriodLowBytes:
incbinRange "../../split/us/music.bin", $999, $9a1
XXStone_Volumes:
incbinRange "../../split/us/music.bin", $9a1, $9a7

.endif


; $400C	--lc.vvvv	Length counter halt, constant volume/envelope flag, and volume/envelope divider period (write)

; $400E	M---.PPPP	Mode and period (write)
; bit 7	M--- ----	Mode flag
; bits 3-0	---- PPPP	The timer period is set to entry P of the following:
; Rate  $0 $1  $2  $3  $4  $5   $6   $7   $8   $9   $A   $B   $C    $D    $E    $F
;       --------------------------------------------------------------------------
; NTSC   4, 8, 16, 32, 64, 96, 128, 160, 202, 254, 380, 508, 762, 1016, 2034, 4068 (2046 in old)
; PAL    4, 8, 14, 30, 60, 88, 118, 148, 188, 236, 354, 472, 708,  944, 1890, 3778
; The period determines how many CPU cycles happen between shift register clocks.
; These periods are all even numbers because there are 2 CPU cycles in an APU cycle.

; $400F	llll.l---	Length counter load and envelope restart (write)

.macro noise_preset lch, cvflag, dividerPeriod, mode, period, lengthCounter
    .byte (lch << 5) | (cvflag) << 4 | dividerPeriod
    .byte (mode << 7) | period
    .byte lengthCounter << 3
.endmacro

Noise_Instruments:
.byte $00,$10,$01
.byte $18,$00,$01
.byte $38,$00,$03
.byte $40,$00,$06
.byte $58,$01,$03
.byte $40,$02,$04
.byte $40,$13,$05
.byte $40,$14,$0A
.byte $40,$14,$08
.byte $40,$12,$0E
.byte $08,$16,$0E
.byte $28,$16,$0B
.byte $18

B28_09cc:
    lda soundactive_track
    cmp #$01
    beq B28_09f5
    txa
    cmp #$03
    beq B28_09f5
    lda ME_Envelopes0, x
    and #$e0
    beq B28_09f5
    sta unk_b0
    lda unk_7c3, x
    cmp #$02
    beq B28_09f2
    ldy unk_be
    lda currptr_pulse0, y
    sta unk_b1
    jsr B28_0a33
    B28_09f2:
    inc unk_7d1, x
    B28_09f5:
    rts

B28_09f6:
    lda unk_b2
    cmp #$31
    bne B28_09fe
    lda #$27
    B28_09fe:
    tay
    lda Pitch_Envelope_4_6, y
    pha
    lda unk_7c3, x
    cmp #$46
    bne B28_0a0f
    pla
    lda #$00
    beq B28_0a6d
    B28_0a0f:
    pla
    jmp B28_0a6d
    B28_0a13:
    lda unk_b2
    tay
    cmp #$10
    bcs B28_0a20
    lda Pitch_Envelope_2, y
    jmp B28_0a73
    B28_0a20:
    lda #$f6
    bne B28_0a73
    B28_0a24:
    lda unk_7c3, x
    cmp #$4c
    bcc B28_0a2f
    lda #$fe
    bne B28_0a73
    B28_0a2f:
    lda #$fe
    bne B28_0a73

B28_0a33:
    lda unk_7d1, x
    sta unk_b2
    lda unk_b0

    ;pitch envelope 1
    cmp #(1 << 5)
    beq B28_0a52
    ;pitch envelope 5
    cmp #(5 << 5)
    beq B28_0a61
    ;pitch envelope 3
    cmp #(3 << 5)
    beq B28_0a24
    ;pitch envelope 2
    cmp #(2 << 5)
    beq B28_0a13
    ;pitch envelope 4
    cmp #(4 << 5)
    beq B28_09f6
    ;pitch envelope 6
    cmp #(6 << 5)
    beq B28_09f6
    B28_0a52:
    lda unk_b2
    cmp #$0a
    bne B28_0a5a
    lda #$00
    B28_0a5a:
    tay
    lda Pitch_Envelope_1_7, y
    jmp B28_0a6d
    B28_0a61:
    lda unk_b2
    cmp #$2b
    bne B28_0a69
    lda #$21
    B28_0a69:
    tay
    lda Pitch_Envelope_5, y
    B28_0a6d:
    pha
    tya
    sta unk_7d1, x
    pla
    B28_0a73:
    pha
    lda unk_7c8, x
    bne B28_0a83
    pla
    clc
    adc unk_b1

    ldy unk_be
    sta SQ1_LO, y
    rts

B28_0a83:
    pla
    rts

Pitch_Envelope_4_6:
.byte 9,8,7,6,5,4,3,2,2,1,1,0
Pitch_Envelope_5:
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
.byte 0,0,0,0,-1,0,0,0,0,1,1,0,0,0,-1,-1
.byte 0
Pitch_Envelope_1_7:
.byte 0,1,1,2,1,0,-1,-1,-2,-1
Pitch_Envelope_2:
.byte 0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-10,-9,-10,-11 ; -10 hardcoded


B28_0acc:
    lda music_id
    tay
    lda Music_Table_2_Ids, y
    tay

    ldx #0
    @copy:
    lda Music_Table_2, y
    sta MusicHeader, x
    iny
    inx
    txa
    cmp #10
    bne @copy

    rts

B28_0ae4:
    lda #$ff
    sta ME_CurrentPulse1Phrase, x
    .ifdef VER_JP
    bne B28_0b65
    .else
    jmp B28_0b65
    .endif

B28_0aec:
    jsr B28_029c
    lda unk_bf
    sta soundactive_track
    .ifndef VER_JP
    cmp #$32
    beq B28_0b06
    .endif
    cmp #$19
    beq B28_0b00
    cmp #$19
    bcc B28_0b1a
    B28_0b00:
    jsr B28_0acc
    jmp B28_0b31
    .ifndef VER_JP
    B28_0b06:
    ldx #$00
    ldy #$00
    B28_0b0a:
    lda Path_To_Giegue_BGM_header, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #$0a
    bne B28_0b0a
    jmp B28_0b31
    .endif
    B28_0b1a:
    lda music_id
    tay
    lda Music_Table_Ids, y
    tay
    ldx #$00
    B28_0b24:
    lda Music_Table, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #$0a
    bne B28_0b24
    B28_0b31:
    lda #1
    sta MusicChannel_NoteLengthCounter
    sta MusicChannel_NoteLengthCounter+1
    sta MusicChannel_NoteLengthCounter+2
    sta MusicChannel_NoteLengthCounter+3
    lda #$00
    sta unk_ba
    ldy #$08
    B28_0b45:
    sta ME_CurrentNoisePhrase+1, y
    dey
    bne B28_0b45
    tax
    B28_0b4c:
    ;store datapointer lo
    lda ME_DataPointer, x
    sta unk_b6

    ;check datapointer hi if ff, else store
    lda ME_DataPointer+1, x
    cmp #$ff
    beq B28_0ae4
    ;store
    sta unk_b6+1

    ldy ME_CurrentPhraseIndex

    ;get phrase pointers from pointer
    lda (unk_b6), y
    sta ME_CurrentPhrases, x
    iny
    lda (unk_b6), y
    B28_0b65:
    sta ME_CurrentPhrases+1, x

    inx
    inx
    txa
    cmp #$08
    bne B28_0b4c
    rts

B28_0b70:
    lda unk_78a
    beq B28_0ba0
    cmp #$01
    beq B28_0b8a
    lda #$7f
    sta SQ2_SWEEP

    lda currptr_pulse1
    sta SQ2_LO
    lda currptr_pulse1+1
    sta SQ2_HI

    B28_0b8a:
    lda #$7f
    sta SQ1_SWEEP

    lda currptr_pulse0
    sta SQ1_LO
    lda currptr_pulse0+1
    sta SQ1_HI

    lda #$00
    sta unk_78a
    B28_0ba0:
    rts

B28_0ba1:
    txa
    cmp #$02
    bcs B28_0ba0
    lda ME_Envelopes0, x
    and #$1f
    beq B28_0c06
    sta unk_b1
    lda unk_7c3, x
    cmp #$02
    beq B28_0c10
    ldy #$00
    B28_0bb8:
    dec unk_b1
    beq B28_0bc0
    iny
    iny
    bne B28_0bb8
    B28_0bc0:
    lda Volume_Envelope_Table, y
    sta unk_b2
    lda Volume_Envelope_Table+1, y
    sta unk_b3
    lda unk_7cd, x
    lsr a
    tay
    lda (unk_b2), y
    sta unk_b4
    cmp #$ff
    beq B28_0c07
    cmp #$f0
    beq B28_0c0c
    lda unk_7cd, x
    and #$01
    bne B28_0bea
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    B28_0bea:
    lda unk_b4
    and #$0f
    sta unk_b0
    lda ME_Envelopes1, x
    and #$f0
    ora unk_b0
    tay
    B28_0bf8:
    inc unk_7cd, x
    B28_0bfb:
    lda unk_7c8, x
    bne B28_0c06
    tya

    ldy unk_be
    sta SQ1_VOL, y
    B28_0c06:
    rts

B28_0c07:
    ldy ME_Envelopes1, x
    bne B28_0bfb
    B28_0c0c:
    ldy #$10
    bne B28_0bfb
    B28_0c10:
    ldy #$10
    bne B28_0bf8

;ran when a loop point is found in a list of phrases
DoLoop:
    ;get 'loop point' address
    ;must be directly after -1

    ;lo
    iny
    lda (unk_b6), y
    sta ME_DataPointer, x

    ;hi
    iny
    lda (unk_b6), y
    sta ME_DataPointer+1, x

    ;set start address to that retrieved pointer
    lda ME_DataPointer, x
    sta unk_b6
    lda ME_DataPointer+1, x
    sta unk_b6+1

    ;x /= 2
    txa
    lsr a
    tax

    ;a, y = 0
    lda #0
    tay

    ;phraseIndex[x] = 0
    sta ME_CurrentPhraseIndex, x

    jmp B28_0c53

B28_0c36:
    jsr B28_0299
    B28_0c39:
    rts

;Next Phrase?
B28_0c3a:

    ;x *= 2
    txa
    asl a
    tax

    lda ME_DataPointer, x
    sta unk_b6
    lda ME_DataPointer+1, x
    sta unk_b6+1

    txa
    lsr a
    tax

    ; ME_CurrentPhraseIndex += 2
    inc ME_CurrentPhraseIndex, x
    inc ME_CurrentPhraseIndex, x

    ldy ME_CurrentPhraseIndex, x
    B28_0c53:
    txa
    asl a
    tax

    ;load next phrase
    ;lo
    lda (unk_b6), y
    sta ME_CurrentPhrases, x
    ;hi
    iny
    lda (unk_b6), y
    sta ME_CurrentPhrases+1, x

    ;if a == 0, end(?)
    cmp #0
    beq B28_0c36
    ;elif a == -1, loop
    cmp #-1
    beq DoLoop
    ;else, continue as normal

B28_0c69:
    txa
    lsr a
    tax
    lda #$00
    sta MusicChannel_Counter, x
    lda #$01
    sta MusicChannel_NoteLengthCounter, x
    bne B28_0c95
    B28_0c78:
    jmp B28_0c3a

B28_0c7b:
    jsr B28_0b70

    lda #$00
    tax
    sta unk_be
    beq B28_0c95
    B28_0c85:
    txa
    lsr a
    tax
    B28_0c88:
    inx
    txa
    cmp #$04
    beq B28_0c39
    lda unk_be

    clc
    adc #$04
    sta unk_be
    B28_0c95:
    txa
    asl a
    tax
    lda ME_CurrentPhrases, x
    sta unk_b6
    lda ME_CurrentPhrases+1, x
    sta unk_b6+1

    lda ME_CurrentPhrases+1, x
    cmp #$ff
    beq B28_0c85
    txa
    lsr a
    tax
    dec MusicChannel_NoteLengthCounter, x
    bne B28_0cfa
    lda #$00
    sta unk_7cd, x
    sta unk_7d1, x
    B28_0cb9:
    jsr ReadByte
    beq B28_0c78
    cmp #$9f
    beq B28_0d09
    cmp #$9e
    beq B28_0d21
    cmp #$9c
    beq B28_0d2a
    tay
    cmp #$ff
    beq B28_0cd8
    and #$c0
    cmp #$c0
    beq B28_0ce8
    jmp B28_0d33


; Command FF, end repeat section
B28_0cd8:
    lda MusicChannel_LoopCounter, x
    beq B28_0cf7
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_LSOffset, x
    sta MusicChannel_Counter, x
    bne B28_0cf7
; Commands C0-FE, repeat until FF
B28_0ce8:
    tya
    and #%00111111
    sta MusicChannel_LoopCounter, x
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_Counter, x
    sta MusicChannel_LSOffset, x
    B28_0cf7:
    jmp B28_0cb9

; Note is still playing
B28_0cfa:
    jsr B28_0ba1
    jsr B28_09cc
    jmp B28_0c88

; Play noise note
B28_0d03:
    jmp B28_0e17

; Set triangle note length
B28_0d06:
    jmp B28_0ded

; Command 9F, set envelope
B28_0d09:
    jsr ReadByte
    sta ME_Envelopes0, x
    jsr ReadByte
    sta ME_Envelopes1, x
    jmp B28_0cb9

; Unreachable command, consume 2 bytes and do nothing
B28_0d18:
    jsr ReadByte
    jsr ReadByte
    jmp B28_0cb9

; Command 9E, set notelength table offset
B28_0d21:
    jsr ReadByte
    sta ME_NoteLengthOffset
    jmp B28_0cb9

; Command 9C, set transpose
B28_0d2a:
    jsr ReadByte
    sta ME_Transpose
    jmp B28_0cb9

B28_0d33:
    tya
    and #%10110000
    cmp #$b0
    bne B28_0d52

; Command B0-BF, set notelength and play note
B28_0d3a:
    tya
    and #%00001111
    clc
    adc ME_NoteLengthOffset
    tay
    lda Tempo_Lengths, y
    sta MusicChannel_NewNoteLength, x
    tay
    txa
    cmp #$02
    beq B28_0d06
    B28_0d4e:
    jsr ReadByte
    tay
; Play note
    B28_0d52:
    tya
    sta unk_7c3, x
    txa
    cmp #$03
    beq B28_0d03
    pha
    ldx unk_be
    lda B28_0fea+1, y
    beq B28_0d87
    lda ME_Transpose
    bpl B28_0d73
    and #$7f
    sta unk_b3
    tya
    clc
    sbc unk_b3
    jmp B28_0d78

B28_0d73:
    tya
    clc
    adc ME_Transpose
    B28_0d78:
    tay

    lda B28_0fea+1, y
    sta currptr_pulse0, x
    lda B28_0fea, y
    ora #$08
    sta currptr_pulse0+1, x

    B28_0d87:
    tay
    pla
    tax
    tya
    bne B28_0d9c
    lda #$00
    sta unk_b0
    txa
    cmp #$02
    beq B28_0da1
    lda #$10
    sta unk_b0
    bne B28_0da1
    B28_0d9c:
    lda ME_Envelopes1, x
    sta unk_b0
    B28_0da1:
    txa
    dec unk_7c8, x
    cmp unk_7c8, x
    beq B28_0de7
    inc unk_7c8, x
    ldy unk_be
    txa
    cmp #$02
    beq B28_0dc7
    lda ME_Envelopes0, x
    and #$1f
    beq B28_0dc7
    lda unk_b0
    cmp #$10
    beq B28_0dc9
    and #$f0
    ora #$00
    bne B28_0dc9
    B28_0dc7:
    lda unk_b0
    B28_0dc9:
    sta SQ1_VOL, y
    lda UNK_7C0, x
    sta SQ1_SWEEP, y

    lda currptr_pulse0, y
    sta SQ1_LO, y
    lda currptr_pulse0+1, y
    sta SQ1_HI, y

    B28_0dde:
    lda MusicChannel_NewNoteLength, x
    sta MusicChannel_NoteLengthCounter, x
    jmp B28_0c88

B28_0de7:
    inc unk_7c8, x
    jmp B28_0dde

; Set triangle note length
B28_0ded:
    lda ME_Envelopes0+2
    and #%00011111
    bne B28_0e11
    lda ME_Envelopes0+2
    and #%11000000
    bne B28_0dfe
    B28_0dfb:
    tya
    bne B28_0e06
    B28_0dfe:
    cmp #$c0
    beq B28_0dfb
    lda #$ff
    bne B28_0e11
    B28_0e06:
    clc
    adc #$ff
    asl a
    asl a
    cmp #$3c
    bcc B28_0e11
    lda #$3c
    B28_0e11:
    sta ME_Envelopes1+2
    jmp B28_0d4e

; Play noise note
B28_0e17:
    tya
    pha
    jsr B28_0e3e
    pla
    and #$3f
    tay
    jsr B28_0e26
    jmp B28_0dde

B28_0e26:
    lda soundactive_noise
    bne B28_0e3d
    lda Noise_Instruments, y
    sta NOISE_VOL
    lda Noise_Instruments+1, y
    sta NOISE_LO
    lda Noise_Instruments+2, y
    sta NOISE_HI
    B28_0e3d:
    rts

B28_0e3e:
    tya
    and #%11000000
    cmp #%01000000 ;is kick
    beq B28_0e4a
    cmp #%10000000 ;is snare
    beq B28_0e54
    rts

;register stuff
.define dmc_sampleaddr(label) (label - $C000) / 64
.define dmc_samplelen(labels, labele) ((labele - labels) -1 ) / 16

B28_0e4a:
    ;kick drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen sample_kick, B30_0071
    ldy #dmc_sampleaddr sample_kick
    beq B28_0e5c
    B28_0e54:
    ;snare drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen sample_snare, B30_0171
    ldy #dmc_sampleaddr sample_snare
    B28_0e5c:
    sta DMC_LEN
    sty DMC_START
    lda disable_dmc
    bne B28_0e7b
    lda unk_b1
    sta DMC_FREQ
    lda #$0f
    sta SND_CHN
    lda #$00
    sta DMC_RAW
    lda #$1f
    sta SND_CHN
    B28_0e7b:
    rts

ReadByte:
    ldy MusicChannel_Counter, x
    inc MusicChannel_Counter, x
    lda (unk_b6), y
    rts

; $8E85
; Volume Envelope Table
Volume_Envelope_Table:
    .addr Volume_Envelope_0 ; 00
    .addr Volume_Envelope_1 ; 01
    .addr Volume_Envelope_2 ; 02
    .addr Volume_Envelope_3 ; 03
    .addr Volume_Envelope_4 ; 04
    .addr Volume_Envelope_5 ; 05
    .addr Volume_Envelope_6 ; 06
    .addr Volume_Envelope_7 ; 07
    .addr Volume_Envelope_8 ; 08
    .addr Volume_Envelope_9 ; 09
    .addr Volume_Envelope_10 ; 0A
    .addr Volume_Envelope_11 ; 0B
    .addr Volume_Envelope_12 ; 0C
    .addr Volume_Envelope_13 ; 0D
    .addr Volume_Envelope_14 ; 0E
    .addr Volume_Envelope_15 ; 0F
    .addr Volume_Envelope_16 ; 10
    .addr Volume_Envelope_17 ; 11
    .addr Volume_Envelope_18 ; 12
    .addr Volume_Envelope_19 ; 13
    .addr Volume_Envelope_20 ; 14
    .addr Volume_Envelope_21 ; 15
    .addr Volume_Envelope_22 ; 16
    .addr Volume_Envelope_23 ; 17
    .addr Volume_Envelope_24 ; 18
    .addr Volume_Envelope_25 ; 19
    .addr Volume_Envelope_26 ; 1A
    .ifndef VER_JP
    .addr Volume_Envelope_27 ; 1B
    .endif

; Envelope divider/volume table
Volume_Envelope_21:   .byte $76,$11,$11,$14,$31,$ff
Volume_Envelope_26:   .byte $33,$45,$66,$ff
Volume_Envelope_25:   .byte $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$f0
Volume_Envelope_24:   .byte $23,$33,$32,$22,$22,$22,$ff
Volume_Envelope_23:   .byte $98,$76,$63,$22,$87,$76,$53,$11,$f0
Volume_Envelope_6:   .byte $23,$56,$78,$88,$88,$87,$ff
Volume_Envelope_0:   .byte $23,$34,$56,$77,$65,$54,$ff
Volume_Envelope_1:   .byte $5a,$98,$88,$77,$66,$66,$65,$55,$55,$ff
Volume_Envelope_22:   .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$76,$54,$32,$ff
.ifndef VER_JP
Volume_Envelope_27:   .byte $11,$11,$22,$ff
.endif
Volume_Envelope_2:   .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$ff
Volume_Envelope_3:   .byte $f9,$87,$77,$77,$66,$65,$55,$44,$ff
Volume_Envelope_4:   .byte $a8,$76,$ff
Volume_Envelope_9:   .byte $74,$32,$ff
Volume_Envelope_5:   .byte $99,$ff
Volume_Envelope_7:   .byte $dc,$ba,$99,$88,$87,$76,$55,$44,$ff
Volume_Envelope_8:   .byte $23,$44,$33,$33,$33,$33,$33,$32,$ff
Volume_Envelope_10:   .byte $77,$76,$65,$55,$44,$43,$32,$21,$f0
Volume_Envelope_11:   .byte $44,$43,$33,$32,$22,$11,$11,$f0
Volume_Envelope_12:   .byte $33,$33,$22,$22,$11,$11,$11,$f0
Volume_Envelope_13:   .byte $22,$22,$22,$11,$11,$11,$f0
Volume_Envelope_14:   .byte $11,$11,$11,$11,$11,$11,$01,$00,$f0
Volume_Envelope_15:   .byte $99,$88,$77,$76,$66,$55,$54,$44,$33,$33,$33,$32,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$f0
Volume_Envelope_18:   .byte $65,$55,$54,$44,$33,$33,$33,$33,$22,$22,$22,$22,$11,$11,$11,$11,$11,$11,$11,$11,$f0
Volume_Envelope_20:   .byte $fb,$ba,$aa,$99,$99,$99,$98,$88,$77,$77,$77,$66,$66,$66,$55,$54,$44,$44,$43,$33,$33,$22,$22,$22,$22,$11,$11,$11,$f0
Volume_Envelope_16:   .byte $23,$45,$55,$44,$33,$33,$22,$ff
Volume_Envelope_17:   .byte $87,$65,$43,$21,$44,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$ff
Volume_Envelope_19:   .byte $66,$65,$42,$21,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$ff


; $8FEA
; UNKNOWN
B28_0fea:
    .byte $07,$F0,$00,$00,$06,$AE,$06,$4E,$05,$F3,$05,$9E,$05,$4D,$05,$01
    .byte $04,$B9,$04,$75,$04,$35,$03,$F8,$03,$BF,$03,$89,$03,$57,$03,$27
    .byte $02,$F9,$02,$CF,$02,$A6,$02,$80,$02,$5C,$02,$3A,$02,$1A,$01,$FC
    .byte $01,$DF,$01,$C4,$01,$AB,$01,$93,$01,$7C,$01,$67,$01,$52,$01,$3F
    .byte $01,$2D,$01,$1C,$01,$0C,$00,$FD,$00,$EE,$00,$E1,$00,$D4,$00,$C8
    .byte $00,$BD,$00,$B2,$00,$A8,$00,$9F,$00,$96,$00,$8D,$00,$85,$00,$7E
    .byte $00,$76,$00,$70,$00,$69,$00,$63,$00,$5E,$00,$58,$00,$53,$00,$4F
    .byte $00,$4A,$00,$46,$00,$42,$00,$3E,$00,$3A,$00,$37,$00,$34,$00,$31
    .byte $00,$2E,$00,$2B,$00,$29,$00,$0A,$00,$01

;tempo note length offsets
Tempo_Lengths:
    NLT_00:
    .byte $04,$08,$10,$20,$40,$18,$30,$0c
    .byte $0a,$05,$02,$01
    NLT_0C:
    .byte $05,$0a,$14,$28,$50,$1e,$3c,$0f
    .byte $0c,$06,$03,$02
    NLT_18:
    .byte $06,$0c,$18,$30,$60,$24,$48,$12
    .byte $10,$08,$03,$01,$04,$02,$00,$90
    NLT_28:
    .byte $07,$0e,$1c,$38,$70,$2a,$54,$15
    .byte $12,$09,$03,$01,$02
    NLT_35:
    .byte $08,$10,$20,$40,$80,$30,$60,$18
    .byte $15,$0a,$04,$01,$02,$c0
    NLT_43:
    .byte $09,$12,$24,$48,$90,$36,$6c,$1b
    .byte $18
    NLT_4C:
    .byte $0a,$14,$28,$50,$a0,$3c,$78,$1e
    .byte $1a,$0d,$05,$01,$02,$17
    NLT_5A:
    .byte $0b,$16,$2c,$58,$b0,$42,$84,$21
    .byte $1d,$0e,$05,$01,$02,$17


.define header_offset(ta) .byte ta-Music_Table
Music_Table_Ids:
    header_offset Ocarina_header
    header_offset Flippant_Battle_header
    header_offset Dangerous_Battle_header
    header_offset Hippie_Battle_header
    header_offset Win_Battle_header
    header_offset Pollyanna_header
    header_offset Bein_Friends_header
    header_offset Yucca_Desert_header
    header_offset Magicant_BGM_header
    header_offset Snowman_BGM_header
    header_offset Mt_Itoi_BGM_header
    header_offset Factory_BGM_header
    header_offset Ghastly_Site_header
    header_offset Twinkle_Elementary_BGM_header
    header_offset Humoresque_Of_A_Little_Dog_header
    header_offset Poltergeist_header
    header_offset Underground_BGM_header
    header_offset Home_BGM_header
    header_offset Approaching_Mt_Itoi_header
    header_offset Paradise_Line_BGM_header
    header_offset Fallin_Love_header
    header_offset Mother_Earth_header
    header_offset Tank_BGM_header
    header_offset Monkey_Cave_BGM_header
.define header_offset2(ta) .byte ta-Music_Table_2
Music_Table_2_Ids:
    header_offset2 Queen_Marys_Song_header
    header_offset2 Wisdom_Of_The_World_header
    header_offset2 Tombstone_BGM_header
    header_offset2 Game_Over_BGM_header
    header_offset2 Big_Victory_BGM_header
    header_offset2 Airplane_BGM_header
    header_offset2 Level_Up_BGM_header
    header_offset2 Recovery_BGM_header
    header_offset2 Fanfare_BGM_header
    header_offset2 Live_House_BGM_header
    header_offset2 All_That_I_Needed_Was_You_header

    header_offset2 Melody_1_header
    header_offset2 Melody_2_header
    header_offset2 Melody_3_header
    header_offset2 Melody_4_header
    header_offset2 Melody_5_header
    header_offset2 Melody_6_header
    header_offset2 Melody_7_header
    header_offset2 Melody_8_header

    header_offset2 VS_Giegue_BGM_header
    header_offset2 Ending_JP_BGM_header
    header_offset2 Zoo_BGM_header
    header_offset2 Phone_BGM_header
    header_offset2 Youngtown_BGM_header
    header_offset2 Cave_Of_The_Tail_BGM_header

    .ifndef VER_JP
    .byte 0
    .endif

Music_Table:

Ocarina_header:
.byte $18
.byte NLT_18-Tempo_Lengths
.addr -1
.addr -1
.addr unk_76c
.addr -1

Flippant_Battle_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_b_flippant_pulse1
.addr mus_b_flippant_pulse2
.addr mus_b_flippant_triangle
.addr mus_b_flippant_noise

Dangerous_Battle_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_b_dangerous_pulse1
.addr mus_b_dangerous_pulse2
.addr mus_b_dangerous_triangle
.addr mus_b_dangerous_noise

Hippie_Battle_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_b_hippie_pulse1
.addr mus_b_hippie_pulse2
.addr mus_b_hippie_triangle
.addr mus_b_hippie_noise

Win_Battle_header:
.byte $00
.byte NLT_00-Tempo_Lengths
.addr mus_b_win_pulse1
.addr mus_b_win_pulse2
.addr mus_b_win_triangle
.addr -1

Bein_Friends_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_bein_friends_pulse1
.addr mus_bein_friends_pulse2
.addr mus_bein_friends_triangle
.addr mus_bein_friends_noise

Pollyanna_header:
.byte $00
.byte NLT_35-Tempo_Lengths
.addr mus_pollyanna_pulse1
.addr mus_pollyanna_pulse2
.addr mus_pollyanna_triangle
.addr mus_pollyanna_noise

Yucca_Desert_header:
.byte $81
.byte NLT_0C-Tempo_Lengths
.addr mus_yucca_desert_pulse1
.addr mus_yucca_desert_pulse2
.addr mus_yucca_desert_triangle
.addr mus_yucca_desert_noise

Magicant_BGM_header:
.byte $00
.byte NLT_4C-Tempo_Lengths
.addr mus_magicant_pulse1
.addr mus_magicant_pulse2
.addr mus_magicant_triangle
.addr mus_magicant_noise

Snowman_BGM_header:
.byte $00
.byte NLT_35-Tempo_Lengths
.addr mus_snowman_pulse1
.addr mus_snowman_pulse2
.addr mus_snowman_triangle
.addr -1

Mt_Itoi_BGM_header:
.byte $00
.byte NLT_4C-Tempo_Lengths
.addr mus_mt_itoi_pulse1
.addr mus_mt_itoi_pulse2
.addr mus_mt_itoi_triangle
.addr mus_mt_itoi_noise

Factory_BGM_header:
.byte $00
.byte NLT_35-Tempo_Lengths
.addr mus_factory_pulse1
.addr mus_factory_pulse2
.addr mus_factory_triangle
.addr mus_factory_noise

Ghastly_Site_header:
.byte $00
.byte NLT_35-Tempo_Lengths
.addr mus_ghastly_site_pulse1
.addr mus_ghastly_site_pulse2
.addr mus_ghastly_site_triangle
.addr mus_ghastly_site_noise

Twinkle_Elementary_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr mus_twinkle_elementary_pulse1
.addr mus_twinkle_elementary_pulse2
.addr mus_twinkle_elementary_triangle
.addr mus_twinkle_elementary_noise

Humoresque_Of_A_Little_Dog_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr mus_humoresque_of_a_little_dog_pulse1
.addr mus_humoresque_of_a_little_dog_pulse2
.addr mus_humoresque_of_a_little_dog_triangle
.addr mus_humoresque_of_a_little_dog_noise

Poltergeist_header:
.byte $87   ; Transpose
.byte NLT_18-Tempo_Lengths   ; Note length table offset
.addr mus_poltergeist_pulse1 ; Pulse1 phrase pointers
.addr mus_poltergeist_pulse2 ; Pulse2 phrase pointers
.addr mus_poltergeist_triangle ; Triangle phrase pointers
.addr mus_poltergeist_noise ; Noise phrase pointers

Underground_BGM_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_underground_pulse1
.addr mus_underground_pulse2
.addr mus_underground_triangle
.addr mus_underground_noise

Home_BGM_header:
.byte $02
.byte NLT_43-Tempo_Lengths
.addr mus_home_pulse1
.addr mus_home_pulse2
.addr mus_home_triangle
.addr mus_home_noise

Approaching_Mt_Itoi_header:
.byte $00
.byte NLT_35-Tempo_Lengths
.addr mus_approaching_mt_itoi_pulse1
.addr mus_approaching_mt_itoi_pulse2
.addr mus_approaching_mt_itoi_triangle
.addr mus_approaching_mt_itoi_noise

Paradise_Line_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr mus_paradise_line_pulse1
.addr mus_paradise_line_pulse2
.addr mus_paradise_line_triangle
.addr mus_paradise_line_noise

Fallin_Love_header:
.byte $00
.byte NLT_43-Tempo_Lengths
.addr mus_fallin_love_pulse1
.addr mus_fallin_love_pulse2
.addr mus_fallin_love_triangle
.addr mus_fallin_love_noise

Mother_Earth_header:
.byte $00   ; Transpose
.byte NLT_28-Tempo_Lengths   ; Note length table offset
.addr mus_mother_earth_pulse1 ; Pulse1 phrase pointers
.addr mus_mother_earth_pulse2 ; Pulse2 phrase pointers
.addr mus_mother_earth_triangle ; Triangle phrase pointers
.addr mus_mother_earth_noise ; Noise phrase pointers

Tank_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr mus_tank_pulse1
.addr mus_tank_pulse2
.addr mus_tank_triangle
.addr mus_tank_noise

Monkey_Cave_BGM_header:
.byte $00
.byte NLT_0C-Tempo_Lengths
.addr mus_monkey_cave_pulse1
.addr mus_monkey_cave_pulse2
.addr mus_monkey_cave_triangle
.addr -1

Music_Table_2:

Queen_Marys_Song_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B29_0E84
.addr B29_0E6C
.addr -1
.addr -1

Wisdom_Of_The_World_header:
.byte $00
.byte NLT_5A-Tempo_Lengths
.addr B29_0EFB
.addr B29_0F01
.addr B29_0F07
.addr -1

Tombstone_BGM_header:
.byte $18
.byte NLT_4C-Tempo_Lengths
.addr B29_0FFF
.addr B29_0FF7
.addr -1
.addr -1

Game_Over_BGM_header:
.byte $00
.byte NLT_4C-Tempo_Lengths
.addr B29_1012
.addr B29_101A
.addr B29_1022
.addr -1

Big_Victory_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr mus_big_victory_pulse1
.addr mus_big_victory_pulse2
.addr mus_big_victory_triangle
.addr -1

Airplane_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr B29_1992
.addr B29_1998
.addr B29_199E
.addr B29_19B0

Level_Up_BGM_header:
.byte $06
.byte NLT_00-Tempo_Lengths
.addr mus_level_up_pulse1_intro
.addr mus_level_up_pulse2_intro
.addr mus_level_up_triangle_intro
.addr -1

Recovery_BGM_header:
.byte $83
.byte NLT_18-Tempo_Lengths
.addr B29_0E98
.addr B29_0E9C
.addr B29_0E9E
.addr -1

Fanfare_BGM_header:
.byte $83
.byte NLT_43-Tempo_Lengths
.addr B29_1438
.addr B29_143C
.addr B29_143E
.addr -1

Live_House_BGM_header:
.byte $87
.byte NLT_18-Tempo_Lengths
.addr B29_109E
.addr B29_10A4
.addr B29_10B0
.addr B29_10BC

All_That_I_Needed_Was_You_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr B29_113C
.addr B29_1152
.addr B29_1162
.addr B29_1174

Melody_1_header:
.byte $30
.byte NLT_28-Tempo_Lengths
.addr B28_1302
.addr B28_1306
.addr -1
.addr -1

Melody_2_header:
.byte $18
.byte NLT_28-Tempo_Lengths
.addr B28_130A
.addr B28_130E
.addr -1
.addr -1

Melody_3_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B28_1312
.addr B28_1316
.addr -1
.addr -1

Melody_4_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B28_131A
.addr B28_131E
.addr -1
.addr -1

Melody_5_header:
.byte $30
.byte NLT_28-Tempo_Lengths
.addr B28_1322
.addr B28_1326
.addr -1
.addr -1

Melody_6_header:
.byte $18
.byte NLT_28-Tempo_Lengths
.addr B28_132A
.addr B28_132E
.addr -1
.addr -1

Melody_7_header:
.byte $30
.byte NLT_28-Tempo_Lengths
.addr B28_1332
.addr B28_1336
.addr -1
.addr -1

Melody_8_header:
.byte $18
.byte NLT_28-Tempo_Lengths
.addr B28_133A
.addr B28_133E
.addr -1
.addr -1

VS_Giegue_BGM_header:
.byte $00
.byte NLT_43-Tempo_Lengths
.addr B29_1461
.addr B29_1467
.addr -1
.addr -1

Ending_JP_BGM_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr mus_epiloguejp_pulse1_start
.addr mus_epiloguejp_pulse2_start
.addr mus_epiloguejp_triangle_start
.addr mus_epiloguejp_noise_start

Zoo_BGM_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B29_1479
.addr B29_147F
.addr B29_0827
.addr B29_082F

Phone_BGM_header:
.byte $00
.byte NLT_18-Tempo_Lengths
.addr -1
.addr B29_1495
.addr -1
.addr -1

Youngtown_BGM_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B29_14A3
.addr B29_14A9
.addr B29_14AF
.addr -1

Cave_Of_The_Tail_BGM_header:
.byte $00
.byte NLT_28-Tempo_Lengths
.addr B29_1556
.addr B29_155E
.addr -1
.addr -1

.ifndef VER_JP
Path_To_Giegue_BGM_header:
.byte $00
.byte NLT_43-Tempo_Lengths
.addr B29_1580
.addr B29_1588
.addr B29_1590
.addr B29_1596
.endif


; $9302
; Music data

;song 1 - ocarina
    .include "./tracks/01_ocarina.asm"

;song 2 - flippant battle
    .include "./tracks/02_flippant.asm"

;song 3 - dangerous + battle intro
    .include "./tracks/03_dangerous.asm"

;song 4 - hippie battle
    .include "./tracks/04_hippie.asm"

;song 5 - you win
    .include "./tracks/05_youwin.asm"

;song 8 - yucca desert
    .include "./tracks/08_yuccadesert.asm"

;song 6 - pollyanna
    .include "./tracks/06_pollyanna.asm"

;song 7 - bein friends
    .include "./tracks/07_beinfriends.asm"

;song 16 ($10) - poltergeist
    .include "./tracks/16_poltergeist.asm"

;song 9 - magicant
    .include "./tracks/09_magicant.asm"

;song 10 ($0a) - snowman
    .include "./tracks/10_snowman.asm"

;song 11 ($0b) - mt_itoi
    .include "./tracks/11_mtitoi.asm"

;song 13 ($0d) - ghastly site
    .include "./tracks/13_ghastlysite.asm"

;song 14 ($0e) - twinkle elementary
    .include "./tracks/14_twinkleelementary.asm"

;song 15 ($0f) - humoresque of a little dog
    .include "./tracks/15_humoresqueofalittledog.asm"

;song 12 ($0c) - factory
    .include "./tracks/12_factory.asm"

;song 17 ($11) - underground
    .include "./tracks/17_underground.asm"

;song 24 ($18) - monkey cave
    .include "./tracks/24_monkeycave.asm"

; song 18 ($12) - home
    .include "./tracks/18_home.asm"

;song 19 ($13) - approaching mt. itoi
    .include "./tracks/19_approachingmtitoi.asm"

;song 21 ($15) - fallin' love
    .include "./tracks/21_fallinlove.asm"

;song 23 ($17) - roving tank
    .include "./tracks/23_rovingtank.asm"

;song 25 ($19) - maria's song
    .include "./tracks/25_mariassong.asm"

;song 32 ($20) - recovery
    .include "./tracks/32_recovery.asm"

;song 31 ($1f) - level up
    .include "./tracks/31_levelup.asm"

;song 26 ($1a) - wisdom of the world
    .include "./tracks/26_wisdomoftheworld.asm"

;song 30 ($1e) - airplane ride jp
    .ifdef VER_JP
        .include "./tracks/30_airplaneride.asm"
    .endif

;song 27 ($1b) - tombstone
    .include "./tracks/27_tombstone.asm"

;song 28 ($1c) - game over
    .include "./tracks/28_gameover.asm"

;song 29 ($1d) - big victory
    .include "./tracks/29_bigvictory.asm"

;song 34 ($22) - live house
    .include "./tracks/34_livehouse.asm"

;song 35 ($23) - all that i needed was you
    .include "./tracks/35_allthatineededwasyou.asm"

;song 33 ($21) - fanfare
    .include "./tracks/33_fanfare.asm"

;song 44 ($2c) - vs giegue
    .include "./tracks/44_vsgiegue.asm"

;song 46 ($2e) - zoo
    .include "./tracks/46_zoo.asm"

;song 47 ($2f) - phone
    .include "./tracks/47_phone.asm"

;song 48 ($30) - youngtown
    .include "./tracks/48_youngtown.asm"

;song 49 ($31) - cave of the tail
    .include "./tracks/49_caveofthetail.asm"

;song 50 ($32) - path to giegue
    .include "./tracks/50_pathtogiegue.asm"

;song 45 ($2d) - epilogue jp
    .include "./tracks/45_epiloguejp.asm"

;song 30 ($1e) - airplane ride usa
    .ifndef VER_JP
        .include "./tracks/30_airplaneride.asm"
    .endif

;song 22 ($16) - mother earth
    .include "./tracks/22_motherearth.asm"

;song 20 ($14) - paradise line
    .include "./tracks/20_paradiseline.asm"

