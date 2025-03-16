; zeropage variables
input_wordvar           = $2a       ; 16-bit var often used to "input" values for use in upcoming functions

tableentry_var          = $40       ; area in zpage ram where table entry's data is often stored (but can be used for other purposes, ofc)

temp_vars               = $60       ; area in zpage ram where temp vars are stored
temp_word               = $60       ; different label when $60 being used as a word (16-bit)
    temp_word_lo        = $60
    temp_word_hi        = $61

.segment        "PRG13": absolute

; Overworld Menu Bank / Engine
OM_OPEN_FULLSTATS:
    lda #$05
    sta soundqueue_pulseg0
SelectOpenFullStats:
    lda learned_melodies
    sta temp_vars
    ldy #$f0
:   lda #$a5            ; --
    lsr temp_vars
    bcc :+              ; +
    lda #$96
:   sta BATTLER, y      ; +
    iny
    cpy #$f8
    bcc :--             ; --
    lda #$00
    sta BATTLER, y
    B19_0021:
    ldx #$00
    B19_0023:
    jsr B30_19f1
    bcs B19_0084
    jsr GetPartyMemberData
    txa
    pha
    ldy #$3f
:   lda (temp_vars), y
    sta BATTLER, y
    dey
    bpl :-
    ldx #$80
    ldy #$28
:   lda BATTLER, y
    sta $29
    jsr B19_008f
    iny
    cpy #$2c
    bcc :-
    jsr B30_03e6
    lda #$f5
    ldx #$a0
    jsr B19_0c44
    lda #$c0
    sta $29
    jsr B19_00b3
    lda #.LOBYTE(B19_0119)
    ldx #.HIBYTE(B19_0119)
    sta $80
    stx $81
    jsr B31_0f34
    B19_0064:
    bit $83
    bvs B19_008b
    lda $82
    beq B19_0082
    jsr B19_00b3
    bcs B19_0074
    jsr B19_00b3
    B19_0074:
    ldx #$0a
    ldy #$03
    stx $76
    sty $77
    jsr B31_0f7c
    jmp B19_0064

B19_0082:
    pla
    tax
B19_0084:
    inx
    cpx #$04
    bcc B19_0023
    bcs B19_0021
B19_008b:
    pla
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_008f:
    tya
    pha
    txa
    pha
    jsr GetItemDataPointer
    ldy #$00
    lda (temp_vars), y
    sta $64
    iny
    lda (temp_vars), y
    sta $65
    pla
    tax
    ldy #$00
    B19_00a5:
    lda ($64), y
    sta BATTLER, x
    inx
    iny
    cpy #$10
    bcc B19_00a5
    pla
    tay
    rts

B19_00b3:
    ldx #$40
B19_00b5:
    stx $68
    jsr B30_1ccd
    ldx $68
    and BATTLER, y
    beq B19_00c4
    jsr B19_008f
    B19_00c4:
    inc $29
    bne B19_00e1
    lda #$c0
    sta $29
    cpx #$41
    bcs B19_00db
    rts

B19_00d1:
    lda #$00
    sta BATTLER, x
    clc
    txa
    adc #$10
    tax
B19_00db:
    cpx #$80
    bcc B19_00d1
    bcs B19_00e5
B19_00e1:
    cpx #$80
    bcc B19_00b5
B19_00e5:
    lda #$fe
    ldx #$a0
    sta $74
    stx $75
B19_00ed:
    jsr B30_06db
    cmp #$00
    bne B19_00ed
    rts

B19_00f5:
    .byte $20,$0b,$03,$23,$38,$06,$00,$07
    .byte $00,$20,$13,$05,$23,$40,$06,$00
    .byte $0b,$01,$23,$50,$06,$00,$0b,$01
    .byte $23,$60,$06,$00,$0b,$01,$23,$70
    .byte $06,$00,$0b,$00

; UNKNOWN
B19_0119:
    .byte $02,$01
    .byte $09       ; X
    .byte $00       ; Y
    .byte %11000101 ; Input mask
    .byte $3a       ; Tile
    .byte $0a,$03
    .addr B31_10d1

B19_0123:
    lda #$80
    bit $d4
    bne B19_0167
    ldx $d2
    ldy $d1
    cpx #$06
    bcc B19_0167
    cpy #$90
    bcc B19_0167
    ora $d4
    sta $d4
    lda #$2f
    jsr B30_0de4
    ldx #$7c
    jsr DisplayText
    ldx #$7e
    jsr DisplayText
    ldx #$80
    jsr DisplayText
    lda #$37
    sta $2c
    jsr B19_0dc1
    bit $83
    bvs B19_0168
    lda $82
    beq B19_0168
    jsr B19_1e57
    ldx #$86
    jsr DisplayText
    jmp OINST_Reset
B19_0167:
    rts

B19_0168:
    ldx #$82
    jsr DisplayText
    ldx #$84
    jsr DisplayText
    jsr OINST_END
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_0178:
    lda #$05
    sta soundqueue_pulseg0
    jsr B30_026c
    lda #.LOBYTE(B19_01b0)
    ldx #.HIBYTE(B19_01b0)
    sta $80
    stx $81
    jsr B31_0f34
    bit $83
    bmi B19_0192
    jmp CLEAR_TEXTBOXES_ROUTINE
    B19_0192:
    lda #$ff
    jsr B31_10b0
    lda $82
    asl a
    tax
    lda B19_01a4+1, x
    pha
    lda B19_01a4  , x
    pha
    rts

B19_01a4:
    .addr B19_01ea-1 ; 00 - TALK
    .addr B19_020f-1 ; 01 - CHECK
    .addr B19_0262-1 ; 02
    .addr SelectOpenFullStats-1 ; 03
    .addr B19_0238-1 ; 04
    .addr B19_01ba-1 ; 05

; UNKNOWN
B19_01b0:
    .byte $02,$03
    .byte $06       ; X
    .byte $02       ; Y
    .byte %11000000 ; Input mask
    .byte $3a       ; Tile
    .byte $02,$03
    .addr B31_10d1

B19_01ba:
    lda #25
    ldx #.LOBYTE(B25_036e-1)
    ldy #.HIBYTE(B25_036e-1)
    jsr TempUpperBankswitch
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_01c6:
    jsr B31_0266
    bcs B19_01e4
    jsr B19_09c7
    beq B19_01e9
    asl a
    asl a
    bcc B19_01e9
    and #$0F<<2
    beq B19_01e9
    lda #$35 ; Interaction type: TOUCH
    sta $34
    jsr B19_0b0f
    bcs B19_01e9
    B19_01e1:
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_01e4:
    jsr B19_0b48
    bcc B19_01e1
B19_01e9:
    rts

B19_01ea:
    jsr B31_020f
    asl a
    bpl B19_0200
    and #$0F<<1
    beq B19_0204
    jsr B31_02a2
    lda #$0a ; Interaction type: TALK
    sta $34
    jsr B19_0b0f
    bcc B19_020c
    B19_0200:
    ldx #$02
    bne B19_0206
    B19_0204:
    ldx #$04
    B19_0206:
    jsr DisplayText
    jsr OINST_END
    B19_020c:
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_020f:
    jsr B31_020f
    jsr B19_09c7
    bne B19_021d
    jsr B19_09d6
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_021d:
    asl a
    bpl B19_022d
    and #$0F<<1
    beq B19_022d
    lda #$0b
    sta $34 ; Interaction type: CHECK
    jsr B19_0b0f
    bcc B19_0235
    B19_022d:
    ldx #$06
    jsr DisplayText
    jsr OINST_END
    B19_0235:
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_0238:
    jsr B19_18e6
    bcc B19_0240
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_0240:
    jsr OA_End
    ldy #$07
    lda (temp_vars), y
    sta $43
    sec
    ldy #$16
    lda (tableentry_var), y
    sbc $43
    iny
    lda (tableentry_var), y
    sbc #$00
    bcc B19_025d
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine
    B19_025d:
    ldx #$10
    jmp DisplayTextAndFinishRoutine

B19_0262:
    jsr B19_17b6
    bcc B19_026a
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_026a:
    jsr B30_03c7
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    beq B19_0281
    lda $29
    cmp #$03
    beq B19_0281
    lda #$a2
    ldx #$a2
    bne B19_0285
    B19_0281:
    lda #$d1
    ldx #$f0
    B19_0285:
    sta $84
    stx $85
    lda #$9a
    ldx #$a2
    sta $80
    stx $81
    jsr B31_0f3f
    bit $83
    bmi B19_02a7
    bpl B19_0262

B19_029a:
    .byte $01,$05,$00,$02,$c0,$3a,$18,$07
    .byte $00,$00,$03,$04,$00

B19_02a7:
    lda #$ff
    jsr B31_10b0
    jsr OA_End
    lda $82
    asl a
    tax
    lda ItemSelectionMenuLUT+1, x
    pha
    lda ItemSelectionMenuLUT, x
    pha
    rts

ItemSelectionMenuLUT:
    .addr SELECTION_USE-1
    .addr SELECTION_EAT-1
    .addr SELECTION_GIVE-1
    .addr SELECTION_DROP-1
    .addr SELECTION_LOOK-1

SELECTION_USE:
    ldy #$03
    lda (temp_vars), y
    bne SELECTION_Equip
    ldy #$02
    lda (temp_vars), y
    and #$3f
    beq @UselessItemUse
    ldx $28
    and PlayerUsableBitfieldLUT, x
    beq @CannotUseItem
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine

@UselessItemUse:
    ldx #$16                        ; "[Name] used the [Item]."
    jsr DisplayText
    jsr OA_NothingHappened
    jmp FinishedTextboxRoutine

@CannotUseItem:
    ldx #$18                        ; "[Name] can't use the [Item]."
    jmp DisplayTextAndFinishRoutine

SELECTION_Equip:
    sta $62
    ldy #$02
    lda (temp_vars), y
    ldx $28
    and PlayerUsableBitfieldLUT, x
    beq @CannotEquipItem
    jsr EquipItemRoutine
    bcs @CannotEquipItem
    ldx #$1c                        ; "[Name] equipped the [Item]."
    jsr DisplayText
    lda #Triangle_Equip
    sta soundqueue_triangle
    jmp FinishedTextboxRoutine
@CannotEquipItem:
    ldx #$1e                        ; "[Name] can't equip the [Item]."
    jmp DisplayTextAndFinishRoutine

SELECTION_GIVE:
    ldx pc_count
    dex
    beq @GiveFail
    lda $29
    cmp #$03            ; bread crumbs id
    beq @CantGiveItem
    jsr PromptWho
    bcs @CancelGive
    jsr IsTargetInventoryFull
    bcs @ReceiverFull
    jsr RemoveItem
    cmp $42
    beq @ReceiverWeird
    jsr PlayerStatusCheck
    bne @GiverIsDead
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bne @AliveToDead

; @AliveToAlive ; (1 person to another)
    ldx #$24
    jmp DisplayTextAndFinishRoutine

@AliveToDead:
    ldx #$4c
    jmp DisplayTextAndFinishRoutine

@GiverIsDead:
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bne @DeadToDead
; @DeadToAlive
    ldx #$4e
    jmp DisplayTextAndFinishRoutine

; funky logic where this location gets jumped to in 2 different locations
; parses between player giving item to self (when the target is alive)
; or giving between dead to dead (when the target is dead)
@ReceiverWeird:
    jsr PlayerStatusCheck
    bne @DeadToDead
; @GiveToSelf
    ldx #$50
    jmp DisplayTextAndFinishRoutine

@DeadToDead:
    ldx #$52
    jmp DisplayTextAndFinishRoutine

; used by bread crumbs only in vania
@CantGiveItem:
    ldx #$26
    jmp DisplayTextAndFinishRoutine

@ReceiverFull:
    lda $28
    cmp $42
    beq @ReceiverWeird
; @ReceiverFull
    ldx #$28
    jmp DisplayTextAndFinishRoutine

@GiveFail:
    ldx #$0c                            ; "You don't have any friends to give items to yet."
    jmp DisplayTextAndFinishRoutine
@CancelGive:
    jmp B19_026a

SELECTION_EAT:
; bittest if item is edible
    ldy #$02
    lda (temp_vars), y
    and #$40
    beq :+
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine
; @ItemNotEdible
:   ldx #$1a                            ; item isnt edible msg
    jmp DisplayTextAndFinishRoutine

SELECTION_DROP:
    jsr TryDropItem
    bcs @DropItemFailed
    jsr PlayerStatusCheck
    bne @OwnerDead
; @Owner Alive
    ldx #$20                            ; threw away item msg
    jmp DisplayTextAndFinishRoutine
@OwnerDead:
    ldx #$54                            ; Leader threw out someone else's item msg
    jmp DisplayTextAndFinishRoutine
; when item is a key item
@DropItemFailed:
    ldx #$22                            ; item is a key msg
    jmp DisplayTextAndFinishRoutine

SELECTION_LOOK:
    clc
    lda $29
    adc #$e8
    sta $74
    lda #$00
    adc #$03
    sta $73
    jsr O_PrintText
    jmp FinishedTextboxRoutine

OverworldActionInterpreter:
    ldy #$04
    lda (temp_vars), y
    asl a
    tax
    lda OVERWORLD_ACTIONS_POINTERS+1, x
    pha
    lda OVERWORLD_ACTIONS_POINTERS, x
    pha
    rts

;the reason these are all -1 are because of NES accessing stuff. needs to be even or odd or whatever
OVERWORLD_ACTIONS_POINTERS:
.addr OA_NothingHappened-1              ; ID 00
.addr OA_INTERACT-1
.addr OA_NothingHappened-1
.addr OA_NothingHappened-1
.addr OA_NothingHappened-1
.addr OA_BREAD-1
.addr OA_TOFU-1
.addr OA_INTERACT-1                     ; ID 07 Phone Card

