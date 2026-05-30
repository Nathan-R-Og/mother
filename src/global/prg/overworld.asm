; zeropage variables
input_wordvar = global_wordvar ; 16-bit var often used to "input" values for use in upcoming functions

curr_player_id = UNK_28
curr_item_id   = UNK_28+1
printing_state = UNK_2C    ; temp variable name, document more when understood
; 00 = Clear (Initial string prints textbox and gets printed at default spot)
; 08 = Continuing (adds break at end -> next string is printed)
; 09 = Yes / No Menu
; 18 = Selection Menu (Who?)
; 1C = Input Number (used for ATM)
; 20 = opens Inventory for item selection
; 21 = opens Storage for item selection
; 22 = Shop Menu
; 37 = Custom Yes / No Menu

tableentry_var = UNK_40 ; area in zpage ram where table entry's data is often stored (but can be used for other purposes, ofc)

temp_vars               = UNK_60       ; area in zpage ram where temp vars are stored
temp_word               = UNK_60       ; different label when $60 is being used as a word (16-bit)
    temp_word_lo        = UNK_60
    temp_word_hi        = UNK_60+1

curr_player_dataptr     = UNK_68

.segment        "PRG13": absolute

; Overworld Engine
OM_OPEN_FULLSTATS:
    lda #PulseG0_MenuBloop
    sta soundqueue_pulseg0
CommandState:
    ;store learned_melodies
    lda learned_melodies
    sta temp_vars

    ;if high bit of learned_melodies != 0, write music note
    ;else, write dot
    ldy #$f0
    @write_melodies:
    lda #dot_tile ;dot tile
    lsr temp_vars
    bcc @keep_blank
    lda #music_note ;music note tile
    @keep_blank:
    sta BATTLER, y
    iny
    cpy #$f8
    bcc @write_melodies

    lda #0
    sta BATTLER, y

    @B19_0021:
    ldx #0
    @B19_0023:
    jsr GetXCharacter
    ;if failed, jump
    bcs @B19_0084
    ;else,
    jsr GetPartyMemberPtr
    ;stash x
    txa
    pha

    ;copy data to actual ram
    ldy #$3f
    @copy_party_member_data:
    lda (temp_vars), y
    sta BATTLER, y
    dey
    bpl @copy_party_member_data

    ldx #$80
    ldy #party_info::weapon
    @bcc_3:
    lda BATTLER, y
    sta curr_item_id
    ;get item
    jsr B19_008f

    iny
    cpy #party_info::crumb_coords
    bcc @bcc_3

    jsr B30_03e6

    ;load text info
    lda #.LOBYTE(State_TextOverlay)
    ldx #.HIBYTE(State_TextOverlay)
    jsr O_DrawCurrentTilepack

    lda #$c0
    sta UNK_28+1
    jsr B19_00b3


    ;do choicer
    lda #.LOBYTE(State_Choicer)
    ldx #.HIBYTE(State_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr PRINT_CURR_CHOICER

    @B19_0064:
    ;test bits of menucursor_pos+1 (the buttons pressed)
    bit menucursor_pos+1
    bvs @B19_008b
    lda menucursor_pos
    beq @B19_0082
    jsr B19_00b3
    bcs @B19_0074
    jsr B19_00b3
    @B19_0074:

    ;store 10,3 for x,y
    ldx #10
    ldy #3
    stx ntbl_x
    sty ntbl_x+1
    jsr B31_0f7c

    jmp @B19_0064

    @B19_0082:
    pla
    tax
    @B19_0084:
    inx
    cpx #4
    bcc @B19_0023
    bcs @B19_0021
    @B19_008b:
    pla
    jmp CLEAR_TEXTBOXES_ROUTINE

;print item from id???
B19_008f:
    ;stash y and x
    tya
    pha
    txa
    pha

    jsr GetItemDataPointer

    ldy #0
    lda (temp_vars), y

    sta UNK_64
    iny
    lda (temp_vars), y
    sta UNK_64+1
    pla
    tax
    ldy #0
    B19_00a5:
    lda (UNK_64), y
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
    stx UNK_68
    jsr B30_1ccd
    ldx UNK_68
    and BATTLER, y
    beq B19_00c4
    jsr B19_008f
    B19_00c4:
    inc curr_item_id
    bne B19_00e1
    lda #$c0
    sta curr_item_id
    cpx #$41
    bcs B19_00db
    rts

B19_00d1:
    lda #0
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
    lda #.LOBYTE(State_PSIOverlay)
    ldx #.HIBYTE(State_PSIOverlay)
    sta tilepack_ptr
    stx tilepack_ptr+1
B19_00ed:
    jsr DrawTilepackClear
    cmp #0
    bne B19_00ed
    rts

State_TextOverlay:
    .ifdef VER_JP
        .define US_MOD 0
    .else
        .define US_MOD 1
    .endif

    ;print the name
    .byte set_pos 11, 3
    .byte print_number $0638, 0, 6+US_MOD
    .byte stopText

State_PSIOverlay:
    ;print the psi panel contents
    .byte set_pos 19, 5
    .byte print_number $0640, 0, 10+US_MOD
    .byte newLine
    .byte print_number $0650, 0, 10+US_MOD
    .byte newLine
    .byte print_number $0660, 0, 10+US_MOD
    .byte newLine
    .byte print_number $0670, 0, 10+US_MOD
    .byte stopText

State_Choicer:
    .byte 2, 1 ; choicer array size
    .byte 9, 0 ; X/Y inc
    .byte PAD_A | PAD_B | PAD_DOWN | PAD_RIGHT ; Input mask
    .byte $3a ; Tile
    .byte 10, 3 ;X/Y start
    .addr EIGHT_OPTIONS_LUT ; choices

Idle_DadPhonecall:
    lda #$80
    bit UNK_D4
    bne @exit
    ldx frame_counter+2
    ldy frame_counter+1
    cpx #6
    bcc @exit
    cpy #$90
    bcc @exit
    ;if framecounter >= 0x069000, get a call from dad

    ora UNK_D4
    sta UNK_D4

    ;play phonecall
    lda #$2f
    jsr B30_0de4

    ldx #$3E*2 ;intro
    jsr DisplayText
    ldx #$3F*2 ;reset prompt
    jsr DisplayText
    ldx #$40*2 ;menu continue rest
    jsr DisplayText

    lda #$37
    sta UNK_2C

    jsr B19_0dc1

    bit menucursor_pos+1
    bvs @decline
    lda menucursor_pos
    beq @decline
    jsr Game_Begin

    ldx #$43*2 ;saved, resetting
    jsr DisplayText
    jmp OINST_Reset
    @exit:
    rts

    @decline:
    ldx #$41*2 ;say no
    jsr DisplayText
    ldx #$42*2 ;good luck
    jsr DisplayText

    jsr OINST_END
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_0178:
    lda #PulseG0_MenuBloop
    sta soundqueue_pulseg0

    jsr B30_026c

    lda #.LOBYTE(Command_Choicer)
    ldx #.HIBYTE(Command_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr PRINT_CURR_CHOICER

    .ifdef VER_JP
        lda #$c5
        jsr B31_10b0
    .endif
    bit menucursor_pos+1
    bmi B19_0192
    jmp CLEAR_TEXTBOXES_ROUTINE
    B19_0192:
    .ifndef VER_JP
        lda #$ff
        jsr B31_10b0
    .endif
    lda menucursor_pos
    asl a
    tax
    lda OverworldCommandLUT+1, x
    pha
    lda OverworldCommandLUT  , x
    pha
    rts

OverworldCommandLUT:
    .addr CommandTalk-1 ; 00 - TALK
    .addr CommandCheck-1 ; 01 - CHECK
    .ifdef VER_JP
        .addr CommandPSI-1 ; 02 - PSI ?
        .addr CommandGoods-1 ; 03 - GOODS ?
    .else
        .addr CommandGoods-1 ; 02 - GOODS ?
        .addr CommandState-1 ; 03 - STATE ?
        .addr CommandPSI-1 ; 04 - PSI ?
        .addr CommandSetup-1 ; 05 - SETUP
    .endif

Command_Choicer:
    .ifdef VER_JP
        .byte 1, 4 ; choicer array size
        .byte 0, 2 ; X/Y inc
    .else
        .byte 2, 3 ; choicer array size
        .byte 6, 2 ; X/Y inc
    .endif
    .byte PAD_A | PAD_B ; Input mask
    .byte $3a ; Tile
    .byte 2, 3 ; X/Y start
    .addr EIGHT_OPTIONS_LUT ; choices

.ifndef VER_JP
CommandSetup:
    lda #.BANK(SetupMenu)
    ldx #.LOBYTE(SetupMenu-1)
    ldy #.HIBYTE(SetupMenu-1)
    jsr TempUpperBankswitch
    jmp CLEAR_TEXTBOXES_ROUTINE
.endif

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
    sta UNK_34
    jsr B19_0b0f
    bcs B19_01e9
    B19_01e1:
    jmp CLEAR_TEXTBOXES_ROUTINE

B19_01e4:
    jsr B19_0b48
    bcc B19_01e1
B19_01e9:
    rts

CommandTalk:
    jsr OBJECT_INTERACTION
    asl a
    bpl @B19_0200
    and #$0F<<1
    beq @B19_0204
    jsr B31_02a2
    lda #$0a ; Interaction type: TALK
    sta UNK_34
    jsr B19_0b0f
    bcc @B19_020c
    @B19_0200:
    ldx #1*2
    bne @B19_0206
    @B19_0204:
    ldx #2*2
    @B19_0206:
    jsr DisplayText
    jsr OINST_END
    @B19_020c:
    jmp CLEAR_TEXTBOXES_ROUTINE

CommandCheck:
    jsr OBJECT_INTERACTION
    jsr B19_09c7
    bne @not_a_present
    jsr OpenPresent
    jmp CLEAR_TEXTBOXES_ROUTINE
    @not_a_present:
    asl a
    bpl @B19_022d
    and #$0F<<1
    beq @B19_022d
    lda #$0b
    sta UNK_34 ; Interaction type: CHECK
    jsr B19_0b0f
    bcc @B19_0235
    @B19_022d:
    ldx #3*2
    jsr DisplayText
    jsr OINST_END
    @B19_0235:
    jmp CLEAR_TEXTBOXES_ROUTINE

CommandPSI:
    jsr OpenOverworldPSI
    bcc SelectedOverworldPSI
    jmp CLEAR_TEXTBOXES_ROUTINE

SelectedOverworldPSI:
    jsr OA_End
    ldy #7
    lda (temp_vars), y
    sta UNK_43
    sec
    ldy #$16
    lda (tableentry_var), y
    sbc UNK_43
    iny
    lda (tableentry_var), y
    sbc #0
    bcc B19_025d
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine
    B19_025d:
    ldx #8*2
    jmp DisplayTextAndFinishRoutine

CommandGoods:
    jsr OpenOverworldGoods
    bcc SelectedOverworldGood
    jmp CLEAR_TEXTBOXES_ROUTINE

SelectedOverworldGood:
    jsr DRAW_WINDOW_ITEMACTIONS
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    beq @B19_0281
    lda curr_item_id
    cmp #3
    beq @B19_0281
    lda #.LOBYTE(ItemUse_WhateverThisIS)
    ldx #.HIBYTE(ItemUse_WhateverThisIS)
    bne @B19_0285
    @B19_0281:
    lda #.LOBYTE(EIGHT_OPTIONS_LUT)
    ldx #.HIBYTE(EIGHT_OPTIONS_LUT)
    @B19_0285:
    sta UNK_84
    stx UNK_84+1
    lda #.LOBYTE(ItemUse_Choicer)
    ldx #.HIBYTE(ItemUse_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr B31_0f3f
    .ifdef VER_JP
        lda #$c5
        jsr B31_10b0
    .endif
    bit menucursor_pos+1
    bmi B19_02a7
    bpl CommandGoods

ItemUse_Choicer:
    .ifdef VER_JP
        .byte 1, 4 ; choicer array size
    .else
        .byte 1, 5 ; choicer array size
    .endif

    .byte 0, 2 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3a ; Tile

    .ifdef VER_JP
        .byte 26, 7 ;X/Y start
    .else
        .byte 24, 7 ;X/Y start
    .endif

ItemUse_WhateverThisIS:
    .byte 0,0,3,4
    .ifndef VER_JP
        .byte 0
    .endif

B19_02a7:
    .ifndef VER_JP
        lda #$ff
        jsr B31_10b0
    .endif
    jsr OA_End
    lda menucursor_pos
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
    .ifndef VER_JP
        .addr SELECTION_LOOK-1
    .endif

; temp_vars = $60 = Item data (0x8 len)
SELECTION_USE:
    ; if item's power != 0, branch to Equip
    ldy #itemd::power
    lda (temp_vars), y
    bne SELECTION_Equip
    ; if item's flags have no users, branch to Useless
    ldy #itemd::flags
    lda (temp_vars), y
    and #%00111111                  ; mask userbits (upper 2 are used for key and eat)
    beq @UselessItemUse
    ; check userbits for valid item use
    ldx curr_player_id
    and PlayerUsableBitfieldLUT, x
    beq @CannotUseItem
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine

@UselessItemUse:
    ldx #$b*2                        ; "[Name] used the [Item]."
    jsr DisplayText
    jsr OA_NothingHappened
    jmp FinishedTextboxRoutine

@CannotUseItem:
    ldx #$c*2                        ; "[Name] can't use the [Item]."
    jmp DisplayTextAndFinishRoutine

SELECTION_Equip:
    sta UNK_62
    ldy #itemd::flags
    lda (temp_vars), y
    ldx curr_player_id
    and PlayerUsableBitfieldLUT, x
    beq @CannotEquipItem
    jsr EquipItemRoutine
    bcs @CannotEquipItem
    ldx #$e*2                        ; "[Name] equipped the [Item]."
    jsr DisplayText
    lda #Triangle_Equip
    sta soundqueue_triangle
    jmp FinishedTextboxRoutine
