.segment        "CREDITS_MUSIC": absolute

;smaller music engine dedicated solely to playing the credits tracks.

; $8000
CreditsMusic_Tick:
    jmp C_B28_0277

B27_0003:
    jmp C_B28_0299

CreditsMusic_Init:
    jmp C_B28_0216


C_SetSQ1Registers:
    lda #<SQ1
    beq C_B28_00a3

C_SetTRIRegisters:
    lda #<TRI
    bne C_B28_00a3

C_SetNOISERegisters:
    lda #<NOISE
    bne C_B28_00a3

C_SetSQ2Registers:
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
C_B28_00a3:
    sta unk_b0
    lda #$40
    sta unk_b1
    sty unk_b2
    sta unk_b3
    ldy #0
    @loop:
    lda (unk_b2), y
    sta (unk_b0), y
    iny
    tya
    cmp #4
    bne @loop
    rts

;Effects:
;  Advances the RNG state at unk_bb used for sound purposes.
;  The RNG is a Fibonacci LFSR with taps on bits 1 and 8 (or going by the conventions on Wikipedia, bits 15 and 7).
;  The state is stored big-endian.
;Clobbers:
;  A, unk_7ff
C_TickRNG:
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

C_B28_00d3:
    ldx unk_bd
    inc unk_7da, x
    lda unk_7da, x
    cmp unk_7d5, x
    bne @exit
    lda #0
    sta unk_7da, x
    @exit:
    rts

C_Ocarina_Missing_List:
.addr 0

C_B28_0216:
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
    lda C_Ocarina_Missing_List, y
    sta unk_76c, y
    iny
    tya
    cmp #10*2
    bne @copy

    jsr C_B28_0299
    rts

.byte 0,0

; Overrides the song for learning melody 2 to instead begin with a tweet sound effect.
; (A generic Canary sound effect is added to the script in EB:B instead.)
C_InsertLauraPreMelodyTweeting:
    lda soundqueue_track
    cmp #$25
    bne @exit
    jsr C_B28_0299
    sta soundqueue_track
    lda #PulseG0_Laura
    sta soundqueue_pulseg0
    @exit:
    rts

; PLAY entry point
C_B28_0277:
    lda #$c0
    sta FRAME_COUNTER ; APU "frame counter". Select "one 5-step sequence" (whatever that means) and clear interrupt flag
    jsr C_TickRNG ; Weird $BB shuffle-around
    jsr C_InsertLauraPreMelodyTweeting
    jsr C_HandleMusic
    lda #0
    ldx #6
    @loop:
    sta sram_mode, x
    dex
    bne @loop
    rts

;End song?
C_B28_0299:
    jsr C_B28_02a8
    ; fallthrough
C_B28_029c:
    jsr C_B28_02c6
    lda #0
    sta DMC_RAW
    sta ME_Envelopes0+2
    rts

C_B28_02a8:
    lda #0
    sta unk_7c8
    sta unk_7c8+1
    sta unk_7c8+2

    sta current_music
    sta unk_78a
    ; Set all sounds and music to be inactive
    tay
    @loop:
    lda #0
    sta soundactive, y
    iny
    tya
    cmp #6
    bne @loop
    rts

C_B28_02c6:
    lda #0
    sta DMC_RAW
    lda #$10
    sta SQ1_VOL
    sta SQ2_VOL
    sta NOISE_VOL
    lda #0
    sta TRI_LINEAR
    rts

; need A, Y set before calling
C_SFX_SetupContinue:
    ldx unk_bd
    sta unk_7d5, x
    txa
    sta unk_7c7, x
    tya
    beq C_SetupCHANNEL
    txa
    beq C_SetupNOI
    cmp #1
    beq C_SetupSQ1
    cmp #2
    beq C_SetupSQ2
    cmp #3
    beq C_SetupTRI
    rts
C_SetupSQ1:
    jsr C_SetSQ1Registers
    beq C_SetupCHANNEL ; unconditional branch
C_SetupSQ2:
    jsr C_SetSQ2Registers
    beq C_SetupCHANNEL ; unconditional branch
C_SetupTRI:
    jsr C_SetTRIRegisters
    beq C_SetupCHANNEL ; unconditional branch
C_SetupNOI:
    jsr C_SetNOISERegisters
    ; fallthrough
C_SetupCHANNEL:
    lda unk_bf
    sta soundactive_noise, x
    lda #0
    sta unk_7da, x
    ; fallthrough
C_StoreCHANNELVariables:
    sta unk_7df, x
    sta unk_7e3, x
    sta unk_7e7, x
    sta unk_78a
C_B28_0320:
    rts

C_NoiseSFX_Unk07_RocketLand_Continue:
    jsr C_B28_00d3
    bne C_B28_041f
    C_EndNoiseSFX:
    lda #0
    sta soundactive_noise
    lda #$10
    sta NOISE_VOL
    C_B28_041f:
    rts

C_DoDoublePulseSFX:
    sta unk_7d9
    jsr C_SetSQ2Registers
    lda unk_bf
    sta soundactive_pulseg1

    ldx #1
    stx unk_7c8
    inx
    stx unk_7c8+1

    lda #0
    sta unk_7de
    sta soundactive_pulseg0
    ldx #1
    jmp C_StoreCHANNELVariables

C_B28_04dd:
    jsr C_EndPulseGroup0SFX
    jsr C_B28_0840
    inc unk_78a
    lda #0
    sta soundactive_pulseg1
    ldx #1
    lda #$7f
C_B28_04ef:
    sta SQ1_VOL, x
    sta SQ2_VOL, x
    rts

C_PulseGroup0SFX_TakeDamage_Unk0D_Unk0E_Miss_Continue:
    jsr C_B28_00d3
    bne C_B28_0698
    ; fallthrough
C_EndPulseGroup0SFX:
    lda #$10
    sta SQ1_VOL

    lda #0
    sta unk_7c8
    sta soundactive_pulseg0
    inc unk_78a
    C_B28_0698:
    rts

C_B28_0840:
    lda #$10
    sta SQ2_VOL
    lda #0
    sta unk_7c8+1
    sta soundactive_unknown
    rts

C_B28_090e:
    jmp C_B28_0299

C_HandleMusic:
    lda soundqueue_track
    tay
    cmp #$3f
    bcs C_B28_090e
    ;cmp #$01
    ;beq C_B28_0903
    tya
    beq C_B28_095c
    sta current_music
    cmp #$19
    beq C_B28_092b
    cmp #$19
    bcc C_B28_0936
    C_B28_092b:
    sta unk_bf
    sec
    sbc #$19
    sta music_id
    jmp C_B28_094e
    C_B28_0936:
    ;if playing pollyanna, check if need to play bein friends instead
    cmp #6
    bne C_B28_0946
    ;if party count != 1, play bein friends
    lda pc_count
    cmp #1
    beq C_B28_0945
    lda #7
    bne C_B28_0946
    C_B28_0945:
    tya
    C_B28_0946:
    sta unk_bf
    sta music_id
    dec music_id
    C_B28_094e:
    lda #$7f
    sta UNK_7C0
    sta UNK_7C0+1
    jsr C_B28_0aec
    C_B28_0959:
    jmp C_B28_0c7b
    C_B28_095c:
    lda soundactive_track
    bne C_B28_0959
    rts

;????
C_Noise_Instruments:
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
.byte     $1D,$01
.byte $28,$16,$01
.byte $28,$13,$01
.byte $38,$12,$01
.byte $38