.addr OA_REPEL_RING-1
.addr OA_NothingHappened-1              ; ID 09 Debug (removed in US)
.addr OA_JUICE-1
.addr OA_FRIES-1
.addr OA_HERB-1
.addr OA_BURGER-1
.addr OA_SPORTS_DRINK-1
.addr OA_OINTMENT-1

.addr OA_BIG_BAG-1
.addr OA_ANTIDOTE-1
.addr OA_MOUTHWASH-1
.addr OA_PSI_STONE-1
.addr OA_RIBBON-1
.addr OA_CANDY-1
.addr OA_SPD_CAPSULE-1
.addr OA_WIS_CAPSULE-1

.addr OA_STR_CAPSULE-1
.addr OA_FCE_CAPSULE-1
.addr OA_FIT_CAPSULE-1
.addr OA_DIARY-1
.addr OA_NothingHappened-1
.addr OA_NothingHappened-1
.addr OA_HOOK-1
.addr OA_CRUMBS-1

.addr OA_FINAL_WEAPON-1
.addr OA_RULER-1
.addr OA_MAP-1
.addr OA_OCARINA-1
.addr OA_TriedUselessPSI-1
.addr OA25_TELEPATHY-1
.addr OA26_TELEPORT-1
.addr OA_LIFEUP_ALPHA-1

.addr OA_LIFEUP_BETA-1
.addr OA_LIFEUP_GAMMA-1
.addr OA_HEALING_GAMMA-1
.addr OA_TriedUselessPSI-1
.addr OA_HEALING_ALPHA-1
.addr OA_SUPER_HEALING-1
; ends at 2D

OA25_TELEPATHY:
    jsr PromptWhoConfirm
    jsr B31_020f
    asl a
    bpl OA_TriedUselessPSI
    and #$1E
    beq OA_TriedUselessPSI
    lda #$C
    sta $34
    jsr B19_0b0f
    bcs OA_TriedUselessPSI
    rts

; Probably some vestigial code. Completely unused in vanilla.
OA_TriedUselessPSI:
    ldx #$0E                    ; "[Name] tried [PSI]."
    jsr DisplayText
;   jmp OA_NothingHappened      ; fallthru

OA_NothingHappened:
    ldx #$2A                    ; "Nothing happened."
DisplayText:
    jsr ReadOverworldMessageLUT
    jmp O_PrintText

; prints "by NUM." msg, used for HP/PP recovery and stat booster items
; (2nd line of the msg)
OA_Print_ByNum:
    jsr ReadOverworldMessageLUT
    jmp B19_0d29

OA_INTERACT:
    jsr B31_020f
    asl a
    bpl OA_NothingHappened
    and #$1E
    beq OA_NothingHappened
    lda #$0D
    sta $34
    jsr B19_0b0f
    bcs OA_NothingHappened
    rts

OA_REPEL_RING:
    jsr OA_DeleteItemSelf
    jsr EnablePRGRam
    lda #$A
    sta repel_counter
    jsr WriteProtectPRGRam
    ldx #$16
    jmp DisplayText

OA_CRUMBS:
    jsr OA_DeleteItemSelf
    jsr EnablePRGRam
    ldy #$2C
:   lda (tableentry_var),y
    sta $73D8,y
    iny
    cpy #$30
    bcc :-
    jsr WriteProtectPRGRam
    lda #$40
    sta fade_flag
    lda #$01
    sta fade_type
    ldx #$48
    jmp DisplayText

OA_BREAD:
    lda menucursor_pos
    bne @BreadEat
; @BreadUse
    lda #$03
    jsr GetItemInventorySlot
    bcc @BreadUseFail
; @BreadUseSuccess
    lda $29
    jsr GetItemInventorySlot
    jsr EnablePRGRam
    lda #$03
    sta (temp_vars),y
    ldy #$2C
:   lda $73D8,y
    sta (tableentry_var),y
    iny
    cpy #$30
    bcc :-
    jsr WriteProtectPRGRam
    ldx #$44                    ; "[Name] used the bread."
    jmp DisplayText
@BreadUseFail:
    ldx #$46                    ; "You need to toss your old crumbs first!"
    jmp DisplayText
@BreadEat:
    lda #20
    jmp OA_Eat

OA_TOFU:
    lda menucursor_pos
    bne @TofuEat
    jmp OA_INTERACT
@TofuEat:
    lda #15                     ; HP Restore value
    jmp OA_Eat

OA_LIFEUP_ALPHA:
    lda #30
    jmp OA_TryLifeup
OA_LIFEUP_BETA:
    lda #80
    jmp OA_TryLifeup
OA_LIFEUP_GAMMA:
    jsr SetInputVar1000
    jmp DoLifeupRoutine
OA_JUICE:
    lda #10
    jmp OA_Drink
OA_FRIES:
    lda #20
    jmp OA_Eat
OA_HERB:
    lda #30
    jmp OA_Eat
OA_BURGER:
    lda #60
    jmp OA_Eat
OA_SPORTS_DRINK:
    lda #100
    jmp OA_Drink
OA_OINTMENT:
    jsr SetInputVar1000
    ldx #$16
    jmp OA_UseHPItem
OA_BIG_BAG:
    lda #$1E
    jsr STA_word60
    jsr PromptWho
    bcs CancelWho
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bmi OA_ConsumeItemUseless
    jsr OA_End
    ldx #$42
    jsr DisplayText
    jsr EnablePRGRam
    dec big_bag_uses
    php
    jsr WriteProtectPRGRam
    plp
    bne OVERWORLD_ACTION11_bne
    jsr RemoveItem
    ldx #$56
    jsr DisplayText
    OVERWORLD_ACTION11_bne:
    jmp OVERWORLD_ACTION11_jmp

OA_Drink:
    ldx #$2E
    bne SetVar_InputNum
OA_Eat:
    ldx #$2C
SetVar_InputNum:
    stx $74
    jsr STA_word60
    ldx $74
OA_UseHPItem:
    jsr ReadOverworldMessageLUT
    jsr PromptWho
    bcs CancelWho
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bmi OA_ConsumeItemUseless
    jsr OA_End
    jsr O_PrintText
    jsr RemoveItem
OVERWORLD_ACTION11_jmp:
    jsr RestoreHP
    jmp EndText
CancelWho:
    pla
    pla
    jmp B19_026a

; JMPed to when item consumption does nothing (like using food on a dead person)
OA_ConsumeItemUseless:
    jsr RemoveItem
    ldx #$58
    jsr DisplayText
OA_JMPNothingHappened:
    jmp OA_NothingHappened

OA_UseStatusCureItem:
    sta input_wordvar
    sty input_wordvar+1
    jsr ReadOverworldMessageLUT
    jsr PromptWho
    bcs CancelWho
    lda input_wordvar
    bmi :+
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bmi OA_ConsumeItemUseless
:   jsr OA_End
    jsr O_PrintText
    jsr RemoveItem
OA_CureStatusEffect:
    ldy #1
    lda (tableentry_var),Y
    and input_wordvar
    beq OA_JMPNothingHappened
    jsr EnablePRGRam
    lda input_wordvar
    php
    eor #$FF
    and (tableentry_var),Y
    sta (tableentry_var),Y
    plp
    bpl :+
    jsr RevivePlayerEffect
:   jsr WriteProtectPRGRam
    lda #7
    sta $07F1
    ldx input_wordvar+1
    jsr DisplayText
    jmp EndText

; does selection menu routines
OA_UseCapsule:
    sty input_wordvar
    jsr ReadOverworldMessageLUT
    jsr PromptWho
    bcs CancelWho
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bmi OA_ConsumeItemUseless
    jsr OA_End
    jsr O_PrintText
    jsr RemoveItem
    ldy input_wordvar
;   jmp OA_StatBoosterEffect            ; fallthrough

; used by items without the selection menu (ribbon, candy)
OA_StatBoosterEffect:
    lda #5
    jsr STA_word60
    clc
    lda (tableentry_var),Y
    adc input_wordvar
    sta $64
    bcc :+
    clc
    lda input_wordvar
    sbc $64
    sta input_wordvar
:   jsr EnablePRGRam
    clc
    lda (tableentry_var),Y
    adc input_wordvar
    sta (tableentry_var),Y
    jsr WriteProtectPRGRam
    clc
    tya
    adc #$11
    asl A
    tax
    jsr DisplayText
    ldx #$32
    jmp OA_Print_ByNum

OA26_TELEPORT:
    jsr TeleportParser
    jsr B19_198f
    bcs PromptWhoBackout
    jsr PromptWhoConfirm
    ldx #$0e
    jsr DisplayText
    pla
    pla
    pla
    pla
    jsr OINST_END
    jmp B30_0cd8

; Determines what type of Teleport is being used (the PSI, OnyxHook, Crumbs)
TeleportParser:
    lda event_flags+31
    and #$02
    beq :+
    pla
    pla
    ldx #$12
    jmp DisplayText
:   rts

; Parameter: A = Recovery value
OA_TryLifeup:
    jsr STA_word60
DoLifeupRoutine:
    jsr PromptWho
    bcs PromptWhoBackout
    jsr PromptWhoConfirm
    ldx #$0E                        ; "[Name] tried [PSI]."
    jsr DisplayText
    jsr OA_End
    jsr PlayerStatusCheck
    bmi LifeupFail
    jsr RestoreHP
    jmp EndText

; runs when B is pressed while in "Who?" prompt selection state
PromptWhoBackout:
    pla
    pla
    jmp B19_0238

LifeupFail:
    jmp OA_NothingHappened

OA_TryHealingPSI:
    sta input_wordvar
    sty input_wordvar+1
    jsr PromptWho
    bcs PromptWhoBackout
    jsr PromptWhoConfirm
    ldx #$0e
    jsr DisplayText
    jsr OA_End
    lda input_wordvar
    bmi @B19_067e
    jsr PlayerStatusCheck
    bmi LifeupFail
    @B19_067e:
    jmp OA_CureStatusEffect

RestoreHP:
    ldy #CurrHP_Offset
    jsr LoadBigStat
    ldy #HP_Offset
    jsr SetBigStatCap
    jsr EnablePRGRam
    ldy #CurrHP_Offset
    jsr IncreaseBigStat
    jsr WriteProtectPRGRam
    lda #PulseG0_Recovery
    sta soundqueue_pulseg0
    ldx #$34
    jsr DisplayText
    ldx #$30
    jmp OA_Print_ByNum

; Parameters
;   Y : local offset of stat
LoadBigStat:
    clc
    lda (tableentry_var), y
    adc input_wordvar
    sta $64
    iny
    lda (tableentry_var), y
    adc input_wordvar+1
    sta $65
    rts

; Parameters
;   Y : local offset of stat
SetBigStatCap:
    sec
    lda (tableentry_var), y
    sbc $64
    sta $68
    iny
    lda (tableentry_var), y
    sbc $65
    sta $69
    bcs @B19_06d0
    lda input_wordvar
    adc $68
    sta input_wordvar
    lda input_wordvar+1
    adc $69
    sta input_wordvar+1
    @B19_06d0:
    rts

; Parameters:
;   Y : local offset of stat
;   A : Value to add by
IncreaseBigStat:
    clc
    lda (tableentry_var), y
    adc input_wordvar
    sta (tableentry_var), y
    iny
    lda (tableentry_var), y
    adc input_wordvar+1
    sta (tableentry_var), y
    rts

; Revives the current player (their data in tableentry_var is changed to max their HP)
; Reorganizes party after
RevivePlayerEffect:
    ; max hp in temp zeropg-variables
    ldy #HP_Offset
    lda (tableentry_var), y
    ldy #CurrHP_Offset
    sta (tableentry_var), y
    ldy #HP_Offset+1
    lda (tableentry_var), y
    ldy #CurrHP_Offset+1
    sta (tableentry_var), y
;   jmp ReconfigurePartyRoutine         ; fallthru

ReconfigurePartyRoutine:
    lda object_pointer
    pha
    lda object_pointer+1
    pha
    jsr RECONFIGURE_PARTY
    jsr GetPlayerPosInParty
    bcs @SkipRoutine
    txa
    jsr B30_186c
    lda $f6
    pha
    ldy #$15
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    jsr B31_02bf
    pla
    ldx #$06
    jsr BANK_SWAP
    lda #$1d
    jsr B30_0de4
    jsr B30_1977
@SkipRoutine:
    jsr EnablePRGRam
    pla
    sta object_pointer+1
    pla
    sta object_pointer
    rts

; Sets X to what position player ID [$28] is in the party.
GetPlayerPosInParty:
    lda $28
    ldx #$00
@LoopStart:
    cmp party_members, x
    clc
    beq @LoopRTS
    inx
    cpx #$04
    bcc @LoopStart
@LoopRTS:
    rts

OA_HEALING_ALPHA:
    lda #POISON
    ldy #$5a
    jmp OA_TryHealingPSI
OA_HEALING_GAMMA:
    lda #PETRIFICATION
    ldy #$6c
    jmp OA_TryHealingPSI
OA_SUPER_HEALING:
    lda #UNCON
    ldy #$14
    jmp OA_TryHealingPSI

OA_ANTIDOTE:
    lda #POISON
    ldx #$2e
    ldy #$5a
    jmp OA_UseStatusCureItem
OA_MOUTHWASH:
    lda #COLD
    ldx #$16
    ldy #$5c
    jmp OA_UseStatusCureItem

OA_PSI_STONE:
    lda #20                     ; recovery value
    jsr STA_word60
    ldx #$5e                    ; Used PSI Stone msg
    jsr DisplayText
    ldy #CurrPP_Offset
    jsr LoadBigStat
    ldy #PP_Offset
    jsr SetBigStatCap
    jsr EnablePRGRam
    ldy #CurrPP_Offset
    jsr IncreaseBigStat
    jsr WriteProtectPRGRam
    ldx #$36                    ; Recovered PP msg
    jsr DisplayText
    ldx #$18*2
    jsr OA_Print_ByNum