@CannotEquipItem:
    ldx #$f*2                        ; "[Name] can't equip the [Item]."
    jmp DisplayTextAndFinishRoutine

SELECTION_GIVE:
    ;x = pc_count
    ldx pc_count
    dex
    ;if pc_count-1 == 0, fail
    beq @GiveFail
    ;else,

    ;check if item == breadcrumbs
    lda curr_item_id
    cmp #3 ; bread crumbs id
    ;if so, fail
    beq @CantGiveItem

    ;ask who
    jsr PromptWho
    ;if backed out, cancel
    bcs @CancelGive

    ;if target's inventory is full, say it is full
    jsr IsTargetInventoryFull
    bcs @ReceiverFull
    ;else, remove the item
    jsr RemoveItem
    cmp UNK_42
    beq @ReceiverWeird
    jsr PlayerStatusCheck
    bne @GiverIsDead

    ;actually move the item
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bne @AliveToDead

; @AliveToAlive ; (1 person to another)
    ldx #$12*2
    jmp DisplayTextAndFinishRoutine

@AliveToDead:
    ldx #$26*2
    jmp DisplayTextAndFinishRoutine

@GiverIsDead:
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bne @DeadToDead
; @DeadToAlive
    ldx #$27*2
    jmp DisplayTextAndFinishRoutine

; funky logic where this location gets jumped to in 2 different locations
; parses between player giving item to self (when the target is alive)
; or giving between dead to dead (when the target is dead)
@ReceiverWeird:
    jsr PlayerStatusCheck
    bne @DeadToDead
; @GiveToSelf
    ldx #$28*2
    jmp DisplayTextAndFinishRoutine

@DeadToDead:
    ldx #$29*2
    jmp DisplayTextAndFinishRoutine

; used by bread crumbs only in vanilla
@CantGiveItem:
    ldx #$13*2
    jmp DisplayTextAndFinishRoutine

@ReceiverFull:
    lda curr_player_id
    cmp UNK_42
    beq @ReceiverWeird
; @ReceiverFull
    ldx #$14*2
    jmp DisplayTextAndFinishRoutine

@GiveFail:
    ldx #6*2                            ; "You don't have any friends to give items to yet."
    jmp DisplayTextAndFinishRoutine
@CancelGive:
    jmp SelectedOverworldGood

SELECTION_EAT:
; bittest if item is edible
    ldy #itemd::flags
    lda (temp_vars), y
    and #$40
    beq :+
    jsr OverworldActionInterpreter
    jmp FinishedTextboxRoutine
; @ItemNotEdible
:   ldx #$d*2                            ; item isnt edible msg
    jmp DisplayTextAndFinishRoutine

SELECTION_DROP:
    jsr TryDropItem
    bcs @DropItemFailed
    jsr PlayerStatusCheck
    bne @OwnerDead
; @Owner Alive
    ldx #$10*2                            ; threw away item msg
    jmp DisplayTextAndFinishRoutine
@OwnerDead:
    ldx #$2a*2                            ; Leader threw out someone else's item msg
    jmp DisplayTextAndFinishRoutine
; when item is a key item
@DropItemFailed:
    ldx #$11*2                            ; item is a key msg
    jmp DisplayTextAndFinishRoutine

.ifndef VER_JP
SELECTION_LOOK:
    clc
    lda curr_item_id
    adc #.LOBYTE(UMSG::LOOK_NULLITEM)
    sta text_id+1
    lda #0
    adc #.HIBYTE(UMSG::LOOK_NULLITEM)
    sta text_id
    jsr O_PrintText
    jmp FinishedTextboxRoutine
.endif

OverworldActionInterpreter:
    ldy #itemd::oa
    lda (temp_vars), y
    asl a
    tax
    lda OVERWORLD_ACTIONS_POINTERS+1, x
    pha
    lda OVERWORLD_ACTIONS_POINTERS, x
    pha
    rts

;the reason these are all -1 are because of NES accessing stuff.
; manual - update enum OAID in macros.asm
OVERWORLD_ACTIONS_POINTERS:
    .addr OA_NothingHappened-1          ; ID 00
    .addr OA_INTERACT-1
    .addr OA_NothingHappened-1
    .addr OA_NothingHappened-1
    .addr OA_NothingHappened-1
    .addr OA_BREAD-1
    .addr OA_TOFU-1
    .addr OA_INTERACT-1                 ; ID 07 Phone Card
    .ifdef VER_JP
        .addr OA_NothingHappened-1
        .addr $c000-1                   ; ID 09 Debug (removed in US)
    .else
        .addr OA_REPEL_RING-1
        .addr OA_NothingHappened-1      ; ID 09 Debug (removed in US)
    .endif
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
    jsr OBJECT_INTERACTION
    asl a
    bpl OA_TriedUselessPSI
    and #$1E
    beq OA_TriedUselessPSI
    lda #$C
    sta UNK_34
    jsr B19_0b0f
    bcs OA_TriedUselessPSI
    rts

; Probably some vestigial code. Completely unused in vanilla.
OA_TriedUselessPSI:
    ldx #7*2                    ; "[Name] tried [PSI]."
    jsr DisplayText
;   jmp OA_NothingHappened      ; fallthru

OA_NothingHappened:
    ldx #$15*2                    ; "Nothing happened."
DisplayText:
    jsr ReadOverworldMessageLUT
    jmp O_PrintText

; prints "by NUM." msg, used for HP/PP recovery and stat booster items
; (2nd line of the msg)
OA_Print_ByNum:
    jsr ReadOverworldMessageLUT
    jmp O_TextInterpretCurrent

OA_INTERACT:
    jsr OBJECT_INTERACTION
    asl a
    bpl OA_NothingHappened
    and #$1E
    beq OA_NothingHappened
    lda #$0D
    sta UNK_34
    jsr B19_0b0f
    bcs OA_NothingHappened
    rts

.ifndef VER_JP
OA_REPEL_RING:
    jsr OA_DeleteItemSelf
    jsr EnablePRGRam
    lda #10
    sta repel_counter
    jsr WriteProtectPRGRam
    ldx #$b*2
    jmp DisplayText
.endif

OA_CRUMBS:
    jsr OA_DeleteItemSelf
    jsr EnablePRGRam

    ;write 4 bytes
    ldy #$2C
    @loop:
    lda (tableentry_var), y
    sta xpos_music-$2c, y
    iny
    cpy #$30
    bcc @loop

    jsr WriteProtectPRGRam
    lda #$40
    sta fade_flag
    lda #1
    sta fade_type
    ldx #$24*2
    jmp DisplayText

OA_BREAD:
    lda menucursor_pos
    bne @BreadEat
; @BreadUse
    lda #3
    jsr GetItemInventorySlot
    bcc @BreadUseFail
; @BreadUseSuccess
    lda curr_item_id
    jsr GetItemInventorySlot
    jsr EnablePRGRam
    lda #3
    sta (temp_vars), y

    ;load 4 bytes
    ldy #$2C
    @loop:
    lda xpos_music-$2c, y
    sta (tableentry_var), y
    iny
    cpy #$30
    bcc @loop

    jsr WriteProtectPRGRam
    ldx #$22*2                    ; "[Name] used the bread."
    jmp DisplayText
@BreadUseFail:
    ldx #$23*2                    ; "You need to toss your old crumbs first!"
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
    ldx #$b*2
    jmp OA_UseHPItem
OA_BIG_BAG:
    lda #30
    jsr STA_word60
    jsr PromptWho
    bcs CancelWho
    .ifndef VER_JP
        jsr MOV_word60_word40
        jsr PlayerStatusCheck
        bmi OA_ConsumeItemUseless
    .endif
    jsr OA_End
    ldx #$21*2
    jsr DisplayText
    jsr EnablePRGRam
    dec big_bag_uses
    php
    jsr WriteProtectPRGRam
    plp
    bne @exit
    jsr RemoveItem
    ldx #$2b*2
    jsr DisplayText
    @exit:
    jmp RestoreHPEndRoutine

OA_Drink:
    ldx #$17*2
    bne SetVar_InputNum
OA_Eat:
    ldx #$16*2
SetVar_InputNum:
    stx tilepack_ptr
    jsr STA_word60
    ldx tilepack_ptr
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
RestoreHPEndRoutine:
    jsr RestoreHP
    jmp EndText

CancelWho:
    pla
    pla
    jmp SelectedOverworldGood

; JMPed to when item consumption does nothing (like using food on a dead person)
OA_ConsumeItemUseless:
    jsr RemoveItem
    ldx #$2c*2
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
    bmi @end
    jsr MOV_word60_word40
    jsr PlayerStatusCheck
    bmi OA_ConsumeItemUseless
    @end:
    jsr OA_End
    jsr O_PrintText
    jsr RemoveItem
OA_CureStatusEffect:
    ldy #1
    lda (tableentry_var), y
    and input_wordvar
    beq OA_JMPNothingHappened
    jsr EnablePRGRam
    lda input_wordvar
    php
    eor #$FF
    and (tableentry_var), y
    sta (tableentry_var), y
    plp
    bpl @no_revive
    jsr RevivePlayerEffect
    @no_revive:
    jsr WriteProtectPRGRam
    lda #PulseG0_Recovery
    sta soundqueue_pulseg0
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
    lda (tableentry_var), y
    adc input_wordvar
    sta UNK_64
    bcc @no_carry
    clc
    lda input_wordvar
    sbc UNK_64
    sta input_wordvar
    @no_carry:
    jsr EnablePRGRam
    clc
    lda (tableentry_var), y
    adc input_wordvar
    sta (tableentry_var), y
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
    jsr OpenTeleportMenu
    bcs PSIWhoBackout
    jsr PromptWhoConfirm
    ldx #7*2
    jsr DisplayText
    pla
    pla
    pla
    pla
    jsr OINST_END
    jmp PSITELEPORT_START

; Determines what type of Teleport is being used (the PSI, OnyxHook, Crumbs)
TeleportParser:
    lda event_flags+31
    and #$02
    beq @exit
    pla
    pla
    ldx #9*2
    jmp DisplayText
    @exit:
    rts

; Parameter: A = Recovery value
OA_TryLifeup:
    jsr STA_word60
DoLifeupRoutine:
    jsr PromptWho
    bcs PSIWhoBackout
    jsr PromptWhoConfirm
    ldx #7*2                        ; "[Name] tried [PSI]."
    jsr DisplayText
    jsr OA_End
    jsr PlayerStatusCheck
    bmi LifeupFail
    jsr RestoreHP
    jmp EndText

; runs when B is pressed while in "Who?" prompt selection state when using PSI
PSIWhoBackout:
    pla
    pla
    jmp CommandPSI

LifeupFail:
    jmp OA_NothingHappened

OA_TryHealingPSI:
    sta input_wordvar
    sty input_wordvar+1
    jsr PromptWho
    bcs PSIWhoBackout
    jsr PromptWhoConfirm
    ldx #7*2
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
    ldx #$1a*2
    jsr DisplayText
    ldx #$30
    jmp OA_Print_ByNum

; Parameters
;   Y : local offset of stat
LoadBigStat:
    clc
    lda (tableentry_var), y
    adc input_wordvar
    sta UNK_64
    iny
    lda (tableentry_var), y
    adc input_wordvar+1
    sta UNK_64+1
    rts

; Parameters
;   Y : local offset of stat
SetBigStatCap:
    sec
    lda (tableentry_var), y
    sbc UNK_64
    sta UNK_68
    iny
    lda (tableentry_var), y
    sbc UNK_64+1
    sta UNK_68+1
    bcs @B19_06d0
    lda input_wordvar
    adc UNK_68
    sta input_wordvar
    lda input_wordvar+1
    adc UNK_68+1
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
    lda current_banks+6
    pha
    ldy #object_m_direction
    lda (object_pointer), y
    asl a
    asl a
    asl a
    tax
    jsr B31_02bf
    pla
    ldx #BANK::PRG8000
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
    lda curr_player_id
    ldx #0
@LoopStart:
    cmp party_members, x
    clc
    beq @LoopRTS
    inx
    cpx #4
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
    ldx #$17*2
    ldy #$5a
    jmp OA_UseStatusCureItem
OA_MOUTHWASH:
    lda #COLD
    ldx #$b*2
    ldy #$5c
    jmp OA_UseStatusCureItem

OA_PSI_STONE:
    lda #20                     ; recovery value
    jsr STA_word60
    ldx #$2f*2                    ; Used PSI Stone msg
    jsr DisplayText
    ldy #CurrPP_Offset
    jsr LoadBigStat
    ldy #PP_Offset
    jsr SetBigStatCap
    jsr EnablePRGRam
    ldy #CurrPP_Offset
    jsr IncreaseBigStat
    jsr WriteProtectPRGRam
    ldx #$1b*2                    ; Recovered PP msg
    jsr DisplayText
    ldx #$18*2
    jsr OA_Print_ByNum
; @TryBreaking
    jsr RNG_BYTE
    cmp #$19
    bcs :+
; @BreakSuccess
    jsr OA_DeleteItemSelf
    ldx #$30*2                    ; PSI Stone broke msg
    jsr DisplayText
:   jmp EndText

OA_RIBBON:
    ldx #$25*2
    jsr DisplayText
    jsr OA_DeleteItemSelf
    ldy #Fce_Offset
    jmp OA_StatBoosterEffect
OA_CANDY:
    ldx #$16*2
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
    .ifdef VER_JP
        lda event_flags+$1E
    .else
        lda event_flags+$1C
    .endif
    bpl @OnyxHookEffect
    jmp OA_NothingHappened
    @OnyxHookEffect:
    jsr EnablePRGRam
    ;copy onyx_hook_warpdata to sram
    ldx #3
    @copy_loop:
    lda onyx_hook_warpdata, x
    sta xpos_music, x
    dex
    bpl @copy_loop

    jsr TeleportParty
    jsr REMOVE_EVE_FROM_PARTY
    lda #2
    sta fade_type
    lda #$40
    sta fade_flag
    ldx #$b*2
    jmp DisplayText