C_B28_09cc:
    lda soundactive_track
    cmp #1
    beq C_B28_09f5
    txa
    cmp #3
    beq C_B28_09f5
    lda ME_Envelopes0, x
    and #$e0
    beq C_B28_09f5
    sta unk_b0
    lda unk_7c3, x
    cmp #2
    beq C_B28_09f2
    ldy unk_be
    lda currptr_pulse0, y
    sta unk_b1
    jsr C_B28_0a33
    C_B28_09f2:
    inc unk_7d1, x
    C_B28_09f5:
    rts

C_B28_09f6:
    lda unk_b2
    cmp #$31
    bne C_B28_09fe
    lda #$27
    C_B28_09fe:
    tay
    lda C_Pitch_Envelope_4_6, y
    pha
    lda unk_7c3, x
    cmp #$46
    bne C_B28_0a0f
    pla
    lda #$00
    beq C_B28_0a6d
    C_B28_0a0f:
    pla
    jmp C_B28_0a6d
    C_B28_0a13:
    lda unk_b2
    tay
    cmp #$10
    bcs C_B28_0a20
    lda C_Pitch_Envelope_2, y
    jmp C_B28_0a73
    C_B28_0a20:
    lda #$f6
    bne C_B28_0a73
    C_B28_0a24:
    lda unk_7c3, x
    cmp #$4c
    bcc C_B28_0a2f
    lda #$fe
    bne C_B28_0a73
    C_B28_0a2f:
    lda #$fe
    bne C_B28_0a73

C_B28_0a33:
    lda unk_7d1, x
    sta unk_b2
    lda unk_b0

    ;pitch envelope 1
    cmp #(1 << 5)
    beq C_B28_0a52
    ;pitch envelope 5
    cmp #(5 << 5)
    beq C_B28_0a61
    ;pitch envelope 3
    cmp #(3 << 5)
    beq C_B28_0a24
    ;pitch envelope 2
    cmp #(2 << 5)
    beq C_B28_0a13
    ;pitch envelope 4
    cmp #(4 << 5)
    beq C_B28_09f6
    ;pitch envelope 6
    cmp #(6 << 5)
    beq C_B28_09f6
    C_B28_0a52:
    lda unk_b2
    cmp #$0a
    bne C_B28_0a5a
    lda #0
    C_B28_0a5a:
    tay
    lda C_Pitch_Envelope_1_7, y
    jmp C_B28_0a6d
    C_B28_0a61:
    lda unk_b2
    cmp #$2b
    bne C_B28_0a69
    lda #$21
    C_B28_0a69:
    tay
    lda C_Pitch_Envelope_5, y
    C_B28_0a6d:
    pha
    tya
    sta unk_7d1, x
    pla
    C_B28_0a73:
    pha
    lda unk_7c8, x
    bne C_B28_0a83
    pla
    clc
    adc unk_b1

    ldy unk_be
    sta SQ1_LO, y
    rts

C_B28_0a83:
    pla
    rts

C_Pitch_Envelope_4_6:
.byte 9,8,7,6,5,4,3,2,2,1,1,0
C_Pitch_Envelope_5:
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
.byte 0,0,0,0,-1,0,0,0,0,1,1,0,0,0,-1,-1
.byte 0
C_Pitch_Envelope_1_7:
.byte 0,1,1,2,1,0,-1,-1,-2,-1
C_Pitch_Envelope_2:
.byte 0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-10,-9,-10,-11 ; -10 hardcoded

C_B28_0acc:
    lda music_id
    tay
    lda C_Music_Table_2_Ids, y
    tay

    ldx #0
    @copy:
    lda C_Music_Table, y
    sta MusicHeader, x
    iny
    inx
    txa
    cmp #10
    bne @copy

    rts

C_B28_0ae4:
    lda #$ff
    sta ME_CurrentPulse1Phrase, x
    jmp C_B28_0b65

C_B28_0aec:
    jsr C_B28_029c
    lda unk_bf
    sta soundactive_track
    cmp #$33
    beq C_B28_0b06
    cmp #$19
    beq C_B28_0b00
    cmp #$19
    bcc C_B28_0b1a
    C_B28_0b00:
    jsr C_B28_0acc
    jmp C_B28_0b31
    C_B28_0b06:
    ldx #0
    ldy #0
    C_B28_0b0a:
    lda C_Path_To_Giegue_BGM_header, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #10
    bne C_B28_0b0a
    jmp C_B28_0b31
    C_B28_0b1a:
    lda music_id
    tay
    lda C_Music_Table_Ids, y
    tay
    ldx #0
    C_B28_0b24:
    lda C_Music_Table, y
    sta ME_Transpose, x
    iny
    inx
    txa
    cmp #10
    bne C_B28_0b24
    C_B28_0b31:
    lda #1
    sta MusicChannel_NoteLengthCounter
    sta MusicChannel_NoteLengthCounter+1
    sta MusicChannel_NoteLengthCounter+2
    sta MusicChannel_NoteLengthCounter+3
    lda #0
    sta unk_ba
    ldy #8
    C_B28_0b45:
    sta ME_CurrentNoisePhrase+1, y
    dey
    bne C_B28_0b45
    tax
    C_B28_0b4c:
    ;store datapointer lo
    lda ME_DataPointer, x
    sta unk_b6

    ;check datapointer hi if ff, else store
    lda ME_DataPointer+1, x
    cmp #$ff
    beq C_B28_0ae4
    ;store
    sta unk_b6+1

    ldy ME_CurrentPhraseIndex

    ;get phrase pointers from pointer
    lda (unk_b6), y
    sta ME_CurrentPhrases, x
    iny
    lda (unk_b6), y
    C_B28_0b65:
    sta ME_CurrentPhrases+1, x

    inx
    inx
    txa
    cmp #8
    bne C_B28_0b4c
    rts

C_B28_0b70:
    lda unk_78a
    beq C_B28_0ba0
    cmp #1
    beq C_B28_0b8a
    lda #$7f
    sta SQ2_SWEEP

    lda currptr_pulse1
    sta SQ2_LO
    lda currptr_pulse1+1
    sta SQ2_HI

    C_B28_0b8a:
    lda #$7f
    sta SQ1_SWEEP

    lda currptr_pulse0
    sta SQ1_LO
    lda currptr_pulse0+1
    sta SQ1_HI

    lda #0
    sta unk_78a
    C_B28_0ba0:
    rts

C_B28_0ba1:
    txa
    cmp #2
    bcs C_B28_0ba0
    lda ME_Envelopes0, x
    and #$1f
    beq C_B28_0c06
    sta unk_b1
    lda unk_7c3, x
    cmp #2
    beq C_B28_0c10
    ldy #0
    C_B28_0bb8:
    dec unk_b1
    beq C_B28_0bc0
    iny
    iny
    bne C_B28_0bb8
    C_B28_0bc0:
    lda C_Volume_Envelope_Table, y
    sta unk_b2
    lda C_Volume_Envelope_Table+1, y
    sta unk_b3
    lda unk_7cd, x
    lsr a
    tay
    lda (unk_b2), y
    sta unk_b4
    cmp #$ff
    beq C_B28_0c07
    cmp #$f0
    beq C_B28_0c0c
    lda unk_7cd, x
    and #$01
    bne C_B28_0bea
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    lsr unk_b4
    C_B28_0bea:
    lda unk_b4
    and #$0f
    sta unk_b0
    lda ME_Envelopes1, x
    and #$f0
    ora unk_b0
    tay
    C_B28_0bf8:
    inc unk_7cd, x
    C_B28_0bfb:
    lda unk_7c8, x
    bne C_B28_0c06
    tya

    ldy unk_be
    sta SQ1_VOL, y
    C_B28_0c06:
    rts