; @TryBreaking
    jsr Rand
    cmp #$19
    bcs :+
; @BreakSuccess
    jsr OA_DeleteItemSelf
    ldx #$60                    ; PSI Stone broke msg
    jsr DisplayText
:   jmp EndText

OA_RIBBON:
    ldx #$4a
    jsr DisplayText
    jsr OA_DeleteItemSelf
    ldy #Fce_Offset
    jmp OA_StatBoosterEffect
OA_CANDY:
    ldx #$2c
    jsr DisplayText
    jsr OA_DeleteItemSelf
    ldy #Fit_Offset
    jmp OA_StatBoosterEffect

OA_SPD_CAPSULE:
    ldx #$2e
    ldy #Spd_Offset
    jmp OA_UseCapsule
OA_WIS_CAPSULE:
    ldx #$2e
    ldy #Wis_Offset
    jmp OA_UseCapsule
OA_STR_CAPSULE:
    ldx #$2e
    ldy #Str_Offset
    jmp OA_UseCapsule
OA_FCE_CAPSULE:
    ldx #$2e
    ldy #Fce_Offset
    jmp OA_UseCapsule
OA_FIT_CAPSULE:
    ldx #$2e
    ldy #Fit_Offset
    jmp OA_UseCapsule

OA_HOOK:
    jsr TeleportParser
; Hook Fails when Warp-Disable is active (EVE)
    lda event_flags+$1C
    bpl :+
    jmp OA_NothingHappened
; @OnyxHookEffect
:   jsr EnablePRGRam
    ldx #3
@LoopStart:
    lda onyx_hook_warpdata,X
    sta xpos_music,X
    dex
    bpl @LoopStart
    jsr B30_19fa
    jsr REMOVE_EVE_FROM_PARTY
    lda #2
    sta fade_type
    lda #$40
    sta fade_flag
    ldx #$16
    jmp DisplayText

onyx_hook_warpdata:
    doorArgDef $9, $279, DIRECTIONS::DOWN, $2A1

OA_FINAL_WEAPON:
    ldx #$62
    jmp DisplayText
OA_RULER:
    ldx #$64
    jmp DisplayText
OA_DIARY:
    ldx #$74
    jmp DisplayText
OA_OCARINA:
    ldx #$70
    jsr DisplayText
    lda #$01
    jsr B30_0de4
    ldx #$72
    jmp DisplayText

; map item (unused in US version)
OA_MAP:
    pla
    pla
    ldx #$78
    jsr DisplayText
    jmp OpenMapEffect

; call located in constant bank
OpenMapWithButton:
    lda #PulseG0_MenuBloop
    sta soundqueue_pulseg0
;   jmp OpenMapEffect                   ; fallthru

OpenMapEffect:
    lda $14
    cmp #$01
    beq :+
    cmp #$02
    beq :+
; @OpenMapFail
    ldx #$7a
    jmp DisplayTextAndFinishRoutine
; @OpenMapSuccess
:   jsr OINST_END
    jsr OT0_DefaultTransition
    jsr B31_1d5e
    ldx #$00
    ldy #$08
    jsr SetScroll
    lda #$06
    ora ram_PPUMASK
    sta ram_PPUMASK
    lda #$5b
    ldx #$02
    jsr BANK_SWAP
    jsr B30_0e6d

    BankswitchCHR_Address map_chr_bankswitch_data

    lda #$df
    sta $0201
    lda #$00
    sta $0202
    ldx #$40
    lda $6785
    jsr B19_08d4
    sbc #$08
    sta $0203
    ldx #$80
    lda $6787
    jsr B19_08d4
    sbc #$21
    sta $0200

    LoadPalette_Address map_palettes_data

    lda #$00
    sta $da
    B19_0899:
    ldx #$08
    jsr WaitXFrames_Min1
    lda #$df
    eor $0201
    sta $0201
    bit $da
    bvc B19_0899
    lda #$00
    sta $da
    lda #$f0
    sta $0200
    jsr PpuSync
    jsr B31_0ddf
    jsr RestorePalette
    lda #$f9
    and ram_PPUMASK
    sta ram_PPUMASK
    lda #$7e
    ldx #$04
    jsr BANK_SWAP
    lda #$00
    sta disable_dmc
    jsr B31_1d5e
    jmp STORE_COORDINATES

B19_08d4:
    sec
    bpl @B19_08e2
    tay
    txa
    ora $0202
    sta $0202
    tya
    sbc #$07
    @B19_08e2:
    rts

;chr bankswitch table
map_chr_bankswitch_data:
.byte $00,$78,$58,$59,$5A,$00

;palettes
map_palettes_data:
.byte $0F,$36,$30,$2A
.byte $0F,$36,$30,$2A
.byte $0F,$36,$30,$16
.byte $0F,$36,$30,$16

.byte $0F,$21,$02,$0A
.byte $0F,$21,$21,$21
.byte $0F,$21,$21,$21
.byte $0F,$21,$21,$21


DisplayTextAndFinishRoutine:
    jsr DisplayText
FinishedTextboxRoutine:
    jsr OINST_END
    jmp CLEAR_TEXTBOXES_ROUTINE

STA_word60:
    sta temp_word
    lda #$00
    sta temp_word+1
    jsr B31_12ed
    lda temp_word
    sta input_wordvar
    lda temp_word+1
    sta input_wordvar+1
    rts

SetInputVar1000:
    lda #.LOBYTE(1000)
    ldx #.HIBYTE(1000)
    sta input_wordvar
    stx input_wordvar+1
    rts

OA_End:
    jsr EnablePRGRam
    jsr MOV_word60_word40
    lda #$04
    sta $6d20
    clc
    lda tableentry_var
    adc #$38
    sta $6d21
    lda tableentry_var+1
    adc #$00
    sta $6d22
    jsr GetItemDataPointer
    ldy #$00
    lda (temp_vars), y
    sta $64
    iny
    lda (temp_vars), y
    sta $65
    ldy #$00
    @B19_0957:
    lda ($64), y
    sta $6d24, y
    iny
    cmp #$00
    bne @B19_0957
    jmp WriteProtectPRGRam

MOV_word60_word40:
    lda $28
    jsr GetPartyMemberData
    lda temp_word
    sta tableentry_var
    lda temp_word+1
    sta tableentry_var+1
    rts

PlayerStatusCheck:
    ldy #$01
    lda (tableentry_var), y
    and #$f0
    rts

IsTargetInventoryFull:
    lda #$00
    jsr GetItemInventorySlot
    bcs OLocal_SEC_RTS
    jsr EnablePRGRam
    lda $29
    sta (temp_vars), y
    clc
    jmp WriteProtectPRGRam

TryDropItem:
    jsr IsKeyItem
    bne OLocal_SEC_RTS
OA_DeleteItemSelf:
    lda $29
    jsr GetItemInventorySlot
    bcs OLocal_SEC_RTS
    jsr EnablePRGRam
    jsr B19_107e
    clc
    jmp WriteProtectPRGRam

OLocal_SEC_RTS:
    sec
    rts

RemoveItem:
    lda $28
    pha
    lda $42
    sta $28
    jsr OA_DeleteItemSelf
    pla
    sta $28
    rts

PromptWhoConfirm:
    jsr EnablePRGRam
    sec
    ldy #$16
    lda (tableentry_var), y
    sbc $43
    sta (tableentry_var), y
    iny
    lda (tableentry_var), y
    sbc #$00
    sta (tableentry_var), y
    jmp WriteProtectPRGRam

B19_09c7:
    tay
    beq @B19_09d3
    tax
    ldy #$00
    lda (object_pointer), y
    and #$3f
    tay
    txa
    @B19_09d3:
    cpy #$20
    rts

B19_09d6:
    jsr GetObjectDataAndBank
    jsr B31_0772
    and All_Bits, x
    bne @B19_09fd
    lda #$04
    jsr B31_02c2
    ldx #$66
    jsr DisplayText
    lda #$0a
    sta soundqueue_pulseg0
    ldy #$06
    lda (object_data), y
    and #$7f
    sta $29
    bne B19_0a05
    jsr B19_0a3f
    @B19_09fd:
    ldx #$76
    jsr DisplayText
    jmp OINST_END

B19_0a05:
    jsr B19_1b8c
    ldx #$68
    jsr DisplayText
    ldx #$00
    B19_0a0f:
    jsr B30_19f1
    bcs B19_0a1f
    sta $28
    txa
    pha
    jsr IsTargetInventoryFull
    pla
    tax
    bcc B19_0a2c
    B19_0a1f:
    inx
    cpx #$04
    bcc B19_0a0f
    ldx #$6e
    jsr DisplayText
    jmp OINST_END

B19_0a2c:
    jsr B19_0a3f
    jsr B19_1b6f
    ldx #$6a
    jsr DisplayText
    lda #$06
    sta soundqueue_pulseg0
    jmp OINST_END

B19_0a3f:
    jsr EnablePRGRam
    jsr B31_0772
    ora All_Bits, x
    sta $7620, y
    jmp WriteProtectPRGRam

PromptWho:
    lda $28
    sta $42
    lda pc_count
    cmp #$02
    bcc @B19_0a6a
    lda $74
    pha
    lda $73
    pha
    jsr B19_1763
    pla
    sta $73
    pla
    sta $74
    bcs B19_0a6f
    @B19_0a6a:
    jsr B19_1b6f
    clc
    rts

B19_0a6f:
    lda $42
    sta $28
    rts

; Bitfield for bit to check if item is usable/equippable.
PlayerUsableBitfieldLUT:
.byte $00,$01,$02,$04,$08,$10,$20,$20

ReadOverworldMessageLUT:
    lda OverworldMessageLUT, x
    sta $74
    lda OverworldMessageLUT+1, x
    sta $73
    rts

OverworldMessageLUT:
    .word $0000 ; 01
    .word $0385 ; 02 - Talking to nothing
    .word $0386 ; 03 - Talking to party members
    .word $0387 ; 04 - Checking nothing
    .word $0000 ; 05
    .word $03d7 ; 06 - "@Don't carry so much cash with you."
    .word $03db ; 07 - No party members to use GIVE command
    .word $06c7 ; 08 - Tried PSI msg
    .word $06c8 ; 09 - Not enough Power for PSI msg
    .word $06d0 ; 0A - Teleport / Warp Fail when EVE is active
    .word $06c9 ; 0B - Revive success msg
    .word $038e ; 0C - Use item msg
    .word $038f ; 0D - Cannot use item msg (user bit not set)
    .word $0390 ; 0E - Cannot eat msg
    .word $0391 ; 0F - Equipped item msg
    .word $0392 ; 10 - Cannot equip item msg
    .word $0393 ; 11 - Throw away item msg
    .word $0394 ; 12 - Cannot throw away item msg (key items)
    .word $0395 ; 13 - Give success msg (A handed item to B)
    .word $0396 ; 14 - Cannot give msg
    .word $0397 ; 15 - Give target's inv is full msg
    .word $0398 ; 16 - Nothing happened
    .word $06af ; 17 - Eat item msg
    .word $06b0 ; 18 - Drink item msg
    .word $06b1 ; 19 - Recovered by [Num] (used for HP, PP items)
    .word $06b2 ; 1A - Increased by [Num] (stat booster items)
    .word $06b3 ; 1C - [Name]'s HP
    .word $06b4 ; 1D - [Name]'s PP
    .word $06b5 ; 1E - [Name]'s Fight       ; infamously, the EBB translation calls it "Energy" only here, for some heretical reason
    .word $06b6 ; 1F - [Name]'s Speed
    .word $06b7 ; 20 - [Name]'s Wisdom
    .word $06b8 ; 21 - [Name]'s Strength
    .word $06b9 ; 22 - [Name]'s Force
    .word $06ba ; 23 - Use Big Bag msg
    .word $06bb ; 24 - Use Bread msg
    .word $06bc ; 25 - Bread use fail msg
    .word $06bd ; 26 - Use Crumbs msg
    .word $06be ; 27 - Use Ribbon msg
    .word $06a7 ; 28 - Give item to dead target msg
    .word $06a8 ; 29 - Take item from dead target msg
    .word $06a5 ; 2A - Give item to self
    .word $06aa ; 2B - Take item from dead target and give to another dead target
    .word $06a9 ; 2C - Throw out dead target's item
    .word $06c1 ; 2D - Big Bag deadge msg
    .word $06a6 ; 2E - Give item to target msg
    .word $06c3 ; 2F - Poison cure msg
    .word $06c4 ; 30 - Cold cure msg
    .word $06c5 ; 31 - Use PSI Stone msg
    .word $06c6 ; 32 - PSI Stone break msg
    .word $06bf ; 33 - Final Weapon msg
    .word $06c0 ; 34 - Ruler msg
    .word $0399 ; 35 - Open box msg
    .word $039a ; 36 - There was item
    .word $039b ; 37 - You got item
    .word $06cb ; 38 - Petrify cure msg
    .word $039d ; 39 - Can't take item from box (inv full) msg
    .word $06cc ; 3A - Ocarina use msg
    .word $06cd ; 3B - Ocarina used msg (Did you hear it?)
    .word $06ca ;
    .word $03a1 ;
    .word $06cf ;
    .word $06ce ;
    .word $0014 ;
    .word $0016 ;
    .word $0338 ;
    .word $0018 ;
    .word $0021 ;
    .word $001b ;

B19_0b0f:
    jsr GetObjectDataAndBank
    ldy #$14
    lda (object_pointer), y
    and #$0f
    tay
B19_0b19:
    lda (object_data), y
    beq B19_0b23
    jsr OverworldScriptInterpreter
    jmp B19_0b19