onyx_hook_warpdata:
    doorArgDef $9, $279, DIRECTIONS::DOWN, $2A1

OA_FINAL_WEAPON:
    ldx #$31*2
    jmp DisplayText

OA_RULER:
    ldx #$32*2
    jmp DisplayText

OA_DIARY:
    ldx #$3a*2
    jmp DisplayText

OA_OCARINA:
    ldx #$38*2
    jsr DisplayText
    lda #1
    jsr B30_0de4
    ldx #$39*2
    jmp DisplayText

; map item (unused in US version)
OA_MAP:
.ifndef VER_JP
    pla
    pla
    ldx #$3c*2
    jsr DisplayText
    jmp OpenMapEffect

; call located in constant bank
OpenMapWithButton:
    lda #PulseG0_MenuBloop
    sta soundqueue_pulseg0
    ;fallthrough

OpenMapEffect:
.endif
    lda map_current_palette
    cmp #1
    beq @OpenMapSuccess
    cmp #2
    beq @OpenMapSuccess
    ; @OpenMapFail
    ldx #$3d*2
    .ifdef VER_JP
        jmp DisplayText

    @OpenMapSuccess:
        ldx #$3c*2
        jsr DisplayText
        jsr OINST_END
        pla
        pla
        pla
        pla
    .else
        jmp DisplayTextAndFinishRoutine
    @OpenMapSuccess:
        jsr OINST_END
    .endif
    jsr OT0_DefaultTransition
    jsr ClearSprites

    ldx #0
    ldy #8
    jsr SetScroll

    ;enable bg and show sprites in first 8
    lda #%00000110
    ora ram_PPUMASK
    sta ram_PPUMASK

    lda #$5b
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    jsr B30_0e6d

    BankswitchCHR_Address map_chr_bankswitch_data

    ;load tile index
    lda #$df
    sta shadow_oam+1
    ;load attr
    lda #0
    sta shadow_oam+2

    ;shadow_oam[0].x = .HIBYTE(object_memory[0].object_m_xpos)
    ldx #%01000000
    lda object_memory+object_m_xpos+1
    jsr @MapCursorAttr
    sbc #8
    sta shadow_oam+3
    ;shadow_oam[0].y = .HIBYTE(object_memory[0].object_m_ypos)
    ldx #%10000000
    lda object_memory+object_m_ypos+1
    jsr @MapCursorAttr
    sbc #$21
    sta shadow_oam

    LoadPalette_Address map_palettes_data

    lda #0
    sta pad1_forced
    @loop:
    ldx #8
    jsr WaitXFrames_Min1
    lda #%11011111
    eor shadow_oam+1
    sta shadow_oam+1
    bit pad1_forced
    bvc @loop
    lda #0
    sta pad1_forced
    lda #$f0
    sta shadow_oam
    jsr PpuSync
    jsr B31_0ddf
    jsr RestorePalette

    ;no sprites left side, disable bg
    lda #%11111001
    and ram_PPUMASK
    sta ram_PPUMASK

    lda #$7e
    ldx #BANK::CHR1800
    jsr BANK_SWAP

    lda #0
    sta disable_dmc
    .ifdef VER_JP
        jmp B30_0b70
    .else
        jsr ClearSprites
        jmp STORE_COORDINATES
    .endif

;in:
;a == position
;x == attr to apply
;out:
;a == new position
;clobbers:
;a, x, y, c
@MapCursorAttr:
    sec
    ;if !position & 0x80, exit immediately
    bpl @exit

    ;y = a
    tay
    ;a = x
    txa
    ora shadow_oam+2
    sta shadow_oam+2
    tya
    sbc #7
    @exit:
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
    lda #0
    sta temp_word+1
    jsr RNG_WORD
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

.ifdef VER_JP
    .define offsetter pmb_pad3+$10
.else
    .define offsetter WHERE_JP_STRINGS_ARE+$20
.endif

OA_End:
    jsr EnablePRGRam
    jsr MOV_word60_word40
    lda #4
    sta offsetter
    clc
    lda tableentry_var
    adc #$38
    sta offsetter+1
    lda tableentry_var+1
    adc #0
    sta offsetter+2
    jsr GetItemDataPointer
    ldy #0
    lda (temp_vars), y
    sta UNK_64
    iny
    lda (temp_vars), y
    sta UNK_64+1

    ldy #0
    @loop:
    lda (UNK_64), y
    sta offsetter+4, y
    iny
    cmp #0
    bne @loop

    jmp WriteProtectPRGRam

MOV_word60_word40:
    lda curr_player_id
    jsr GetPartyMemberPtr
    lda temp_word
    sta tableentry_var
    lda temp_word+1
    sta tableentry_var+1
    rts

PlayerStatusCheck:
    ldy #1
    lda (tableentry_var), y
    and #$f0
    rts

IsTargetInventoryFull:
    lda #0
    jsr GetItemInventorySlot
    bcs OLocal_SEC_RTS
    jsr EnablePRGRam
    lda curr_item_id
    sta (temp_vars), y
    clc
    jmp WriteProtectPRGRam

TryDropItem:
    jsr IsKeyItem
    bne OLocal_SEC_RTS
OA_DeleteItemSelf:
    lda curr_item_id
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
    lda curr_player_id
    pha
    lda UNK_42
    sta curr_player_id
    jsr OA_DeleteItemSelf
    pla
    sta curr_player_id
    rts

PromptWhoConfirm:
    jsr EnablePRGRam
    sec
    ldy #$16
    lda (tableentry_var), y
    sbc UNK_43
    sta (tableentry_var), y
    iny
    lda (tableentry_var), y
    sbc #0
    sta (tableentry_var), y
    jmp WriteProtectPRGRam

B19_09c7:
    tay
    beq @B19_09d3
    tax
    ldy #object_m_type
    lda (object_pointer), y
    and #$3f
    tay
    txa
    @B19_09d3:
    cpy #$20
    rts

OpenPresent:
    jsr GetObjectDataAndBank
    jsr GetPresentFlag
    and All_Bits, x
    bne @B19_09fd
    lda #$04
    jsr B31_02c2
    ldx #$33*2
    jsr DisplayText
    lda #PulseG0_PlayerAttack
    sta soundqueue_pulseg0
    ldy #6
    lda (object_data), y
    and #$7f
    sta curr_item_id
    bne @B19_0a05
    jsr B19_0a3f
    @B19_09fd:
    ldx #$3b*2
    jsr DisplayText
    jmp OINST_END

    @B19_0a05:
    jsr B19_1b8c
    ldx #$34*2
    jsr DisplayText
    ldx #0
    @B19_0a0f:
    jsr GetXCharacter
    bcs @B19_0a1f
    sta curr_player_id
    txa
    pha
    jsr IsTargetInventoryFull
    pla
    tax
    bcc @B19_0a2c
    @B19_0a1f:
    inx
    cpx #4
    bcc @B19_0a0f
    ldx #$37*2
    jsr DisplayText
    jmp OINST_END

    @B19_0a2c:
    jsr B19_0a3f
    jsr B19_1b6f
    ldx #$35*2
    jsr DisplayText
    lda #PulseG0_ItemDropGet
    sta soundqueue_pulseg0
    jmp OINST_END

B19_0a3f:
    jsr EnablePRGRam
    jsr GetPresentFlag
    ora All_Bits, x
    sta present_flags, y
    jmp WriteProtectPRGRam

PromptWho:
    ;UNK_42 = UNK_28
    lda curr_player_id
    sta UNK_42

    ;if partycount < 2 (== 1), branch
    lda pc_count
    cmp #2
    bcc @B19_0a6a
    ;else

    lda tilepack_ptr
    pha
    lda UNK_73
    pha

    jsr B19_1763

    pla
    sta UNK_73
    pla
    sta tilepack_ptr

    bcs @B19_0a6f
    @B19_0a6a:
    jsr B19_1b6f
    clc
    rts

    @B19_0a6f:
    lda UNK_42
    sta curr_player_id
    rts

; Bitfield for bit to check if item is usable/equippable.
PlayerUsableBitfieldLUT:
    .byte %00000000 ;any/all
    .byte %00000001 ;ninten
    .byte %00000010 ;ana
    .byte %00000100 ;lloyd
    .byte %00001000 ;teddy
    .byte %00010000 ;pippi
    .byte %00100000 ;EVE
    .byte %00100000 ;flying man

ReadOverworldMessageLUT:
    lda OverworldMessageLUT, x
    sta tilepack_ptr
    lda OverworldMessageLUT+1, x
    sta UNK_73
    rts

OverworldMessageLUT:
    .word 0 ; 00
    .word UMSG::TALK_NOONE ; 01 - Talking to nothing
    .word UMSG::TALK_PARTY ; 02 - Talking to party members
    .word UMSG::CHECK_NOTHING ; 03 - Checking nothing
    .word 0 ; 04
    .word UMSG::ATM_TOO_MUCH_CASH ; 05 - "@Don't carry so much cash with you."
    .word UMSG::GIVE_CANT ; 06 - No party members to use GIVE command
    .word UMSG::PSI_TRIED ; 07 - Tried PSI msg
    .word UMSG::PSI_NOPP ; 08 - Not enough Power for PSI msg
    .word UMSG::PSI_NOTELEPORT ; 09 - Teleport / Warp Fail when EVE is active
    .word UMSG::PSI_REVIVE ; 0A - Revive success msg
    .word UMSG::USE_ITEM ; 0B - Use item msg
    .word UMSG::CANT_USE_ITEM ; 0C - Cannot use item msg (user bit not set)
    .word UMSG::CANT_EAT ; 0D - Cannot eat msg
    .word UMSG::EQUIPPED_ITEM ; 0E - Equipped item msg
    .word UMSG::CANT_EQUIP_ITEM ; 0F - Cannot equip item msg
    .word UMSG::TOSS_ITEM ; 10 - Throw away item msg
    .word UMSG::CANT_TOSS_ITEM ; 11 - Cannot throw away item msg (key items)
    .word UMSG::GIVE_ITEM ; 12 - Give success msg (A handed item to B)
    .word UMSG::CANT_GIVE ; 13 - Cannot give msg
    .word UMSG::CANT_GIVE_FULL ; 14 - Give target's inv is full msg
    .word UMSG::NOTHING_HAPPENED ; 15 - Nothing happened
    .word UMSG::ITEM_EAT ; 16 - Eat item msg
    .word UMSG::ITEM_DRINK ; 17 - Drink item msg
    .word UMSG::ITEM_RECOVER ; 18 - Recovered by [Num] (used for HP, PP items)
    .word UMSG::ITEM_INCREASE ; 19 - Increased by [Num] (stat booster items)
    .word UMSG::HP_IS ; 1A - [Name]'s HP
    .word UMSG::PP_IS ; 1B - [Name]'s PP
    .word UMSG::FIGHT_IS ; 1C - [Name]'s Fight       ; infamously, the EBB translation calls it "Energy" only here, for some heretical reason
    .word UMSG::SPEED_IS ; 1D - [Name]'s Speed
    .word UMSG::WISDOM_IS ; 1E - [Name]'s Wisdom
    .word UMSG::STRENGTH_IS ; 1F - [Name]'s Strength
    .word UMSG::FORCE_IS ; 20 - [Name]'s Force
    .word UMSG::USEBIGBAG ; 21 - Use Big Bag msg
    .word UMSG::USEBREAD ; 22 - Use Bread msg
    .word UMSG::USEBREAD_FAIL ; 23 - Bread use fail msg
    .word UMSG::USECRUMBS ; 24 - Use Crumbs msg
    .word UMSG::USERIBBON ; 25 - Use Ribbon msg
    .word UMSG::GOODS_HANDOFF ; 26 - Give item to dead target msg
    .word UMSG::GOODS_TAKEFROM ; 27 - Take item from dead target msg
    .word UMSG::GOODS_GIVESELF ; 28 - Give item to self
    .word UMSG::GOODS_MOVE ; 29 - Take item from dead target and give to another dead target
    .word UMSG::GOODS_TAKENTHROW ; 2A - Throw out dead target's item
    .word UMSG::BIGBAG_EMPTY ; 2B - Big Bag empty msg
    .word UMSG::GOODS_GIVE ; 2C - Give item to target msg
    .word UMSG::CURE_POISON ; 2D - Poison cure msg
    .word UMSG::CURE_COLD ; 2E - Cold cure msg
    .word UMSG::ITEM_PSISTONE ; 2F - Use PSI Stone msg
    .word UMSG::ITEM_PSISTONE_USEDUP ; 30 - PSI Stone break msg
    .word UMSG::USEFINALWEAPON ; 31 - Final Weapon msg
    .word UMSG::USERULER ; 32 - Ruler msg
    .word UMSG::OPEN_PRESENT ; 33 - Open box msg
    .word UMSG::PRESENT_ITEM ; 34 - There was item
    .word UMSG::GET_ITEM ; 35 - You got item
    .word UMSG::CURE_PETRIFY ; 36 - Petrify cure msg
    .word UMSG::INVENTORY_FULL ; 37 - Can't take item from box (inv full) msg
    .word UMSG::USEOCARINA ; 38 - Ocarina use msg
    .word UMSG::USEOCARINA2 ; 39 - Ocarina used msg (Did you hear it?)
    .word UMSG::USEDIARY ; 3A
    .word UMSG::PRESENT_EMPTY ; 3B
    .word UMSG::USEMAP ; 3C
    .word UMSG::USEMAP_FAIL ; 3D
    .word UMSG::PHONE_INTRO ; 3E
    .word UMSG::PHONE_RESETPROMPT ; 3F
    .word UMSG::MENU_CONTINUE_REST ; 40
    .word UMSG::PHONE_SAVE_NO ; 41
    .word UMSG::PHONE_GOODLUCK ; 42
    .word UMSG::PHONE_SAVED_RESETPROMPT ; 43