C_B28_0c07:
    ldy ME_Envelopes1, x
    bne C_B28_0bfb
    C_B28_0c0c:
    ldy #$10
    bne C_B28_0bfb
    C_B28_0c10:
    ldy #$10
    bne C_B28_0bf8

;ran when a loop point is found in a list of phrases
C_DoLoop:
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

    jmp C_B28_0c53

C_B28_0c36:
    jsr C_B28_0299
    C_B28_0c39:
    rts

;Next Phrase?
C_B28_0c3a:

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
    C_B28_0c53:
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
    beq C_B28_0c36
    ;elif a == -1, loop
    cmp #-1
    beq C_DoLoop
    ;else, continue as normal

C_B28_0c69:
    txa
    lsr a
    tax
    lda #0
    sta MusicChannel_Counter, x
    lda #1
    sta MusicChannel_NoteLengthCounter, x
    bne C_B28_0c95
    C_B28_0c78:
    jmp C_B28_0c3a

C_B28_0c7b:
    jsr C_B28_0b70

    lda #0
    tax
    sta unk_be
    beq C_B28_0c95
    C_B28_0c85:
    txa
    lsr a
    tax
    C_B28_0c88:
    inx
    txa
    cmp #4
    beq C_B28_0c39
    lda unk_be

    clc
    adc #4
    sta unk_be
    C_B28_0c95:
    txa
    asl a
    tax
    lda ME_CurrentPhrases, x
    sta unk_b6
    lda ME_CurrentPhrases+1, x
    sta unk_b6+1

    lda ME_CurrentPhrases+1, x
    cmp #$ff
    beq C_B28_0c85
    txa
    lsr a
    tax
    dec MusicChannel_NoteLengthCounter, x
    bne C_B28_0cfa
    lda #0
    sta unk_7cd, x
    sta unk_7d1, x
    C_B28_0cb9:
    ;interpret music commands
    jsr C_ReadByte
    beq C_B28_0c78
    cmp #$9f
    beq C_B28_0d09
    cmp #$9e
    beq C_B28_0d21
    cmp #$9c
    beq C_B28_0d2a
    tay
    cmp #$ff
    beq C_B28_0cd8
    and #$c0
    cmp #$c0
    beq C_B28_0ce8
    jmp C_B28_0d33

; Command FF, end repeat section
C_B28_0cd8:
    lda MusicChannel_LoopCounter, x
    beq C_B28_0cf7
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_LSOffset, x
    sta MusicChannel_Counter, x
    bne C_B28_0cf7
; Commands C0-FE, repeat until FF
C_B28_0ce8:
    tya
    and #%00111111
    sta MusicChannel_LoopCounter, x
    dec MusicChannel_LoopCounter, x
    lda MusicChannel_Counter, x
    sta MusicChannel_LSOffset, x
    C_B28_0cf7:
    jmp C_B28_0cb9

; Note is still playing
C_B28_0cfa:
    jsr C_B28_0ba1
    jsr C_B28_09cc
    jmp C_B28_0c88

; Play noise note
C_B28_0d03:
    jmp C_B28_0e17

; Set triangle note length
C_B28_0d06:
    jmp C_B28_0ded

; Command 9F, set envelope
C_B28_0d09:
    jsr C_ReadByte
    sta ME_Envelopes0, x
    jsr C_ReadByte
    sta ME_Envelopes1, x
    jmp C_B28_0cb9

; Unreachable command, consume 2 bytes and do nothing
C_B28_0d18:
    jsr C_ReadByte
    jsr C_ReadByte
    jmp C_B28_0cb9

; Command 9E, set notelength table offset
C_B28_0d21:
    jsr C_ReadByte
    sta ME_NoteLengthOffset
    jmp C_B28_0cb9

; Command 9C, set transpose
C_B28_0d2a:
    jsr C_ReadByte
    sta ME_Transpose
    jmp C_B28_0cb9

C_B28_0d33:
    tya
    and #%10110000
    cmp #$b0
    bne C_B28_0d52

; Command B0-BF, set notelength and play note
C_B28_0d3a:
    tya
    and #%00001111
    clc
    adc ME_NoteLengthOffset
    tay
    lda C_Tempo_Lengths, y
    sta MusicChannel_NewNoteLength, x
    tay
    txa
    cmp #2
    beq C_B28_0d06
    C_B28_0d4e:
    jsr C_ReadByte
    tay
; Play note
    C_B28_0d52:
    tya
    sta unk_7c3, x
    txa
    cmp #3
    beq C_B28_0d03
    pha
    ldx unk_be
    lda C_B28_0fea+1, y
    beq C_B28_0d87
    lda ME_Transpose
    bpl C_B28_0d73
    and #$7f
    sta unk_b3
    tya
    clc
    sbc unk_b3
    jmp C_B28_0d78

C_B28_0d73:
    tya
    clc
    adc $0790
    C_B28_0d78:
    tay

    lda C_B28_0fea+1, y
    sta currptr_pulse0, x
    lda C_B28_0fea, y
    ora #$08
    sta currptr_pulse0+1, x

    C_B28_0d87:
    tay
    pla
    tax
    tya
    bne C_B28_0d9c
    lda #0
    sta unk_b0
    txa
    cmp #2
    beq C_B28_0da1
    lda #$10
    sta unk_b0
    bne C_B28_0da1
    C_B28_0d9c:
    lda ME_Envelopes1, x
    sta unk_b0
    C_B28_0da1:
    txa
    dec unk_7c8, x
    cmp unk_7c8, x
    beq C_B28_0de7
    inc unk_7c8, x
    ldy unk_be
    txa
    cmp #2
    beq C_B28_0dc7
    lda ME_Envelopes0, x
    and #$1f
    beq C_B28_0dc7
    lda unk_b0
    cmp #$10
    beq C_B28_0dc9
    and #$f0
    ora #0
    bne C_B28_0dc9
    C_B28_0dc7:
    lda unk_b0
    C_B28_0dc9:
    sta SQ1_VOL, y
    lda UNK_7C0, x
    sta SQ1_SWEEP, y

    lda currptr_pulse0, y
    sta SQ1_LO, y
    lda currptr_pulse0+1, y
    sta SQ1_HI, y

    C_B28_0dde:
    lda MusicChannel_NewNoteLength, x
    sta MusicChannel_NoteLengthCounter, x
    jmp C_B28_0c88

C_B28_0de7:
    inc unk_7c8, x
    jmp C_B28_0dde

; Set triangle note length
C_B28_0ded:
    lda ME_Envelopes0+2
    and #%00011111
    bne C_B28_0e11
    lda ME_Envelopes0+2
    and #%11000000
    bne C_B28_0dfe
    C_B28_0dfb:
    tya
    bne C_B28_0e06
    C_B28_0dfe:
    cmp #$c0
    beq C_B28_0dfb
    lda #$ff
    bne C_B28_0e11
    C_B28_0e06:
    clc
    adc #$ff
    asl a
    asl a
    cmp #$3c
    bcc C_B28_0e11
    lda #$3c
    C_B28_0e11:
    sta ME_Envelopes1+2
    jmp C_B28_0d4e