B19_0b23:
    lda $21
    beq OINST_END
    jsr B31_0266
    lda #$40
    sta $34 ; Interaction type: SIGNAL
    bne B19_0b0f

; Instruction 00 - End script
OINST_END:
    lda $2c
    beq @B19_0b3c
    lda #$00
    sta $2c
    clc
    jmp WAIT_CLOSE_MENU
    @B19_0b3c:
    sec
    rts

GetObjectDataAndBank:
    jsr GetObjectData
    B19_0b41:
    ldy #$01
    lda (object_pointer), y
    jmp SetObjectBank

B19_0b48:
    jsr GetObjectDataAndBank
    ldy #$1c
    lda (object_pointer), y
    tay
    jmp B19_0b19

B19_0b53:
    jsr B31_0266
    jsr GetObjectDataAndBank
    ldy object_script_offset
    jmp B19_0b19

OverworldScriptInterpreter:
    asl a
    tax
    lda OverworldScriptLUT+1, x
    pha
    lda OverworldScriptLUT  , x
    pha
    rts

; Object script JSR table
OverworldScriptLUT:
    .addr OINST_END-1 ; 00 - End script
    .addr OINST_JMP-1 ; 01 - Jump
    .addr OINST_JSR-1 ; 02 - Call subroutine
    .addr OINST_RTS-1 ; 03 - Return from subroutine
    .addr OINST_Delay-1 ; 04 - TODO: delay
    .addr OINST_SpawnIfFlag-1 ; 05 - Appear if flag clear (only valid at start of script)
    .addr OINST_SpawnIfFlag-1 ; 06 - Appear if flag set (only valid at start of script)
    .addr OINST_InfiniteLoop-1 ; 07 - Infinite loop
    .addr OINST_PrintObjectText-1 ; 08 - Display text
    .addr OINST_PromptYesNo-1 ; 09 - Ask yes/no, jump if canceled or "no" selected
    .addr OINST_JMP_NotCondition-1 ; 0A - Jump unless TALKing
    .addr OINST_JMP_NotCondition-1 ; 0B - Jump unless CHECKing
    .addr OINST_JMP_NotPSI-1 ; 0C - Jump unless using PSI
    .addr OINST_JMP_NotItem-1 ; 0D - Jump unless using item
    .addr OINST_InfiniteLoop-1 ; 0E - Infinite loop
    .addr OINST_Reset-1 ; 0F - Reset game
    .addr OINST_SetFlag-1 ; 10 - Set flag
    .addr OINST_ClrFlag-1 ; 11 - Clear flag
    .addr OINST_JMPFlagClr-1 ; 12 - Jump unless flag set
    .addr OINST_DecCounter-1 ; 13 - Decrement counter
    .addr OINST_IncCounter-1 ; 14 - Increment counter
    .addr OINST_ClrCounter-1 ; 15 - Set counter to zero
    .addr OINST_JMP_LessThan-1 ; 16 - Jump if counter less than
    .addr OINST_Set7400-1 ; 17 - Set $7400[] value
    .addr OINST_ChooseChara-1 ; 18 - Choose character, jump if canceled
    .addr OINST_LoadChara-1 ; 19 - Select specific character
    .addr OINST_JMP_NotChara-1 ; 1A - Jump unless character selected
    .addr OINST_JMP_DadMoneyClr-1 ; 1B
    .addr OINST_PromptInputNum-1 ; 1C
    .addr OINST_LoadNum-1 ; 1D
    .addr OINST_JMP_Compare2Inputs-1 ; 1E
    .addr OINST_ShowWallet-1 ; 1F
    .addr B19_1196-1 ; 20
    .addr B19_1172-1 ; 21
    .addr B19_1184-1 ; 22
    .addr OINST_JMP_ItemNotInCurrentCharaInv-1 ; 23
    .addr OINST_JMP_ItemNotInStorage-1 ; 24
    .addr OINST_LoadItem-1 ; 25
    .addr OINST_JMP_NotItemSelected-1 ; 26
    .addr OINST_JMP_ItemNotInInv-1 ; 27
    .addr OINST_JMP_WalletOverflows-1 ; 28
    .addr OINST_JMP_NotEnoughMoney-1 ; 29
    .addr OINST_TryDeposit-1 ; 2A
    .addr OINST_TryWithdrawal-1 ; 2B
    .addr OINST_JMP_CurrItemKey-1 ; 2C
    .addr OINST_TryGiveItem-1 ; 2D
    .addr OINST_TryRemoveItem-1 ; 2E
    .addr OINST_TryDepositItem-1 ; 2F
    .addr OINST_TryWithdrawItem-1 ; 30
    .addr OINST_TrySelectCharaInvSlot-1 ; 31
    .addr OINST_DivideNumBy100-1 ; 32
    .addr OINST_JMP_CharaNotInParty-1 ; 33
    .addr OINST_JMP_NotCondition-1 ; 34 - TODO
    .addr OINST_JMP_NotCondition-1 ; 35 - Jump unless touching object
    .addr B19_13d8-1 ; 36
    .addr B19_0dfa-1 ; 37
    .addr OINST_JMP_InvEmpty-1 ; 38
    .addr OINST_JMP_StorageEmpty-1 ; 39
    .addr OINST_LoadCharaInParty-1 ; 3A
    .addr OINST_SetObjectType-1 ; 3B - Set object type
    .addr B19_142b-1 ; 3C
    .addr OINST_Teleport-1 ; 3D
    .addr OINST_MoveObject-1 ; 3E - TODO: Move object
    .addr B19_0c57-1 ; 3F - TODO: Signal another object
    .addr OINST_JMP_NotCondition-1 ; 40 - TODO: Jump unless signaled
    .addr OINST_WarpToSaveSpot-1 ; 41
    .addr OINST_AddChara-1 ; 42
    .addr OINST_RemoveChara-1 ; 43
    .addr OINST_StartEncounter-1 ; 44
    .addr OINST_MultiplyByPartySize-1 ; 45
    .addr OINST_MoveRocket-1 ; 46
    .addr OINST_DoPlane-1 ; 47
    .addr OINST_DoTank-1 ; 48
    .addr OINST_DoBoat-1 ; 49
    .addr OINST_DoTrain-1 ; 4A
    .addr OINST_DoElevator-1 ; 4B
    .addr OINST_DismountVehicle-1 ; 4C
    .addr OINST_EndPlane-1 ; 4D
    .addr B19_1432-1 ; 4E
    .addr B19_13e8-1 ; 4F
    .addr OINST_JMP_CharaHPNotFull-1 ; 50
    .addr OINST_RecoverHP-1 ; 51
    .addr OINST_JMP_CharaHasStatus-1 ; 52
    .addr OINST_CharaHealStatusExcept-1 ; 53
    .addr OINST_JMP_CharaLvLessThan-1 ; 54
    .addr OINST_Sleep-1 ; 55
    .addr OINST_Save-1 ; 56
    .addr OINST_GetCharaNextLv-1 ; 57
    .addr OINST_LoadWallet-1 ; 58
    .addr OINST_GiveStatusToChara-1 ; 59
    .addr OINST_PlayTrack-1 ; 5A
    .addr OINST_QueueNoise-1 ; 5B
    .addr OINST_QueuePulse-1 ; 5C
    .addr OINST_QueueTriangle-1 ; 5D
    .addr OINST_InfiniteLoop-1 ; 5E - Infinite loop
    .addr OINST_TeachTeleport-1 ; 5F
    .addr OINST_JMP_CharaPPNotFull-1 ; 60
    .addr OINST_RecoverPP-1 ; 61
    .addr B19_11fd-1 ; 62
    .addr OINST_LoadConfiscatedWeapon-1 ; 63
    .addr OINST_DoLiveHouse-1 ; 64
    .addr OINST_JMP_NotHas8Melodies-1 ; 65
    .addr OINST_RegisterName-1 ; 66
    .addr OINST_DarkenPalettes-1 ; 67 - Darken palette
    .addr OINST_DoLandmine-1 ; 68
    .addr B19_1735-1 ; 69
    .addr OINST_DoTombstone-1 ; 6A
    .addr B19_1751-1 ; 6B

; Instructions 07, 0E and 5E (infinite loop)
OINST_InfiniteLoop:
    jmp OINST_InfiniteLoop

B19_0c44:
    sta $74
    stx $75
    jmp B30_06d2

; Instruction 0F - Reset game
OINST_Reset:
    jsr OINST_END
    jsr OT0_DefaultTransition
    jmp Reset_Vector

; Instructions 05 and 06 (only valid at the start of a script)
OINST_SpawnIfFlag:
    iny
    iny
    rts

; Instruction 3F - Signal another object
B19_0c57:
    iny
    lda (object_data), y
    clc
    adc #4
    sta $21
    iny
    rts

; Instruction 0C - Jump unless using PSI
OINST_JMP_NotPSI:
    iny
    lda (object_data), y
    clc
    adc #$c0
    jmp B19_0c6d

; Insruction 0D - Jump unless using item
OINST_JMP_NotItem:
    iny
    lda (object_data), y
B19_0c6d:
    cmp $29
    bne OINST_JMP
; Instructions 0A, 0B, 34, 35, 40 - Jump unless certain interaction type
OINST_JMP_NotCondition:
    txa
    lsr a
    cmp $34
    bne OINST_JMP
B19_0c77:
    iny
    iny
    rts

JumpCS:
    bcs B19_0c77
    bcc OINST_JMP
JumpCC:
    bcc B19_0c77
    bcs OINST_JMP
JumpEQ:
    bne B19_0c77
    beq OINST_JMP
JumpNE:
    beq B19_0c77

; Instruction 01 - Jump
OINST_JMP:
    iny
    lda (object_data), y
    tay
    rts

; Instruction 02 - Call subroutine
OINST_JSR:
    lda object_data
    pha
    lda object_data+1
    pha
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    sta object_script_offset
    iny
    pla
    sta object_data+1
    pla
    sta object_data
    tya
    pha
    ldy object_script_offset
    jsr B19_0b19
    pla
    tay
    pla
    sta object_data+1
    pla
    sta object_data
    rts

; Instruction 03 - Return from subroutine
OINST_RTS:
    pla
    pla
    rts

; Instruction 04 - Delay
OINST_Delay:
    lda xpos_music
    and #$3f
    cmp #$24
    bcc B19_0d05
    cmp #$2c
    bcs B19_0d05
    jsr BackupPalette
    iny
    lda (object_data), y
    sta melody_timer
    iny
B19_0cd0:
    lsr a
    lsr a
    lsr a
    and #7
    tax
    lda B19_0cfd, x
    sta $0501
    sta $0505
    sta $0509
    sta $050d
    jsr UpdatePalette
    lda melody_timer
    bne B19_0cd0
    lda $10
    ldx #2
    jsr BANK_SWAP
    lda $12
    ldx #3
    jsr BANK_SWAP
    jmp RestoreAndUpdatePalette

B19_0cfd:
    .byte $21,$22,$23,$24,$25,$24,$23,$22

B19_0d05:
    iny
    lda (object_data), y
    tax
    iny
    jmp WaitXFrames_Min1

; Instruction 08 - prints the object's text/dialogue
OINST_PrintObjectText:
    iny
    lda (object_data), y
    sta $74
    iny
    lda (object_data), y
    sta $73
    iny
    sty object_script_offset
; FALLTHROUGH
O_PrintText:
    lda $2c
    bne B19_0d21
    jsr B19_1c0a
B19_0d21:
    lda #8
    cmp $2c
    beq B19_0d7b
B19_0d27:
    sta $2c
B19_0d29:
    ldy $77
    cpy #$1b
    bcc B19_0d36
    jsr B19_0d98
    dec $2d
    bmi B19_0d84
B19_0d36:
    lda $2d
    bne B19_0d40
    ldy $77
    cpy #$19
    bcs B19_0d84
B19_0d40:
    jsr GetTextData
    lda #$16
    sta $70
    lda #0
    sta $71
    jsr B30_0707
    jsr B30_07af
    cmp #0
    beq B19_0d61
    ldy #0
    lda ($74), y
    cmp #3
    beq B19_0d75
    cmp #0
    bne B19_0d29
B19_0d61:
    jsr B19_0b41
    lda #0
    sta $70
    sta $71
    ldy object_script_offset
B19_0d6c:
    sec
    lda $77
    sbc #$13
    lsr a
    sta $2d
    rts

B19_0d75:
    inc $74
    bne B19_0d7b
    inc $73
B19_0d7b:
    ldy $77
    cpy #$1b
    bcc B19_0d84
    jsr B19_0d98
B19_0d84:
    jsr B19_0d6c
    lda #$91
    ldx #$ad
    jsr B19_0dc5
    jmp B19_0d40

B19_0d91:
    .byte 1,1,0,0,$c0,$3b,$12

B19_0d98:
    ldx #4
    jsr B30_07c1
    dec $77
    dec $77
    rts

; Instruction 09 - Ask yes/no, jump if canceled or "no" selected
OINST_PromptYesNo:
    sty object_script_offset
    jsr B19_0dae
    ldy object_script_offset
    lda $82
    jmp JumpNE

B19_0dae:
    lda #.LOBYTE(B19_0ddf)
    ldx #.HIBYTE(B19_0ddf)
    sta $74
    stx $73
    lda #9
    jsr B19_0d27
    lda #.LOBYTE(B19_0dec)
    ldx #.HIBYTE(B19_0dec)
    bne B19_0dc5

B19_0dc1:
    lda #.LOBYTE(B19_0df3)
    ldx #.HIBYTE(B19_0df3)
B19_0dc5:
    sta $80
    stx $81
    ldy #6
    lda ($80), y
    sta $76
    lda #$d1
    ldx #$f0
    sta $84
    stx $85
    jsr B31_0f4b
    lda #8
    sta $76
    rts