B19_0b0f:
    jsr GetObjectDataAndBank
    ldy #object_m_bitfield1
    lda (object_pointer), y
    and #$0f
    tay
B19_0b19:
    lda (object_data), y
    beq B19_0b23
    jsr OverworldScriptInterpreter
    jmp B19_0b19

B19_0b23:
    lda is_scripted
    beq OINST_END
    jsr B31_0266
    lda #$40
    sta UNK_34 ; Interaction type: SIGNAL
    bne B19_0b0f

; Instruction 00 - End script
OINST_END:
    lda printing_state
    beq @B19_0b3c
    lda #0
    sta printing_state
    clc
    jmp WAIT_CLOSE_MENU
    @B19_0b3c:
    sec
    rts

GetObjectDataAndBank:
    jsr GetObjectData
    B19_0b41:
    ldy #object_m_area
    lda (object_pointer), y
    jmp SetObjectBank

B19_0b48:
    jsr GetObjectDataAndBank
    ldy #object_m_scriptOffset
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
    .ifdef VER_JP
        .addr OINST_Delay-1 ; 04 - TODO: delay
    .else
        .addr OINST_MelodyDelayHook-1 ; 04 - TODO: delay
    .endif
    .addr OINST_SpawnIfFlag-1 ; 05 - Appear if flag clear (only valid at start of script)
    .addr OINST_SpawnIfFlag-1 ; 06 - Appear if flag set (only valid at start of script)
    .addr OINST_InfiniteLoop-1 ; 07 - Infinite loop
    .addr OINST_Dialogue-1 ; 08 - Display text
    .addr OINST_PromptYesNo-1 ; 09 - Ask yes/no, jump if canceled or "no" selected
    .addr OINST_JMP_NotCondition-1 ; 0A - Jump unless TALKing
    .addr OINST_JMP_NotCondition-1 ; 0B - Jump unless CHECKing
    .addr OINST_JMP_NotPSI-1 ; 0C - Jump unless using PSI
    .addr OINST_JMP_NotItem-1 ; 0D - Jump unless using item
    .addr OINST_InfiniteLoop-1 ; 0E - Infinite loop
    .addr OINST_Reset-1 ; 0F - Reset game
    .addr OINST_SetFlag-1 ; 10 - Set flag
    .addr OINST_ClearFlag-1 ; 11 - Clear flag
    .addr OINST_JMP_FlagClear-1 ; 12 - Jump unless flag set
    .addr OINST_DecCounter-1 ; 13 - Decrement counter
    .addr OINST_IncCounter-1 ; 14 - Increment counter
    .addr OINST_ClrCounter-1 ; 15 - Set counter to zero
    .addr OINST_JMP_LessThan-1 ; 16 - Jump if counter less than
    .addr OINST_WriteSaveMeta-1 ; 17 - Set $7400[] value
    .addr OINST_ChooseChara-1 ; 18 - Choose character, jump if canceled
    .addr OINST_LoadChara-1 ; 19 - Select specific character
    .addr OINST_JMP_NotChara-1 ; 1A - Jump unless character selected
    .addr OINST_JMP_DadMoneyClr-1 ; 1B
    .addr OINST_PromptInputNum-1 ; 1C
    .addr OINST_LoadNum-1 ; 1D
    .addr OINST_JMP_Compare2Inputs-1 ; 1E
    .addr OINST_ShowWallet-1 ; 1F
    .addr OINST_ChooseItem-1 ; 20
    .addr OINST_ChooseItemCloset-1 ; 21
    .addr OINST_ShowShop-1 ; 22
    .addr OINST_JMP_ItemNotInCurrentCharaInv-1 ; 23
    .addr OINST_JMP_ItemNotInStorage-1 ; 24
    .addr OINST_LoadItem-1 ; 25
    .addr OINST_JMP_NotItemSelected-1 ; 26
    .addr OINST_JMP_ItemNotInInv-1 ; 27
    .addr OINST_JMP_GiveMoney-1 ; 28
    .addr OINST_JMP_TakeMoney-1 ; 29
    .addr OINST_TryDeposit-1 ; 2A
    .addr OINST_TryWithdrawl-1 ; 2B
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
    .addr OINST_JMP_NotFacing-1 ; 36
    .addr OINST_CustomMenu-1 ; 37
    .addr OINST_JMP_InvEmpty-1 ; 38
    .addr OINST_JMP_StorageEmpty-1 ; 39
    .addr OINST_LoadCharaInParty-1 ; 3A
    .addr OINST_SetObjectType-1 ; 3B - Set object type
    .addr OINST_SetFadeType-1 ; 3C
    .addr OINST_Teleport-1 ; 3D
    .addr OINST_MoveObject-1 ; 3E - TODO: Move object
    .addr OINST_Signal-1 ; 3F - TODO: Signal another object
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
    .addr OINST_TeleportUpdate-1 ; 4E
    .addr OINST_JMP_HasMoved-1 ; 4F
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
    .addr OINST_RemoveWeapon-1 ; 62
    .addr OINST_LoadConfiscatedWeapon-1 ; 63
    .addr OINST_DoLiveHouse-1 ; 64
    .addr OINST_JMP_NotHas8Melodies-1 ; 65
    .addr OINST_RegisterName-1 ; 66
    .addr OINST_DarkenPalettes-1 ; 67 - Darken palette
    .addr OINST_DoLandmine-1 ; 68
    .addr OINST_ScreenShake-1 ; 69
    .ifndef VER_JP
        .addr OINST_DoTombstone-1 ; 6A
        .addr OINST_Useless-1 ; 6B
    .endif

; Instructions 07, 0E and 5E (infinite loop)
OINST_InfiniteLoop:
    jmp OINST_InfiniteLoop

;render tilepack_ptr
; A, X (lo, hi byte of ptr to tilepack data)
O_DrawCurrentTilepack:
    sta tilepack_ptr
    stx tilepack_ptr+1
    .ifdef VER_JP
        jmp DrawTilepackClear
    .else
        jmp DrawTilepack
    .endif

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
OINST_Signal:
    iny
    lda (object_data), y
    clc
    adc #4
    sta is_scripted
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
    cmp curr_item_id
    bne OINST_JMP
; Instructions 0A, 0B, 34, 35, 40 - Jump unless certain interaction type
OINST_JMP_NotCondition:
    txa
    lsr a
    cmp UNK_34
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

.ifndef VER_JP
; Instruction 04 - Delay
OINST_MelodyDelayHook:
    ;if music != melody, jump to generic delay
    lda xpos_music
    and #%00111111
    cmp #$24
    bcc OINST_Delay
    cmp #$2c
    bcs OINST_Delay

    ;else, do melody bg
    jsr BackupPalette

    iny
    lda (object_data), y
    sta melody_timer

    iny
    @update_colors:
    lsr a
    lsr a
    lsr a
    and #7
    tax
    lda @melody_colors, x
    sta palette_queue+1
    sta palette_queue+5
    sta palette_queue+9
    sta palette_queue+$d
    jsr UpdatePalette
    lda melody_timer
    bne @update_colors

    ;change chr back
    lda map_tileset_1
    ldx #BANK::CHR1000
    jsr BANK_SWAP
    lda map_tileset_2
    ldx #BANK::CHR1400
    jsr BANK_SWAP

    jmp RestoreAndUpdatePalette

    @melody_colors:
    .byte $21,$22,$23,$24,$25,$24,$23,$22
.endif

OINST_Delay:
    iny
    lda (object_data), y
    tax
    iny
    jmp WaitXFrames_Min1

; Instruction 08 - prints the object's text/dialogue
OINST_Dialogue:
    iny
    lda (object_data), y
    sta text_id+1
    iny
    lda (object_data), y
    sta text_id
    iny
    sty object_script_offset
; FALLTHROUGH
O_PrintText:
    lda printing_state
    bne @B19_0d21
    jsr B19_1c0a
    @B19_0d21:
    lda #8
    cmp printing_state
    beq O_DoPrintingState8
O_TextInterpretString:
    sta printing_state
O_TextInterpretCurrent:
    ldy ntbl_y
    cpy #$1b
    bcc B19_0d36
    jsr B19_0d98
    dec UNK_2C+1
    bmi O_TextBreakRoutine
B19_0d36:
    lda UNK_2C+1
    bne O_TextInterpretLine
    ldy ntbl_y
    cpy #$19
    bcs O_TextBreakRoutine
O_TextInterpretLine:
    jsr GetTextData
    .ifdef VER_JP
        lda #$12
        sta UNK_70
        ldy #0
        lda (tilepack_ptr), y
        eor #$90
        beq @yeah
        lda #1
        @yeah:
        sta UNK_71
    .else
        lda #$16
        sta UNK_70
        lda #0
        sta UNK_71
    .endif
    jsr PRINT_STRING
    jsr B30_07af
    cmp #0
    beq OTC_End
    ldy #0
    lda (tilepack_ptr), y
    cmp #3
    beq OTC_Brk
    cmp #0
    bne O_TextInterpretCurrent
; Text Code 00 - End
OTC_End:
    jsr B19_0b41
    lda #0
    sta UNK_70
    sta UNK_71
    ldy object_script_offset
SetPrintingState2:  ; ?
    sec
    lda ntbl_y
    sbc #$13
    lsr a
    sta UNK_2C+1
    rts
; Text Code 03 - Break
OTC_Brk:
    inc tilepack_ptr
    bne O_DoPrintingState8
    inc UNK_73
O_DoPrintingState8:
    ldy ntbl_y
    cpy #$1b
    bcc O_TextBreakRoutine
    jsr B19_0d98
O_TextBreakRoutine:
    jsr SetPrintingState2
    lda #.LOBYTE(string_brk_arrow)
    ldx #.HIBYTE(string_brk_arrow)
    jsr T_DoBreak
    jmp O_TextInterpretLine

string_brk_arrow:
    .byte 1, 1 ; choicer array size
    .byte 0, 0 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3b ; Tile
    .ifdef VER_JP
        .byte $13
    .else
        .byte $12
    .endif

B19_0d98:
.ifdef VER_JP
    ldy #$ca
    @four:
    jsr PpuSync
    sty nmi_data_offset
    @three:
    lda nmi_queue, y
    beq @one
    sec
    lda nmi_queue+3, y
    sbc #$40
    sta nmi_queue+3, y
    lda nmi_queue+2, y
    sta UNK_72
    sbc #0
    sta nmi_queue+2, y
    eor UNK_72
    and #$04
    beq @two
    sec
    lda nmi_queue+3, y
    sbc #$40
    sta nmi_queue+3, y
    lda nmi_queue+2, y
    sbc #4
    and #$0f
    ora #$20
    sta nmi_queue+2, y
    @two:
    clc
    tya
    adc #4
    clc
    adc nmi_queue+1, y
    tay
    bcc @three
    @one:
    sec
    lda nmi_data_offset
    sbc #$36
    tay

    lda #$80
    sta nmi_flags

    cpy #$5e
    bcs @four
    dec ntbl_y
    dec ntbl_y
    lda tilepack_ptr
    pha
    lda UNK_73
    pha
    lda #$12
    sta UNK_70
    lda #.LOBYTE(string_yesno_2)
    ldx #.HIBYTE(string_yesno_2)
    jsr O_DrawCurrentTilepack
    pla
    sta UNK_73
    pla
    sta tilepack_ptr
    rts
.else
    ldx #4
    jsr DELAY_PRINT_SCROLL
    dec ntbl_y
    dec ntbl_y
    rts
.endif

; Instruction 09 - Ask yes/no, jump if canceled or "no" selected
OINST_PromptYesNo:
    sty object_script_offset
    jsr DrawYesNoPrompt
    ldy object_script_offset
    lda menucursor_pos
    jmp JumpNE

DrawYesNoPrompt:
    lda #.LOBYTE(string_yesno)
    ldx #.HIBYTE(string_yesno)
    sta text_id+1
    stx text_id
    lda #9
    jsr O_TextInterpretString
    lda #.LOBYTE(string_yesnocursor)
    ldx #.HIBYTE(string_yesnocursor)
    bne T_DoBreak

B19_0dc1:
    lda #.LOBYTE(string_yesnocursor2)
    ldx #.HIBYTE(string_yesnocursor2)
; Requires A, X to be loaded if called from outside!
T_DoBreak:
    sta UNK_80
    stx UNK_80+1
    ldy #6
    lda (UNK_80), y
    sta ntbl_x
    lda #.LOBYTE(EIGHT_OPTIONS_LUT)
    ldx #.HIBYTE(EIGHT_OPTIONS_LUT)
    sta UNK_84
    stx UNK_84+1
    jsr B31_0f4b
    .ifdef VER_JP
        lda #11
    .else
        lda #8
    .endif
    sta ntbl_x
    rts

.ifdef VER_JP
    string_yesno:
        kanafix "   はい   いいえ "
    string_yesno_2:
        .byte " "
        .byte stopText
    string_yesnocursor:
        .byte 2, 1 ; choicer array size
        .byte 5, 0 ; X/Y inc
        .byte PAD_A ; Input mask
        .byte $3A ; Tile
        .byte $0E
    string_yesnocursor2:
        .byte 2, 1 ; choicer array size
        .byte 7, 0 ; X/Y inc
        .byte PAD_A | PAD_B ; Input mask
        .byte $3A ; Tile
        .byte $0D
.else
    string_yesno:
        .byte "    Yes  No "
        .byte stopText
    string_yesnocursor:
        .byte 2, 1 ; choicer array size
        .byte 5, 0 ; X/Y inc
        .byte PAD_A ; Input mask
        .byte $3a ; Tile
        .byte $0b
    string_yesnocursor2:
        .byte 2, 1 ; choicer array size
        .byte 9, 0 ; X/Y inc
        .byte PAD_A | PAD_B ; Input mask
        .byte $3a ; Tile
        .byte 9