; Play noise note
C_B28_0e17:
    tya
    pha
    jsr C_B28_0e3e
    pla
    and #$3f
    tay
    jsr C_B28_0e26
    jmp C_B28_0dde

C_B28_0e26:
    lda soundactive_noise
    bne @exit
    lda C_Noise_Instruments, y
    sta NOISE_VOL
    lda C_Noise_Instruments+1, y
    sta NOISE_LO
    lda C_Noise_Instruments+2, y
    sta NOISE_HI
    @exit:
    rts

C_B28_0e3e:
    tya
    and #%11000000
    cmp #%01000000 ;is kick
    beq C_B28_0e4a
    cmp #%10000000 ;is snare
    beq C_B28_0e54
    rts

C_B28_0e4a:
    ;kick drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen sample_kick, B30_0071
    ldy #dmc_sampleaddr sample_kick
    beq C_B28_0e5c
    C_B28_0e54:
    ;snare drum
    lda #$0e
    sta unk_b1
    lda #dmc_samplelen sample_snare, B30_0171
    ldy #dmc_sampleaddr sample_snare
    C_B28_0e5c:
    sta DMC_LEN
    sty DMC_START
    lda disable_dmc
    bne @exit
    lda unk_b1
    sta DMC_FREQ
    lda #$0f
    sta SND_CHN
    lda #$00
    sta DMC_RAW
    lda #$1f
    sta SND_CHN
    @exit:
    rts

C_ReadByte:
    ldy MusicChannel_Counter, x
    inc MusicChannel_Counter, x
    lda (unk_b6), y
    rts

; Volume Envelope Table
C_Volume_Envelope_Table:
    .addr C_Volume_Envelope_0
    .addr C_Volume_Envelope_1
    .addr C_Volume_Envelope_2
    .addr C_Volume_Envelope_3
    .addr C_Volume_Envelope_4
    .addr C_Volume_Envelope_5
    .addr C_Volume_Envelope_6
    .addr C_Volume_Envelope_7
    .addr C_Volume_Envelope_8
    .addr C_Volume_Envelope_9
    .addr C_Volume_Envelope_10
    .addr C_Volume_Envelope_11
    .addr C_Volume_Envelope_12
    .addr C_Volume_Envelope_13
    .addr C_Volume_Envelope_14
    .addr C_Volume_Envelope_15
    .addr C_Volume_Envelope_16
    .addr C_Volume_Envelope_17
    .addr C_Volume_Envelope_18
    .addr C_Volume_Envelope_19
    .addr C_Volume_Envelope_20
    .addr C_Volume_Envelope_21
    .addr C_Volume_Envelope_22
    .addr C_Volume_Envelope_23
    .addr C_Volume_Envelope_24
    .addr C_Volume_Envelope_25
    .addr C_Volume_Envelope_26
    .addr C_Volume_Envelope_27
    .addr C_Volume_Envelope_28
    .addr C_Volume_Envelope_29
    .addr C_Volume_Envelope_30

; Envelope divider/volume table
C_Volume_Envelope_21:   .byte $76,$11,$11,$14,$31,$ff
C_Volume_Envelope_26:   .byte $33,$45,$66,$ff
C_Volume_Envelope_25:    .byte $43,$33,$22,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_24:    .byte $23,$33,$32,$22,$22,$22,$FF
C_Volume_Envelope_23:    .byte $98,$76,$63,$22,$87,$76,$53,$11,$F0
C_Volume_Envelope_6:    .byte $23,$56,$78,$88,$88,$87,$FF
C_Volume_Envelope_0:    .byte $23,$34,$56,$77,$65,$54,$FF
C_Volume_Envelope_1:    .byte $5A,$98,$88,$77,$66,$66,$65,$55,$55,$FF
C_Volume_Envelope_22:    .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$76,$54,$32,$FF
C_Volume_Envelope_27:    .byte $11,$11,$22,$FF
C_Volume_Envelope_2:    .byte $11,$11,$22,$22,$33,$33,$44,$44,$44,$45,$55,$55,$55,$66,$66,$77,$78,$88,$FF
C_Volume_Envelope_3:    .byte $F9,$87,$77,$77,$66,$65,$55,$44,$FF
C_Volume_Envelope_28:    .byte $C8,$76,$66,$66,$55,$55,$55,$44,$FF
C_Volume_Envelope_4:    .byte $A8,$76,$FF
C_Volume_Envelope_9:    .byte $74,$32,$FF
C_Volume_Envelope_5:    .byte $99,$FF
C_Volume_Envelope_7:    .byte $DC,$BA,$99,$88,$87,$76,$55,$44,$FF
C_Volume_Envelope_8:    .byte $23,$44,$33,$33,$33,$33,$33,$32,$FF
C_Volume_Envelope_10:    .byte $77,$76,$65,$55,$44,$43,$32,$22,$11,$11,$11,$11,$F0
C_Volume_Envelope_11:    .byte $54,$43,$33,$33,$32,$22,$22,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_12:    .byte $43,$33,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_13:    .byte $32,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_14:    .byte $21,$11,$11,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_15:    .byte $99,$88,$77,$76,$66,$55,$54,$44,$33,$33,$33,$32,$22,$22,$22,$22,$21,$11,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_18:    .byte $65,$55,$54,$44,$33,$33,$33,$33,$22,$22,$22,$22,$11,$11,$11,$11,$11,$11,$11,$11,$F0
C_Volume_Envelope_20:    .byte $FB,$BA,$AA,$99,$99,$99,$98,$88,$77,$77,$77,$66,$66,$66,$55,$54,$44,$44,$43,$33,$33,$22,$22,$22,$22,$11,$11,$11,$F0
C_Volume_Envelope_16:    .byte $23,$45,$55,$44,$33,$33,$22,$FF
C_Volume_Envelope_17:    .byte $87,$65,$43,$21,$44,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
C_Volume_Envelope_19:    .byte $66,$65,$42,$21,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
C_Volume_Envelope_29:    .byte $A8,$75,$43,$21,$43,$33,$21,$11,$32,$21,$11,$11,$21,$11,$11,$11,$11,$11,$11,$FF
C_Volume_Envelope_30:    .byte $12,$33,$33,$34,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$22,$FF

;;???? what are these LOL
C_B28_0fea:
.byte $07,$F0,$00,$00,$06,$AE,$06,$4E,$05,$F3,$05,$9E,$05,$4D,$05,$01
.byte $04,$B9,$04,$75,$04,$35,$03,$F8,$03,$BF,$03,$89,$03,$57,$03,$27
.byte $02,$F9,$02,$CF,$02,$A6,$02,$80,$02,$5C,$02,$3A,$02,$1A,$01,$FC
.byte $01,$DF,$01,$C4,$01,$AB,$01,$93,$01,$7C,$01,$67,$01,$52,$01,$3F
.byte $01,$2D,$01,$1C,$01,$0C,$00,$FD,$00,$EE,$00,$E1,$00,$D4,$00,$C8
.byte $00,$BD,$00,$B2,$00,$A8,$00,$9F,$00,$96,$00,$8D,$00,$85,$00,$7E
.byte $00,$76,$00,$70,$00,$69,$00,$63,$00,$5E,$00,$58,$00,$53,$00,$4F
.byte $00,$4A,$00,$46,$00,$42,$00,$3E,$00,$3A,$00,$37,$00,$34,$00,$31
.byte $00,$2E,$00,$2B,$00,$29,$00,$0A,$00,$01