B19_0ddf:
.byte $a0, $a0, $a0, $a0, $d9, $e5, $f3, $a0
.byte $a0, $ce, $ef, $a0, $00

B19_0dec:
.byte $02, $01, $05, $00, $80, $3a, $0b

B19_0df3:
.byte $02, $01, $09, $00, $c0, $3a, $09

B19_0dfa:
    iny
    lda (object_data), y
    sta $74
    iny
    lda (object_data), y
    sta $73
    iny
    sty object_script_offset
    lda #$37
    jsr B19_0d27
    jsr B19_0dc1
    ldy object_script_offset
    bit $83
    bvs B19_0e20
    lda $82
    bne B19_0e1c
    iny
    iny
    rts

B19_0e1c:
    lda (object_data), y
    tay
    rts

B19_0e20:
    jmp OINST_JMP

; Instruction 10 - Set flag
OINST_SetFlag:
    jsr EnablePRGRam
    jsr B19_0e58
    ora All_Bits, x
    sta event_flags, y
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 11 - Clear flag
OINST_ClrFlag:
    jsr EnablePRGRam
    jsr B19_0e58
    ora All_Bits, x
    eor All_Bits, x
    sta event_flags, y
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 12 - Jump unless flag set
OINST_JMPFlagClr:
    jsr B19_0e58
    ldy object_script_offset
    and All_Bits, x
    eor All_Bits, x
    jmp JumpNE

B19_0e58:
    iny
    sty object_script_offset
    jmp B31_0646

; Instruction 14 - Increment counter
OINST_IncCounter:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    inc script_counters, x
    jmp WriteProtectPRGRam

; Instruction 13 - Decrement counter
OINST_DecCounter:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    dec script_counters, x
    jmp WriteProtectPRGRam

; Instruction 15 - Set counter to zero
OINST_ClrCounter:
    iny
    lda (object_data), y
    tax
    iny
    jsr EnablePRGRam
    lda #0
    sta script_counters, x
    jmp WriteProtectPRGRam

; Instruction 16 - Jump if counter less than
OINST_JMP_LessThan:
    iny
    lda (object_data), y
    tax
    iny
    lda script_counters, x
    cmp (object_data), y
    jmp JumpCS

; Instruction 19 - Select specific character
OINST_LoadChara:
    jsr B19_1032
    ldy object_script_offset
    iny
    rts

; Instruction 1D - Load Number
OINST_LoadNum:
    iny
    lda (object_data), y
    sta input_wordvar
    iny
    lda (object_data), y
    sta input_wordvar+1
    iny
    rts

; Instruction 58 - Load Cash
OINST_LoadWallet:
    lda wallet_money
    sta input_wordvar
    lda wallet_money+1
    sta input_wordvar+1
    iny
    rts

; Instruction 25 - Load Item
OINST_LoadItem:
    jsr B19_0fc4
    ldy object_script_offset
    iny
    rts

; Instruction 1A - Jump to J if chararacter C not selected
OINST_JMP_NotChara:
    iny
    lda $28
    cmp (object_data), y
    jmp JumpNE

; Instruction 1E - Jump to J if number less than value
OINST_JMP_Compare2Inputs:
    sec
    iny
    lda input_wordvar
    sbc (object_data), y
    iny
    lda input_wordvar+1
    sbc (object_data), y
    jmp JumpCS

; Instruction 26 - Jump to J if item I isnt selected
OINST_JMP_NotItemSelected:
    iny
    lda $29
    cmp (object_data), y
    jmp JumpNE

; Instruction 28 - Jump to J if cant hold money
OINST_JMP_WalletOverflows:
    clc
    lda wallet_money
    adc input_wordvar
    sta temp_word
    lda wallet_money+1
    adc input_wordvar+1
    sta temp_word+1
    bcs B19_0f12
    bcc B19_0eff

; Instruction 29 - Jump to J if not enough money
OINST_JMP_NotEnoughMoney:
    sec
    lda wallet_money
    sbc input_wordvar
    sta temp_word
    lda wallet_money+1
    sbc input_wordvar+1
    sta temp_word+1
    bcc B19_0f12
B19_0eff:
    jsr EnablePRGRam
    lda temp_word
    sta wallet_money
    lda temp_word+1
    sta wallet_money+1
    jsr WriteProtectPRGRam
    iny
    iny
    rts

B19_0f12:
    jmp OINST_JMP

; Instruction 2A - Add to bank account, Jump to J if can't hold any more
OINST_TryDeposit:
    clc
    lda bank_money
    adc input_wordvar
    sta temp_word
    lda bank_money+1
    adc input_wordvar+1
    sta temp_word+1
    lda bank_money+2
    adc #0
    sta $62
    bcs B19_0f12
    bcc B19_0f47

; Instruction 2B - Take from bank account, Jump to J if not enough
OINST_TryWithdrawal:
    sec
    lda bank_money
    sbc input_wordvar
    sta temp_word
    lda bank_money+1
    sbc input_wordvar+1
    sta temp_word+1
    lda bank_money+2
    sbc #0
    sta $62
    bcc B19_0f12
B19_0f47:
    jsr EnablePRGRam
    lda temp_word
    sta bank_money
    lda temp_word+1
    sta bank_money+1
    lda temp_word+2
    sta bank_money+2
    iny
    iny
    jmp WriteProtectPRGRam

; Instruction 32 - Multiply number by n / 100
OINST_DivideNumBy100:
    iny
    lda (object_data), y
    sta temp_vars+4
    sty object_script_offset
    lda input_wordvar
    sta temp_vars
    lda input_wordvar+1
    sta temp_vars+1
    jsr Mult16x8 ; $60 *= $64
    lda #100
    sta temp_vars+4
    jsr B31_113d
    ldy object_script_offset
    iny
    lda temp_vars+2
    bne B19_0f87
    lda temp_vars
    sta input_wordvar
    lda temp_vars+1
    sta input_wordvar+1
    rts

B19_0f87:
    lda #$ff
    sta input_wordvar
    sta input_wordvar+1
    rts

; Instruction 27 - Jump to J if item I not in inventory
OINST_JMP_ItemNotInInv:
    jsr B19_0fc4
    ldx #0
B19_0f93:
    jsr B30_19f1
    bcs B19_0fa5
    sta $28
    txa
    pha
    lda $29
    jsr GetItemInventorySlot
    pla
    tax
    bcc B19_101e
B19_0fa5:
    inx
    cpx #4
    bcc B19_0f93
    bcs B19_1023

; Instruction 23 - Jump to J if item I not in selected character's inventory
OINST_JMP_ItemNotInCurrentCharaInv:
    jsr B19_0fc4
    lda $29
    jsr GetItemInventorySlot
    bcc B19_101e
    bcs B19_1023

; Instruction 24 - Jump to J if item I not in closet
OINST_JMP_ItemNotInStorage:
    jsr B19_0fc4
    lda $29
    jsr GetItemStorageSlot
    bcs B19_1023
    bcc B19_101e

;?????????
B19_0fc4:
    iny
    lda (object_data), y
    sta $29
    sty object_script_offset
    jsr B19_1bc3
    jmp B19_1b8c

; Instruction 2D - Jump to J if inventory full, else give selected item
OINST_TryGiveItem:
    sty object_script_offset
    lda #0
    jsr GetItemInventorySlot
    bcs B19_1023
    bcc B19_0ffe

; Instruction 2C - Jump to J if item cannot be sold
OINST_JMP_CurrItemKey:
    sty object_script_offset
    jsr IsKeyItem
    php
    jsr B19_0b41
    plp
    bne B19_1023
    beq B19_0fec

; Instruction 2E - Remove item, Jump to J if don't have
OINST_TryRemoveItem:
    sty object_script_offset
B19_0fec:
    lda $29
    jsr GetItemInventorySlot
    bcs B19_1023
    bcc B19_1015

; Instruction 2F - Add item to closet, Jump to J if closet full
OINST_TryDepositItem:
    sty object_script_offset
    lda #0
    jsr GetItemStorageSlot
    bcs B19_1023
B19_0ffe:
    jsr EnablePRGRam
    lda $29
    sta (temp_vars), y
    ldy object_script_offset
    iny
    iny
    jmp WriteProtectPRGRam

; Instruction 30 - Remove item to closet, Jump to J if not available
OINST_TryWithdrawItem:
    sty object_script_offset
    lda $29
    jsr GetItemStorageSlot
    bcs B19_1023
B19_1015:
    jsr EnablePRGRam
    jsr B19_107e
    jsr WriteProtectPRGRam
B19_101e:
    ldy object_script_offset
    iny
    iny
    rts

B19_1023:
    ldy object_script_offset
    jmp OINST_JMP

; Instruction 33 - Jump to J if character C is not in party
OINST_JMP_CharaNotInParty:
    jsr B19_1032
    jsr GetPlayerPosInParty
    bcc B19_101e
    bcs B19_1023

B19_1032:
    iny
    lda (object_data), y
    sta $28
    sty object_script_offset
    jmp B19_1b6f

; Instruction 31 - Pick character's I'th item, Jump to J if empty (0)
OINST_TrySelectCharaInvSlot:
    iny
    lda (object_data), y
    sty object_script_offset
    pha
    lda $28
    jsr GetInventoryPointer
    pla
    tay
    lda (temp_vars), y
    beq B19_1023
    sta $29
    jsr B19_1bc3
    jsr B19_1b8c
    jmp B19_101e

GetItemInventorySlot:
    pha
    lda $28
    jsr GetInventoryPointer
    pla
    ldy #8
    bne B19_1068

GetItemStorageSlot:
    jsr GetItemStoragePointer
    ldy #$50
B19_1068:
    sty temp_vars+4
    ldy #0
B19_106c:
    cmp (temp_vars), y
    beq B19_1076
    iny
    cpy temp_vars+4
    bcc B19_106c
    rts

B19_1076:
    clc
    rts

B19_1078:
    lda (temp_vars), y
    dey
    sta (temp_vars), y
    iny
B19_107e:
    iny
    cpy temp_vars+4
    bcc B19_1078
    lda #0
    dey
    sta (temp_vars), y
    rts

GetInventoryPointer:
    jsr GetPartyMemberData
    clc
    lda temp_word
    adc #$20
    sta temp_word
    lda temp_word+1
    adc #0
    sta temp_word+1
    rts

GetItemStoragePointer:
    ldx #.LOBYTE(item_storage)
    stx temp_word
    ldx #.HIBYTE(item_storage)
    stx temp_word+1
    rts

IsKeyItem:
    jsr GetItemDataPointer
    ldy #2
    lda (temp_vars), y
    and #$80
    rts

; Instruction 18 - Choose character, jump if canceled
OINST_ChooseChara:
    lda #$18
    sta $2c
    lda $76
    pha
    lda $77
    pha
    sty object_script_offset
    jsr B19_1763
    pla
    sta $77
    pla
    sta $76
    bcs B19_10cc
B19_10c4:
    jsr B19_1b6f
    ldy object_script_offset
    iny
    iny
    rts

B19_10cc:
    ldy object_script_offset
    jmp OINST_JMP

; Instruction 3A - Select character C in party, Jump to J if not present
OINST_LoadCharaInParty:
    iny
    lda (object_data), y
    sty object_script_offset
    tax
    cpx #4
    bcs B19_10cc
    lda party_members, x
    beq B19_10cc
    sta $28
    bne B19_10c4

; Instruction 1C - Input a number, Jump to J if B pressed
OINST_PromptInputNum:
    sty object_script_offset
    jsr B19_1c28
    ldx #7
B19_10eb:
    lda B19_115e, x
    sta $68, x
    dex
    bpl B19_10eb
    lda #.LOBYTE(B19_1166)
    ldx #.HIBYTE(B19_1166)
    sta $74
    stx $73
    lda #$1c
    jsr B19_0d27
    lda #.LOBYTE(B19_116C)
    ldx #.HIBYTE(B19_116C)
    sta $80
    stx $81
    lda #$6c
    ldx #0
    sta $84
    stx $85
    lda #0
    sta $86
    sta $87
    sta $82
B19_1118:
    ldx #$c
    stx $76
    jsr B31_0f7c
    lda $83
    and #$c
    beq B19_1146
    ldx $82
    ldy $6c, x
    and #8
    beq B19_1136
    iny
    cpy #$ba
    bne B19_113d
    ldy #$b0
    bne B19_113d
B19_1136:
    dey
    cpy #$af
    bne B19_113d
    ldy #$b9
B19_113d:
    tya
    sta $6c, x
    jsr B31_10b0
    jmp B19_1118

B19_1146:
    jsr B31_11a4
    lda temp_word
    sta input_wordvar
    lda temp_word+1
    sta input_wordvar+1
    ldx #8
    stx $76
    ldy object_script_offset
    lda #$40
    bit $83
    jmp JumpNE

B19_115e:
    .byte $a0,$a0,$a4,$a0,$b0,$b0,$b0,$b0
B19_1166:
    .byte $23,$68,$00,$00,$08,$00
B19_116C:
    .byte $04,$01,$01,$00,$cc,$01

B19_1172:
  lda #$21
  sta $2C
  sty $35

;???
B19_1178:
    lda $76
    pha
    lda $77
    pha
    jsr B19_187f
    jmp B19_11a5

; Instruction 22 - Jump to J if declined
B19_1184:
    lda #$22
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_1814
    jmp B19_11a5

; Instruction 20 - Jump to J if declined
B19_1196:
    lda #$20
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_17b6
B19_11a5:
    pla
    sta $77
    pla
    sta $76
    bcs B19_11b8
    jsr B19_1bc3
    jsr B19_1b8c
B19_11b3:
    ldy $35
    iny
    iny
    rts

B19_11b8:
    ldy $35
    jmp OINST_JMP