.endif

; Instruction 37 - Ask a custom prompt, jump to j1 if option 2, jump to j2 if b pressed
OINST_CustomMenu:
    iny
    lda (object_data), y
    sta text_id+1
    iny
    lda (object_data), y
    sta text_id
    iny
    sty object_script_offset
    lda #$37
    jsr O_TextInterpretString
    jsr B19_0dc1
    ldy object_script_offset
    bit menucursor_pos+1
    bvs @B19_0e20
    lda menucursor_pos
    bne @B19_0e1c
    iny
    iny
    rts

    @B19_0e1c:
    lda (object_data), y
    tay
    rts

    @B19_0e20:
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
OINST_ClearFlag:
    jsr EnablePRGRam
    jsr B19_0e58
    ora All_Bits, x
    eor All_Bits, x
    sta event_flags, y
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 12 - Jump unless flag set
OINST_JMP_FlagClear:
    jsr B19_0e58
    ldy object_script_offset
    and All_Bits, x
    eor All_Bits, x
    jmp JumpNE

B19_0e58:
    iny
    sty object_script_offset
    jmp get_story_flag_data

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
    jsr LoadGenericItemData
    ldy object_script_offset
    iny
    rts

; Instruction 1A - Jump to J if chararacter C not selected
OINST_JMP_NotChara:
    iny
    lda curr_player_id
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
    lda curr_item_id
    cmp (object_data), y
    jmp JumpNE

; Instruction 28 - Jump to J if cant hold money
OINST_JMP_GiveMoney:
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
OINST_JMP_TakeMoney:
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
    sta UNK_62
    bcs B19_0f12
    bcc B19_0f47

; Instruction 2B - Take from bank account, Jump to J if not enough
OINST_TryWithdrawl:
    sec
    lda bank_money
    sbc input_wordvar
    sta temp_word
    lda bank_money+1
    sbc input_wordvar+1
    sta temp_word+1
    lda bank_money+2
    sbc #0
    sta UNK_62
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
    jsr LoadGenericItemData
    ldx #0
    @B19_0f93:
    jsr GetXCharacter
    bcs @B19_0fa5
    sta curr_player_id
    txa
    pha
    lda curr_item_id
    jsr GetItemInventorySlot
    pla
    tax
    bcc B19_101e
    @B19_0fa5:
    inx
    cpx #4
    bcc @B19_0f93
    bcs B19_1023

; Instruction 23 - Jump to J if item I not in selected character's inventory
OINST_JMP_ItemNotInCurrentCharaInv:
    jsr LoadGenericItemData
    lda curr_item_id
    jsr GetItemInventorySlot
    bcc B19_101e
    bcs B19_1023

; Instruction 24 - Jump to J if item I not in closet
OINST_JMP_ItemNotInStorage:
    jsr LoadGenericItemData
    lda curr_item_id
    jsr GetItemStorageSlot
    bcs B19_1023
    bcc B19_101e

;Loads generic item data from item in next byte
LoadGenericItemData:
    iny
    lda (object_data), y
    sta curr_item_id
    sty object_script_offset
    jsr LOAD_ITEM_PRICE
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
    lda curr_item_id
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
    lda curr_item_id
    sta (temp_vars), y
    ldy object_script_offset
    iny
    iny
    jmp WriteProtectPRGRam

; Instruction 30 - Remove item to closet, Jump to J if not available
OINST_TryWithdrawItem:
    sty object_script_offset
    lda curr_item_id
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
    sta curr_player_id
    sty object_script_offset
    jmp B19_1b6f

; Instruction 31 - Pick character's I'th item, Jump to J if empty (0)
OINST_TrySelectCharaInvSlot:
    iny
    lda (object_data), y
    sty object_script_offset
    pha
    lda curr_player_id
    jsr GetInventoryPointer
    pla
    tay
    lda (temp_vars), y
    beq B19_1023
    sta curr_item_id
    jsr LOAD_ITEM_PRICE
    jsr B19_1b8c
    jmp B19_101e

GetItemInventorySlot:
    pha
    lda curr_player_id
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
    jsr GetPartyMemberPtr
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
    sta printing_state
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    sty object_script_offset
    jsr B19_1763
    pla
    sta ntbl_y
    pla
    sta ntbl_x
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
    sta curr_player_id
    bne B19_10c4

; Instruction 1C - Input a number, Jump to J if B pressed
;current_input is the list of the literal tiles
.define current_input UNK_6C

OINST_PromptInputNum:
    sty object_script_offset
    jsr B19_1c28

    ;load text into UNK_68???
    ldx #number_input_placeholder_END-number_input_placeholder-1
    @copy:
    lda number_input_placeholder, x
    sta UNK_68, x
    dex
    bpl @copy

    ;load that text???
    lda #.LOBYTE(do_numinput_load)
    ldx #.HIBYTE(do_numinput_load)
    sta text_id+1
    stx text_id
    lda #$1c
    jsr O_TextInterpretString

    ;do choicer
    lda #.LOBYTE(numinput_choicer)
    ldx #.HIBYTE(numinput_choicer)
    sta UNK_80
    stx UNK_80+1
    lda #.LOBYTE(current_input)
    ldx #.HIBYTE(current_input)
    sta UNK_84
    stx UNK_84+1
    lda #0
    sta menu_x_pos
    sta menu_y_pos
    sta menucursor_pos
    @loop:
    .ifdef VER_JP
        ldx #$10
    .else
        ldx #$c
    .endif
    stx ntbl_x
    jsr B31_0f7c

    ;if button != Up/Down, branch
    lda menucursor_pos+1
    and #PAD_DOWN | PAD_UP
    beq @fire_button

    ldx menucursor_pos
    ldy current_input, x
    ;branch if down. fallthrough if up
    and #PAD_UP
    beq @is_down
    iny
    .ifdef VER_JP
        ;if tile > '4', move to '5'
        cpy #'4'+1
        bne @after_4
        ldy #'5'
        @after_4:

        ;if tile > '9', move to '0'
        cpy #'9'+1
        bne @updown_finish
        ldy #'0'
        bne @updown_finish
    .else
        ;if tile > '9', move to '0'
        cpy #'9'+1
        bne @updown_finish
        ldy #'0'
        bne @updown_finish
    .endif
    @is_down:
    dey
    .ifdef VER_JP
        ;if tile < '0', move to '9'
        cpy #'0'-1
        bne @before_0
        ldy #'9'
        @before_0:

        ;if tile < '5', move to '4'
        cpy #'5'-1
        bne @updown_finish
        ldy #'4'
    .else
        ;if tile < '0', move to '9'
        cpy #'0'-1
        bne @updown_finish
        ldy #'9'
    .endif
    @updown_finish:
    ;write result
    tya
    sta current_input, x
    jsr B31_10b0
    jmp @loop

    ;button is a/b
    @fire_button:
    jsr B31_11a4
    lda temp_word
    sta input_wordvar
    lda temp_word+1
    sta input_wordvar+1
    .ifdef VER_JP
        ldx #$b
    .else
        ldx #8
    .endif
    stx ntbl_x
    ldy object_script_offset
    lda #$40
    bit menucursor_pos+1
    jmp JumpNE

number_input_placeholder:
    .ifdef VER_JP
        .byte "  ? 0000"
    .else
        .byte "  $ 0000"
    .endif
number_input_placeholder_END:

do_numinput_load:
    .byte print_number $0068, 0, 8
    .byte stopText

numinput_choicer:
    .byte 4, 1 ; choicer array size
    .byte 1, 0 ; X/Y inc
    .byte PAD_A | PAD_B | PAD_UP | PAD_DOWN  ; Input mask
    .byte 1 ; Tile

OINST_ChooseItemCloset:
    lda #$21
    sta UNK_2C
    sty object_script_offset
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    jsr OpenMenuStorage
    jmp B19_11a5

; Instruction 22 - Jump to J if declined
OINST_ShowShop:
    lda #$22
    sta printing_state
    sty object_script_offset
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    jsr B19_1814
    jmp B19_11a5

; Instruction 20 - Jump to J if declined
OINST_ChooseItem:
    lda #$20
    sta printing_state
    sty object_script_offset
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    jsr OpenOverworldGoods
B19_11a5:
    pla
    sta ntbl_y
    pla
    sta ntbl_x
    bcs B19_11b8
    jsr LOAD_ITEM_PRICE
    jsr B19_1b8c
B19_11b3:
    ldy object_script_offset
    iny
    iny
    rts

B19_11b8:
    ldy object_script_offset
    jmp OINST_JMP

; Instruction 38 - Jump to J if no items
OINST_JMP_InvEmpty:
    sty object_script_offset
    ldx #0
B19_11c1:
    jsr GetXCharacter
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
    sty object_script_offset
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
    sty UNK_64
    ldy #0
    @B19_11f1:
    lda (temp_vars), y
    bne @B19_11fb
    iny
    cpy UNK_64
    bcc @B19_11f1
    rts
    @B19_11fb:
    clc
    rts

; Instruction 62 - Jump to J if no weapon, else take
OINST_RemoveWeapon:
    sty object_script_offset
    jsr LoadCurrPlayerPtr
    jsr EnablePRGRam
    ldy #$28
    lda (temp_vars), y
    beq B19_121b
    sta confiscated_weapon
    sty UNK_62
    jsr EquipItemStart_confiscated
    jsr B19_0b41
B19_1216:
    ldy object_script_offset
    iny
    iny
    rts

B19_121b:
    ldy object_script_offset
    jsr WriteProtectPRGRam
B19_1220:
    jmp OINST_JMP

; Instruction 63 - Get confiscated weapon, Jump to j if none
OINST_LoadConfiscatedWeapon:
    lda confiscated_weapon
    beq B19_1220
    sta curr_item_id
    sty object_script_offset
    jsr LOAD_ITEM_PRICE
    jsr B19_1b8c
    jmp B19_1216

; Instruction 3B - Set object type
OINST_SetObjectType:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    sty object_script_offset
    jsr SetObjectType
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 3E - Move
OINST_MoveObject:
    jsr EnablePRGRam

    ;get ram pointer
    iny
    lda (object_data), y
    pha
    iny
    lda (object_data), y

    ;store offset
    iny
    sty object_script_offset

    ;object_pointer->1e = ram pointer
    ldy #object_m_unk2+2
    sta (object_pointer), y
    dey
    pla
    sta (object_pointer), y

    ;object_pointer->type = 7
    ldy #object_m_type
    lda #7
    sta (object_pointer), y

    ;move actual type to object_pointer->1d
    ldy #0
    lda (object_data), y
    and #$3f
    ldy #object_m_unk2
    sta (object_pointer), y

    ;make object noninteractable
    ldy #object_m_bitfield1
    lda (object_pointer), y
    and #~OBJECT_M_BF1_INTERACTABLE
    sta (object_pointer), y

    ;yeah
    ldy #object_m_scriptOffset
    lda object_script_offset
    sta (object_pointer), y

    lda object_memory+object_m_direction
    asl a
    asl a
    asl a
    tax
    lda xy_unknown+4, x ; Flags
    lsr a
    lsr a
    sta object_memory+object_m_unk1+1
    jsr WriteProtectPRGRam
    pla
    pla
    jmp B19_0b23

; Instruction 46 - Rocket
OINST_MoveRocket:
    lda current_banks+1
    jsr B19_129c
B19_1295:
    ldy object_script_offset
    iny
    iny
    jmp WriteProtectPRGRam

B19_129c:
    tax
    sty object_script_offset
    jsr EnablePRGRam
    txa
    eor is_tank
    and #$7f
    bne B19_12aa
    rts

B19_12aa:
    stx is_tank
    ldy #$1c
    lda object_script_offset
    sta (object_pointer), y
    jsr B19_12c3
    ora #$80
    sta is_scripted
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
    stx object_memory+object_m_sprite_base
    sty object_memory+object_m_sprite_base+1
B19_12de:
    sta object_memory
    asl a
    asl a
    tax

    ;write typed object to object memory
    lda Object_Configs+2, x
    sta object_memory+object_m_tiles
    lda Object_Configs+3, x
    sta object_memory+object_m_bitfield1

    ldy object_script_offset
    iny
    lda (object_data), y
    sta object_memory+object_m_direction
    sta object_memory+object_m_unk1+1
    rts

; Instruction 47 - Airplane
OINST_DoPlane:
    lda #$74
    jsr B19_129c
    lda #9
    ldx #.LOBYTE(SPRITEDEF_PLANE)
    ldy #.HIBYTE(SPRITEDEF_PLANE)
    jsr B19_12d8
    lda #$f
    sta object_memory+object_m_unk1+2
    ldx #$10
    jsr B30_0daf
    jmp B19_1295

; Instruction 4D - Airplane End
OINST_EndPlane:
    jsr EnablePRGRam
    lda #$f8
    sta object_memory+object_m_unk1+2
    iny
    jmp WriteProtectPRGRam

; Instruction 48 - Tank
OINST_DoTank:
    lda #$74
    jsr B19_129c
    lda #$a
    ldx #.LOBYTE(SPRITEDEF_TANK)
    ldy #.HIBYTE(SPRITEDEF_TANK)
    jsr B19_12d8
    ldx #8
    jsr B30_0daf
    jmp B19_1295

; Instruction 49 - Boat
OINST_DoBoat:
    lda #$74
    jsr B19_129c
    lda #$b
    ldx #.LOBYTE(SPRITEDEF_BOAT)
    ldy #.HIBYTE(SPRITEDEF_BOAT)
    jsr B19_12d8
    jmp B19_1295