C_Tempo_Lengths:
    C_NLT_00:
    .byte $04,$08,$10,$20,$40,$18,$30,$0c
    .byte $0a,$05,$02,$01
    C_NLT_0C:
    .byte $05,$0a,$14,$28,$50,$1e,$3c,$0f
    .byte $0c,$06,$03,$02
    C_NLT_18:
    .byte $06,$0c,$18,$30,$60,$24,$48,$12
    .byte $10,$08,$03,$01,$04,$02,$00,$90
    C_NLT_28:
    .byte $07,$0e,$1c,$38,$70,$2a,$54,$15
    .byte $12,$09,$03,$01,$02
    C_NLT_NEW:
    .byte $07,$0F,$1E,$3C,$78,$2D,$5A,$16
    .byte $14,$0A,$03,$01,$08
    C_NLT_35:
    .byte $08,$10,$20,$40,$80,$30,$60,$18
    .byte $15,$0a,$04,$01,$02,$c0
    C_NLT_43:
    .byte $09,$12,$24,$48,$90,$36,$6c,$1b
    .byte $18
    C_NLT_4C:
    .byte $0a,$14,$28,$50,$a0,$3c,$78,$1e
    .byte $1a,$0d,$05,$01,$02,$17
    C_NLT_5A:
    .byte $0b,$16,$2c,$58,$b0,$42,$84,$21
    .byte $1d,$0e,$05,$01,$02,$17

C_Music_Table_Ids:
.res $18, 0

C_Music_Table_2_Ids:
.res $1c, 0

;song header
C_Music_Table:
.byte $00
.byte $28
.addr credits_mus_table_2
.addr credits_mus_table_1
.addr credits_mus_table_3
.addr credits_mus_table_4

;song header
C_Path_To_Giegue_BGM_header:
.byte $00
.byte $18
.addr credits2_mus_table_1
.addr credits2_mus_table_2
.addr credits2_mus_table_3
.addr credits2_mus_table_4

credits_phrase_14:
.byte $9F,$B3,$B1
.byte $B4,$5A
.byte $B3,$64,$62
.byte $B4,$5A
.byte $B3,$50,$4C
.byte $B4,$4C
.byte $B3,$48,$46
.byte $B4,$46,$50
.byte $00

credits_phrase_1:
.byte $9F,$0E,$B1
.byte $B3,$34,$42,$54,$50,$32,$42
.byte $B4,$4A
.byte $B3,$30,$42
.byte $B4,$50
.byte $B3,$2E,$38
.byte $B4,$40
.byte $00

credits_phrase_2:
.byte $C8
    .byte $B4,$02
.byte $FF
.byte $00

credits_phrase_3:
.byte $C8
    .byte $B4,$01
.byte $FF
.byte $00

credits_phrase_4:
.byte $9C,$8D
.byte $00

credits_phrase_5:
.byte $9F,$13,$B5
.byte $B2,$68,$6C,$70,$76
.byte $B4,$6C
.byte $B2,$80,$7E,$7A,$70
.byte $B4,$76
.byte $B2,$7A,$7E,$80
.byte $B3,$76
.byte $B6,$68
.byte $B2,$72,$70,$68
.byte $B4,$5E
.byte $B2,$02
.byte $B3,$62,$66,$68,$72
.byte $B2,$70,$72,$76,$70,$6C,$70,$72,$6C
.byte $B2,$62,$72,$70,$5E
.byte $B3,$6C,$66
.byte $B3,$68
.byte $9F,$0C,$B5
.byte $B2,$5E
.byte $9F,$0D,$B5
.byte $B2,$6C
.byte $9F,$0E,$B5
.byte $B4,$68,$02,$02,$00

credits_phrase_6:
.byte $9F,$10,$B5
.byte $B2,$68,$6C,$70,$76
.byte $B4,$6C
.byte $B2,$80,$7E,$7A,$70
.byte $B4,$76
.byte $B2,$7A,$7E,$80
.byte $B3,$76
.byte $B6,$68
.byte $B2,$72,$70,$68
.byte $B4,$5E
.byte $B2,$02
.byte $B3,$62,$66,$68,$72
.byte $B2,$70,$72,$76,$70,$6C,$70,$72,$6C
.byte $B2,$62,$72,$70,$5E
.byte $B3,$6C,$66
.byte $B3,$68
.byte $B2,$5E,$6C
.byte $B4,$68,$00

credits_phrase_7:
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58
.byte $5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46
.byte $4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66
.byte $9F,$0C,$B1
.byte $50,$5E,$02,$02
.byte $9F,$1A,$B1
.byte $B4,$58,$02,$02
.byte $00

credits_phrase_8:
.byte $9F,$0C,$B1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A
.byte $58,$02,$58,$5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E
.byte $66,$50,$58,$5E,$58,$46,$4E,$54,$5E,$42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits_phrase_9:
.byte $D0
    .byte $B4,$02
.byte $FF
.byte $00

credits_phrase_A:
.byte $9F,$A7,$F6
.byte $C3
    .byte $B3,$4A
    .byte $B2,$4C,$50
    .byte $B3,$50,$54
    .byte $B3,$46
    .byte $B2,$4A,$4C
    .byte $B3,$4A,$42
    .byte $B3,$42
    .byte $B2,$46,$3C
    .byte $B2,$40,$42,$46,$4A
    .byte $B3,$40,$3C
    .byte $B4,$38
.byte $FF
.byte $B3,$4A
.byte $B2,$50,$5A
.byte $B3,$54,$4C
.byte $B3,$50
.byte $B2,$46,$4C
.byte $B6,$4A
.byte $B1,$4A,$46
.byte $B3,$42
.byte $B2,$46,$4A
.byte $B3,$46,$3C,$42,$40,$42,$46
.byte $9F,$A7,$F3
.byte $B4,$4A
.byte $B3,$46,$50
.byte $B4,$4A,$46
.byte $9F,$09,$F2
.byte $B4,$46
.byte $00

credits_phrase_10:
.byte $9F,$A7,$B2
.byte $C2
    .byte $B1,$5A,$50,$4A,$42,$38,$42,$4A,$50,$5A,$54,$4C
    .byte $42,$3C,$42,$4C,$54,$58,$50,$46,$40,$38,$40,$46,$50,$50,$4A,$42
    .byte $38,$32,$38,$42,$4A,$50,$4A,$42,$3C,$36,$3C,$42,$4A,$4E,$46,$3C
    .byte $36,$2E,$36,$3C,$46,$50,$46,$40,$38,$2E,$38,$40,$46,$50,$4C,$46
    .byte $40,$38,$34,$2E,$28
.byte $FF
credits_phrase_15:
.byte $C2
    .byte $B0,$5A,$50,$4A,$42,$38,$42,$4A,$50
.byte $FF
.byte $C2
    .byte $5A,$54,$4C,$42,$3C,$42,$4C,$54
.byte $FF
.byte $C2
    .byte $58,$50,$46,$40,$38,$40,$46,$50
.byte $FF
.byte $C2
    .byte $50,$4A,$42,$38,$32,$38,$42,$4A
.byte $FF
.byte $50
.byte $4A,$42,$3C,$38,$32,$2A,$24,$20,$24,$2A,$32,$3C,$42,$4A,$50,$54
.byte $4E,$46,$42,$3C,$36,$2E,$2A,$24,$2E,$36,$3C,$42,$46,$4E,$54
.byte $C2
    .byte $50,$46,$40,$38,$2E,$38,$40,$46
.byte $FF
.byte $C2
    .byte $50,$4C,$46,$40,$38,$34,$2E,$28