; Instruction 38 - Jump to J if no items
OINST_JMP_InvEmpty:
    sty $35
    ldx #0
B19_11c1:
    jsr B30_19f1
    bcs B19_11d1
    tay
    txa
    pha
    tya
    jsr B19_11e1
    pla
    tax
    bcc B19_11b3
B19_11d1:
    inx
    cpx #4
    bcc B19_11c1
    bcs B19_11b8

; Instruction 39 - Jump to J if no items in closet
OINST_JMP_StorageEmpty:
    sty $35
    jsr B19_11e8
    bcs B19_11b8
    bcc B19_11b3
B19_11e1:
    jsr GetInventoryPointer
    ldy #8
    bne B19_11ed
B19_11e8:
    jsr GetItemStoragePointer
    ldy #$50
B19_11ed:
    sty $64
    ldy #0
B19_11f1:
    lda (temp_vars), y
    bne B19_11fb
    iny
    cpy $64
    bcc B19_11f1
    rts
B19_11fb:
    clc
    rts
B19_11fd:
    sty $35
    jsr B19_15c4
    jsr EnablePRGRam
    ldy #$28
    lda (temp_vars), y
    beq B19_121b
    sta confiscated_weapon
    sty $62
    jsr B19_1c5a
    jsr B19_0b41
B19_1216:
    ldy $35
    iny
    iny
    rts

B19_121b:
    ldy $35
    jsr WriteProtectPRGRam
B19_1220:
    jmp OINST_JMP

; Instruction 63 - Get confiscated weapon, Jump to j if none
OINST_LoadConfiscatedWeapon:
    lda confiscated_weapon
    beq B19_1220
    sta $29
    sty $35
    jsr B19_1bc3
    jsr B19_1b8c
    jmp B19_1216

; Instruction 3B - Set object type
OINST_SetObjectType:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    sty $35
    jsr SetObjectType
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 3E - Move
OINST_MoveObject:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y
    iny
    sty $35
    ldy #$1f
    sta (object_pointer), y
    dey
    pla
    sta (object_pointer), y
    ldy #0
    lda #7
    sta (object_pointer), y
    ldy #0
    lda (object_data), y
    and #$3f
    ldy #$1d
    sta (object_pointer), y
    ldy #$14
    lda (object_pointer), y
    and #$bf
    sta (object_pointer), y
    ldy #$1c
    lda $35
    sta (object_pointer), y
    lda $6795
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
    lsr a
    lsr a
    sta $6799
    jsr WriteProtectPRGRam
    pla
    pla
    jmp B19_0b23

; Instruction 46 - Rocket
OINST_MoveRocket:
    lda $f1
    jsr B19_129c
B19_1295:
    ldy $35
    iny
    iny
    jmp WriteProtectPRGRam

B19_129c:
    tax
    sty $35
    jsr EnablePRGRam
    txa
    eor $23
    and #$7f
    bne B19_12aa
    rts

B19_12aa:
    stx $23
    ldy #$1c
    lda $35
    sta (object_pointer), y
    jsr B19_12c3
    ora #$80
    sta $21
    jsr WriteProtectPRGRam
    pla
    pla
    pla
    pla
    jmp OINST_END

B19_12c3:
    sec
    lda object_pointer
    sbc #.LOBYTE(object_memory)
    sta temp_vars
    lda object_pointer+1
    sbc #.HIBYTE(object_memory)
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    rts

B19_12d8:
    stx object_memory+$16
    sty object_memory+$17
B19_12de:
    sta object_memory
    asl a
    asl a
    tax
    lda B31_0105+2, x
    sta object_memory+$08
    lda B31_0105+3, x
    sta object_memory+$14
    ldy $35
    iny
    lda (object_data), y
    sta object_memory+$15
    sta object_memory+$19
    rts

; Instruction 47 - Airplane
OINST_DoPlane:
    lda #$74
    jsr B19_129c
    lda #9
    ldx #$fc
    ldy #$8a
    jsr B19_12d8
    lda #$f
    sta $679a
    ldx #$10
    jsr B30_0daf
    jmp B19_1295

; Instruction 4D - Airplane End
OINST_EndPlane:
    jsr EnablePRGRam
    lda #$f8
    sta $679a
    iny
    jmp WriteProtectPRGRam

; Instruction 48 - Tank
OINST_DoTank:
    lda #$74
    jsr B19_129c
    lda #$a
    ldx #$1c
    ldy #$8b
    jsr B19_12d8
    ldx #8
    jsr B30_0daf
    jmp B19_1295

; Instruction 49 - Boat
OINST_DoBoat:
    lda #$74
    jsr B19_129c
    lda #$b
    ldx #$3c
    ldy #$8b
    jsr B19_12d8
    jmp B19_1295

; Instruction 4A - Train
OINST_DoTrain:
    sty $35
    lda #$f0
    sta $23
    lda #$3f
    sta $15
    jsr EnablePRGRam
    lda #0
    sta $67c0
    sta $67e0
    lda #$d
    ldy #0
    jsr B19_138b
    lda #$e
    ldy #$20
    jsr B19_138b
    sec
    lda $29
    sbc #$8f
    sta $679e
    lda #0
    sta $679f
    sta $679a
    jsr B19_1bd4
    ldx #$10
    jsr B30_0daf
    ldy $35
    iny
    jmp WriteProtectPRGRam

B19_138b:
    sta $6780, y
    asl a
    asl a
    tax
    lda #$28
    sta $6796, y
    lda #$8a
    sta $6797, y
    lda B31_0105+2, x
    sta $6788, y
    lda B31_0105+3, x
    sta $6794, y
    rts

; Instruction 4B - Elevator
OINST_DoElevator:
    lda #$f2
    jsr B19_129c
    lda #$f
    jsr B19_12de
    jmp B19_1295

; Instruction 4C - No Vehicle
OINST_DismountVehicle:
    iny
    sty $35
    lda (object_data), y
    ora #$80
    sta fade_flag
    ldx #0
    stx $23
    jsr B30_0daf
    lda $30
    pha
    lda $31
    pha
    jsr B30_1674
    pla
    sta $31
    pla
    sta $30
    ldy $35
    iny
    rts

; Instruction 36 - Unknown Jump
B19_13d8:
    sty $35
    ldy #2
    lda (object_data), y
    and #$3f
    ldy $35
    cmp $6795
    jmp JumpNE

; Instruction 4F - Unknown Jump 2
B19_13e8:
    sty $35
    ldy #0
    lda (object_data), y
    and #$c0
    ldy #4
    cmp (object_pointer), y
    bne B19_141b
    ldy #1
    lda (object_data), y
    ldy #5
    cmp (object_pointer), y
    bne B19_141b
    ldy #2
    lda (object_data), y
    and #$c0
    ldy #6
    cmp (object_pointer), y
    bne B19_141b
    ldy #3
    lda (object_data), y
    ldy #7
    cmp (object_pointer), y
    bne B19_141b
    ldy $35
    iny
    iny
    rts

B19_141b:
    ldy $35
    jmp OINST_JMP

; Instruction 3D - Teleport
OINST_Teleport:
    jsr EnablePRGRam
    iny
    jsr B31_06a1
    iny
    jmp WriteProtectPRGRam

; Instruction 3C - ???
B19_142b:
    iny
    lda (object_data), y
    sta fade_type
    iny
    rts

; Instruction 4E - ???
B19_1432:
    sty $35
    jsr EnablePRGRam
    jsr B30_19fa
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 42 - Add char C from party, Jump to J if full
OINST_AddChara:
    jsr B19_1032
    lda $30
    pha
    lda $31
    pha
    lda $28
    jsr B30_1759
    pla
    sta $31
    pla
    sta $30
    ldy $35
    jmp JumpCC

; Instruction 43 - Remove char C from party, Jump to J if not in party
OINST_RemoveChara:
    jsr B19_1032
    lda $30
    pha
    lda $31
    pha
    lda $28
    jsr REMOVE_PARTY_MEMBER
    pla
    sta $31
    pla
    sta $30
    ldy $35
    jmp JumpCC

; Instruction 44 - Start battle B in battles list
OINST_StartEncounter:
    iny
    lda (object_data), y
    sta enemy_group
    jsr B19_12c3
    sta $21
    iny
    sty $35
    pla
    pla
    jmp OINST_END

; Instruction 1F - Show money
OINST_ShowWallet:
    sty $35
    jsr B19_1c28
    ldy $35
    iny
    rts

; Instruction 17 - Set $7400[] value
OINST_Set7400:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    and #$3f
    tax
    iny
    lda (object_data), y
    sta $7400, x
    iny
    jmp WriteProtectPRGRam

; Instruction 56 - Save
OINST_Save:
    sty $35
    jsr B19_1e57
    ldy $35
    iny
    rts

; Instruction 57 - Get selected characters' needed exp
OINST_GetCharaNextLv:
    sty $35
    jsr B19_15c4
    ldy #$10
    lda (temp_vars), y
    jsr B30_1b40
    jsr B19_15c4
    ldy #$11
    sec
    lda $64
    sbc (temp_vars), y
    sta input_wordvar
    iny
    lda $65
    sbc (temp_vars), y
    sta input_wordvar+1
    jsr B19_0b41
    jsr EnablePRGRam
    ldx #3
B19_14d0:
    lda xpos_music, x
    sta save_coordinates, x
    dex
    bpl B19_14d0
    lda #0
    sta dad_money
    sta dad_money+1
    sta dad_money+2
    jsr WriteProtectPRGRam
    ldy $35
    iny
    rts

; Instruction 41 - Teleport to saved game location
OINST_WarpToSaveSpot:
    jsr EnablePRGRam
    ldx #3
B19_14f0:
    lda save_coordinates, x
    sta xpos_music, x
    dex
    bpl B19_14f0
    lda #$20
    sta fade_flag
    lda #0
    sta autowalk_direction
    iny
    jmp WriteProtectPRGRam

; Instruction 1B - Jump to J if no money has been gained since last call
OINST_JMP_DadMoneyClr:
    lda dad_money
    ora dad_money+1
    ora dad_money+2
    jmp JumpEQ

; Instruction 45 - Multiply by number of characters
OINST_MultiplyByPartySize:
    sty $35
    lda input_wordvar
    sta $64
    lda input_wordvar+1
    sta $65
    ldx #1
B19_151d:
    jsr B30_19f1
    bcs B19_153d
    jsr GetPartyMemberData
    ldy #1
    lda (temp_vars), y
    bmi B19_153d
    clc
    lda $64
    adc input_wordvar
    sta input_wordvar
    lda $65
    adc input_wordvar+1
    sta input_wordvar+1
    bcc B19_153d
    jsr B19_0f87
B19_153d:
    inx
    cpx #4
    bcc B19_151d
    ldy $35
    iny
    rts

; Instruction 55 - Sleep
OINST_Sleep:
    sty $35
    ldx #60
    jsr WaitXFrames_Min1
    jsr OT0_DefaultTransition
    jsr B19_1561
    jsr B19_1c0a
    lda #$55
    sta $2c
    jsr B31_0e30
    ldy $35
    iny
    rts

B19_1561:
    jsr EnablePRGRam
    ldx #0
B19_1566:
    lda party_members, x
    beq B19_157a
    jsr GetPartyMemberData
    ldy #1
    lda (temp_vars), y
    bmi B19_157a
    jsr MaxCurrCharaHP
    jsr MaxCurrCharaPP
B19_157a:
    inx
    cpx #4
    bcc B19_1566
    jsr WriteProtectPRGRam
    lda #$20
    jmp B30_0de4

; Set HP of character in $60 to their max HP
MaxCurrCharaHP:
    ldy #3
    lda (temp_vars), y
    ldy #$14
    sta (temp_vars), y
    ldy #4
    lda (temp_vars), y
    ldy #$15
    sta (temp_vars), y
    rts

; Set PP of character in $60 to their max PP
MaxCurrCharaPP:
    ldy #5
    lda (temp_vars), y
    ldy #$16
    sta (temp_vars), y
    ldy #6
    lda (temp_vars), y
    ldy #$17
    sta (temp_vars), y
    rts

; Instruction 50 - Jump to J if < max hp
OINST_JMP_CharaHPNotFull:
    jsr B19_15c2
    sec
    ldy #$14
    lda (temp_vars), y
    ldy #3
    sbc (temp_vars), y
    ldy #$15
    lda (temp_vars), y
    ldy #4
    sbc (temp_vars), y
    ldy $35
    jmp JumpCS

B19_15c2:
    sty $35
B19_15c4:
    lda $28
    jmp GetPartyMemberData

; Instruction 60 - Jump to J if < max pp
OINST_JMP_CharaPPNotFull:
    jsr B19_15c2
    sec
    ldy #$16
    lda (temp_vars), y
    ldy #5
    sbc (temp_vars), y
    ldy #$17
    lda (temp_vars), y
    ldy #6
    sbc (temp_vars), y
    ldy $35
    jmp JumpCS

; Instruction 52 - Jump to J if character has status S
OINST_JMP_CharaHasStatus:
    iny
    jsr B19_15c2
    ldy #1
    lda (temp_vars), y
    ldy $35
    and (object_data), y
    jmp JumpNE

; Instruction 54 - Jump to J if < level N
OINST_JMP_CharaLvLessThan:
    iny
    jsr B19_15c2
    ldy #$10
    lda (temp_vars), y
    ldy $35
    cmp (object_data), y
    jmp JumpCS

; Instruction 53 - Remove all statuses but status S
OINST_CharaHealStatusExcept:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy $35
    lda (object_data), y
    php
    ldy #1
    pha
    lda (temp_vars), y
    tax
    pla
    and (temp_vars), y
    sta (temp_vars), y
    plp
    bmi B19_1623
    jsr MaxCurrCharaHP
    txa
    bpl B19_1623
    jsr ReconfigurePartyRoutine