; Instruction 4A - Train
OINST_DoTrain:
    sty object_script_offset

    lda #$f0
    sta is_tank

    lda #$3f
    sta map_area

    jsr EnablePRGRam

    lda #0
    sta object_memory+(object_m_sizeof*2)+object_m_type
    sta object_memory+(object_m_sizeof*3)+object_m_type

    ;make head of train
    lda #$d
    ldy #0
    jsr MakeTrainObject

    ;make tail of train
    lda #$e
    ldy #$20
    jsr MakeTrainObject

    ;path = item - $8f
    sec
    lda curr_item_id
    sbc #$8f
    sta object_memory+object_m_unk2+1

    lda #0
    sta object_memory+object_m_unk2+2
    sta object_memory+object_m_unk1+2

    jsr B19_1bd4

    ldx #$10
    jsr B30_0daf

    ;return
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

;a = type
;y = offset
;set object details at object[y/0x20] using a as reference
MakeTrainObject:
    sta object_memory+object_m_type, y

    asl a
    asl a
    tax

    lda #.LOBYTE(SPRITEDEF_TRAIN_DL)
    sta object_memory+object_m_sprite_base, y
    lda #.HIBYTE(SPRITEDEF_TRAIN_DL)
    sta object_memory+object_m_sprite_base+1, y

    lda Object_Configs+2, x
    sta object_memory+object_m_tiles, y

    lda Object_Configs+3, x
    sta object_memory+object_m_bitfield1, y

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
    sty object_script_offset
    lda (object_data), y
    ora #$80
    sta fade_flag
    ldx #0
    stx is_tank
    jsr B30_0daf
    lda object_pointer
    pha
    lda object_pointer+1
    pha
    jsr InitPartyObjects
    pla
    sta object_pointer+1
    pla
    sta object_pointer
    ldy object_script_offset
    iny
    rts

; Instruction 36 - Jump if player != object direction
OINST_JMP_NotFacing:
    sty object_script_offset

    ;get object direction
    ldy #2
    lda (object_data), y
    and #$3f

    ldy object_script_offset

    ;compare to player (object 0) direction
    cmp object_memory+object_m_direction
    jmp JumpNE

; Instruction 4F - Unknown Jump 2
OINST_JMP_HasMoved:
    sty object_script_offset
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
    ldy object_script_offset
    iny
    iny
    rts

B19_141b:
    ldy object_script_offset
    jmp OINST_JMP

; Instruction 3D - Teleport
OINST_Teleport:
    jsr EnablePRGRam
    iny
    jsr obj_prep_teleport
    iny
    jmp WriteProtectPRGRam

; Instruction 3C - ???
OINST_SetFadeType:
    iny
    lda (object_data), y
    sta fade_type
    iny
    rts

; Instruction 4E - ???
OINST_TeleportUpdate:
    sty object_script_offset
    jsr EnablePRGRam
    jsr TeleportParty
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 42 - Add char C from party, Jump to J if full
OINST_AddChara:
    jsr B19_1032
    lda object_pointer
    pha
    lda object_pointer+1
    pha
    lda curr_player_id
    jsr B30_1759
    pla
    sta object_pointer+1
    pla
    sta object_pointer
    ldy object_script_offset
    jmp JumpCC

; Instruction 43 - Remove char C from party, Jump to J if not in party
OINST_RemoveChara:
    jsr B19_1032
    lda object_pointer
    pha
    lda object_pointer+1
    pha
    lda curr_player_id
    jsr REMOVE_PARTY_MEMBER
    pla
    sta object_pointer+1
    pla
    sta object_pointer
    ldy object_script_offset
    jmp JumpCC

; Instruction 44 - Start battle B in battles list
OINST_StartEncounter:
    ;set battle
    iny
    lda (object_data), y
    sta enemy_group

    jsr B19_12c3

    sta is_scripted
    iny
    sty object_script_offset
    pla
    pla
    jmp OINST_END

; Instruction 1F - Show money
OINST_ShowWallet:
    sty object_script_offset
    jsr B19_1c28
    ldy object_script_offset
    iny
    rts

; Instruction 17 - Set $7400[] value
OINST_WriteSaveMeta:
    jsr EnablePRGRam
    iny
    lda (object_data), y
    and #$3f
    tax
    iny
    lda (object_data), y
    sta starting_sram, x
    iny
    jmp WriteProtectPRGRam

; Instruction 56 - Save
OINST_Save:
    sty object_script_offset
    jsr Game_Begin
    ldy object_script_offset
    iny
    rts

; Instruction 57 - Get selected characters' needed exp
OINST_GetCharaNextLv:
    sty object_script_offset
    jsr LoadCurrPlayerPtr
    ldy #$10
    lda (temp_vars), y
    jsr B30_1b40
    jsr LoadCurrPlayerPtr
    ldy #$11
    sec
    lda UNK_64
    sbc (temp_vars), y
    sta input_wordvar
    iny
    lda UNK_64+1
    sbc (temp_vars), y
    sta input_wordvar+1
    jsr B19_0b41
    jsr EnablePRGRam
    ldx #3
    @B19_14d0:
    lda xpos_music, x
    sta save_coordinates, x
    dex
    bpl @B19_14d0
    lda #0
    sta dad_money
    sta dad_money+1
    sta dad_money+2
    jsr WriteProtectPRGRam
    ldy object_script_offset
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
    sty object_script_offset
    lda input_wordvar
    sta UNK_64
    lda input_wordvar+1
    sta UNK_64+1
    ldx #1
    @B19_151d:
    jsr GetXCharacter
    bcs @B19_153d
    jsr GetPartyMemberPtr
    ldy #1
    lda (temp_vars), y
    bmi @B19_153d
    clc
    lda UNK_64
    adc input_wordvar
    sta input_wordvar
    lda UNK_64+1
    adc input_wordvar+1
    sta input_wordvar+1
    bcc @B19_153d
    jsr B19_0f87
    @B19_153d:
    inx
    cpx #4
    bcc @B19_151d
    ldy object_script_offset
    iny
    rts

; Instruction 55 - Sleep
OINST_Sleep:
    sty object_script_offset
    ldx #60
    jsr WaitXFrames_Min1
    jsr OT0_DefaultTransition
    jsr B19_1561
    jsr B19_1c0a
    lda #$55
    sta printing_state
    jsr B31_0e30
    ldy object_script_offset
    iny
    rts

B19_1561:
    jsr EnablePRGRam
    ldx #0
    @B19_1566:
    lda party_members, x
    beq @B19_157a
    jsr GetPartyMemberPtr
    ldy #1
    lda (temp_vars), y
    bmi @B19_157a
    jsr MaxCurrCharaHP
    jsr MaxCurrCharaPP
    @B19_157a:
    inx
    cpx #4
    bcc @B19_1566
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
    ldy object_script_offset
    jmp JumpCS

B19_15c2:
    sty object_script_offset
LoadCurrPlayerPtr:
    lda curr_player_id
    jmp GetPartyMemberPtr

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
    ldy object_script_offset
    jmp JumpCS

; Instruction 52 - Jump to J if character has status S
OINST_JMP_CharaHasStatus:
    iny
    jsr B19_15c2
    ldy #1
    lda (temp_vars), y
    ldy object_script_offset
    and (object_data), y
    jmp JumpNE

; Instruction 54 - Jump to J if < level N
OINST_JMP_CharaLvLessThan:
    iny
    jsr B19_15c2
    ldy #$10
    lda (temp_vars), y
    ldy object_script_offset
    cmp (object_data), y
    jmp JumpCS

; Instruction 53 - Remove all statuses but status S
OINST_CharaHealStatusExcept:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy object_script_offset
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
    ldy object_script_offset
    iny
    jmp WriteProtectPRGRam

; Instruction 59 - Inflict status S
OINST_GiveStatusToChara:
    iny
    jsr B19_15c2
    jsr EnablePRGRam
    ldy object_script_offset
    lda (object_data), y
    ldy #1
    ora (temp_vars), y
    sta (temp_vars), y
    ldy object_script_offset
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
    stx UNK_62
    sty UNK_62+1
    clc
    ldy object_script_offset
    lda (object_data), y
    ldy UNK_62
    adc (temp_vars), y
    sta UNK_64
    iny
    lda #0
    adc (temp_vars), y
    sta UNK_64+1
    sec
    ldy UNK_62+1
    lda (temp_vars), y
    sbc UNK_64
    iny
    lda (temp_vars), y
    sbc UNK_64+1
    bcs B19_1681
    ldy UNK_62+1
    lda (temp_vars), y
    sta UNK_64
    iny
    lda (temp_vars), y
    sta UNK_64+1
B19_1681:
    jsr EnablePRGRam
    ldy UNK_62
    lda UNK_64
    sta (temp_vars), y
    iny
    lda UNK_64+1
    sta (temp_vars), y
    ldy object_script_offset
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
    ;write to their psi tables
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
    sty object_script_offset
    ;us exports the code to ANTIPIRACY for checking.
    .ifdef VER_JP
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
        jsr WaitXFrames_Min1
    .else
        lda #.BANK(Livehouse_Antipiracy)
        ldx #.LOBYTE(Livehouse_Antipiracy-1)
        ldy #.HIBYTE(Livehouse_Antipiracy-1)
        jsr TempUpperBankswitch
    .endif
    ldy object_script_offset
    iny
    rts

.ifdef VER_JP
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

    lda #48
    sta nmi_flags

    jsr LIVEHOUSE_movex8

    cpx #$20
    bcc @loop

    jsr PpuSync

    lda #48
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

    lda #22
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

    lda #24
    sta nmi_flags

    rts
.endif

OINST_JMP_NotHas8Melodies:
    lda learned_melodies
    .ifdef VER_JP
        cmp #$7f
        bne @exit
        sty object_script_offset
        jsr EnablePRGRam
        ldx #3
        @loop:
        lda MtItoiCabinCoords, x
        sta save_file_current+12, x
        dex
        bpl @loop
        lda #$ff
        sta save_file_fill-$62
        ldy #$b
        jsr GAME_OVER_looper
        lda #2
        sta fade_type
        ldy object_script_offset
        @exit:
    .else
        cmp #$ff
        beq @not_exit
        jmp OINST_JMP
        @not_exit:
        jsr EnablePRGRam
        ldx #3
        @loop:
        lda MtItoiCabinCoords, x
        sta save_coordinates, x
        dex
        bpl @loop
        jsr WriteProtectPRGRam
        iny
    .endif
    iny
    rts

; Mt. Itoi cabin coordinates
MtItoiCabinCoords:
    doorArgDef $12, 3, DIRECTIONS::UP, $11e

; Instruction 66 - Register name
OINST_RegisterName:
    lda #$66
    sta printing_state
    sty object_script_offset
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    jsr B19_19e4
    pla
    sta ntbl_y
    pla
    sta ntbl_x
    ldy object_script_offset
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

; Instruction 69 - Horizontal shake for the EVE explosion
OINST_ScreenShake:
    ldx #16
    @loop:
    jsr DoHorizontalShake
    dex
    bne @loop
    iny
    rts

.ifndef VER_JP
; Instruction 6A - George crystal (?)
OINST_DoTombstone:
    sty object_script_offset
    lda #.BANK(Tombstone_AntiPiracy)
    ldx #.LOBYTE(Tombstone_AntiPiracy-1)
    ldy #.HIBYTE(Tombstone_AntiPiracy-1)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy object_script_offset
    iny
    rts

; Instruction 6B - do literally nothing
OINST_Useless:
    sty object_script_offset
    lda #.BANK(Rts_Antipiracy)
    ldx #.LOBYTE(Rts_Antipiracy-1)
    ldy #.HIBYTE(Rts_Antipiracy-1)
    jsr TempUpperBankswitch
    jsr B19_0b41
    ldy object_script_offset
    iny
    rts
.endif

B19_1763:
    ldx #.HIBYTE($0219)
    ldy #.LOBYTE($0219)
    stx ntbl_x
    sty ntbl_y
    ldx #2
    @B19_176d:
    lda party_choice_is, x
    beq @B19_177e
    lda #' '
    jsr AddTileViaNMI
    dec ntbl_y
    dec ntbl_y
    dex
    bpl @B19_176d
    @B19_177e:
    dec ntbl_x
    sec
    lda ntbl_y
    sbc #4
    sta ntbl_y
    jsr DrawWindowWho
    jsr B19_0b41
    lda #.LOBYTE(Who_Choicer)
    ldx #.HIBYTE(Who_Choicer)
    sta UNK_80
    stx UNK_80+1
    jsr PRINT_CURR_CHOICER
    bit menucursor_pos+1
    bmi B19_179e
    sec
    rts
    B19_179e:
    lda #'>'
    jsr B31_10b0
    ldx menucursor_pos
    lda party_choice_is, x
    sta curr_player_id
    clc
    rts

; The options are the party members
; Who?
Who_Choicer:
    .byte 1, 3 ; choicer array size
    .byte 0, 2 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3A ; Tile
    .byte 2, 21 ;X/Y start
    .addr party_choice_is ; choices

OpenOverworldGoods:
    jsr DRAW_WINDOW_8ENTRY
    ldx #$ff
@GoodsIncChar:
    inx
    ;char count (infamous inability to access 4th person inv lol)
    cpx #3
    bcc @GoodsStart
    ldx #0
@GoodsStart:
    jsr GetXCharacter
    bcs @GoodsIncChar
    sta curr_player_id
    stx UNK_37
    jsr Draw8Entry_LabelName
    jsr B19_1803
    jsr B19_1b40
    jsr Load8Entry_CharChoicer
    ldx UNK_37
    lda #6
    bit menucursor_pos+1
    bvs @GoodsRTS
    bmi @GoodsIncChar
    beq @GoodsIncChar
    jsr B19_1803
    jsr B19_1b0e
    bit menucursor_pos+1
    bvs @GoodsRTS
    bmi B19_17f6
    ldx UNK_37
    jmp @GoodsStart
@GoodsRTS:
    sec
    rts
    B19_17f6:
    lda #'>'
    jsr B31_10b0
    ldy menucursor_pos
    lda (UNK_84), y
    sta curr_item_id
    clc
    rts