.byte $FF
.byte $00

credits_phrase_11:
.byte $9F,$A9,$B2
.byte $C2
    .byte $B2,$5A,$50,$4A,$50,$5A,$4C,$46,$4C
.byte $FF
.byte $9F,$0E,$B1
.byte $5A,$4C,$46,$4C
.byte $00

credits_phrase_12:
.byte $C2
    .byte $B4,$42,$34,$38,$42,$3C,$46,$38
    .byte $B3,$38,$34
.byte $FF
.byte $B3,$2A
.byte $B2,$2E,$32
.byte $B3,$34,$1C
.byte $B3,$20
.byte $B2,$28,$2E
.byte $B6,$2A
.byte $B2,$28,$24,$20
.byte $B3,$1E
.byte $B4,$2E,$20
.byte $B3,$38,$34
.byte $B3,$42
.byte $B2,$46,$4A
.byte $B3,$4C,$34
.byte $B3,$38
.byte $B2,$40,$46
.byte $B6,$42
.byte $B2,$40,$3C,$38
.byte $B3,$36
.byte $B4,$2E,$20,$32,$2A,$26,$2A,$26,$26
.byte $00

credits_phrase_13:
.byte $C7
    .byte $B3,$41,$04
    .byte $B5,$41
    .byte $B1,$04
    .byte $B3,$07
.byte $FF
.byte $B3,$41
.byte $B5,$81
.byte $B0,$41,$41
.byte $B1,$81,$41,$01,$41,$01,$41,$81,$01
.byte $C8
    .byte $B2,$44,$04,$81,$04
    .byte $B1,$04,$41,$44,$01
    .byte $B2,$81,$04
.byte $FF
.byte $C4
    .byte $B3,$01,$04
.byte $FF
.byte $00


credits_mus_table_1:
    .addr credits_phrase_6
    .addr credits_phrase_1B
    .addr credits_phrase_14
    .addr credits_phrase_A
    .addr credits_phrase_6
    .addr credits_phrase_5
    .addr 0

credits_mus_table_2:
    .addr credits_phrase_8
    .addr credits_phrase_1A
    .addr credits_phrase_1
    .addr credits_phrase_10
    .addr credits_phrase_15
    .addr credits_phrase_11
    .addr credits_phrase_4
    .addr credits_phrase_8
    .addr credits_phrase_7

credits_mus_table_3:
    .addr credits_phrase_19
    .addr credits_phrase_18
    .addr credits_phrase_2
    .addr credits_phrase_12
    .addr credits_phrase_9
    .addr credits_phrase_9

credits_mus_table_4:
    .addr credits_phrase_16
    .addr credits_phrase_17
    .addr credits_phrase_3
    .addr credits_phrase_13
    .addr credits_phrase_16
    .addr credits_phrase_16
    .addr credits_phrase_16

credits_phrase_1B:
.byte $9F,$10,$B1
.byte $C2
    .byte $B2,$50,$54,$58,$5E
    .byte $B4,$54
    .byte $B2,$68,$66,$62,$58
    .byte $B4,$5E
    .byte $B2,$62,$66,$68
    .byte $B3,$5E
    .byte $B6,$50
    .byte $B2,$5A,$58,$50
    .byte $B4,$46
    .byte $B2,$02
    .byte $B3,$4A,$4E,$50,$5A
    .byte $B2,$58,$5A,$5E,$58,$54,$58,$5A,$54
    .byte $B2,$4A,$5A,$58,$46
    .byte $B3,$54,$4E
    .byte $B3,$50
    .byte $B2,$46,$54
    .byte $B4,$50
.byte $FF
.byte $00

credits_phrase_1A:
.byte $9F,$B4,$B1
.byte $B2,$5E,$70,$5E,$70,$62,$72,$62,$72,$62,$70,$62,$70,$5E,$70,$5E,$70,$62,$72,$62
.byte $B3,$5E
.byte $B2,$70,$5E,$70,$62,$72,$62
.byte $B3,$66
.byte $B2,$76,$66,$76,$62,$72,$62
.byte $B3,$72
.byte $B2,$62
.byte $B3,$72
.byte $B2,$5E,$70,$5E,$70,$5A,$6C,$5A,$6C,$62,$72,$62,$72,$66,$76,$66,$76,$68,$70,$76,$70,$80,$76,$70,$68
.byte $9F,$A9,$B2
.byte $B1,$46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42,$46,$42,$46,$40,$46,$40,$4A,$40,$46,$40
.byte $46,$40,$46,$40,$4A,$40,$46,$40,$46,$42,$46,$42,$4A,$42
.byte $B5,$46
.byte $B1,$40,$46,$40,$4A,$40
.byte $B5,$46
.byte $B1,$42,$46,$42,$4A,$42
.byte $B5,$46
.byte $B1,$3C,$46,$3C,$4A,$3C
.byte $B2,$46
.byte $B1,$4A,$42,$4A,$42,$4E,$42,$4E,$42,$50,$42,$50,$42,$54,$42,$54,$42,$58,$50,$46,$40,$50,$46,$40,$38
.byte $3C,$46,$4E,$46,$54,$4E,$46,$4E,$4A,$38,$4A,$38,$4A,$38,$4A,$38,$4E,$3C,$4E,$3C,$4E,$3C,$4E,$3C,$50
.byte $40,$50,$40,$50,$40,$50,$40,$50,$46,$40,$38,$46,$40,$38,$40
.byte $00

credits_phrase_19:
.byte $9F,$A0,$00
.byte $B4,$50,$5A
.byte $B4,$4A
.byte $B6,$40
.byte $B1,$40,$02
.byte $B6,$42
.byte $B4,$50
.byte $B2,$02
.byte $B6,$42
.byte $B4,$46
.byte $B2,$02
.byte $B3,$42,$46,$4A,$4E
.byte $B4,$50,$46
.byte $B4,$42,$46,$50
.byte $B6,$38
.byte $B2,$02
.byte $00

credits_phrase_18:
.byte $9F,$A0,$00
.byte $C2
    .byte $B4,$38,$42,$32,$28
    .byte $B6,$2A
    .byte $B4,$38
    .byte $B2,$02
    .byte $B6,$2A
    .byte $B4,$2E
    .byte $B2,$02
    .byte $B3,$2A,$2E,$32,$36
    .byte $B4,$38,$2E
    .byte $B4,$2A,$2E,$38,$20
.byte $FF
.byte $00

credits_phrase_16:
.byte $D0
    .byte $B4,$01
.byte $FF
.byte $00

credits_phrase_17:
.byte $C8
    .byte $B3,$01,$04
.byte $FF
.byte $C8
    .byte $B3,$01,$04
.byte $FF
.byte $B3,$01
.byte $B1,$25,$28,$2B,$2E
.byte $CF
    .byte $B1,$2E,$2E
    .byte $B2,$01
    .byte $B1,$25,$28,$2B,$2B
.byte $FF
.byte $00





credits2_mus_table_1:
.addr credits2_phrase_3
.addr credits2_phrase_C
.addr credits2_phrase_15
.addr credits2_phrase_16
@loop:
.addr credits2_phrase_17
.addr -1
.addr @loop

credits2_mus_table_2:
.addr credits2_phrase_4
.addr credits2_phrase_D
.addr credits2_phrase_E
.addr credits2_phrase_F
@loop:
.addr credits2_phrase_18
.addr -1
.addr @loop