B19_1623:
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 59 - Inflict status S
OINST_GiveStatusToChara:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy $35
    lda (object_data), y
    ldy #1
    ora (temp_vars), y
    sta (temp_vars), y
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 61 - Heal pp n
OINST_RecoverPP:
    iny
    jsr B19_15c2
    ldx #$16
    ldy #5
    bne B19_1652

; Instruction 51 - Heal hp n
OINST_RecoverHP:
    iny
    jsr B19_15c2
    ldx #$14
    ldy #3
B19_1652:
    stx $62
    sty $63
    clc
    ldy $35
    lda (object_data), y
    ldy $62
    adc (temp_vars), y
    sta $64
    iny
    lda #0
    adc (temp_vars), y
    sta $65
    sec
    ldy $63
    lda (temp_vars), y
    sbc $64
    iny
    lda (temp_vars), y
    sbc $65
    bcs B19_1681
    ldy $63
    lda (temp_vars), y
    sta $64
    iny
    lda (temp_vars), y
    sta $65
B19_1681:
    jsr EnablePRGRam
    ldy $62
    lda $64
    sta (temp_vars), y
    iny
    lda $65
    sta (temp_vars), y
    ldy $35
    iny
    jmp WriteProtectPRGRam

; Instruction 5A - Play song M
OINST_PlayTrack:
    iny
    lda (object_data), y
    jsr PlayMusic
    jsr EnablePRGRam
    lda xpos_music
    and #$c0
    ora (object_data), y
    sta xpos_music
    iny
    jmp WriteProtectPRGRam

; Instruction 5B - Play sound S - 1
OINST_QueueNoise:
    iny
    lda (object_data), y
    sta soundqueue_noise
    iny
    rts

; Instruction 5C - Play sound S - 2
OINST_QueuePulse:
    iny
    lda (object_data), y
    sta soundqueue_pulseg0
    iny
    rts

; Instruction 5D - Play sound S - 3
OINST_QueueTriangle:
    iny
    lda (object_data), y
    sta soundqueue_triangle
    iny
    rts

; Instruction 5F - Teach Ninten and Ana Teleport
OINST_TeachTeleport:
    jsr EnablePRGRam
    lda #$20
    ora party_data+$30
    sta party_data+$30
    lda #$20
    ora party_data+$70
    sta party_data+$70
    iny
    jmp WriteProtectPRGRam

; Instruction 64 - Live House performance
OINST_DoLiveHouse:
    sty $35
    lda #25
    ldx #.LOBYTE(B25_06c2-1)
    ldy #.HIBYTE(B25_06c2)
    jsr TempUpperBankswitch
    ldy $35
    iny
    rts

; Instruction 65 - Jump to J if not all melodies learnt
OINST_JMP_NotHas8Melodies:
    lda learned_melodies
    cmp #$ff
    beq B19_16f4
    jmp OINST_JMP

B19_16f4:
    jsr EnablePRGRam
    ldx #3
B19_16f9:
    lda HolyLolyCabinCoords, x
    sta save_coordinates, x
    dex
    bpl B19_16f9
    jsr WriteProtectPRGRam
    iny
    iny
    rts

; Mt. Itoi cabin coordinates
HolyLolyCabinCoords:
    .word $00D2, $4780

; Instruction 66 - Register name
OINST_RegisterName:
    lda #$66
    sta $2c
    sty $35
    lda $76
    pha
    lda $77
    pha
    jsr B19_19e4
    pla
    sta $77
    pla
    sta $76
    ldy $35
    iny
    rts

; Instruction 67 - Darken palette
OINST_DarkenPalettes:
    jsr PpuSync
    jsr DarkenPalette
    iny
    rts

; Instruction 68 - Itoi landmine
OINST_DoLandmine:
    jsr B19_1d3b
    jsr RestoreAndUpdatePalette
    iny
    rts

; Instruction 69 - Horizontal shake (?)
B19_1735:
    ldx #$10
B19_1737:
    jsr B31_0ee4
    dex
    bne B19_1737
    iny
    rts

; Instruction 6A - George crystal (?)
OINST_DoTombstone:
    sty $35
    lda #$19
    ldx #.LOBYTE(B25_05cc-1)
    ldy #.HIBYTE(B25_05cc-1)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy $35
    iny
    rts

; Instruction 6B - ???
B19_1751:
    sty $35
    lda #$19
    ldx #.LOBYTE(B25_06c1-1)
    ldy #.HIBYTE(B25_06c1-1)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy $35
    iny
    rts

B19_1763:
    ldx #$02
    ldy #$19
    stx $76
    sty $77
    ldx #$02
    B19_176d:
    lda $6704, x
    beq B19_177e
    lda #$a0
    jsr B30_068b
    dec $77
    dec $77
    dex
    bpl B19_176d
    B19_177e:
    dec $76
    sec
    lda $77
    sbc #$04
    sta $77
    jsr B30_03c0
    jsr B19_0b41
    lda #.LOBYTE(B19_17ac)
    ldx #.HIBYTE(B19_17ac)
    sta $80
    stx $81
    jsr B31_0f34
    bit $83
    bmi B19_179e
    sec
    rts
    B19_179e:
    lda #$ff
    jsr B31_10b0
    ldx $82
    lda $6704, x
    sta $28
    clc
    rts

; UNKNOWN
B19_17ac:
    .byte $01,$03
    .byte $00       ; X
    .byte $02       ; Y
    .byte %11000000 ; Input mask
    .byte $3A       ; Tile
    .byte $02,$15
    .word $6704

B19_17b6:
    jsr B30_03b2
    ldx #$ff
    B19_17bb:
    inx
    cpx #$03
    bcc B19_17c2
    ldx #$00
    B19_17c2:
    jsr B30_19f1
    bcs B19_17bb
    sta $28
    stx $37
    jsr B19_1b21
    jsr B19_1803
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_17f4
    bmi B19_17bb
    beq B19_17bb
    jsr B19_1803
    jsr B19_1b0e
    bit $83
    bvs B19_17f4
    bmi B19_17f6
    ldx $37
    jmp B19_17c2
    B19_17f4:
    sec
    rts
    B19_17f6:
    lda #$ff
    jsr B31_10b0
    ldy $82
    lda ($84), y
    sta $29
    clc
    rts

B19_1803:
    jsr B19_15c4
    clc
    lda temp_word
    adc #$20
    sta $84
    lda temp_word+1
    adc #$00
    sta $85
    rts

B19_1814:
    jsr B30_03b9
    jsr B19_0b41
    sec
    lda $35
    adc object_data
    sta $84
    lda #$00
    adc object_data+1
    sta $85
    ldy #$03
    B19_1829:
    sty $77
    ldy $35
    iny
    sty $35
    lda (object_data), y
    sta $29
    beq B19_1853
    lda #$0c
    sta $70
    ldx #$03
    stx $76
    jsr B19_1baf
    jsr B19_1bc3
    lda #$00
    sta $70
    ldx #$0f
    stx $76
    lda #$6f
    ldx #$b8
    jsr B19_0c44
    B19_1853:
    ldy $77
    iny
    iny
    cpy #$0b
    bcc B19_1829
    lda #$77
    ldx #$b8
    sta $80
    stx $81
    jsr B31_0f3f
    bit $83
    bmi B19_186c
    sec
    rts
    B19_186c:
    jmp B19_17f6

B19_186f:
    .byte $a4,$23,$2a,$00,$02,$04,$ba,$00
    .byte $01,$04,$00,$02,$c0,$3a,$02,$03

B19_187f:
    jsr B30_03b2
    lda #$d8
    ldx #$b8
    jsr B19_0c44
    ldx #$f8
    B19_188b:
    clc
    txa
    adc #$08
    tax
    cpx #$50
    bcc B19_1896
    ldx #$00
    B19_1896:
    lda item_storage, x
    bne B19_189d
    ldx #$00
    B19_189d:
    stx $37
    jsr B19_18ca
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_18c5
    bmi B19_188b
    beq B19_188b
    jsr B19_18ca
    jsr B19_1b0e
    bit $83
    bvs B19_18c5
    bmi B19_18c7
    ldx $37
    jmp B19_1896
    B19_18c5:
    sec
    rts
    B19_18c7:
    jmp B19_17f6

B19_18ca:
    clc
    lda $37
    adc #.LOBYTE(item_storage)
    sta $84
    lda #$00
    adc #.HIBYTE(item_storage)
    sta $85
    rts

B19_18d8:
    .byte $20,$09,$03,$d4,$e8,$e5,$a0,$c3
    .byte $ec,$ef,$f3,$e5,$f4,$00

B19_18e6:
    jsr B30_03b2
    ldx #$ff
    B19_18eb:
    inx
    cpx #$03
    bcc B19_18f2
    ldx #$00
    B19_18f2:
    lda party_members, x
    beq B19_18eb
    cmp #$03
    bcs B19_18eb
    sta $28
    stx $37
    jsr B19_1b21
    jsr B19_1935
    jsr B19_1b40
    jsr B19_1af9
    ldx $37
    lda #$06
    bit $83
    bvs B19_1930
    bmi B19_18eb
    beq B19_18eb
    jsr B19_1935
    ldy #$01
    lda (temp_vars), y
    and #$f0
    bne B19_192b
    jsr B19_1b0e
    bit $83
    bvs B19_1930
    bmi B19_1932
    B19_192b:
    ldx $37
    jmp B19_18f2
    B19_1930:
    sec
    rts
    B19_1932:
    jmp B19_17f6
    B19_1935:
    jsr B19_15c4
    clc
    lda temp_word
    adc #$30
    sta $84
    lda temp_word+1
    adc #$00
    sta $85
    ldx #$00
    ldy #$00
    B19_1949:
    stx temp_vars+4
    sty temp_vars+5
    lda temp_vars+5
    and #$07
    tax
    lda temp_vars+5
    lsr a
    lsr a
    lsr a
    tay
    lda ($84), y
    and All_Bits, x
    ldx temp_vars+4
    and B19_198b, y
    beq B19_1971
    clc
    lda temp_vars+5
    adc #$c0
    sta $0580, x
    inx
    cpx #$08
    bcs B19_1982
    B19_1971:
    ldy temp_vars+5
    iny
    cpy #$20
    bcc B19_1949
    lda #$00
    B19_197a:
    sta $0580, x
    inx
    cpx #$08
    bcc B19_197a
    B19_1982:
    lda #$80
    ldx #$05
    sta $84
    stx $85
    rts

B19_198b:
    .byte $60,$e0,$a8,$00

B19_198f:
    jsr B30_03b2
    lda #.LOBYTE(B19_19d1)
    ldx #.HIBYTE(B19_19d1)
    jsr B19_0c44
    jsr B19_19af
    jsr B19_1b40
    lda #.LOBYTE(B19_19dc)
    ldx #.HIBYTE(B19_19dc)
    jsr B19_1b12
    bit $83
    bmi B19_19ac
    sec
    rts
    B19_19ac:
    jmp B19_17f6

B19_19af:
    lda event_flags+29
    sta $65
    ldx #$00
    B19_19b6:
    lda #$00
    asl $65
    bcc B19_19c0
    clc
    txa
    adc #$80
    B19_19c0:
    sta $0580, x
    inx
    cpx #$08
    bcc B19_19b6
    lda #$80
    ldx #$05
    sta $84
    stx $85
    rts

B19_19d1:
    .byte $20,$07,$03,$fe,$d7,$e8,$e5,$f2
    .byte $e5,$a2,$00

B19_19dc:
    .byte $02,$04,$0c,$02,$c0,$3a,$06,$05

B19_19e4:
    jsr B30_03ce
    lda #$b6
    ldx #$ba
    jsr B19_0c44
    jsr B30_06d2
    ldx #$00
    jsr B19_1a72
    jsr B19_1a72
    jsr EnablePRGRam
    lda #$00
    sta player_name_end
    sta $37
    ldy #$10
    lda #$a2
    B19_1a07:
    sta player_name, y
    dey
    bpl B19_1a07
    sta $d6
    jsr B19_1a8d
    jsr B31_0f34
    jmp B19_1a1e

B19_1a18:
    jsr B19_1a8d
    jsr B31_0f7c
B19_1a1e:
    bit $83
    bmi B19_1a39
    bvc B19_1a54
    B19_1a24:
    ldy $37
    beq B19_1a18
    lda player_name, y
    cmp #$a2
    bne B19_1a30
    dey
    B19_1a30:
    lda #$a2
    sty $37
    sta player_name, y
    bne B19_1a18
    B19_1a39:
    ldy $82
    cpy #$10
    beq B19_1a24
    cpy #$26
    beq B19_1a54
    lda $0580, y
    ldy $37
    sta player_name, y
    cpy #$10
    bcs B19_1a18
    iny
    sty $37
    bne B19_1a18
    B19_1a54:
    ldy $37
    beq B19_1a18
    lda player_name, y
    cmp #$a2
    beq B19_1a60
    iny
    B19_1a60:
    lda #$00
    sta player_name, y
    sta $d6
    lda #$f0
    sta $0204
    jsr WriteProtectPRGRam
    jmp B19_0b41

B19_1a72:
    ldy #$11
    B19_1a74:
    lda B19_1ab9, x
    sta $0580, x
    inx
    dey
    bne B19_1a74
    lda #$00
    sta $057e, x
    ldy #$05
    B19_1a85:
    sta $0580, x
    inx
    dey
    bne B19_1a85
    rts

B19_1a8d:
    lda #.LOBYTE(B19_1ae5)
    ldx #.HIBYTE(B19_1ae5)
    jsr B19_0c44
    lda #$32
    sta $0204
    lda #$01
    sta $0205
    lda #$00
    sta $0206
    lda $37
    asl a
    asl a
    asl a
    adc #$48
    sta $0207
    lda #.LOBYTE(B19_1aef)
    ldx #.HIBYTE(B19_1aef)
    sta $80
    stx $81
    rts