B19_1803:
    jsr LoadCurrPlayerPtr
    clc
    lda temp_word
    adc #$20
    sta UNK_84
    lda temp_word+1
    adc #0
    sta UNK_84+1
    rts

B19_1814:
    jsr DRAW_WINDOW_SHOP
    jsr B19_0b41
    sec
    lda object_script_offset
    adc object_data
    sta UNK_84
    lda #0
    adc object_data+1
    sta UNK_84+1
    ldy #3
    @B19_1829:
    sty ntbl_y
    ldy object_script_offset
    iny
    sty object_script_offset
    lda (object_data), y
    sta curr_item_id
    beq @B19_1853
    .ifdef VER_JP
        lda #10
    .else
        lda #12
    .endif
    sta UNK_70
    ldx #3
    stx ntbl_x
    jsr LoadItemNameptr
    jsr LOAD_ITEM_PRICE
    lda #0
    sta UNK_70
    .ifdef VER_JP
        ldx #13
    .else
        ldx #15
    .endif
    stx ntbl_x
    lda #.LOBYTE(label_currmoney)
    ldx #.HIBYTE(label_currmoney)
    jsr O_DrawCurrentTilepack
    @B19_1853:
    ldy ntbl_y
    iny
    iny
    cpy #11
    bcc @B19_1829
    lda #.LOBYTE(ShopChoicer)
    ldx #.HIBYTE(ShopChoicer)
    sta UNK_80
    stx UNK_80+1
    jsr B31_0f3f
    bit menucursor_pos+1
    bmi @B19_186c
    sec
    rts
    @B19_186c:
    jmp B19_17f6

label_currmoney:
    .byte "$"
    .byte print_number $002a, 2, 4
    .byte c00
    .byte stopText

;OBJ_DISPLAY_ITEMS choicer
ShopChoicer:
    .byte 1, 4 ; choicer array size
    .byte 0, 2 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3A ; Tile
    .byte 2, 3 ;X/Y start

OpenMenuStorage:
    jsr DRAW_WINDOW_8ENTRY
    lda #.LOBYTE(label_thecloset)
    ldx #.HIBYTE(label_thecloset)
    jsr O_DrawCurrentTilepack
    ldx #$f8
    @B19_188b:
    clc
    txa
    adc #8
    tax
    cpx #$50
    bcc @B19_1896
    ldx #0
    @B19_1896:
    lda item_storage, x
    bne @B19_189d
    ldx #0
    @B19_189d:
    stx UNK_37
    jsr B19_18ca
    jsr B19_1b40
    jsr Load8Entry_CharChoicer
    ldx UNK_37
    lda #6
    bit menucursor_pos+1
    bvs @B19_18c5
    bmi @B19_188b
    beq @B19_188b
    jsr B19_18ca
    jsr B19_1b0e
    bit menucursor_pos+1
    bvs @B19_18c5
    bmi @B19_18c7
    ldx UNK_37
    jmp @B19_1896
    @B19_18c5:
    sec
    rts
    @B19_18c7:
    jmp B19_17f6

B19_18ca:
    clc
    lda UNK_37
    adc #.LOBYTE(item_storage)
    sta UNK_84
    lda #0
    adc #.HIBYTE(item_storage)
    sta UNK_84+1
    rts

label_thecloset:
    .ifdef VER_JP
        .byte set_pos 23, 3
        kanafix "あずかりもの"
        .byte stopText
    .else
        .byte set_pos 9, 3
        .byte "The Closet"
        .byte stopText
    .endif

OpenOverworldPSI:
    jsr DRAW_WINDOW_8ENTRY
    ldx #$ff
@IncrementX:
    inx
    cpx #3     ; wrap to 0 if >3
    bcc @FindPSIsStart
    ldx #0
@FindPSIsStart:
    lda party_members, x
    beq @IncrementX
    cmp #3
    bcs @IncrementX
    sta curr_player_id
    stx UNK_37
    jsr Draw8Entry_LabelName
    jsr B19_1935
    jsr B19_1b40
    jsr Load8Entry_CharChoicer
    ldx UNK_37
    lda #6
    bit menucursor_pos+1
    bvs @B19_1930
    bmi @IncrementX
    beq @IncrementX
    jsr B19_1935
    ldy #1
    lda (temp_vars), y
    and #$f0
    bne @skip
    jsr B19_1b0e
    bit menucursor_pos+1
    bvs @B19_1930
    bmi @B19_1932
    ; go back to start of loop
    @skip:
    ldx UNK_37
    jmp @FindPSIsStart
    @B19_1930:
    sec
    rts
    @B19_1932:
    jmp B19_17f6

B19_1935:
    jsr LoadCurrPlayerPtr
    clc
    lda temp_word
    adc #$30
    sta UNK_84
    lda temp_word+1
    adc #0
    sta UNK_84+1
    ldx #0
    ldy #0
    @B19_1949:
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
    lda (UNK_84), y
    and All_Bits, x
    ldx temp_vars+4
    and overworldpsi_mask, y
    beq @B19_1971
    clc
    lda temp_vars+5
    adc #$c0
    sta UNK_580, x
    inx
    cpx #8
    bcs @B19_1982
    @B19_1971:
    ldy temp_vars+5
    iny
    cpy #$20
    bcc @B19_1949
    lda #0
    @B19_197a:
    sta UNK_580, x
    inx
    cpx #8
    bcc @B19_197a
    @B19_1982:
    lda #.LOBYTE(UNK_580)
    ldx #.HIBYTE(UNK_580)
    sta UNK_84
    stx UNK_84+1
    rts

overworldpsi_mask:
    .byte %01100000
    .byte %11100000
    .byte %10101000
    .byte %00000000

OpenTeleportMenu:
    jsr DRAW_WINDOW_8ENTRY
    lda #.LOBYTE(label_teleportmenu_where)
    ldx #.HIBYTE(label_teleportmenu_where)
    jsr O_DrawCurrentTilepack
    jsr B19_19af
    jsr B19_1b40
    lda #.LOBYTE(teleport_choicer)
    ldx #.HIBYTE(teleport_choicer)
    jsr B19_1b12
    bit menucursor_pos+1
    bmi @B19_19ac
    sec
    rts
    @B19_19ac:
    jmp B19_17f6

B19_19af:
    lda event_flags+29
    sta UNK_64+1
    ldx #0
    @B19_19b6:
    lda #0
    asl UNK_64+1
    bcc @B19_19c0
    clc
    txa
    adc #$80
    @B19_19c0:
    sta UNK_580, x
    inx
    cpx #8
    bcc @B19_19b6
    lda #.LOBYTE(UNK_580)
    ldx #.HIBYTE(UNK_580)
    sta UNK_84
    stx UNK_84+1
    rts

label_teleportmenu_where:
    .ifdef VER_JP
        .byte set_pos 21, 3
        .byte uibox_t,uibox_t
        kanafix "どこへ? "
        .byte stopText
    .else
        .byte set_pos 7, 3
        .byte uibox_tc, "Where?"
        .byte stopText
    .endif

teleport_choicer:
    .byte 2, 4 ; choicer array size
    .byte 12, 2 ; X/Y inc
    .byte PAD_A | PAD_B ; Input mask
    .byte $3a ; Tile
    .byte 6, 5 ;X/Y start

B19_19e4:
.ifdef VER_JP
    jsr DRAW_WINDOW_CASHBOX
    lda #.LOBYTE(B19_1ab6)
    ldx #.HIBYTE(B19_1ab6)
    jsr O_DrawCurrentTilepack
    jsr DrawTilepackClear
    ldx #$29
    @loop:
    lda RegName_Alphabet, x
    cmp #$41
    bcc @skiper1
    cmp #$91
    bcc @skiper2
    @skiper1:
    lda #0
    @skiper2:
    sta UNK_580, x
    dex
    bpl @loop
    lda #$c0
    sta UNK_580+35
    sta UNK_D6

    jsr EnablePRGRam
    lda #0
    sta save_file_current+49
    sta UNK_37
    ldy #$10
    lda #'?'
    B19_1a07:
    sta save_file_current+32, y
    dey
    bpl B19_1a07

    jsr B19_1a8d
    jsr PRINT_CURR_CHOICER
    jmp @bb22
    @yump1:
    jsr B19_1a8d
    jsr B31_0f7c

    @bb22:
    bit menucursor_pos+1
    bmi @B19_1a39
    bvc @B19_1a54
    @B19_1a24:
    ldy UNK_37
    beq @yump1
    lda player_name, y
    cmp #'?'
    bne @B19_1a30
    dey
    @B19_1a30:
    lda #'?'
    sty UNK_37
    sta player_name, y
    bne @yump1
    @B19_1a39:
    ldy menucursor_pos
    cpy #$10
    beq @B19_1a24

    cpy #$25
    beq @B19_1a54
    lda UNK_580, y

    ldy UNK_37
    sta save_file_current+32, y
    cpy #$10
    bcs @yump1
    iny
    sty UNK_37
    bne @yump1
    @B19_1a54:
    ldy UNK_37
    beq @yump1
    lda save_file_current+32, y
    cmp #$c2
    beq @skip
    iny
    @skip:
    lda #0
    sta save_file_current+32, y
    sta UNK_D6
    lda #$f0
    sta shadow_oam+4
    jsr WriteProtectPRGRam
    jmp B19_0b41
.else
    jsr DRAW_WINDOW_CASHBOX
    lda #.LOBYTE(B19_1ab6)
    ldx #.HIBYTE(B19_1ab6)
    jsr O_DrawCurrentTilepack
    jsr DrawTilepack
    ldx #0
    jsr B19_1a72
    jsr B19_1a72
    jsr EnablePRGRam
    lda #0
    sta player_name_end
    sta UNK_37
    ldy #$10
    lda #'?'
    B19_1a07:
    sta player_name, y
    dey
    bpl B19_1a07
    sta UNK_D6
    jsr B19_1a8d
    jsr PRINT_CURR_CHOICER
    jmp B19_1a1e

B19_1a18:
    jsr B19_1a8d
    jsr B31_0f7c
B19_1a1e:
    bit menucursor_pos+1
    bmi B19_1a39
    bvc B19_1a54
    B19_1a24:
    ldy UNK_37
    beq B19_1a18
    lda player_name, y
    cmp #$a2
    bne B19_1a30
    dey
    B19_1a30:
    lda #$a2
    sty UNK_37
    sta player_name, y
    bne B19_1a18
    B19_1a39:
    ldy menucursor_pos
    cpy #$10
    beq B19_1a24
    cpy #$26
    beq B19_1a54
    lda UNK_580, y
    ldy UNK_37
    sta player_name, y
    cpy #$10
    bcs B19_1a18
    iny
    sty UNK_37
    bne B19_1a18
    B19_1a54:
    ldy UNK_37
    beq B19_1a18
    lda player_name, y
    cmp #'?'
    beq B19_1a60
    iny
    B19_1a60:
    lda #0
    sta player_name, y
    sta UNK_D6
    lda #$f0
    sta shadow_oam+4
    jsr WriteProtectPRGRam
    jmp B19_0b41

B19_1a72:
    ldy #$11
    B19_1a74:
    lda RegName_Alphabet, x
    sta UNK_580, x
    inx
    dey
    bne B19_1a74
    lda #0
    sta irq_pointers+$3e, x
    ldy #5
    B19_1a85:
    sta UNK_580, x
    inx
    dey
    bne B19_1a85
    rts
.endif

B19_1a8d:
    lda #.LOBYTE(B19_1ae5)
    ldx #.HIBYTE(B19_1ae5)
    jsr O_DrawCurrentTilepack
    lda #$32
    sta shadow_oam+4
    lda #1
    sta shadow_oam+5
    lda #0
    sta shadow_oam+6
    lda UNK_37
    asl a
    asl a
    asl a
    adc #$48
    sta shadow_oam+7
    lda #.LOBYTE(RegisterName_Choicer)
    ldx #.HIBYTE(RegisterName_Choicer)
    sta UNK_80
    stx UNK_80+1
    rts

B19_1ab6:
    .byte set_pos 8, 9

RegName_Alphabet:
.ifdef VER_JP
    kanafix "ABCDEFG HIJKLMN *もどる",newLine
    kanafix "OPQRSTU VWXYZ,  *おわり",stopText
.else
    .byte "ABCDEFG HIJKLMN *Back",newLine
    .byte "OPQRSTU VWXYZ.' *End ",stopText
.endif

B19_1ae5:
    .byte set_pos 9, 5
    .byte print_string $7420
    .byte set_pos 8, 9
    .byte stopText

RegisterName_Choicer:
    .ifdef VER_JP
        .byte 21, 2 ; choicer array size
    .else
        .byte 22, 2 ; choicer array size
    .endif
    .byte 1, 2 ; X/Y inc
    .byte PAD_A | PAD_B | PAD_START ; Input mask
    .byte 1 ; Tile
    .byte 8, 9 ;X/Y start
    .word UNK_580 ; choices

Load8Entry_CharChoicer:
    lda #.LOBYTE(Overworld8Entry_Choicer)
    ldx #.HIBYTE(Overworld8Entry_Choicer)
    sta UNK_80
    stx UNK_80+1
    jmp PRINT_CURR_CHOICER

; Overworld 8-Menu Choicer
Overworld8Entry_Choicer:
    .byte 1, 1 ; choicer array size
    .byte 0, 0 ; X/Y inc
    .ifdef VER_JP
        .byte PAD_A | PAD_B | PAD_DOWN | PAD_LEFT | PAD_RIGHT ; Input mask
        .byte $3a ; Tile
        .byte 21, 3 ; X/Y start
    .else
        .byte PAD_A | PAD_B | PAD_DOWN | PAD_RIGHT ; Input mask
        .byte $3a ; Tile
        .byte 7, 3 ; X/Y start
    .endif
    .addr EIGHT_OPTIONS_LUT ; choices