credits2_mus_table_3:
.addr credits2_phrase_5
.addr credits2_phrase_6
.addr credits2_phrase_6
.addr credits2_phrase_9
.addr credits2_phrase_A
.addr credits2_phrase_9
.addr credits2_phrase_B
.addr credits2_phrase_10
.addr credits2_phrase_11
@loop:
.addr credits2_phrase_1
.addr -1
.addr @loop

credits2_mus_table_4:
.addr credits2_phrase_7
.addr credits2_phrase_8
.addr credits2_phrase_12
.addr credits2_phrase_13
.addr credits2_phrase_14
@loop:
.addr credits2_phrase_2
.addr -1
.addr @loop


credits2_phrase_1:
.byte $B4,$02,$02,$02,$02
.byte $00

credits2_phrase_2:
.byte $B4,$01,$01,$01,$01
.byte $00

credits2_phrase_3:
.byte $9F,$04,$13
.byte $C4
    .byte $B2,$02
    .byte $B5,$24,$28,$20
    .byte $B1,$02,$20
    .byte $B5,$28
    .byte $B2,$02
    .byte $B5,$24,$28
    .byte $B3,$1E,$20
.byte $FF
.byte $B4,$2C,$2C
.byte $B1,$2C,$2C,$02,$02
.byte $B3,$2C
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $B4,$2C,$2C
.byte $B1,$2C,$2C,$02,$02
.byte $B3,$2C
.byte $B1,$38
.byte $B5,$38
.byte $B1,$38
.byte $B4,$38
.byte $B5,$02
.byte $00

credits2_phrase_4:
.byte $9F,$04,$13
.byte $C4
    .byte $B1,$0C,$0C,$2C,$0C,$0C,$2E,$0C,$0C,$28,$0C,$0C,$0C,$28,$2E,$0C,$0C,$0C,$0C,$2C,$0C,$0C,$2E,$0C,$0C
    .byte $B3,$2E,$2E
.byte $FF
.byte $B4,$24,$22
.byte $B1,$1E,$1E,$02,$02
.byte $B3,$1E
.byte $B1,$02,$16,$10,$12,$24,$22,$20
.byte $B4,$1E
.byte $B1,$24
.byte $B4,$22
.byte $B1,$1E,$1E,$02,$02
.byte $B3,$1E
.byte $B1,$2E
.byte $B5,$32
.byte $B1,$28
.byte $B4,$2A
.byte $B5,$02
.byte $00

credits2_phrase_5:
.byte $9F,$A0,$00
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24
.byte $B3,$1E,$20
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$02,$4A,$54,$4A
.byte $B4,$3C
.byte $B3,$1E
.byte $BA,$46,$44,$42,$40,$3E,$3C,$3A,$38,$36,$34,$32,$30,$2E,$2C,$2A,$26
.byte $00

credits2_phrase_6:
.byte $9F,$00,$00
.byte $CC
    .byte $B1,$24,$24
.byte $FF
.byte $B8,$1E,$24,$2E,$20,$24,$2E
.byte $00

credits2_phrase_7:
.byte $C6
    .byte $B2,$01,$04
.byte $FF,$B1,$81,$41,$81,$81,$41,$81,$81,$41,$41,$01,$04,$01
.byte $C5
    .byte $B2,$01,$04
.byte $FF
.byte $C8
    .byte $B0,$81
.byte $FF
.byte $B1,$81,$41,$B0,$81,$81,$B1,$41
.byte $00

credits2_phrase_8:
.byte $C8
    .byte $44,$04,$84,$04,$44,$44,$84,$04
.byte $FF
.byte $C5,$B1,$44,$44,$84,$44
.byte $FF
.byte $44,$44
.byte $C4
    .byte $B0,$81
.byte $FF
.byte $B1,$81
.byte $C2
    .byte $84,$44,$44
.byte $FF
.byte $44
.byte $C5
    .byte $44,$44,$84,$44
.byte $FF
.byte $44,$44
.byte $C4
    .byte $B0,$81
.byte $FF
.byte $C2
    .byte $B1,$84,$44,$01,$01
.byte $FF
.byte $04,$01,$04,$01,$81,$41,$B0,$81,$41,$81,$41
.byte $00

credits2_phrase_9:
.byte $9F,$00,$00
.byte $C5
    .byte $B1,$1E
    .byte $B0,$1E,$36
.byte $FF
.byte $B1,$1E,$32,$32,$36,$32,$32,$32,$2E,$2E,$02
.byte $C2
    .byte $B1,$2E
    .byte $B0,$2E,$2E
.byte $FF
.byte $00

credits2_phrase_A:
.byte $B1,$02,$2E,$28,$2A,$3C,$3A,$38,$36
.byte $00

credits2_phrase_B:
.byte $9F,$A0,$00
.byte $B1,$28
.byte $B5,$2A
.byte $B1,$2E
.byte $B4,$32
.byte $BA,$32,$30,$2E,$2C,$2A,$28,$26,$24,$22,$20,$1E,$1C
.byte $00

credits2_phrase_C:
.byte $9F,$04,$13
.byte $B2,$02
.byte $B5,$24,$20,$28,$24
.byte $B1,$20,$24,$02,$02
.byte $B5,$24,$20
.byte $B4,$1A
.byte $B2,$02
.byte $B5,$24,$20,$28,$24
.byte $B1,$20,$24,$02,$02
.byte $B5,$24,$20
.byte $B3,$1A
.byte $B1,$2E,$2E,$2E,$2E
.byte $9F,$0D,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$04,$13
.byte $2E,$2E,$2E,$2E
.byte $9F,$0D,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$0C,$13
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $9F,$04,$13
.byte $B2,$12
.byte $B5,$36,$32,$38,$36
.byte $B1,$32,$36
.byte $B2,$16
.byte $B5,$36,$32
.byte $B4,$2A
.byte $9F,$A7,$F3
.byte $B2,$04
.byte $B5,$42,$40,$38
.byte $B3,$3C
.byte $B1,$02
.byte $B2,$08
.byte $B5,$42,$40,$46
.byte $B3,$3C
.byte $B1,$02
.byte $00

credits2_phrase_D:
.byte $9F,$04,$13
.byte $B1,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C,$2E,$0C,$0C,$2C,$0C,$0C,$28,$2C,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C
.byte $B4,$20
.byte $B1,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C,$2E,$0C,$0C,$2C,$0C,$0C,$28,$2C,$0C,$0C,$2C,$0C,$0C,$28,$0C,$0C
.byte $B3,$20
.byte $9F,$04,$13
.byte $B1,$06,$06,$06,$08
.byte $9F,$0D,$13
.byte $08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08,$08,$08
.byte $9F,$04,$13
.byte $B1,$06,$06,$06,$08
.byte $9F,$0D,$13
.byte $08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0D,$13
.byte $08,$08
.byte $9F,$0C,$13
.byte $24
.byte $9F,$0C,$13
.byte $08,$08,$08,$08
.byte $9F,$1D,$13
.byte $08,$08,$08,$08
.byte $00

credits2_phrase_E:
.byte $9F,$1D,$13
.byte $B1,$12,$12,$2E,$12,$12,$2A,$12,$12,$32,$12,$12,$2E,$12,$12,$2A,$2E,$16,$16,$2E,$16,$16,$2A,$16,$16,$24,$16,$16
.byte $B0,$16,$16
.byte $B1,$16
.byte $B0,$16,$16
.byte $9F,$04,$13
.byte $B1,$16,$1A
.byte $00