B19_1ab6:
    .byte $20,$08,$09

B19_1ab9:
    .byte $c1,$c2,$c3,$c4,$c5,$c6,$c7,$a0
    .byte $c8,$c9,$ca,$cb,$cc,$cd,$ce,$a0
    .byte $c0

B19_1aca:
    .byte $c2,$e1,$e3,$eb,$01,$cf,$d0,$d1
    .byte $d2,$d3,$d4,$d5,$a0,$d6,$d7,$d8
    .byte $d9

B19_1adb:
    .byte $da,$ae,$a7,$a0,$c0,$c5,$ee,$e4
    .byte $a0,$00

B19_1ae5:
    .byte $20,$09,$05,$21,$20,$74,$20,$08
    .byte $09,$00


; UNKNOWN
B19_1aef:
    .byte $16,$02
    .byte $01       ; X
    .byte $02       ; Y
    .byte %11010000 ; Input mask
    .byte $01       ; Tile
    .byte $08,$09
    .word $0580

B19_1af9:
    lda #.LOBYTE(B19_1b04)
    ldx #.HIBYTE(B19_1b04)
    sta $80
    stx $81
    jmp B31_0f34

; UNKNOWN
B19_1b04:
    .byte $01,$01
    .byte $00       ; X
    .byte $00       ; Y
    .byte %11000101 ; Input mask
    .byte $3a
    .byte $07,$03
    .addr B31_10d1

B19_1b0e:
    lda #.LOBYTE(B19_1b19)
    ldx #.HIBYTE(B19_1b19)
B19_1b12:
    sta $80
    stx $81
    jmp B31_0f3f

; UNKNOWN
B19_1b19:
    .byte $02,$04
    .byte $0c       ; X
    .byte $02       ; Y
    .byte %11001000 ; Input mask
    .byte $3a       ; Tile
    .byte $06,$05

B19_1b21:
    jsr GetPartyMemberData
    clc
    lda temp_word
    adc #$38
    sta $74
    lda temp_word+1
    adc #$00
    sta $75
    lda #$07
    ldx #$09
    ldy #$03
    sta $70
    stx $76
    sty $77
    jmp B30_06d2

B19_1b40:
    lda #$0b
    ldx #$07
    ldy #$05
    sta $70
    sty $77
    ldy #$00
    B19_1b4c:
    stx $76
    sty $82
    lda ($84), y
    sta $29
    jsr B19_1baf
    ldx #$13
    cpx $76
    bne B19_1b63
    inc $77
    inc $77
    ldx #$07
    B19_1b63:
    ldy $82
    iny
    cpy #$08
    bcc B19_1b4c
    lda #$00
    sta $70
    rts

B19_1b6f:
    jsr B19_15c4
    jsr EnablePRGRam
    lda #$04
    sta $6d00
    clc
    lda temp_word
    adc #$38
    sta $6d01
    lda temp_word+1
    adc #$00
    sta $6d02
    jmp WriteProtectPRGRam

B19_1b8c:
    jsr GetItemDataPointer
    ldy #$00
    lda (temp_vars), y
    sta $64
    iny
    lda (temp_vars), y
    sta $65
    jsr EnablePRGRam
    ldy #$00
    B19_1b9f:
    lda ($64), y
    sta $6d04, y
    iny
    cmp #$00
    bne B19_1b9f
    jsr WriteProtectPRGRam
    jmp B19_0b41

B19_1baf:
    jsr GetItemDataPointer
    ldy #$00
    lda (temp_vars), y
    sta $74
    iny
    lda (temp_vars), y
    sta $75
    jsr B30_06d2
    jmp B19_0b41

B19_1bc3:
    jsr GetItemDataPointer
    ldy #$06
    lda (temp_vars), y
    sta input_wordvar
    iny
    lda (temp_vars), y
    sta input_wordvar+1
    jmp B19_0b41

B19_1bd4:
    jsr GetItemDataPointer
    ldy #$02
    jsr B31_06a9
    jmp B19_0b41

GetItemDataPointer:
    jsr GetItemDataOffset
B19_1be2:
    clc
    lda temp_word
    adc #.LOBYTE(Item_Data)
    sta temp_word
    lda temp_word+1
    adc #.HIBYTE(Item_Data)
    sta temp_word+1
    rts

GetItemDataOffset:
    lda $29
B19_1bf2:
    sta temp_vars
    lda #$00
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    sta temp_vars+1
    jmp BankswitchLower_Bank00_2nd

EndText:
    jsr WAIT_CLOSE_MENU
    jmp B30_03d5

B19_1c0a:
    lda $74
    pha
    lda $73
    pha
    jsr B30_03a0
    pla
    sta $73
    pla
    sta $74
    lda #$00
    sta $2d
    ldx #$08
    ldy #$13
    stx $76
    sty $77
    jmp B19_0b41

B19_1c28:
    lda $76
    pha
    lda $77
    pha
    jsr B30_03df
    pla
    sta $77
    pla
    sta $76
    jmp B19_0b41

EquipItemRoutine:
    lda $62
    and #$3f
    sta $6b
    lda $62
    and #$c0
    asl a
    rol a
    rol a
    adc #$28
    sta $62
    lda $29
    jsr GetItemInventorySlot
    bcs B19_1c59
    tya
    adc #$20
    sta $6a
    bcc B19_1c5e
    B19_1c59:
    rts

B19_1c5a:
    lda #$00
    sta $6b
    B19_1c5e:
    jsr B19_15c4
    lda temp_word
    ldx temp_word+1
    sta $68
    stx $69
    ldy $62
    lda ($68), y
    jsr B19_1bf2
    jsr B19_1be2
    ldy #$03
    lda (temp_vars), y
    and #$3f
    sta $63
    jsr EnablePRGRam
    ldx $62
    lda B19_1ce8-$28, x
    bmi B19_1ca6
    tay
    sec
    lda ($68), y
    sbc $63
    sta ($68), y
    iny
    lda ($68), y
    sbc #$00
    sta ($68), y
    dey
    clc
    lda ($68), y
    adc $6b
    sta ($68), y
    iny
    lda ($68), y
    adc #$00
    sta ($68), y
    jmp B19_1cb8
    B19_1ca6:
    ldy #$02
    lda $63
    asl a
    eor #$ff
    and ($68), y
    sta ($68), y
    lda $6b
    asl a
    ora ($68), y
    sta ($68), y
    B19_1cb8:
    lda $6b
    beq B19_1ce0
    ldy $6a
    lda ($68), y
    tax
    ldy $62
    lda ($68), y
    bne B19_1cdb
    ldy $6a
    bne B19_1cd1
    B19_1ccb:
    lda ($68), y
    dey
    sta ($68), y
    iny
    B19_1cd1:
    iny
    cpy #$28
    bcc B19_1ccb
    dey
    lda #$00
    beq B19_1cdd
    B19_1cdb:
    ldy $6a
    B19_1cdd:
    sta ($68), y
    txa
    B19_1ce0:
    ldy $62
    sta ($68), y
    clc
    jmp WriteProtectPRGRam

B19_1ce8:
    .byte $07,$09,$09,$ff

; Run do screen transition
OverworldTransitionIntepreter:
    lda fade_type
    asl a
    tax
    lda #0
    sta fade_type
    lda OverworldTransitionLUT+1, x
    pha
    lda OverworldTransitionLUT, x
    pha
    rts

; Screen transition JSR table
OverworldTransitionLUT:
    .addr OT0_DefaultTransition-1               ; 00 : In Common banks
    .addr OT1_Stairs-1
    .addr OT2_OnyxHook-1
    .addr OT3_LabExplosion-1
    .addr OT4_Whirlpool-1
    .addr OT5_Flood-1
    .addr B19_1d34-1                            ; 06 : Unknown
    .addr B19_1e0f-1                            ; 07 : Unknown

; Screen transition type #1 (Stairs)
OT1_Stairs:
    lda #$08
    sta soundqueue_noise
    jmp OT0_DefaultTransition

; Screen transition type #2 (Onyx Hook)
OT2_OnyxHook:
    lda #$10
    sta soundqueue_pulseg0
    lda #$34
    jsr B31_0e21
    lda $06
    beq :+
    lda #25
    ldx #.LOBYTE(B25_01f8-1)
    ldy #.HIBYTE(B25_01f8-1)
    jsr TempUpperBankswitch
:   ldx #60
    jmp WaitXFrames_Min1

; Screen transition type #3 (Explosion)
OT3_LabExplosion:
    jsr B19_1d3b
B19_1d34:
    lda #$20
    sta fade_flag
    jmp OT0_DefaultTransition

B19_1d3b:
    jsr BackupPalette
    lda #$02
    sta soundqueue_noise
    lda #$14
:   pha
    lda #$34
    jsr FillPalette
    lda #$38
    jsr FillPalette
    lda #$30
    jsr FillPalette
    pla
    sec
    sbc #$01
    bne :-
    rts

; Screen transition type #4 (Sucked into whirlpool)
OT4_Whirlpool:
    lda #$09
    sta soundqueue_noise
    lda #$11
    jsr B31_0e21
    jsr B31_1d5e
    jsr ResetScroll
    lda #$5d
    ldx #$02
    jsr BANK_SWAP
    jsr B30_0e6d
    lda #$5c
    ldx #$02
    jsr BANK_SWAP
    lda #$1f
    ldx #$be
    sta temp_word
    stx temp_word+1
    jsr B31_0087

    LoadPalette_Address B19_1e2f

    ldy #$16
    B19_1d91:
    tya
    pha
    ldx #$08
    B19_1d95:
    jsr PpuSync
    lda #$01
    sta $0305, x
    lda $0303, x
    and #$1f
    bne B19_1daa
    lda #$e8
    ldy #$ff
    bne B19_1dae
    B19_1daa:
    lda #$08
    ldy #$00
    B19_1dae:
    clc
    adc $0306, x
    sta $0306, x
    tya
    adc $0307, x
    sta $0307, x
    clc
    txa
    adc #$08
    tax
    cpx #$28
    bcc B19_1d95
    lda #$08
    sta $e5
    pla
    tay
    dey
    bne B19_1d91
    jsr B31_1d5e
    jsr OT0_DefaultTransition
    ldx #90
    jmp WaitXFrames_Min1

; Screen transition type #5 (Underwater lab floods)
OT5_Flood:
    lda #$11
    jsr FillBackgroundColor
    lda #$03
    sta soundqueue_noise
    jsr B31_1dc0
    ldx #$08
    ldy #$07
    B19_1dea:
    lda B19_1e4f, y
    sta $0305, x
    dey
    lda B19_1e4f, y
    sta $0304, x
    clc
    txa
    adc #$08
    tax
    dey
    bpl B19_1dea
    jsr BankswitchLower_Bank20
    jsr B20_1641
    lda #$11
    jsr BackupAndFillPalette
    ldx #90
    jmp WaitXFrames_Min1

B19_1e0f:
    jsr B19_1d34
    lda #$ff
    jsr PlayMusic
    ldx #90
    jsr WaitXFrames_Min1
    jmp B19_1561

.byte $60,$e0,$40,$18
.byte $68,$c8,$40,$00
.byte $58,$b0,$40,$08
.byte $60,$98,$40,$10

B19_1e2f:
.byte $0f,$22,$20,$11
.byte $0f,$10,$1a,$11
.byte $0f,$30,$00,$11
.byte $0f,$00,$10,$30
.byte $0f,$0f,$01,$31
.byte $0f,$0f,$13,$32
.byte $0f,$0f,$22,$32
.byte $0f,$0f,$11,$32

B19_1e4f:
    .byte $fe,$ff
    .byte $02,$ff
    .byte $ff,$fe
    .byte $01,$fe

B19_1e57:
    lda save_slot
    jsr B19_1ebb
    jsr B19_1ed3
    jsr EnablePRGRam
    sec
    ldy #$00
    lda ($64), y
    sbc temp_word
    sta ($64), y
    iny
    lda ($64), y
    sbc temp_word+1
    sta ($64), y
    ldx #$03
    B19_1e75:
    ldy #$00
    B19_1e77:
    lda ($64), y
    sta ($68), y
    iny
    bne B19_1e77
    inc $65
    inc $69
    dex
    bne B19_1e75
    jmp WriteProtectPRGRam

B19_1e88:
    jsr B19_1ebb
    jsr EnablePRGRam
    ldx #$03
    B19_1e90:
    ldy #$00
    B19_1e92:
    lda ($68), y
    sta ($64), y
    iny
    bne B19_1e92
    inc $69
    inc $65
    dex
    bne B19_1e90
    jsr WriteProtectPRGRam
    jsr B19_1ed3
    lda save_slot
    and #$f0
    cmp #$b0
    bne B19_1eba
    lda save_slot_state
    cmp #$e9
    bne B19_1eba
    lda temp_word
    ora temp_word+1
    B19_1eba:
    rts

B19_1ebb:
    and #$07
    sta $69
    asl a
    adc $69
    adc #$77
    sta $69
    lda #$00
    sta $68
B19_1eca:
    lda #.LOBYTE(starting_sram)
    ldx #.HIBYTE(starting_sram)
    sta $64
    stx $65
    rts

B19_1ed3:
    jsr B19_1eca
    lda #$00
    sta temp_word
    sta temp_word+1
    ldx #$03
    B19_1ede:
    ldy #$00
    B19_1ee0:
    clc
    lda ($64), y
    adc temp_word
    sta temp_word
    iny
    lda ($64), y
    adc temp_word+1
    sta temp_word+1
    iny
    bne B19_1ee0
    inc $65
    dex
    bne B19_1ede
    jmp B19_1eca