B19_1b0e:
    lda #.LOBYTE(PartyContentTrue_Choicer)
    ldx #.HIBYTE(PartyContentTrue_Choicer)
B19_1b12:
    sta UNK_80
    stx UNK_80+1
    jmp B31_0f3f

;the actual items in the list
;see Overworld8Entry_Choicer for name explanation
PartyContentTrue_Choicer:
    .byte 2, 4 ; choicer array size
    .byte 12, 2 ; X/Y inc
    .byte PAD_A | PAD_B | PAD_UP ; Input mask
    .byte $3a ; Tile
    .byte 6, 5 ; X/Y start

Draw8Entry_LabelName:
    jsr GetPartyMemberPtr
    clc
    lda temp_word
    adc #$38
    sta tilepack_ptr
    lda temp_word+1
    adc #$00
    sta tilepack_ptr+1
    .ifdef VER_JP
        lda #6                  ; tile qty (name length is 6)
        ldx #23                 ; x-pos
        ldy #3                  ; y-pos
        sta UNK_70
        stx ntbl_x
        sty ntbl_y
        jmp DrawTilepackClear
    .else
        lda #7                  ; tile qty (name length is 7)
        ldx #9                  ; x-pos
        ldy #3                  ; y-pos
        sta UNK_70
        stx ntbl_x
        sty ntbl_y
        jmp DrawTilepack
    .endif

B19_1b40:
    .ifdef VER_JP
        lda #10
    .else
        lda #11
    .endif
    ldx #7
    ldy #5
    sta UNK_70
    sty ntbl_y
    ldy #0
; print 8 entries loop
B19_1b4c:
    stx ntbl_x
    sty menucursor_pos
    lda (UNK_84), y
    sta curr_item_id
    jsr LoadItemNameptr
    ldx #$13
    cpx ntbl_x
    bne B19_1b63
    inc ntbl_y
    inc ntbl_y
    ldx #7
    B19_1b63:
    ldy menucursor_pos
    iny
    cpy #8
    bcc B19_1b4c
    lda #0
    sta UNK_70
    rts


.ifdef VER_JP
    .define dude pmb_pad3
.else
    .define dude WHERE_JP_STRINGS_ARE
.endif

B19_1b6f:
    jsr LoadCurrPlayerPtr
    jsr EnablePRGRam
    lda #4
    sta dude
    clc
    lda temp_word
    adc #$38
    sta dude+1
    lda temp_word+1
    adc #0
    sta dude+2
    jmp WriteProtectPRGRam

B19_1b8c:
    jsr GetItemDataPointer
    ldy #0
    lda (temp_vars), y
    sta UNK_64
    iny
    lda (temp_vars), y
    sta UNK_64+1
    jsr EnablePRGRam
    ldy #0
    B19_1b9f:
    lda (UNK_64), y
    sta dude+4, y
    iny
    cmp #0
    bne B19_1b9f
    jsr WriteProtectPRGRam
    jmp B19_0b41

LoadItemNameptr:
    jsr GetItemDataPointer
    ldy #0
    lda (temp_vars), y
    sta tilepack_ptr
    iny
    lda (temp_vars), y
    sta tilepack_ptr+1
    .ifdef VER_JP
        jsr DrawTilepackClear
    .else
        jsr DrawTilepack
    .endif
    jmp B19_0b41

LOAD_ITEM_PRICE:
    jsr GetItemDataPointer
    ldy #6
    lda (temp_vars), y
    sta input_wordvar
    iny
    lda (temp_vars), y
    sta input_wordvar+1
    jmp B19_0b41

B19_1bd4:
    jsr GetItemDataPointer
    ldy #2
    jsr obj_do_teleport
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
    lda curr_item_id
GetItemDataOffset_InA:
    sta temp_vars
    lda #0
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    asl temp_vars
    rol a
    sta temp_vars+1
    jmp BANKSET_L00

EndText:
    jsr WAIT_CLOSE_MENU
    jmp B30_03d5

B19_1c0a:
    lda text_id+1
    pha
    lda text_id
    pha
    jsr DrawWindowMessagebox
    pla
    sta text_id
    pla
    sta text_id+1
    lda #0
    sta UNK_2C+1
    .ifdef VER_JP
        ldx #11
    .else
        ldx #8
    .endif
    ldy #$13
    stx ntbl_x
    sty ntbl_y
    jmp B19_0b41

B19_1c28:
    lda ntbl_x
    pha
    lda ntbl_y
    pha
    jsr B30_03df
    pla
    sta ntbl_y
    pla
    sta ntbl_x
    jmp B19_0b41

; get data of item
.define equipment_stat_val UNK_6A+1
EquipItemRoutine:
    ;UNK_6A+1 = who_can_equip
    lda UNK_62
    and #%00111111          ; remove upper 2 bits
    sta equipment_stat_val
    lda UNK_62
    and #%11000000          ; get upper 2 bits
    asl a
    rol a
    rol a
    adc #$28
    sta UNK_62
    lda curr_item_id
    jsr GetItemInventorySlot
    bcs @exit
    tya
    adc #$20
    sta UNK_6A
    bcc EquipItemStart
    @exit:
    rts

.define equipitem_currslot curr_player_id
.define UNK_63 UNK_62+1
EquipItemStart_confiscated:
    lda #0
    sta equipment_stat_val
EquipItemStart:
    jsr LoadCurrPlayerPtr
    lda temp_word
    ldx temp_word+1
    sta curr_player_dataptr
    stx curr_player_dataptr+1
    ldy UNK_62
    lda (curr_player_dataptr), y
    jsr GetItemDataOffset_InA
    jsr B19_1be2
    ldy #3
    lda (temp_vars), y
    and #$3f
    sta UNK_63
    jsr EnablePRGRam
    ldx UNK_62
    lda equipment_slot_stat_table-equipitem_currslot, x
    bmi EquipPendantRoutine ; branch if null (pendant)
    tay
    sec
    ; subtract old item's stats
    lda (curr_player_dataptr), y
    sbc UNK_63
    sta (curr_player_dataptr), y
    iny
    lda (curr_player_dataptr), y
    sbc #0
    sta (curr_player_dataptr), y
    dey
    clc
    ; add new item's stats
    lda (curr_player_dataptr), y
    adc equipment_stat_val
    sta (curr_player_dataptr), y
    iny
    lda (curr_player_dataptr), y
    adc #0
    sta (curr_player_dataptr), y
    ; done
    jmp B19_1cb8

EquipPendantRoutine:
    ; offset of player's resistances
    ldy #2
    lda UNK_63
    asl a
    eor #$ff
    and (curr_player_dataptr), y
    sta (curr_player_dataptr), y
    lda equipment_stat_val
    asl a
    ora (curr_player_dataptr), y
    sta (curr_player_dataptr), y
B19_1cb8:
    lda equipment_stat_val
    beq B19_1ce0
    ldy UNK_6A
    lda (curr_player_dataptr), y
    tax
    ldy UNK_62
    lda (curr_player_dataptr), y
    bne B19_1cdb
    ldy UNK_6A
    bne B19_1cd1
B19_1ccb:
    lda (curr_player_dataptr), y
    dey
    sta (curr_player_dataptr), y
    iny
B19_1cd1:
    iny
    cpy #$28
    bcc B19_1ccb
    dey
    lda #0
    beq B19_1cdd
B19_1cdb:
    ldy UNK_6A
B19_1cdd:
    sta (curr_player_dataptr), y
    txa
B19_1ce0:
    ldy UNK_62
    sta (curr_player_dataptr), y
    clc
    jmp WriteProtectPRGRam

equipment_slot_stat_table:
    ; off, def, def, null (pendant)
    .byte $07,$09,$09,$ff

; Run do screen transition
OverworldTransitionIntepreter:
    ;x = fade_type << 1
    lda fade_type
    asl a
    tax

    lda #0
    sta fade_type

    ;jump to OverworldTransitionLUT[fade_type]
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
    lda #Noise_Stairs
    sta soundqueue_noise
    jmp OT0_DefaultTransition

; Screen transition type #2 (Onyx Hook)
OT2_OnyxHook:
    lda #PulseG0_MagicantWarp
    sta soundqueue_pulseg0
    lda #$34
    jsr B31_0e21
    .ifndef VER_JP
        ;if antipiracy set, run more checks
        lda UNK_6
        beq @return
        lda #.BANK(ShowAntipiracy)
        ldx #.LOBYTE(ShowAntipiracy-1)
        ldy #.HIBYTE(ShowAntipiracy-1)
        jsr TempUpperBankswitch
        @return:
    .endif
    ldx #60
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
    lda #Noise_Bomb
    sta soundqueue_noise
    lda #$14
    @loop:
    pha
    lda #$34
    jsr FillPalette
    lda #$38
    jsr FillPalette
    lda #$30
    jsr FillPalette
    pla
    sec
    sbc #1
    bne @loop
    rts

; Screen transition type #4 (Sucked into whirlpool)
OT4_Whirlpool:
    lda #Noise_Rocket
    sta soundqueue_noise
    lda #$11
    jsr B31_0e21
    jsr ClearSprites
    jsr ResetScroll

    ;load drain tiles
    lda #$5d
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    ;copy drain tiles
    jsr B30_0e6d

    ;load drain gfx
    lda #$5c
    ldx #BANK::CHR1000
    jsr BANK_SWAP

    ;do animate????
    lda #.LOBYTE(B19_1E1F)
    ldx #.HIBYTE(B19_1E1F)
    sta temp_word
    stx temp_word+1
    jsr B31_0087

    LoadPalette_Address DrainAnimation_Palette

    ldy #$16
    @B19_1d91:
    tya
    pha
    ldx #8
    @B19_1d95:
    jsr PpuSync
    lda #1
    sta SPRITE_OBJECTS+5, x
    lda SPRITE_OBJECTS+3, x
    and #$1f
    bne @B19_1daa
    lda #.LOBYTE($ffe8)
    ldy #.HIBYTE($ffe8)
    bne @B19_1dae
    @B19_1daa:
    lda #.LOBYTE(8)
    ldy #.HIBYTE(8)
    @B19_1dae:
    clc
    adc SPRITE_OBJECTS+6, x
    sta SPRITE_OBJECTS+6, x
    tya
    adc SPRITE_OBJECTS+7, x
    sta SPRITE_OBJECTS+7, x
    clc
    txa
    adc #8
    tax
    cpx #$28
    bcc @B19_1d95

    lda #8
    sta nmi_flags

    pla
    tay
    dey
    bne @B19_1d91
    jsr ClearSprites
    jsr OT0_DefaultTransition
    ldx #90
    jmp WaitXFrames_Min1

; Screen transition type #5 (Underwater lab floods)
OT5_Flood:
    lda #$11
    jsr FillBackgroundColor
    lda #Noise_Thunder
    sta soundqueue_noise
    jsr Refresh_SpriteObjects
    ldx #8
    ldy #7
    @B19_1dea:
    lda EVE_Fling, y
    sta SPRITE_OBJECTS+5, x
    dey
    lda EVE_Fling, y
    sta SPRITE_OBJECTS+4, x
    clc
    txa
    adc #8
    tax
    dey
    bpl @B19_1dea
    jsr BANKSET_H14
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

B19_1E1F:
; X, Y (but also sprite????), ????, ?????
.byte $60,$e0,$40,$18
.byte $68,$c8,$40,$00
.byte $58,$b0,$40,$08
.byte $60,$98,$40,$10

DrainAnimation_Palette:
.byte $0f,$22,$20,$11
.byte $0f,$10,$1a,$11
.byte $0f,$30,$00,$11
.byte $0f,$00,$10,$30

.byte $0f,$0f,$01,$31
.byte $0f,$0f,$13,$32
.byte $0f,$0f,$22,$32
.byte $0f,$0f,$11,$32

;lut for each party member
;'velocities' to fling each party member after the underwater lab floods.
EVE_Fling:
    .byte -2,-1
    .byte 2,-1
    .byte -1,-2
    .byte 1,-2

Game_Begin:
    lda save_slot
    jsr B19_1ebb
    jsr B19_1ed3
    jsr EnablePRGRam
    sec
    ldy #0
    lda (UNK_64), y
    sbc temp_word
    sta (UNK_64), y
    iny
    lda (UNK_64), y
    sbc temp_word+1
    sta (UNK_64), y
    ldx #3
    @B19_1e75:
    ldy #0
    @B19_1e77:
    lda (UNK_64), y
    sta (curr_player_dataptr), y
    iny
    bne @B19_1e77
    inc UNK_64+1
    inc UNK_68+1
    dex
    bne @B19_1e75
    jmp WriteProtectPRGRam

B19_1e88:
    jsr B19_1ebb
    jsr EnablePRGRam
    ldx #3
    @B19_1e90:
    ldy #0
    @B19_1e92:
    lda (curr_player_dataptr), y
    sta (UNK_64), y
    iny
    bne @B19_1e92
    inc UNK_68+1
    inc UNK_64+1
    dex
    bne @B19_1e90
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
    sta UNK_68+1
    asl a
    adc UNK_68+1
    adc #$77
    sta UNK_68+1
    lda #0
    sta UNK_68
B19_1eca:
    lda #.LOBYTE(starting_sram)
    ldx #.HIBYTE(starting_sram)
    sta UNK_64
    stx UNK_64+1
    rts

B19_1ed3:
    jsr B19_1eca
    lda #0
    sta temp_word
    sta temp_word+1
    ldx #3
    @B19_1ede:
    ldy #0
    @B19_1ee0:
    clc
    lda (UNK_64), y
    adc temp_word
    sta temp_word
    iny
    lda (UNK_64), y
    adc temp_word+1
    sta temp_word+1
    iny
    bne @B19_1ee0
    inc UNK_64+1
    dex
    bne @B19_1ede
    jmp B19_1eca