credits2_phrase_F:
.byte $9F,$B9,$B2
.byte $C4
    .byte $B0,$50,$46,$42,$46
.byte $FF
.byte $C2
    .byte $50,$46,$42,$38,$2E,$2A,$2E,$38
.byte $FF
.byte $C2
    .byte $50,$46,$50,$46,$42,$46,$50,$46
.byte $FF
.byte $C2
    .byte $50,$46,$42,$38,$2E,$2A,$2E,$38
.byte $FF
.byte $9F,$BE,$F1
.byte $B2,$4A,$4E
.byte $B1,$54
.byte $B5,$58
.byte $B2,$5C,$54
.byte $B1,$4E
.byte $B5,$54
.byte $9F,$B0,$F2
.byte $B5,$54
.byte $B3,$54
.byte $B1,$02
.byte $B5,$54
.byte $B3,$54
.byte $B1,$02
.byte $9F,$A9,$F2
.byte $B4,$2C,$02
.byte $9F,$AF,$B1
.byte $B3,$3C,$44,$38,$44
.byte $9F,$AE,$B1
.byte $36,$44
.byte $9F,$AD,$B1
.byte $34,$44
.byte $9F,$AC,$B1
.byte $3C,$44,$38,$44,$36,$44
.byte $9F,$AD,$B1
.byte $34,$44
.byte $9F,$BC,$B2
.byte $B4,$4A
.byte $9F,$BC,$B1
.byte $32,$24
.byte $00

credits2_phrase_10:
.byte $9F,$A0,$00
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24,$24
.byte $B4,$24
.byte $B3,$3C
.byte $B1,$3C,$4A,$54,$4A
.byte $B4,$24
.byte $B3,$24
.byte $9F,$00,$00
.byte $B1,$1E,$1E,$1E,$20,$20,$38,$20,$20,$38,$20,$20,$20,$20,$20,$20,$20,$1E,$1E,$1E,$20,$20,$38,$20,$20,$38,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
.byte $00

credits2_phrase_11:
.byte $2A,$2A,$2A
.byte $B0,$2A,$2A
.byte $B1,$2A,$2A,$2A,$2A,$2A,$42
.byte $B0,$2A,$2A
.byte $B1,$2A,$2A,$2A,$2A
.byte $B0,$2A,$2A
.byte $C7
    .byte $B1,$2E
    .byte $B0,$2E,$2E
.byte $FF
.byte $B1,$2E,$32
.byte $9F,$A0,$00
.byte $B4,$34,$1C,$38,$20
.byte $9F,$A0,$00
.byte $B2,$36
.byte $B3,$32
.byte $B2,$02,$32
.byte $B3,$2E
.byte $B2,$02
.byte $B5,$2E
.byte $B3,$2A
.byte $B1,$02
.byte $B5,$28
.byte $B3,$26
.byte $B1,$02
.byte $B4,$24,$24
.byte $C4
    .byte $B4,$24,$3C
.byte $FF
.byte $24,$02,$02
.byte $00

credits2_phrase_12:
.byte $B2,$44,$04
.byte $C5
    .byte $01,$04
.byte $FF
.byte $B1,$81,$41,$81,$81,$41,$81,$81,$41,$41,$01,$04,$01
.byte $C5
    .byte $B2,$01,$04
.byte $FF
.byte $BA,$81,$81
.byte $C7
    .byte $B0,$81
.byte $FF
.byte $B1,$81,$41,$81,$81
.byte $00

credits2_phrase_13:
.byte $44,$44,$84,$44,$44,$04,$84,$44,$44,$04,$84,$04,$84,$44,$81,$81,$04,$44,$84,$44,$44,$04,$84,$44,$84,$44,$84,$44
.byte $BA,$81,$81
.byte $B0,$81,$81,$81
.byte $B1,$44
.byte $B0,$81,$28
.byte $B1,$44,$04,$84,$44,$44,$04,$84,$44,$04,$44,$84,$44,$04,$44,$84,$04,$44,$04,$84,$04,$44,$44,$84,$04
.byte $B0,$04,$01,$44,$41,$84,$01,$44,$2E,$04,$44,$04,$41,$44,$41,$44,$41
.byte $B0,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$28,$2E,$04,$2B,$28,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$84,$2E
.byte $84,$2B,$44,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$01,$2B,$28,$2E,$04,$2B,$28,$2E,$44,$2B,$28,$2E,$04,$2B,$28,$2E,$81
.byte $41,$25,$81,$41,$44,$84,$2E
.byte $00

credits2_phrase_14:
.byte $44,$2B,$2E,$2B,$44,$2B,$2E,$2B,$2E,$2B,$2E,$2B,$04,$2B,$2E,$28,$44,$2B,$2E,$2B,$44,$2B,$2E,$2B,$28,$2B,$2E,$2B,$28,$81,$84,$81
.byte $B1,$44,$04,$81,$44,$01,$41,$81,$01,$44,$04,$81,$44,$01
.byte $B0,$41,$41
.byte $B2,$81
.byte $B0,$44,$25,$25,$28,$28,$28,$28,$2B,$2B,$2B,$2B,$2B,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E
.byte $00

credits2_phrase_15:
.byte $9F,$0D,$F1
.byte $C4
    .byte $B0,$54,$3C,$54,$54,$3C,$54,$3C,$3C
.byte $FF
.byte $9F,$04,$15
.byte $B5,$16
.byte $B3,$12
.byte $B1,$02
.byte $B5,$10
.byte $B3,$0E
.byte $B1,$02
.byte $9F,$1D,$12
.byte $B4,$0C
.byte $9F,$A9,$B1
.byte $B4,$24,$9E,$35
.byte $9F,$BC,$B1
.byte $B4,$4A,$54,$4A,$54
.byte $B4,$4A,$54,$4A,$54,$24,$24,$02
.byte $00

credits2_phrase_16:
.byte $9F,$0F,$F1
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E,$68,$42,$50,$5A,$4E,$02,$54,$5E,$66
.byte $9F,$0E,$F1
.byte $42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46,$4E,$54,$5E
.byte $9F,$0D,$F1
.byte $42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits2_phrase_17:
.byte $B2,$50,$58,$5E,$68,$42,$50,$5A,$62,$4A,$50,$58,$62,$40,$4E,$58,$5E,$42,$50,$5A,$58,$02,$58,$5E
.byte $68,$42,$50,$5A,$4E,$02,$54,$5E,$66,$42,$5A,$46,$5E,$4A,$62,$4E,$66,$50,$58,$5E,$58,$46,$4E,$54
.byte $5E,$42,$50,$5A,$50,$46,$54,$5E,$66,$50,$5E,$02,$02,$70,$68,$5E,$58
.byte $00

credits2_phrase_18:
.byte $9F,$BF,$B0
.byte $B2,$50,$54,$58,$5E
.byte $B6,$54
.byte $B2,$02
.byte $B2,$68,$66,$62,$58
.byte $B3,$5E,$02
.byte $B2,$62,$66,$68
.byte $B3,$5E
.byte $B6,$50
.byte $B2,$5A,$58,$50
.byte $B4,$46
.byte $B2,$02
.byte $B3,$4A,$4E,$50,$5A
.byte $B2,$58,$5A,$5E,$58,$54,$58,$5A,$54
.byte $B2,$4A,$5A,$58,$46
.byte $B3,$54,$4E
.byte $B3,$50
.byte $B2,$46,$54
.byte $B3,$50,$02
.byte $00
