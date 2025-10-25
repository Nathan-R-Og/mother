.segment "SPRITES": absolute

;sprite
.macro spritePointerDef pointer, ppu, p1, p2, unkArg1, unkArg2
    .addr pointer
    .byte ppu
    .byte (unkArg2 << 5) | (unkArg1 << 4) | (p2 << 2) | p1
.endmacro

.macro spriteTile posX, posY, palette, unkArg1, order, flipX, flipY, index
    .byte posX, posY
    .byte (flipY << 7) | (flipX << 6) | (order << 5) | (unkArg1 << 2) | palette
    .byte index
.endmacro

SPRITES:

;;;;;characters1
SPRITEDEF_NINTEN:
spritePointerDef SPRITE_CHARUP1, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARUP2, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARRIGHT1, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARRIGHT2, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARDOWN1, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARDOWN2, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARLEFT1, $0, 1, 3, 1, 0
spritePointerDef SPRITE_CHARLEFT2, $0, 1, 3, 1, 0

SPRITEDEF_ANA:
spritePointerDef SPRITE_CHARUP1, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARUP2, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARRIGHT1, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARRIGHT2, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARDOWN1, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARDOWN2, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARLEFT1, $40, 2, 2, 1, 0
spritePointerDef SPRITE_CHARLEFT2, $40, 2, 2, 1, 0

SPRITEDEF_LLOYD:
spritePointerDef SPRITE_10, $20, 1, 1, 1, 0
spritePointerDef SPRITE_11, $20, 1, 1, 1, 0
spritePointerDef SPRITE_12, $20, 1, 1, 1, 0
spritePointerDef SPRITE_13, $20, 1, 1, 1, 0
spritePointerDef SPRITE_14, $20, 1, 1, 1, 0
spritePointerDef SPRITE_15, $20, 1, 1, 1, 0
spritePointerDef SPRITE_16, $20, 1, 1, 1, 0
spritePointerDef SPRITE_17, $20, 1, 1, 1, 0

SPRITEDEF_TEDDY:
spritePointerDef SPRITE_18, $60, 1, 1, 1, 0
spritePointerDef SPRITE_19, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1A, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1B, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1C, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1D, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1E, $60, 1, 1, 1, 0
spritePointerDef SPRITE_1F, $60, 1, 1, 1, 0

SPRITEDEF_PIPPI:
spritePointerDef SPRITE_CHARUP1, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARUP2, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARRIGHT1, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARRIGHT2, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARDOWN1, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARDOWN2, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARLEFT1, $8, 1, 2, 1, 0
spritePointerDef SPRITE_CHARLEFT2, $8, 1, 2, 1, 0

SPRITEDEF_NINTEN_DEAD:
spritePointerDef SPRITE_28, $0, 0, 0, 0, 0
spritePointerDef SPRITE_29, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2A, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2B, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2C, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2D, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2E, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2F, $0, 0, 0, 0, 0

SPRITEDEF_ANA_DEAD:
spritePointerDef SPRITE_30, $0, 0, 0, 0, 0
spritePointerDef SPRITE_31, $0, 0, 0, 0, 0
spritePointerDef SPRITE_32, $0, 0, 0, 0, 0
spritePointerDef SPRITE_33, $0, 0, 0, 0, 0
spritePointerDef SPRITE_34, $0, 0, 0, 0, 0
spritePointerDef SPRITE_35, $0, 0, 0, 0, 0
spritePointerDef SPRITE_36, $0, 0, 0, 0, 0
spritePointerDef SPRITE_37, $0, 0, 0, 0, 0

SPRITEDEF_LLOYD_DEAD:
spritePointerDef SPRITE_38, $0, 0, 0, 0, 0
spritePointerDef SPRITE_39, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3A, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3B, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3C, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3D, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3E, $0, 0, 0, 0, 0
spritePointerDef SPRITE_3F, $0, 0, 0, 0, 0

SPRITEDEF_TEDDY_DEAD:
spritePointerDef SPRITE_40, $0, 0, 0, 0, 0
spritePointerDef SPRITE_41, $0, 0, 0, 0, 0
spritePointerDef SPRITE_42, $0, 0, 0, 0, 0
spritePointerDef SPRITE_43, $0, 0, 0, 0, 0
spritePointerDef SPRITE_44, $0, 0, 0, 0, 0
spritePointerDef SPRITE_45, $0, 0, 0, 0, 0
spritePointerDef SPRITE_46, $0, 0, 0, 0, 0
spritePointerDef SPRITE_47, $0, 0, 0, 0, 0

SPRITEDEF_PIPPI_DEAD:
spritePointerDef SPRITE_48, $0, 0, 0, 0, 0
spritePointerDef SPRITE_49, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4A, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4B, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4C, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4D, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4E, $0, 0, 0, 0, 0
spritePointerDef SPRITE_4F, $0, 0, 0, 0, 0

;characters7 but whatever
SPRITEDEF_FLYINGMAN:
spritePointerDef SPRITE_CHARUP1, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 2, 0, 0

;characters9 but whatever
SPRITEDEF_EVE:
spritePointerDef SPRITE_58, $80, 1, 1, 0, 0
spritePointerDef SPRITE_58, $82, 1, 1, 0, 0
spritePointerDef SPRITE_58, $84, 1, 1, 0, 0
spritePointerDef SPRITE_58, $86, 1, 1, 0, 0
spritePointerDef SPRITE_58, $88, 1, 1, 0, 0
spritePointerDef SPRITE_58, $8A, 1, 1, 0, 0
spritePointerDef SPRITE_58, $8C, 1, 1, 0, 0
spritePointerDef SPRITE_58, $8E, 1, 1, 0, 0

SPRITEDEF_TELEPORT_FRY:
spritePointerDef SPRITE_60, $68, 0, 0, 0, 0

;unused?
spritePointerDef SPRITE_60, $68, 0, 0, 0, 0


SPRITEDEF_PRESENT:
spritePointerDef SPRITE_60, $6A, 1, 1, 0, 0
;SPRITEDEF_PRESENT_OPEN:
spritePointerDef SPRITE_60, $6C, 1, 1, 0, 0

;unused?
spritePointerDef SPRITE_60, $6C, 0, 0, 0, 0


SPRITEDEF_SIGN:
spritePointerDef SPRITE_60, $6E, 1, 1, 0, 0

;unused?
spritePointerDef SPRITE_66, $3C, 1, 1, 0, 0
spritePointerDef SPRITE_67, $3C, 1, 1, 0, 0

;unused?
SPRITEDEF_SWEAT:
spritePointerDef SPRITE_68, $3E, 0, 0, 0, 0
spritePointerDef SPRITE_69, $3E, 0, 0, 0, 0

;;;;;characters2
SPRITEDEF_CHARSLOT1_BB: ;bank irrelevant
SPRITEDEF_MOUSTACHE_GUY: ;characters2
spritePointerDef SPRITE_CHARUP1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 3, 3, 0, 0

SPRITEDEF_CHARSLOT2_BB: ;bank irrelevant
SPRITEDEF_COP: ;characters2
spritePointerDef SPRITE_CHARUP1, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A0, 3, 3, 0, 0

SPRITEDEF_BIGLADY:
spritePointerDef SPRITE_10, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_11, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_12, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_13, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_14, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_15, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_16, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_17, $C0, 1, 1, 0, 0

SPRITEDEF_PIGPEN:
spritePointerDef SPRITE_10, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_11, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_12, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_13, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_14, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_15, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_16, $E0, 1, 2, 0, 0
spritePointerDef SPRITE_17, $E0, 1, 2, 0, 0

SPRITEDEF_CHARSLOT5_BB: ;bank irrelevant
SPRITEDEF_MAN: ;characters2
spritePointerDef SPRITE_CHARUP1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 3, 3, 0, 0

SPRITEDEF_CHARSLOT6_RP: ;bank irrelevant
SPRITEDEF_SECRETARY: ;characters2
spritePointerDef SPRITE_CHARUP1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 2, 0, 0

SPRITEDEF_CHARSLOT7_RR: ;bank irrelevant
SPRITEDEF_COOL_GUY: ;characters2
spritePointerDef SPRITE_CHARUP1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 1, 1, 0, 0

SPRITEDEF_CHARSLOT8_RR: ;bank irrelevant
SPRITEDEF_OLD_WOMAN: ;characters2
spritePointerDef SPRITE_CHARUP1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E8, 1, 1, 0, 0

SPRITEDEF_CHARSLOT9_RR: ;bank irrelevant
SPRITEDEF_WOMAN: ;characters2
spritePointerDef SPRITE_AA, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AB, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AC, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AD, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AE, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AF, $80, 1, 1, 0, 0
spritePointerDef SPRITE_B0, $80, 1, 1, 0, 0
spritePointerDef SPRITE_B1, $80, 1, 1, 0, 0

SPRITEDEF_CHARSLOT1_5_BB: ;bank irrelevant
SPRITEDEF_SUIT_GUY: ;characters2
spritePointerDef SPRITE_B2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B3, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B4, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B5, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B6, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B7, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B8, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B9, $80, 3, 3, 0, 0

SPRITEDEF_CHARSLOT1_6_RR: ;bank irrelevant
SPRITEDEF_SUIT_GIRL: ;characters2
spritePointerDef SPRITE_BA, $80, 1, 1, 0, 0
spritePointerDef SPRITE_BB, $80, 1, 1, 0, 0
spritePointerDef SPRITE_BC, $80, 1, 1, 0, 0
spritePointerDef SPRITE_BD, $80, 1, 1, 0, 0
spritePointerDef SPRITE_BE, $80, 1, 1, 0, 0
spritePointerDef SPRITE_BF, $80, 1, 1, 0, 0
spritePointerDef SPRITE_C0, $80, 1, 1, 0, 0
spritePointerDef SPRITE_C1, $80, 1, 1, 0, 0


;;;;;characters3
SPRITEDEF_CHARSLOT1_RB: ;bank irrelevant
SPRITEDEF_CAP_KID: ;characters3
spritePointerDef SPRITE_CHARUP1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 3, 0, 0

SPRITEDEF_CHARSLOT2_RR: ;bank irrelevant
SPRITEDEF_HAIR_GIRL: ;characters3
spritePointerDef SPRITE_CHARUP1, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A0, 2, 1, 0, 0

SPRITEDEF_CHARSLOT3_BB: ;bank irrelevant
SPRITEDEF_LONG_GUY: ;characters3
spritePointerDef SPRITE_CHARUP1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C0, 3, 3, 0, 0

SPRITEDEF_MAYOR:
spritePointerDef SPRITE_10, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_11, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_12, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_13, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_14, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_15, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_16, $E0, 3, 3, 0, 0
spritePointerDef SPRITE_17, $E0, 3, 3, 0, 0

SPRITEDEF_CHARSLOT5_RR: ;bank irrelevant
SPRITEDEF_HEADBAND_KID: ;characters3
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0

SPRITEDEF_CHARSLOT6_RP_DUPE1: ;bank irrelevant
SPRITEDEF_PIGTAIL_GIRL: ;characters3
spritePointerDef SPRITE_CHARUP1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 2, 0, 0

SPRITEDEF_CHARSLOT7_PP: ;bank irrelevant
SPRITEDEF_PONYTAIL_GIRL: ;characters3
spritePointerDef SPRITE_CHARUP1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 2, 2, 0, 0

SPRITEDEF_SMALLCAP_KID:
spritePointerDef SPRITE_10, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_11, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_12, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_13, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_14, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_15, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_16, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_17, $E8, 3, 3, 0, 0

SPRITEDEF_CHARSLOT9_BB: ;bank irrelevant
SPRITEDEF_JANITOR: ;characters3
spritePointerDef SPRITE_AA, $80, 3, 3, 0, 0
spritePointerDef SPRITE_AB, $80, 3, 3, 0, 0
spritePointerDef SPRITE_AC, $80, 3, 3, 0, 0
spritePointerDef SPRITE_AD, $80, 3, 3, 0, 0
spritePointerDef SPRITE_AE, $80, 3, 3, 0, 0
spritePointerDef SPRITE_AF, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B0, $80, 3, 3, 0, 0
spritePointerDef SPRITE_B1, $80, 3, 3, 0, 0

SPRITEDEF_CHARSLOT1_5_BR: ;bank irrelevant
SPRITEDEF_HEADBAND_KID_2: ;characters3
spritePointerDef SPRITE_B2, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B3, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B4, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B5, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B6, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B7, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B8, $80, 3, 1, 0, 0
spritePointerDef SPRITE_B9, $80, 3, 1, 0, 0

SPRITEDEF_CHARSLOT1_6_BB: ;bank irrelevant
SPRITEDEF_PIGTAIL_GIRL_2: ;characters3
spritePointerDef SPRITE_BA, $80, 3, 3, 0, 0
spritePointerDef SPRITE_BB, $80, 3, 3, 0, 0
spritePointerDef SPRITE_BC, $80, 3, 3, 0, 0
spritePointerDef SPRITE_BD, $80, 3, 3, 0, 0
spritePointerDef SPRITE_BE, $80, 3, 3, 0, 0
spritePointerDef SPRITE_BF, $80, 3, 3, 0, 0
spritePointerDef SPRITE_C0, $80, 3, 3, 0, 0
spritePointerDef SPRITE_C1, $80, 3, 3, 0, 0


;;;;;characters4
SPRITEDEF_BELLHOP_WOMAN:
spritePointerDef SPRITE_10, $80, 2, 2, 0, 0
spritePointerDef SPRITE_11, $80, 2, 2, 0, 0
spritePointerDef SPRITE_12, $80, 2, 2, 0, 0
spritePointerDef SPRITE_13, $80, 2, 2, 0, 0
spritePointerDef SPRITE_14, $80, 2, 2, 0, 0
spritePointerDef SPRITE_15, $80, 2, 2, 0, 0
spritePointerDef SPRITE_16, $80, 2, 2, 0, 0
spritePointerDef SPRITE_17, $80, 2, 2, 0, 0

SPRITEDEF_CHARSLOT2_RR_DUPE1: ;bank irrelevant
SPRITEDEF_NURSE: ;characters4
spritePointerDef SPRITE_CHARUP1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 1, 0, 0

SPRITEDEF_CHARSLOT3_BB_DUPE1: ;bank irrelevant
SPRITEDEF_GLASSES_GUY: ;characters4
spritePointerDef SPRITE_CHARUP1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C0, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C0, 3, 3, 0, 0

SPRITEDEF_CHARSLOT5_BB_DUPE1: ;bank irrelevant
SPRITEDEF_DOCTOR: ;characters4
spritePointerDef SPRITE_CHARUP1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 3, 3, 0, 0

SPRITEDEF_CHARSLOT6_BB: ;bank irrelevant
SPRITEDEF_PRIEST: ;characters4
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0

SPRITEDEF_BABY:
spritePointerDef SPRITE_142, $A8, 1, 1, 0, 0

SPRITEDEF_ANA_NOHAT:
spritePointerDef SPRITE_10, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_11, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_12, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_13, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_14, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_15, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_16, $E0, 2, 2, 1, 0
spritePointerDef SPRITE_17, $E0, 2, 2, 1, 0

SPRITEDEF_ABLE_BAKER:
spritePointerDef SPRITE_10, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_11, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_12, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_13, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_14, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_15, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_16, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_17, $C8, 3, 3, 0, 0

SPRITEDEF_TEDDY_LYING:
spritePointerDef SPRITE_60, $EC, 1, 1, 1, 0

SPRITEDEF_DUNCAN_ROCKET:
spritePointerDef SPRITE_154, $E8, 3, 3, 0, 0
spritePointerDef SPRITE_155, $E8, 3, 3, 0, 0

SPRITEDEF_COFFIN:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0

;unused?
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0

SPRITEDEF_DUNCAN_ROCKETHOLSTER:
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0

SPRITEDEF_SKELETON:
spritePointerDef SPRITE_142, $C0, 0, 0, 0, 0


;;;;;characters5
SPRITEDEF_CHARSLOT1_GG: ;bank irrelevant
SPRITEDEF_SPOOKANE_BELLHOP: ;characters5
spritePointerDef SPRITE_CHARUP1, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 0, 0, 0, 0

SPRITEDEF_CANARY:
spritePointerDef SPRITE_10, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_11, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_12, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_13, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_14, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_15, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_16, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_17, $A0, 1, 1, 0, 0

SPRITEDEF_CHARSLOT3_PP: ;bank irrelevant
SPRITEDEF_PIPPI_MOM: ;characters5
spritePointerDef SPRITE_CHARUP1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C0, 2, 2, 0, 0

SPRITEDEF_CHARSLOT4_PR: ;bank irrelevant
SPRITEDEF_MOM: ;characters5
spritePointerDef SPRITE_CHARUP1, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 1, 0, 0

SPRITEDEF_CANARY_PILLAR:
spritePointerDef SPRITE_17A, $88, 0, 0, 0, 0

SPRITEDEF_CHARSLOT6_GG: ;bank irrelevant
SPRITEDEF_DOG: ;characters5
spritePointerDef SPRITE_CHARUP1, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 0, 0, 0, 0

SPRITEDEF_CHARSLOT7_BB_DUPE1: ;bank irrelevant
SPRITEDEF_HEALER: ;characters5
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0

SPRITEDEF_CHARSLOT8_PP: ;bank irrelevant
SPRITEDEF_MIMMIE: ;characters5
spritePointerDef SPRITE_CHARUP1, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E8, 2, 2, 0, 0

SPRITEDEF_MOUSE:
spritePointerDef SPRITE_193, $80, 0, 0, 0, 0
spritePointerDef SPRITE_194, $80, 0, 0, 0, 0
spritePointerDef SPRITE_195, $80, 0, 0, 0, 0
spritePointerDef SPRITE_196, $80, 0, 0, 0, 0
spritePointerDef SPRITE_197, $80, 0, 0, 0, 0
spritePointerDef SPRITE_198, $80, 0, 0, 0, 0
spritePointerDef SPRITE_199, $80, 0, 0, 0, 0
spritePointerDef SPRITE_19A, $80, 0, 0, 0, 0

SPRITEDEF_DOLL:
spritePointerDef SPRITE_142, $C0, 3, 3, 0, 0

SPRITEDEF_PHONE:
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0

SPRITEDEF_LAMP:
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0

;unused?
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0

SPRITEDEF_CHARSLOT8_RR_DUPE1: ;bank irrelevant
SPRITEDEF_MINNIE: ;characters5
spritePointerDef SPRITE_CHARUP1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E8, 1, 1, 0, 0



;;;;;characters6
SPRITEDEF_BBGANG:
spritePointerDef SPRITE_10, $80, 3, 3, 0, 0
spritePointerDef SPRITE_11, $80, 3, 3, 0, 0
spritePointerDef SPRITE_12, $80, 3, 3, 0, 0
spritePointerDef SPRITE_13, $80, 3, 3, 0, 0
spritePointerDef SPRITE_14, $80, 3, 3, 0, 0
spritePointerDef SPRITE_15, $80, 3, 3, 0, 0
spritePointerDef SPRITE_16, $80, 3, 3, 0, 0
spritePointerDef SPRITE_17, $80, 3, 3, 0, 0

SPRITEDEF_CHARSLOT6_RR: ;bank irrelevant
SPRITEDEF_OVERALLS_MAN: ;characters6
spritePointerDef SPRITE_CHARUP1, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 1, 0, 0

SPRITEDEF_CHARSLOT2_RR_DUPE3: ;bank irrelevant
SPRITEDEF_BEEHAIR: ;characters6
spritePointerDef SPRITE_CHARUP1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 1, 0, 0

SPRITEDEF_CHARSLOT5_RR_DUPE1: ;bank irrelevant
SPRITEDEF_PILOT: ;characters6
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0

SPRITEDEF_CHARSLOT7_BB_DUPE2: ;bank irrelevant
SPRITEDEF_ELLAY_COP: ;characters6
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0

SPRITEDEF_CHARSLOT4_PP_DUPE1: ;bank irrelevant
SPRITEDEF_ELLAY_PUNK: ;characters6
spritePointerDef SPRITE_CHARUP1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 2, 0, 0

SPRITEDEF_CHARSLOT3_RR_DUPE1: ;bank irrelevant
SPRITEDEF_SIDETAIL_GIRL: ;characters6
spritePointerDef SPRITE_CHARUP1, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C0, 1, 1, 0, 0

SPRITEDEF_LIVEHOUSE_SIGN:
spritePointerDef SPRITE_1DF, $80, 2, 1, 0, 3

;unused?
spritePointerDef SPRITE_1DF, $80, 2, 1, 0, 3

SPRITEDEF_CHARSLOT9_RR_DUPE1: ;bank irrelevant
SPRITEDEF_BLACKHAIR_WOMAN: ;characters6
spritePointerDef SPRITE_AA, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AB, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AC, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AD, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AE, $80, 1, 1, 0, 0
spritePointerDef SPRITE_AF, $80, 1, 1, 0, 0
spritePointerDef SPRITE_B0, $80, 1, 1, 0, 0
spritePointerDef SPRITE_B1, $80, 1, 1, 0, 0



;;;;;characters7
SPRITEDEF_CHARSLOT1_BB_DUPE2: ;bank irrelevant
SPRITEDEF_MAGICANTIAN_BOY: ;characters7
spritePointerDef SPRITE_CHARUP1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 3, 3, 0, 0

SPRITEDEF_MONKEY:
spritePointerDef SPRITE_10, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_11, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_12, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_13, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_14, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_15, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_16, $C0, 1, 1, 0, 0
spritePointerDef SPRITE_17, $C0, 1, 1, 0, 0

SPRITEDEF_CHARSLOT4_PP_DUPE2: ;bank irrelevant
SPRITEDEF_CAT: ;characters7
spritePointerDef SPRITE_CHARUP1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 2, 0, 0

SPRITEDEF_CHARSLOT5_RR_DUPE2: ;bank irrelevant
SPRITEDEF_MAGICANTIAN_GIRL: ;characters7
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0

SPRITEDEF_MAGICANTIAN_ADULT:
spritePointerDef SPRITE_10, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_11, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_12, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_13, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_14, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_15, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_16, $A8, 2, 2, 0, 0
spritePointerDef SPRITE_17, $A8, 2, 2, 0, 0

SPRITEDEF_CHARSLOT7_GG: ;bank irrelevant
SPRITEDEF_PENGUIN: ;characters7
spritePointerDef SPRITE_CHARUP1, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 0, 0, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 0, 0, 0, 0

SPRITEDEF_ZOO_SIGN:
spritePointerDef SPRITE_154, $E8, 3, 3, 0, 0

SPRITEDEF_ZOO_INFOPANEL:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0

SPRITEDEF_ZOO_GATE:
spritePointerDef SPRITE_154, $EC, 0, 0, 0, 0

SPRITEDEF_TRASH_CAN:
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0

;unused?
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0

SPRITEDEF_RABBIT:
spritePointerDef SPRITE_193, $80, 0, 0, 0, 0
spritePointerDef SPRITE_194, $80, 0, 0, 0, 0
spritePointerDef SPRITE_195, $80, 0, 0, 0, 0
spritePointerDef SPRITE_196, $80, 0, 0, 0, 0
spritePointerDef SPRITE_197, $80, 0, 0, 0, 0
spritePointerDef SPRITE_198, $80, 0, 0, 0, 0
spritePointerDef SPRITE_199, $80, 0, 0, 0, 0
spritePointerDef SPRITE_19A, $80, 0, 0, 0, 0

SPRITEDEF_FLAMINGOS:
spritePointerDef SPRITE_142, $C0, 2, 2, 0, 5

SPRITEDEF_PANDA:
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0

SPRITEDEF_CHARSLOT1_RB_DUPE1: ;bank irrelevant
SPRITEDEF_MAGICANTIAN_BOY_RB: ;characters7
spritePointerDef SPRITE_CHARUP1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 3, 0, 0

SPRITEDEF_CHARSLOT5_PP: ;bank irrelevant
SPRITEDEF_MAGICANTIAN_GIRL_PINK: ;characters7
spritePointerDef SPRITE_CHARUP1, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 2, 2, 0, 0

SPRITEDEF_CHARSLOT6_BB_DUPE1: ;bank irrelevant
SPRITEDEF_MAGICANTIAN_ADULT_BLUE: ;characters7
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0



;;;;;characters8
SPRITEDEF_CHARSLOT1_RR: ;bank irrelevant
SPRITEDEF_MAGICANT_GUARD: ;characters8
spritePointerDef SPRITE_CHARUP1, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 1, 0, 0

SPRITEDEF_CHARSLOT3_PP_DUPE1: ;bank irrelevant
SPRITEDEF_MARIA: ;characters8
spritePointerDef SPRITE_CHARUP1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C0, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C0, 2, 2, 0, 0

SPRITEDEF_FORGOTTEN_MAN:
spritePointerDef SPRITE_60, $88, 3, 3, 0, 0

SPRITEDEF_CHARSLOT6_BB_DUPE2: ;bank irrelevant
SPRITEDEF_GUITARIST: ;characters8
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0

SPRITEDEF_CHARSLOT7_BB_DUPE3: ;bank irrelevant
SPRITEDEF_BAG_MAN: ;characters8
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0

SPRITEDEF_PIANOLEFT:
spritePointerDef SPRITE_60, $E8, 0, 0, 0, 0
SPRITEDEF_PIANORIGHT: ;TODO: see if object is split or not
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0

SPRITEDEF_ISLAND_ROCKET_SMALL:
spritePointerDef SPRITE_263, $0, 1, 1, 0, 0
;unused?
spritePointerDef SPRITE_263, $0, 1, 1, 0, 0

SPRITEDEF_ISLAND_ROCKET:
spritePointerDef SPRITE_265, $0, 1, 1, 0, 0
;unused?
spritePointerDef SPRITE_265, $0, 1, 1, 0, 0

SPRITEDEF_ISLAND_ROCKET_FLAME:
spritePointerDef SPRITE_267, $0, 1, 1, 0, 0
spritePointerDef SPRITE_268, $0, 1, 1, 0, 0

SPRITEDEF_MARIA_FADE:
spritePointerDef SPRITE_269, $E0, 1, 1, 0, 0
;copy?
spritePointerDef SPRITE_269, $E0, 1, 1, 0, 0
;frame2
spritePointerDef SPRITE_26B, $E0, 1, 1, 0, 0
;copy?
spritePointerDef SPRITE_26B, $E0, 1, 1, 0, 0
;frame3
spritePointerDef SPRITE_26D, $E0, 1, 1, 0, 0
;copy?
spritePointerDef SPRITE_26D, $E0, 1, 1, 0, 0
;frame4
spritePointerDef SPRITE_26F, $E0, 1, 1, 0, 0
;copy?
spritePointerDef SPRITE_26F, $E0, 1, 1, 0, 0

SPRITEDEF_GRAVESTONE:
.ifdef VER_JP
spritePointerDef SPRITE_142, $A8, 1, 1, 0, 0
.else
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0
.endif

SPRITEDEF_DRAGONLEFT:
spritePointerDef SPRITE_60, $EC, 1, 1, 0, 0
SPRITEDEF_DRAGONRIGHT: ;TODO: see if object is split or not
spritePointerDef SPRITE_60, $EE, 1, 1, 0, 0

SPRITEDEF_MAGICANT_OLDMAN:
spritePointerDef SPRITE_60, $8A, 3, 3, 0, 0

SPRITEDEF_MAGICANTIANGIRL_SHOPKEEP:
spritePointerDef SPRITE_60, $8C, 1, 1, 0, 0

SPRITEDEF_MAGICANTIAN_SHOPKEEP:
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0

SPRITEDEF_CHARSLOT7_PP_DUPE1: ;bank irrelevant
SPRITEDEF_BAG_MAN_PINK: ;characters8
spritePointerDef SPRITE_CHARUP1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 2, 2, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 2, 2, 0, 0

SPRITEDEF_CHARSLOT7_RR_DUPE1: ;bank irrelevant
SPRITEDEF_BAG_MAN_RED: ;characters8
spritePointerDef SPRITE_CHARUP1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $C8, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $C8, 1, 1, 0, 0

SPRITEDEF_MAGICANTIAN_SHOPKEEP_PINK:
spritePointerDef SPRITE_60, $8E, 2, 2, 0, 0

SPRITEDEF_MAGICANTIAN_SHOPKEEP_RED:
spritePointerDef SPRITE_60, $8E, 1, 1, 0, 0

SPRITEDEF_MAGICANTIANGIRL_SHOPKEEP_BLUE:
spritePointerDef SPRITE_60, $8C, 3, 3, 0, 0



;;;;;characters9
SPRITEDEF_TRAIN_DL:
spritePointerDef SPRITE_28A, $80, 0, 0, 0, 0

SPRITEDEF_TRAIN_DR_SHIFT:
spritePointerDef SPRITE_28B, $80, 0, 0, 0, 0

;unused?
spritePointerDef SPRITE_28A, $80, 0, 0, 0, 0

SPRITEDEF_TRAIN_L:
spritePointerDef SPRITE_28D, $80, 0, 0, 0, 0

SPRITEDEF_TRAIN_DR:
spritePointerDef SPRITE_28E, $80, 0, 0, 0, 0

SPRITEDEF_TRAIN_DL_SHIFT:
spritePointerDef SPRITE_28F, $80, 0, 0, 0, 0

;unused?
spritePointerDef SPRITE_28E, $80, 0, 0, 0, 0

SPRITEDEF_TRAIN_R:
spritePointerDef SPRITE_291, $80, 0, 0, 0, 0

SPRITEDEF_EVE_DEAD:
spritePointerDef SPRITE_292, $80, 1, 1, 0, 0

;technically characters10 but whatever
SPRITEDEF_PLATFORM:
spritePointerDef SPRITE_293, $80, 1, 0, 0, 0
;unused?
spritePointerDef SPRITE_293, $80, 1, 0, 0, 0

SPRITEDEF_FISH_RED:
spritePointerDef SPRITE_295, $80, 1, 1, 0, 0
spritePointerDef SPRITE_296, $80, 1, 1, 0, 0
spritePointerDef SPRITE_297, $80, 1, 1, 0, 0
spritePointerDef SPRITE_298, $80, 1, 1, 0, 0
spritePointerDef SPRITE_299, $80, 1, 1, 0, 0
spritePointerDef SPRITE_29A, $80, 1, 1, 0, 0
spritePointerDef SPRITE_29B, $80, 1, 1, 0, 0
spritePointerDef SPRITE_29C, $80, 1, 1, 0, 0

SPRITEDEF_FISH_GRAY:
spritePointerDef SPRITE_295, $80, 0, 0, 0, 0
spritePointerDef SPRITE_296, $80, 0, 0, 0, 0
spritePointerDef SPRITE_297, $80, 0, 0, 0, 0
spritePointerDef SPRITE_298, $80, 0, 0, 0, 0
spritePointerDef SPRITE_299, $80, 0, 0, 0, 0
spritePointerDef SPRITE_29A, $80, 0, 0, 0, 0
spritePointerDef SPRITE_29B, $80, 0, 0, 0, 0
spritePointerDef SPRITE_29C, $80, 0, 0, 0, 0

SPRITEDEF_FISH_BLUE:
spritePointerDef SPRITE_295, $80, 3, 3, 0, 0
spritePointerDef SPRITE_296, $80, 3, 3, 0, 0
spritePointerDef SPRITE_297, $80, 3, 3, 0, 0
spritePointerDef SPRITE_298, $80, 3, 3, 0, 0
spritePointerDef SPRITE_299, $80, 3, 3, 0, 0
spritePointerDef SPRITE_29A, $80, 3, 3, 0, 0
spritePointerDef SPRITE_29B, $80, 3, 3, 0, 0
spritePointerDef SPRITE_29C, $80, 3, 3, 0, 0

SPRITEDEF_CRACK:
spritePointerDef SPRITE_2AD, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2AD, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2AF, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2AF, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2B1, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2B1, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2B3, $0, 0, 0, 0, 0
spritePointerDef SPRITE_2B3, $0, 0, 0, 0, 0



;;;;;characters11
SPRITEDEF_CHARSLOT5_RR_DUPE3: ;bank irrelevant
SPRITEDEF_PILOT_VEHIC: ;characters11
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0

SPRITEDEF_PILL_BLUE:
spritePointerDef SPRITE_60, $C6, 3, 3, 0, 0
SPRITEDEF_PILL_RED:
spritePointerDef SPRITE_60, $C6, 1, 1, 1, 0

SPRITEDEF_PLANE:
spritePointerDef SPRITE_2BF, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C0, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C1, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C2, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C3, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C4, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C5, $80, 1, 1, 1, 2
spritePointerDef SPRITE_2C6, $80, 1, 1, 1, 2

SPRITEDEF_TANK:
spritePointerDef SPRITE_2C7, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2C8, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2C9, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2CA, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2CB, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2CC, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2CD, $E0, 0, 0, 0, 0
spritePointerDef SPRITE_2CE, $E0, 0, 0, 0, 0

SPRITEDEF_BOAT:
spritePointerDef SPRITE_2C7, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2C8, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2C9, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2CA, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2CB, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2CC, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2CD, $A0, 3, 3, 1, 7
spritePointerDef SPRITE_2CE, $A0, 3, 3, 1, 7


SPRITE_CHARUP1:
spriteTile $10, $20, 0, 4, 0, 0, 0, $04
spriteTile $18, $20, 0, 4, 0, 0, 0, $05
spriteTile $10, $28, 1, 4, 0, 0, 0, $12
spriteTile $18, $28, 1, 4, 0, 0, 0, $13
SPRITE_CHARUP2:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $04
spriteTile $18, $1F, 0, 4, 0, 0, 0, $05
spriteTile $10, $27, 1, 4, 0, 1, 0, $13
spriteTile $18, $27, 1, 4, 0, 1, 0, $12
SPRITE_CHARRIGHT1:
spriteTile $10, $20, 0, 4, 0, 1, 0, $07
spriteTile $18, $20, 0, 4, 0, 1, 0, $06
spriteTile $10, $28, 1, 4, 0, 1, 0, $15
spriteTile $18, $28, 1, 4, 0, 1, 0, $14
SPRITE_CHARRIGHT2:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $07
spriteTile $18, $1F, 0, 4, 0, 1, 0, $06
spriteTile $10, $27, 1, 4, 0, 1, 0, $17
spriteTile $18, $27, 1, 4, 0, 1, 0, $16
SPRITE_CHARDOWN1:
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $03
spriteTile $10, $28, 1, 4, 0, 0, 0, $10
spriteTile $18, $28, 1, 4, 0, 0, 0, $11
SPRITE_CHARDOWN2:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $02
spriteTile $18, $1F, 0, 4, 0, 0, 0, $03
spriteTile $10, $27, 1, 4, 0, 1, 0, $11
spriteTile $18, $27, 1, 4, 0, 1, 0, $10
SPRITE_CHARLEFT1:
spriteTile $10, $20, 0, 4, 0, 0, 0, $06
spriteTile $18, $20, 0, 4, 0, 0, 0, $07
spriteTile $10, $28, 1, 4, 0, 0, 0, $14
spriteTile $18, $28, 1, 4, 0, 0, 0, $15
SPRITE_CHARLEFT2:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $06
spriteTile $18, $1F, 0, 4, 0, 0, 0, $07
spriteTile $10, $27, 1, 4, 0, 0, 0, $16
spriteTile $18, $27, 1, 4, 0, 0, 0, $17
SPRITE_10:
spriteTile $10, $20, 0, 4, 0, 0, 0, $04
spriteTile $18, $20, 0, 4, 0, 0, 0, $05
spriteTile $10, $28, 1, 4, 0, 0, 0, $12
spriteTile $18, $28, 1, 4, 0, 0, 0, $13
SPRITE_11:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $04
spriteTile $18, $1F, 0, 4, 0, 0, 0, $05
spriteTile $0F, $27, 1, 4, 0, 1, 0, $13
spriteTile $17, $27, 1, 4, 0, 1, 0, $12
SPRITE_12:
spriteTile $10, $20, 0, 4, 0, 1, 0, $07
spriteTile $18, $20, 0, 4, 0, 1, 0, $06
spriteTile $10, $28, 1, 4, 0, 1, 0, $15
spriteTile $18, $28, 1, 4, 0, 1, 0, $14
SPRITE_13:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $07
spriteTile $18, $1F, 0, 4, 0, 1, 0, $06
spriteTile $10, $27, 1, 4, 0, 1, 0, $17
spriteTile $18, $27, 1, 4, 0, 1, 0, $16
SPRITE_14:
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $03
spriteTile $10, $28, 1, 4, 0, 0, 0, $10
spriteTile $18, $28, 1, 4, 0, 0, 0, $11
SPRITE_15:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $02
spriteTile $18, $1F, 0, 4, 0, 0, 0, $03
spriteTile $0F, $27, 1, 4, 0, 1, 0, $11
spriteTile $17, $27, 1, 4, 0, 1, 0, $10
SPRITE_16:
spriteTile $10, $20, 0, 4, 0, 0, 0, $06
spriteTile $18, $20, 0, 4, 0, 0, 0, $07
spriteTile $10, $28, 1, 4, 0, 0, 0, $14
spriteTile $18, $28, 1, 4, 0, 0, 0, $15
SPRITE_17:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $06
spriteTile $18, $1F, 0, 4, 0, 0, 0, $07
spriteTile $10, $27, 1, 4, 0, 0, 0, $16
spriteTile $18, $27, 1, 4, 0, 0, 0, $17
SPRITE_AA:
spriteTile $10, $20, 0, 4, 0, 0, 0, $40
spriteTile $18, $20, 0, 4, 0, 0, 0, $41
spriteTile $10, $28, 1, 4, 0, 0, 0, $28
spriteTile $18, $28, 1, 4, 0, 0, 0, $29
SPRITE_AB:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $40
spriteTile $18, $1F, 0, 4, 0, 0, 0, $41
spriteTile $10, $27, 1, 4, 0, 1, 0, $29
spriteTile $18, $27, 1, 4, 0, 1, 0, $28
SPRITE_AC:
spriteTile $10, $20, 0, 4, 0, 1, 0, $61
spriteTile $18, $20, 0, 4, 0, 1, 0, $60
spriteTile $10, $28, 1, 4, 0, 1, 0, $69
spriteTile $18, $28, 1, 4, 0, 1, 0, $68
SPRITE_AD:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $61
spriteTile $18, $1F, 0, 4, 0, 1, 0, $60
spriteTile $10, $27, 1, 4, 0, 1, 0, $49
spriteTile $18, $27, 1, 4, 0, 1, 0, $48
SPRITE_AE:
spriteTile $10, $20, 0, 4, 0, 0, 0, $20
spriteTile $18, $20, 0, 4, 0, 0, 0, $21
spriteTile $10, $28, 1, 4, 0, 0, 0, $08
spriteTile $18, $28, 1, 4, 0, 0, 0, $09
SPRITE_AF:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $20
spriteTile $18, $1F, 0, 4, 0, 0, 0, $21
spriteTile $10, $27, 1, 4, 0, 1, 0, $09
spriteTile $18, $27, 1, 4, 0, 1, 0, $08
SPRITE_B0:
spriteTile $10, $20, 0, 4, 0, 0, 0, $60
spriteTile $18, $20, 0, 4, 0, 0, 0, $61
spriteTile $10, $28, 1, 4, 0, 0, 0, $48
spriteTile $18, $28, 1, 4, 0, 0, 0, $49
SPRITE_B1:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $60
spriteTile $18, $1F, 0, 4, 0, 0, 0, $61
spriteTile $10, $27, 1, 4, 0, 0, 0, $68
spriteTile $18, $27, 1, 4, 0, 0, 0, $69
SPRITE_B2:
spriteTile $10, $20, 0, 4, 0, 0, 0, $0C
spriteTile $18, $20, 0, 4, 0, 0, 0, $0D
spriteTile $10, $28, 1, 4, 0, 0, 0, $12
spriteTile $18, $28, 1, 4, 0, 0, 0, $13
SPRITE_B3:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $0C
spriteTile $18, $1F, 0, 4, 0, 0, 0, $0D
spriteTile $10, $27, 1, 4, 0, 1, 0, $13
spriteTile $18, $27, 1, 4, 0, 1, 0, $12
SPRITE_B4:
spriteTile $10, $20, 0, 4, 0, 1, 0, $0F
spriteTile $18, $20, 0, 4, 0, 1, 0, $0E
spriteTile $10, $28, 1, 4, 0, 1, 0, $15
spriteTile $18, $28, 1, 4, 0, 1, 0, $14
SPRITE_B5:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $0F
spriteTile $18, $1F, 0, 4, 0, 1, 0, $0E
spriteTile $10, $27, 1, 4, 0, 1, 0, $17
spriteTile $18, $27, 1, 4, 0, 1, 0, $16
SPRITE_B6:
spriteTile $10, $20, 0, 4, 0, 0, 0, $0A
spriteTile $18, $20, 0, 4, 0, 0, 0, $0B
spriteTile $10, $28, 1, 4, 0, 0, 0, $10
spriteTile $18, $28, 1, 4, 0, 0, 0, $11
SPRITE_B7:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $0A
spriteTile $18, $1F, 0, 4, 0, 0, 0, $0B
spriteTile $10, $27, 1, 4, 0, 1, 0, $11
spriteTile $18, $27, 1, 4, 0, 1, 0, $10
SPRITE_B8:
spriteTile $10, $20, 0, 4, 0, 0, 0, $0E
spriteTile $18, $20, 0, 4, 0, 0, 0, $0F
spriteTile $10, $28, 1, 4, 0, 0, 0, $14
spriteTile $18, $28, 1, 4, 0, 0, 0, $15
SPRITE_B9:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $0E
spriteTile $18, $1F, 0, 4, 0, 0, 0, $0F
spriteTile $10, $27, 1, 4, 0, 0, 0, $16
spriteTile $18, $27, 1, 4, 0, 0, 0, $17
SPRITE_BA:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2C
spriteTile $18, $20, 0, 4, 0, 0, 0, $2D
spriteTile $10, $28, 1, 4, 0, 0, 0, $12
spriteTile $18, $28, 1, 4, 0, 0, 0, $13
SPRITE_BB:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $2C
spriteTile $18, $1F, 0, 4, 0, 0, 0, $2D
spriteTile $10, $27, 1, 4, 0, 1, 0, $13
spriteTile $18, $27, 1, 4, 0, 1, 0, $12
SPRITE_BC:
spriteTile $10, $20, 0, 4, 0, 1, 0, $2F
spriteTile $18, $20, 0, 4, 0, 1, 0, $2E
spriteTile $10, $28, 1, 4, 0, 1, 0, $15
spriteTile $18, $28, 1, 4, 0, 1, 0, $14
SPRITE_BD:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $2F
spriteTile $18, $1F, 0, 4, 0, 1, 0, $2E
spriteTile $10, $27, 1, 4, 0, 1, 0, $17
spriteTile $18, $27, 1, 4, 0, 1, 0, $16
SPRITE_BE:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2A
spriteTile $18, $20, 0, 4, 0, 0, 0, $2B
spriteTile $10, $28, 1, 4, 0, 0, 0, $10
spriteTile $18, $28, 1, 4, 0, 0, 0, $11
SPRITE_BF:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $2A
spriteTile $18, $1F, 0, 4, 0, 0, 0, $2B
spriteTile $10, $27, 1, 4, 0, 1, 0, $11
spriteTile $18, $27, 1, 4, 0, 1, 0, $10
SPRITE_C0:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2E
spriteTile $18, $20, 0, 4, 0, 0, 0, $2F
spriteTile $10, $28, 1, 4, 0, 0, 0, $14
spriteTile $18, $28, 1, 4, 0, 0, 0, $15
SPRITE_C1:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $2E
spriteTile $18, $1F, 0, 4, 0, 0, 0, $2F
spriteTile $10, $27, 1, 4, 0, 0, 0, $16
spriteTile $18, $27, 1, 4, 0, 0, 0, $17
SPRITE_18:
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $03
spriteTile $10, $28, 1, 4, 0, 0, 0, $14
spriteTile $18, $28, 1, 4, 0, 0, 0, $15
SPRITE_19:
spriteTile $0F, $20, 0, 4, 0, 1, 0, $03
spriteTile $17, $20, 0, 4, 0, 1, 0, $02
spriteTile $0F, $28, 1, 4, 0, 1, 0, $15
spriteTile $17, $28, 1, 4, 0, 1, 0, $14
SPRITE_1A:
spriteTile $10, $1F, 0, 4, 0, 1, 0, $05
spriteTile $18, $1F, 0, 4, 0, 1, 0, $04
spriteTile $10, $27, 1, 4, 0, 1, 0, $17
spriteTile $18, $27, 1, 4, 0, 1, 0, $16
SPRITE_1B:
spriteTile $10, $20, 0, 4, 0, 1, 0, $05
spriteTile $18, $20, 0, 4, 0, 1, 0, $04
spriteTile $10, $28, 1, 4, 0, 1, 0, $07
spriteTile $18, $28, 1, 4, 0, 1, 0, $06
SPRITE_1C:
spriteTile $11, $1F, 0, 4, 0, 0, 0, $00
spriteTile $19, $1F, 0, 4, 0, 0, 0, $01
spriteTile $11, $27, 1, 4, 0, 0, 0, $10
spriteTile $19, $27, 1, 4, 0, 0, 0, $11
SPRITE_1D:
spriteTile $0F, $1F, 0, 4, 0, 1, 0, $01
spriteTile $17, $1F, 0, 4, 0, 1, 0, $00
spriteTile $0F, $27, 1, 4, 0, 0, 0, $12
spriteTile $17, $27, 1, 4, 0, 0, 0, $13
SPRITE_1E:
spriteTile $10, $1F, 0, 4, 0, 0, 0, $04
spriteTile $18, $1F, 0, 4, 0, 0, 0, $05
spriteTile $10, $27, 1, 4, 0, 0, 0, $16
spriteTile $18, $27, 1, 4, 0, 0, 0, $17
SPRITE_1F:
spriteTile $10, $20, 0, 4, 0, 0, 0, $04
spriteTile $18, $20, 0, 4, 0, 0, 0, $05
spriteTile $10, $28, 1, 4, 0, 0, 0, $06
spriteTile $18, $28, 1, 4, 0, 0, 0, $07
SPRITE_193:
spriteTile $14, $20, 0, 4, 0, 0, 0, $08
spriteTile $14, $28, 0, 4, 0, 0, 0, $20
SPRITE_194:
spriteTile $14, $1F, 0, 4, 0, 1, 0, $08
spriteTile $14, $27, 0, 4, 0, 1, 0, $20
SPRITE_195:
spriteTile $14, $20, 0, 4, 0, 0, 0, $09
spriteTile $14, $28, 0, 4, 0, 1, 0, $21
SPRITE_196:
spriteTile $14, $1F, 0, 4, 0, 1, 0, $09
spriteTile $14, $27, 0, 4, 0, 1, 0, $21
SPRITE_197:
spriteTile $14, $20, 0, 4, 0, 0, 0, $08
spriteTile $14, $28, 0, 4, 0, 0, 0, $01
SPRITE_198:
spriteTile $14, $1F, 0, 4, 0, 1, 0, $08
spriteTile $14, $27, 0, 4, 0, 1, 0, $01
SPRITE_199:
spriteTile $14, $20, 0, 4, 0, 1, 0, $09
spriteTile $14, $28, 0, 4, 0, 0, 0, $21
SPRITE_19A:
spriteTile $14, $1F, 0, 4, 0, 0, 0, $09
spriteTile $14, $27, 0, 4, 0, 0, 0, $21
SPRITE_263:
spriteTile $14, $24, 0, 4, 0, 0, 0, $81
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
SPRITE_60:
spriteTile $10, $20, 0, 4, 0, 0, 0, $00
spriteTile $18, $20, 0, 4, 0, 0, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $10
spriteTile $18, $28, 0, 4, 0, 0, 0, $11
spriteTile $11, $21, 0, 4, 0, 0, 0, $00
spriteTile $19, $21, 0, 4, 0, 0, 0, $01
spriteTile $11, $29, 0, 4, 0, 0, 0, $10
spriteTile $19, $29, 0, 4, 0, 0, 0, $11
SPRITE_142:
spriteTile $10, $20, 0, 4, 0, 0, 0, $00
spriteTile $18, $20, 0, 4, 0, 0, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $20
spriteTile $18, $28, 0, 4, 0, 0, 0, $21
SPRITE_66:
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $01
SPRITE_67:
spriteTile $10, $28, 0, 4, 0, 0, 0, $01
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_68:
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 1, 0, $00
SPRITE_69:
spriteTile $10, $28, 0, 4, 0, 0, 0, $01
spriteTile $18, $28, 0, 4, 0, 1, 0, $01
SPRITE_269:
spriteTile $10, $20, 0, 4, 0, 0, 0, $00
spriteTile $18, $20, 0, 4, 0, 0, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $10
spriteTile $18, $28, 0, 4, 0, 0, 0, $11
SPRITE_26B:
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $03
spriteTile $10, $28, 0, 4, 0, 0, 0, $12
spriteTile $18, $28, 0, 4, 0, 0, 0, $13
SPRITE_26D:
spriteTile $10, $20, 0, 4, 0, 0, 0, $04
spriteTile $18, $20, 0, 4, 0, 0, 0, $05
spriteTile $10, $28, 0, 4, 0, 0, 0, $14
spriteTile $18, $28, 0, 4, 0, 0, 0, $15
SPRITE_26F:
spriteTile $10, $20, 0, 4, 0, 0, 0, $06
spriteTile $18, $20, 0, 4, 0, 0, 0, $07
spriteTile $10, $28, 0, 4, 0, 0, 0, $16
spriteTile $18, $28, 0, 4, 0, 0, 0, $17
SPRITE_265:
spriteTile $10, $20, 0, 4, 0, 0, 0, $C0
spriteTile $18, $20, 0, 4, 0, 1, 0, $C0
spriteTile $10, $28, 0, 4, 0, 0, 0, $C1
spriteTile $18, $28, 0, 4, 0, 1, 0, $C1
spriteTile $11, $20, 0, 4, 0, 0, 0, $C0
spriteTile $19, $20, 0, 4, 0, 1, 0, $C0
spriteTile $11, $28, 0, 4, 0, 0, 0, $C1
spriteTile $19, $28, 0, 4, 0, 1, 0, $C1
SPRITE_267:
spriteTile $14, $30, 0, 4, 0, 0, 0, $A0
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
SPRITE_268:
spriteTile $14, $30, 0, 4, 0, 0, 0, $A1
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
SPRITE_1DF:
spriteTile $08, $28, 0, 4, 0, 0, 0, $6C
spriteTile $10, $28, 0, 4, 0, 0, 0, $6D
spriteTile $18, $28, 0, 4, 0, 0, 0, $6E
spriteTile $20, $28, 0, 4, 0, 0, 0, $6F
spriteTile $08, $30, 0, 4, 0, 0, 0, $7C
spriteTile $10, $30, 0, 4, 0, 0, 0, $7D
spriteTile $18, $30, 0, 4, 0, 0, 0, $7E
spriteTile $20, $30, 0, 4, 0, 0, 0, $7F
SPRITE_17A:
spriteTile $10, $08, 0, 4, 0, 0, 0, $04
spriteTile $18, $08, 0, 4, 0, 0, 0, $05
spriteTile $10, $10, 0, 4, 0, 0, 0, $14
spriteTile $18, $10, 0, 4, 0, 0, 0, $15
spriteTile $10, $18, 0, 4, 0, 0, 0, $02
spriteTile $18, $18, 0, 4, 0, 0, 0, $03
spriteTile $10, $20, 0, 4, 0, 0, 0, $12
spriteTile $18, $20, 0, 4, 0, 0, 0, $13
spriteTile $10, $28, 0, 4, 0, 0, 0, $10
spriteTile $18, $28, 0, 4, 0, 0, 0, $11
SPRITE_28A:
spriteTile $10, $1C, 0, 4, 0, 0, 0, $2A
spriteTile $18, $1C, 0, 4, 0, 0, 0, $2B
spriteTile $20, $1C, 0, 4, 0, 0, 0, $2C
spriteTile $10, $24, 0, 4, 0, 0, 0, $17
spriteTile $18, $24, 0, 4, 0, 0, 0, $18
spriteTile $20, $24, 0, 4, 0, 0, 0, $19
spriteTile $10, $2C, 0, 4, 0, 0, 0, $27
spriteTile $18, $2C, 0, 4, 0, 0, 0, $28
spriteTile $20, $2C, 0, 4, 0, 0, 0, $29
SPRITE_28B:
spriteTile $08, $1C, 0, 4, 0, 1, 0, $2C
spriteTile $10, $1C, 0, 4, 0, 1, 0, $2B
spriteTile $18, $1C, 0, 4, 0, 1, 0, $2A
spriteTile $08, $24, 0, 4, 0, 1, 0, $19
spriteTile $10, $24, 0, 4, 0, 1, 0, $18
spriteTile $18, $24, 0, 4, 0, 1, 0, $17
spriteTile $08, $2C, 0, 4, 0, 1, 0, $29
spriteTile $10, $2C, 0, 4, 0, 1, 0, $28
spriteTile $18, $2C, 0, 4, 0, 1, 0, $27
SPRITE_28F:
spriteTile $08, $24, 0, 4, 0, 0, 0, $2A
spriteTile $10, $24, 0, 4, 0, 0, 0, $2B
spriteTile $18, $24, 0, 4, 0, 0, 0, $2C
spriteTile $08, $2C, 0, 4, 0, 0, 0, $17
spriteTile $10, $2C, 0, 4, 0, 0, 0, $18
spriteTile $18, $2C, 0, 4, 0, 0, 0, $19
spriteTile $08, $34, 0, 4, 0, 0, 0, $25
spriteTile $10, $34, 0, 4, 0, 0, 0, $26
spriteTile $18, $34, 0, 4, 0, 0, 0, $29
SPRITE_28E:
spriteTile $10, $24, 0, 4, 0, 1, 0, $2C
spriteTile $18, $24, 0, 4, 0, 1, 0, $2B
spriteTile $20, $24, 0, 4, 0, 1, 0, $2A
spriteTile $10, $2C, 0, 4, 0, 1, 0, $19
spriteTile $18, $2C, 0, 4, 0, 1, 0, $18
spriteTile $20, $2C, 0, 4, 0, 1, 0, $17
spriteTile $10, $34, 0, 4, 0, 1, 0, $29
spriteTile $18, $34, 0, 4, 0, 1, 0, $26
spriteTile $20, $34, 0, 4, 0, 1, 0, $25
SPRITE_28D:
spriteTile $08, $20, 0, 4, 0, 0, 0, $1A
spriteTile $10, $20, 0, 4, 0, 0, 0, $1B
spriteTile $18, $20, 0, 4, 0, 0, 0, $1C
spriteTile $08, $28, 0, 4, 0, 0, 0, $1D
spriteTile $10, $28, 0, 4, 0, 0, 0, $1E
spriteTile $18, $28, 0, 4, 0, 0, 0, $1F
spriteTile $08, $30, 0, 4, 0, 0, 0, $2D
spriteTile $10, $30, 0, 4, 0, 0, 0, $2E
spriteTile $18, $30, 0, 4, 0, 0, 0, $2F
SPRITE_291:
spriteTile $10, $20, 0, 4, 0, 1, 0, $1C
spriteTile $18, $20, 0, 4, 0, 1, 0, $1B
spriteTile $20, $20, 0, 4, 0, 1, 0, $1A
spriteTile $10, $28, 0, 4, 0, 1, 0, $1F
spriteTile $18, $28, 0, 4, 0, 1, 0, $1E
spriteTile $20, $28, 0, 4, 0, 1, 0, $1D
spriteTile $10, $30, 0, 4, 0, 1, 0, $2F
spriteTile $18, $30, 0, 4, 0, 1, 0, $2E
spriteTile $20, $30, 0, 4, 0, 1, 0, $2D
SPRITE_2C7:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $05
spriteTile $14, $18, 0, 4, 0, 0, 0, $06
spriteTile $1C, $18, 0, 4, 0, 0, 0, $07
spriteTile $0C, $20, 0, 4, 0, 0, 0, $16
spriteTile $14, $20, 0, 4, 0, 0, 0, $17
spriteTile $1C, $20, 0, 4, 0, 0, 0, $18
spriteTile $0C, $28, 0, 4, 0, 0, 0, $19
spriteTile $14, $28, 0, 4, 0, 0, 0, $1A
spriteTile $1C, $28, 0, 4, 0, 1, 0, $19
SPRITE_2C8:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $05
spriteTile $14, $18, 0, 4, 0, 0, 0, $06
spriteTile $1C, $18, 0, 4, 0, 0, 0, $07
spriteTile $0C, $20, 0, 4, 0, 0, 0, $16
spriteTile $14, $20, 0, 4, 0, 0, 0, $17
spriteTile $1C, $20, 0, 4, 0, 0, 0, $18
spriteTile $0C, $28, 0, 4, 0, 1, 0, $1B
spriteTile $14, $28, 0, 4, 0, 0, 0, $1A
spriteTile $1C, $28, 0, 4, 0, 0, 0, $1B
SPRITE_2C9:
spriteTile $0C, $18, 0, 4, 0, 1, 0, $0A
spriteTile $14, $18, 0, 4, 0, 1, 0, $09
spriteTile $1C, $18, 0, 4, 0, 1, 0, $08
spriteTile $0C, $20, 0, 4, 0, 1, 0, $0F
spriteTile $14, $20, 0, 4, 0, 1, 0, $0E
spriteTile $1C, $20, 0, 4, 0, 1, 0, $0D
spriteTile $0C, $28, 0, 4, 0, 1, 0, $1C
spriteTile $14, $28, 0, 4, 0, 1, 0, $0C
spriteTile $1C, $28, 0, 4, 0, 1, 0, $0B
SPRITE_2CA:
spriteTile $0C, $18, 0, 4, 0, 1, 0, $0A
spriteTile $14, $18, 0, 4, 0, 1, 0, $09
spriteTile $1C, $18, 0, 4, 0, 1, 0, $08
spriteTile $0C, $20, 0, 4, 0, 1, 0, $0F
spriteTile $14, $20, 0, 4, 0, 1, 0, $0E
spriteTile $1C, $20, 0, 4, 0, 1, 0, $0D
spriteTile $0C, $28, 0, 4, 0, 1, 0, $1F
spriteTile $14, $28, 0, 4, 0, 1, 0, $1E
spriteTile $1C, $28, 0, 4, 0, 1, 0, $1D
SPRITE_2CB:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $02
spriteTile $14, $18, 0, 4, 0, 0, 0, $03
spriteTile $1C, $18, 0, 4, 0, 0, 0, $04
spriteTile $0C, $20, 0, 4, 0, 0, 0, $10
spriteTile $14, $20, 0, 4, 0, 0, 0, $11
spriteTile $1C, $20, 0, 4, 0, 0, 0, $12
spriteTile $0C, $28, 0, 4, 0, 0, 0, $13
spriteTile $14, $28, 0, 4, 0, 0, 0, $14
spriteTile $1C, $28, 0, 4, 0, 1, 0, $13
SPRITE_2CC:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $02
spriteTile $14, $18, 0, 4, 0, 0, 0, $03
spriteTile $1C, $18, 0, 4, 0, 0, 0, $04
spriteTile $0C, $20, 0, 4, 0, 0, 0, $10
spriteTile $14, $20, 0, 4, 0, 0, 0, $11
spriteTile $1C, $20, 0, 4, 0, 0, 0, $12
spriteTile $0C, $28, 0, 4, 0, 1, 0, $15
spriteTile $14, $28, 0, 4, 0, 0, 0, $14
spriteTile $1C, $28, 0, 4, 0, 0, 0, $15
SPRITE_2CD:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $08
spriteTile $14, $18, 0, 4, 0, 0, 0, $09
spriteTile $1C, $18, 0, 4, 0, 0, 0, $0A
spriteTile $0C, $20, 0, 4, 0, 0, 0, $0D
spriteTile $14, $20, 0, 4, 0, 0, 0, $0E
spriteTile $1C, $20, 0, 4, 0, 0, 0, $0F
spriteTile $0C, $28, 0, 4, 0, 0, 0, $1D
spriteTile $14, $28, 0, 4, 0, 0, 0, $1E
spriteTile $1C, $28, 0, 4, 0, 0, 0, $1F
SPRITE_2CE:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $08
spriteTile $14, $18, 0, 4, 0, 0, 0, $09
spriteTile $1C, $18, 0, 4, 0, 0, 0, $0A
spriteTile $0C, $20, 0, 4, 0, 0, 0, $0D
spriteTile $14, $20, 0, 4, 0, 0, 0, $0E
spriteTile $1C, $20, 0, 4, 0, 0, 0, $0F
spriteTile $0C, $28, 0, 4, 0, 0, 0, $0B
spriteTile $14, $28, 0, 4, 0, 0, 0, $0C
spriteTile $1C, $28, 0, 4, 0, 0, 0, $1C
SPRITE_2BF:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $4C
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $4D
spriteTile $14, $20, 0, 4, 0, 0, 0, $4E
spriteTile $1C, $20, 0, 4, 0, 0, 0, $4F
spriteTile $0C, $28, 0, 4, 0, 0, 0, $5D
spriteTile $14, $28, 0, 4, 0, 0, 0, $5E
spriteTile $1C, $28, 0, 4, 0, 0, 0, $5F
SPRITE_2C0:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $5C
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $4D
spriteTile $14, $20, 0, 4, 0, 0, 0, $4E
spriteTile $1C, $20, 0, 4, 0, 0, 0, $4F
spriteTile $0C, $28, 0, 4, 0, 0, 0, $5D
spriteTile $14, $28, 0, 4, 0, 0, 0, $5E
spriteTile $1C, $28, 0, 4, 0, 0, 0, $5F
SPRITE_2C1:
spriteTile $0C, $18, 0, 4, 0, 1, 0, $00
spriteTile $14, $18, 0, 4, 0, 1, 0, $51
spriteTile $1C, $18, 0, 4, 0, 1, 0, $50
spriteTile $0C, $20, 0, 4, 0, 1, 0, $45
spriteTile $14, $20, 0, 4, 0, 1, 0, $44
spriteTile $1C, $20, 0, 4, 0, 1, 0, $43
spriteTile $0C, $28, 0, 4, 0, 1, 0, $55
spriteTile $14, $28, 0, 4, 0, 1, 0, $54
spriteTile $1C, $28, 0, 4, 0, 1, 0, $53
SPRITE_2C2:
spriteTile $0C, $18, 0, 4, 0, 1, 0, $00
spriteTile $14, $18, 0, 4, 0, 1, 0, $51
spriteTile $1C, $18, 0, 4, 0, 1, 0, $50
spriteTile $0C, $20, 0, 4, 0, 1, 0, $45
spriteTile $14, $20, 0, 4, 0, 1, 0, $44
spriteTile $1C, $20, 0, 4, 0, 1, 0, $42
spriteTile $0C, $28, 0, 4, 0, 1, 0, $55
spriteTile $14, $28, 0, 4, 0, 1, 0, $54
spriteTile $1C, $28, 0, 4, 0, 1, 0, $52
SPRITE_2C3:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $48
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $49
spriteTile $14, $20, 0, 4, 0, 0, 0, $4A
spriteTile $1C, $20, 0, 4, 0, 0, 0, $4B
spriteTile $0C, $28, 0, 4, 0, 0, 0, $59
spriteTile $14, $28, 0, 4, 0, 0, 0, $5A
spriteTile $1C, $28, 0, 4, 0, 0, 0, $5B
SPRITE_2C4:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $48
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $49
spriteTile $14, $20, 0, 4, 0, 0, 0, $4A
spriteTile $1C, $20, 0, 4, 0, 0, 0, $4B
spriteTile $0C, $28, 0, 4, 0, 0, 0, $59
spriteTile $14, $28, 0, 4, 0, 0, 0, $58
spriteTile $1C, $28, 0, 4, 0, 0, 0, $5B
SPRITE_2C5:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $50
spriteTile $14, $18, 0, 4, 0, 0, 0, $51
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $43
spriteTile $14, $20, 0, 4, 0, 0, 0, $44
spriteTile $1C, $20, 0, 4, 0, 0, 0, $45
spriteTile $0C, $28, 0, 4, 0, 0, 0, $53
spriteTile $14, $28, 0, 4, 0, 0, 0, $54
spriteTile $1C, $28, 0, 4, 0, 0, 0, $55
SPRITE_2C6:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $50
spriteTile $14, $18, 0, 4, 0, 0, 0, $51
spriteTile $1C, $18, 0, 4, 0, 0, 0, $00
spriteTile $0C, $20, 0, 4, 0, 0, 0, $42
spriteTile $14, $20, 0, 4, 0, 0, 0, $44
spriteTile $1C, $20, 0, 4, 0, 0, 0, $45
spriteTile $0C, $28, 0, 4, 0, 0, 0, $52
spriteTile $14, $28, 0, 4, 0, 0, 0, $54
spriteTile $1C, $28, 0, 4, 0, 0, 0, $55
SPRITE_154:
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $01
spriteTile $10, $30, 0, 4, 0, 0, 0, $10
spriteTile $18, $30, 0, 4, 0, 0, 0, $11
SPRITE_155:
spriteTile $10, $29, 0, 4, 0, 0, 0, $00
spriteTile $18, $29, 0, 4, 0, 0, 0, $01
spriteTile $10, $31, 0, 4, 0, 0, 0, $10
spriteTile $18, $31, 0, 4, 0, 0, 0, $11
SPRITE_292:
spriteTile $10, $20, 0, 4, 0, 0, 0, $10
spriteTile $18, $20, 0, 4, 0, 0, 0, $11
spriteTile $20, $20, 0, 4, 0, 0, 0, $12
spriteTile $28, $20, 0, 4, 0, 0, 0, $13
spriteTile $30, $20, 0, 4, 0, 0, 0, $14
spriteTile $10, $28, 0, 4, 0, 0, 0, $20
spriteTile $18, $28, 0, 4, 0, 0, 0, $21
spriteTile $20, $28, 0, 4, 0, 0, 0, $22
spriteTile $28, $28, 0, 4, 0, 0, 0, $23
spriteTile $30, $28, 0, 4, 0, 0, 0, $24
SPRITE_58:
spriteTile $10, $08, 0, 4, 0, 0, 0, $30
spriteTile $18, $08, 0, 4, 0, 0, 0, $31
spriteTile $10, $10, 0, 4, 0, 0, 0, $40
spriteTile $18, $10, 0, 4, 0, 0, 0, $41
spriteTile $10, $18, 0, 4, 0, 0, 0, $50
spriteTile $18, $18, 0, 4, 0, 0, 0, $51
spriteTile $10, $20, 0, 4, 0, 0, 0, $60
spriteTile $18, $20, 0, 4, 0, 0, 0, $61
spriteTile $10, $28, 0, 4, 0, 0, 0, $70
spriteTile $18, $28, 0, 4, 0, 0, 0, $71
SPRITE_28:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4C
spriteTile $18, $20, 0, 4, 0, 1, 0, $4C
spriteTile $10, $28, 0, 4, 0, 0, 0, $5C
spriteTile $18, $28, 0, 4, 0, 1, 0, $5C
SPRITE_29:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4C
spriteTile $18, $20, 0, 4, 0, 1, 0, $4C
spriteTile $10, $28, 0, 4, 0, 0, 0, $5C
spriteTile $18, $28, 0, 4, 0, 1, 0, $5C
SPRITE_2A:
spriteTile $10, $20, 0, 4, 0, 1, 0, $4F
spriteTile $18, $20, 0, 4, 0, 1, 0, $4E
spriteTile $10, $28, 0, 4, 0, 1, 0, $5F
spriteTile $18, $28, 0, 4, 0, 1, 0, $5E
SPRITE_2B:
spriteTile $10, $20, 0, 4, 0, 1, 0, $4F
spriteTile $18, $20, 0, 4, 0, 1, 0, $4E
spriteTile $10, $28, 0, 4, 0, 1, 0, $5F
spriteTile $18, $28, 0, 4, 0, 1, 0, $5E
SPRITE_2C:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4A
spriteTile $18, $20, 0, 4, 0, 0, 0, $4B
spriteTile $10, $28, 0, 4, 0, 0, 0, $5A
spriteTile $18, $28, 0, 4, 0, 0, 0, $5B
SPRITE_2D:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4A
spriteTile $18, $20, 0, 4, 0, 0, 0, $4B
spriteTile $10, $28, 0, 4, 0, 0, 0, $5A
spriteTile $18, $28, 0, 4, 0, 0, 0, $5B
SPRITE_2E:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4E
spriteTile $18, $20, 0, 4, 0, 0, 0, $4F
spriteTile $10, $28, 0, 4, 0, 0, 0, $5E
spriteTile $18, $28, 0, 4, 0, 0, 0, $5F
SPRITE_2F:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4E
spriteTile $18, $20, 0, 4, 0, 0, 0, $4F
spriteTile $10, $28, 0, 4, 0, 0, 0, $5E
spriteTile $18, $28, 0, 4, 0, 0, 0, $5F
SPRITE_30:
spriteTile $10, $20, 0, 4, 0, 0, 0, $5D
spriteTile $18, $20, 0, 4, 0, 1, 0, $5D
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_31:
spriteTile $10, $20, 0, 4, 0, 0, 0, $5D
spriteTile $18, $20, 0, 4, 0, 1, 0, $5D
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_32:
spriteTile $10, $20, 0, 4, 0, 1, 0, $39
spriteTile $18, $20, 0, 4, 0, 1, 0, $38
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_33:
spriteTile $10, $20, 0, 4, 0, 1, 0, $39
spriteTile $18, $20, 0, 4, 0, 1, 0, $38
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_34:
spriteTile $10, $20, 0, 4, 0, 0, 0, $21
spriteTile $18, $20, 0, 4, 0, 1, 0, $21
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_35:
spriteTile $10, $20, 0, 4, 0, 0, 0, $21
spriteTile $18, $20, 0, 4, 0, 1, 0, $21
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_36:
spriteTile $10, $20, 0, 4, 0, 0, 0, $38
spriteTile $18, $20, 0, 4, 0, 0, 0, $39
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_37:
spriteTile $10, $20, 0, 4, 0, 0, 0, $38
spriteTile $18, $20, 0, 4, 0, 0, 0, $39
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_38:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4C
spriteTile $18, $20, 0, 4, 0, 1, 0, $4C
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_39:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4C
spriteTile $18, $20, 0, 4, 0, 1, 0, $4C
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_3A:
spriteTile $10, $20, 0, 4, 0, 1, 0, $49
spriteTile $18, $20, 0, 4, 0, 1, 0, $48
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_3B:
spriteTile $10, $20, 0, 4, 0, 1, 0, $49
spriteTile $18, $20, 0, 4, 0, 1, 0, $48
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_3C:
spriteTile $10, $20, 0, 4, 0, 0, 0, $20
spriteTile $18, $20, 0, 4, 0, 1, 0, $20
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_3D:
spriteTile $10, $20, 0, 4, 0, 0, 0, $20
spriteTile $18, $20, 0, 4, 0, 1, 0, $20
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_3E:
spriteTile $10, $20, 0, 4, 0, 0, 0, $48
spriteTile $18, $20, 0, 4, 0, 0, 0, $49
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_3F:
spriteTile $10, $20, 0, 4, 0, 0, 0, $48
spriteTile $18, $20, 0, 4, 0, 0, 0, $49
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_40:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2E
spriteTile $18, $20, 0, 4, 0, 1, 0, $2E
spriteTile $10, $28, 0, 4, 0, 0, 0, $09
spriteTile $18, $28, 0, 4, 0, 1, 0, $09
SPRITE_41:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2E
spriteTile $18, $20, 0, 4, 0, 1, 0, $2E
spriteTile $10, $28, 0, 4, 0, 0, 0, $09
spriteTile $18, $28, 0, 4, 0, 1, 0, $09
SPRITE_42:
spriteTile $10, $20, 0, 4, 0, 1, 0, $2D
spriteTile $18, $20, 0, 4, 0, 1, 0, $2C
spriteTile $10, $28, 0, 4, 0, 1, 0, $3D
spriteTile $18, $28, 0, 4, 0, 1, 0, $3C
SPRITE_43:
spriteTile $10, $20, 0, 4, 0, 1, 0, $2D
spriteTile $18, $20, 0, 4, 0, 1, 0, $2C
spriteTile $10, $28, 0, 4, 0, 1, 0, $3D
spriteTile $18, $28, 0, 4, 0, 1, 0, $3C
SPRITE_44:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2A
spriteTile $18, $20, 0, 4, 0, 1, 0, $2A
spriteTile $10, $28, 0, 4, 0, 0, 0, $08
spriteTile $18, $28, 0, 4, 0, 1, 0, $08
SPRITE_45:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2A
spriteTile $18, $20, 0, 4, 0, 1, 0, $2A
spriteTile $10, $28, 0, 4, 0, 0, 0, $08
spriteTile $18, $28, 0, 4, 0, 1, 0, $08
SPRITE_46:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2C
spriteTile $18, $20, 0, 4, 0, 0, 0, $2D
spriteTile $10, $28, 0, 4, 0, 0, 0, $3C
spriteTile $18, $28, 0, 4, 0, 0, 0, $3D
SPRITE_47:
spriteTile $10, $20, 0, 4, 0, 0, 0, $2C
spriteTile $18, $20, 0, 4, 0, 0, 0, $2D
spriteTile $10, $28, 0, 4, 0, 0, 0, $3C
spriteTile $18, $28, 0, 4, 0, 0, 0, $3D
SPRITE_48:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4D
spriteTile $18, $20, 0, 4, 0, 1, 0, $4D
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_49:
spriteTile $10, $20, 0, 4, 0, 0, 0, $4D
spriteTile $18, $20, 0, 4, 0, 1, 0, $4D
spriteTile $10, $28, 0, 4, 0, 0, 0, $2F
spriteTile $18, $28, 0, 4, 0, 1, 0, $2F
SPRITE_4A:
spriteTile $10, $20, 0, 4, 0, 1, 0, $29
spriteTile $18, $20, 0, 4, 0, 1, 0, $28
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_4B:
spriteTile $10, $20, 0, 4, 0, 1, 0, $29
spriteTile $18, $20, 0, 4, 0, 1, 0, $28
spriteTile $10, $28, 0, 4, 0, 1, 0, $59
spriteTile $18, $28, 0, 4, 0, 1, 0, $58
SPRITE_4C:
spriteTile $10, $20, 0, 4, 0, 0, 0, $41
spriteTile $18, $20, 0, 4, 0, 1, 0, $41
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_4D:
spriteTile $10, $20, 0, 4, 0, 0, 0, $41
spriteTile $18, $20, 0, 4, 0, 1, 0, $41
spriteTile $10, $28, 0, 4, 0, 0, 0, $40
spriteTile $18, $28, 0, 4, 0, 1, 0, $40
SPRITE_4E:
spriteTile $10, $20, 0, 4, 0, 0, 0, $28
spriteTile $18, $20, 0, 4, 0, 0, 0, $29
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_4F:
spriteTile $10, $20, 0, 4, 0, 0, 0, $28
spriteTile $18, $20, 0, 4, 0, 0, 0, $29
spriteTile $10, $28, 0, 4, 0, 0, 0, $58
spriteTile $18, $28, 0, 4, 0, 0, 0, $59
SPRITE_293:
spriteTile $0C, $20, 0, 4, 0, 0, 0, $0D
spriteTile $14, $20, 0, 4, 0, 0, 0, $0E
spriteTile $1C, $20, 0, 4, 0, 0, 0, $0F
spriteTile $0C, $28, 0, 4, 0, 0, 0, $1D
spriteTile $14, $28, 0, 4, 0, 0, 0, $1E
spriteTile $1C, $28, 0, 4, 0, 0, 0, $1F
spriteTile $0C, $30, 0, 4, 0, 0, 0, $2D
spriteTile $14, $30, 0, 4, 0, 0, 0, $2E
spriteTile $1C, $30, 0, 4, 0, 0, 0, $2F
SPRITE_295:
spriteTile $10, $20, 0, 4, 0, 0, 0, $01
spriteTile $18, $20, 0, 4, 0, 0, 0, $02
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_296:
spriteTile $10, $20, 0, 4, 0, 0, 0, $03
spriteTile $18, $20, 0, 4, 0, 0, 0, $04
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_297:
spriteTile $10, $20, 0, 4, 0, 1, 0, $02
spriteTile $18, $20, 0, 4, 0, 1, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_298:
spriteTile $10, $20, 0, 4, 0, 1, 0, $04
spriteTile $18, $20, 0, 4, 0, 1, 0, $03
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_299:
spriteTile $10, $20, 0, 4, 0, 1, 0, $02
spriteTile $18, $20, 0, 4, 0, 1, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_29A:
spriteTile $10, $20, 0, 4, 0, 1, 0, $04
spriteTile $18, $20, 0, 4, 0, 1, 0, $03
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_29B:
spriteTile $10, $20, 0, 4, 0, 0, 0, $01
spriteTile $18, $20, 0, 4, 0, 0, 0, $02
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_29C:
spriteTile $10, $20, 0, 4, 0, 0, 0, $03
spriteTile $18, $20, 0, 4, 0, 0, 0, $04
spriteTile $10, $28, 0, 4, 0, 0, 0, $00
spriteTile $18, $28, 0, 4, 0, 0, 0, $00
SPRITE_2AD:
spriteTile $10, $18, 0, 4, 0, 0, 0, $86
spriteTile $18, $18, 0, 4, 0, 1, 0, $85
spriteTile $10, $20, 0, 4, 0, 0, 1, $85
spriteTile $00, $00, 0, 4, 0, 0, 0, $80
SPRITE_2AF:
spriteTile $10, $18, 0, 4, 0, 1, 1, $85
spriteTile $20, $18, 0, 4, 0, 1, 0, $85
spriteTile $18, $20, 0, 4, 0, 1, 0, $86
spriteTile $10, $28, 0, 4, 0, 1, 0, $85
SPRITE_2B1:
spriteTile $08, $18, 0, 4, 0, 0, 0, $85
spriteTile $10, $18, 0, 4, 0, 1, 0, $86
spriteTile $10, $20, 0, 4, 0, 0, 0, $85
spriteTile $18, $28, 0, 4, 0, 0, 0, $85
SPRITE_2B3:
spriteTile $18, $18, 0, 4, 0, 1, 0, $85
spriteTile $18, $20, 0, 4, 0, 0, 1, $85
spriteTile $10, $28, 0, 4, 0, 1, 0, $85
spriteTile $18, $28, 0, 4, 0, 0, 0, $85

SPRITEDEF_EARTH:
spritePointerDef SPRITE_EARTH, 4, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, 8, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, $c, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, $40, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, $44, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, $48, 0, 0, 0, 0
spritePointerDef SPRITE_EARTH, $4c, 0, 0, 0, 0

SPRITE_EARTH:
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $08, $00, 0, 4, 0, 0, 0, $01
spriteTile $10, $00, 0, 4, 0, 0, 0, $02
spriteTile $18, $00, 0, 4, 0, 0, 0, $03
spriteTile $00, $08, 0, 4, 0, 0, 0, $10
spriteTile $08, $08, 0, 4, 0, 0, 0, $11
spriteTile $10, $08, 0, 4, 0, 0, 0, $12
spriteTile $18, $08, 0, 4, 0, 0, 0, $13
spriteTile $00, $10, 0, 4, 0, 0, 0, $20
spriteTile $08, $10, 0, 4, 0, 0, 0, $21
spriteTile $10, $10, 0, 4, 0, 0, 0, $22
spriteTile $18, $10, 0, 4, 0, 0, 0, $23
spriteTile $00, $18, 0, 4, 0, 0, 0, $30
spriteTile $08, $18, 0, 4, 0, 0, 0, $31
spriteTile $10, $18, 0, 4, 0, 0, 0, $32
spriteTile $18, $18, 0, 4, 0, 0, 0, $33

SPRITEDEF_STAT_WOUNDED:
spritePointerDef SPRITE_STAT_BG, $6D, 0, 0, 0, 0
SPRITEDEF_STAT_UNCON:
spritePointerDef SPRITE_STAT_BG, $6E, 0, 0, 0, 0
SPRITEDEF_AUTOBATTLER:
spritePointerDef SPRITE_AUTOBATTLER,  0, 0, 0, 0, 0

SPRITE_STAT_BG:
spriteTile $00, $00, 0, 4, 1, 0, 0, $00
spriteTile $08, $00, 0, 4, 1, 0, 0, $00
spriteTile $10, $00, 0, 4, 1, 0, 0, $00
spriteTile $18, $00, 0, 4, 1, 0, 0, $00
spriteTile $20, $00, 0, 4, 1, 0, 0, $00
spriteTile $28, $00, 0, 4, 1, 0, 0, $00

SPRITE_AUTOBATTLER:
spriteTile $00, $00, 0, 4, 0, 0, 0, $6F
spriteTile $08, $00, 0, 4, 0, 0, 0, $7D
spriteTile $10, $00, 0, 4, 0, 0, 0, $7E
spriteTile $18, $00, 0, 4, 0, 0, 0, $7F

;enemy extra tiles
SPRITEDEF_DADSEYES_EXTRATILES: ;DadsEyes
spritePointerDef SPRITE_DADSEYES_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_MOMSEYES_EXTRATILES: ;MomsEyes
spritePointerDef SPRITE_MOMSEYES_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_BIGWOODOH_EXTRATILES: ;BigWoodoh
spritePointerDef SPRITE_BIGWOODOH_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_R7037_EXTRATILES: ;R7037
spritePointerDef SPRITE_R7037_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_R7038_EXTRATILES: ;R7038
spritePointerDef SPRITE_R7038_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_R7038XX_EXTRATILES: ;R7038XX
spritePointerDef SPRITE_R7038XX_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_SCRAPPER_EXTRATILES: ;Scrapper
spritePointerDef SPRITE_SCRAPPER_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_FIRE_BALL_EXTRATILES: ;Fire Ball
spritePointerDef SPRITE_FIRE_BALL_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_CENTIPEDE_EXTRATILES: ;Centipede
spritePointerDef SPRITE_CENTIPEDE_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_ARMOR_EXTRATILES: ;Armor
spritePointerDef SPRITE_ARMOR_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_RATTLESNAKE_EXTRATILES: ;RattleSnake
spritePointerDef SPRITE_RATTLESNAKE_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_STRAY_DOG_EXTRATILES: ;Stray Dog
spritePointerDef SPRITE_STRAY_DOG_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_KELLY_EXTRATILES: ;Kelly
spritePointerDef SPRITE_KELLY_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_JUANA_EXTRATILES: ;Juana
spritePointerDef SPRITE_JUANA_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_GIEGUE_EXTRATILES: ;Giegue
spritePointerDef SPRITE_GIEGUE_EXTRATILES, 0, 1, 2, 1, 1
SPRITEDEF_SKY_YDDET_EXTRATILES: ;Sky_Yddet
spritePointerDef SPRITE_SKY_YDDET_EXTRATILES, 0, 1, 2, 1, 1

SPRITE_DADSEYES_EXTRATILES:
spriteTile $0F, $0C, 0, 4, 0, 0, 0, $20
spriteTile $17, $0C, 0, 4, 0, 0, 0, $21
spriteTile $20, $0C, 0, 4, 0, 1, 0, $21
spriteTile $28, $0C, 0, 4, 0, 1, 0, $20
SPRITE_MOMSEYES_EXTRATILES:
spriteTile $0F, $0C, 0, 4, 0, 0, 0, $30
spriteTile $17, $0C, 0, 4, 0, 0, 0, $31
spriteTile $20, $0C, 0, 4, 0, 1, 0, $31
spriteTile $28, $0C, 0, 4, 0, 1, 0, $30
SPRITE_BIGWOODOH_EXTRATILES:
spriteTile $10, $20, 0, 4, 0, 0, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $11
spriteTile $40, $18, 0, 4, 0, 0, 0, $03
spriteTile $48, $18, 0, 4, 0, 0, 0, $04
spriteTile $48, $20, 0, 4, 0, 0, 0, $14
SPRITE_R7037_EXTRATILES:
spriteTile $28, $28, 1, 4, 0, 0, 0, $29
spriteTile $30, $28, 1, 4, 0, 0, 0, $2A
spriteTile $28, $30, 1, 4, 0, 0, 0, $39
spriteTile $30, $30, 1, 4, 0, 0, 0, $3A
SPRITE_R7038_EXTRATILES:
spriteTile $10, $18, 0, 4, 0, 0, 0, $07
spriteTile $18, $18, 0, 4, 0, 0, 0, $08
spriteTile $10, $20, 0, 4, 0, 0, 0, $17
spriteTile $18, $20, 0, 4, 0, 0, 0, $18
spriteTile $10, $28, 0, 4, 0, 0, 0, $27
spriteTile $18, $28, 0, 4, 0, 0, 0, $28
spriteTile $10, $30, 0, 4, 0, 0, 0, $37
spriteTile $18, $30, 0, 4, 0, 0, 0, $38
spriteTile $28, $10, 1, 4, 0, 0, 0, $2B
spriteTile $30, $10, 1, 4, 0, 0, 0, $2C
spriteTile $28, $18, 1, 4, 0, 0, 0, $3B
spriteTile $30, $18, 1, 4, 0, 0, 0, $3C
spriteTile $28, $28, 2, 4, 0, 0, 0, $29
spriteTile $30, $28, 2, 4, 0, 0, 0, $2A
spriteTile $28, $30, 2, 4, 0, 0, 0, $39
spriteTile $30, $30, 2, 4, 0, 0, 0, $3A
SPRITE_R7038XX_EXTRATILES:
spriteTile $10, $18, 0, 4, 0, 0, 0, $07
spriteTile $18, $18, 0, 4, 0, 0, 0, $08
spriteTile $10, $20, 0, 4, 0, 0, 0, $17
spriteTile $18, $20, 0, 4, 0, 0, 0, $18
spriteTile $10, $28, 0, 4, 0, 0, 0, $27
spriteTile $18, $28, 0, 4, 0, 0, 0, $28
spriteTile $10, $30, 0, 4, 0, 0, 0, $37
spriteTile $18, $30, 0, 4, 0, 0, 0, $38
spriteTile $40, $18, 0, 4, 0, 1, 0, $08
spriteTile $48, $18, 0, 4, 0, 1, 0, $07
spriteTile $40, $20, 0, 4, 0, 1, 0, $18
spriteTile $48, $20, 0, 4, 0, 1, 0, $17
spriteTile $40, $28, 0, 4, 0, 1, 0, $28
spriteTile $48, $28, 0, 4, 0, 1, 0, $27
spriteTile $40, $30, 0, 4, 0, 1, 0, $38
spriteTile $48, $30, 0, 4, 0, 1, 0, $37
spriteTile $28, $16, 1, 4, 0, 0, 0, $2D
spriteTile $30, $16, 1, 4, 0, 0, 0, $2E
spriteTile $28, $1E, 1, 4, 0, 0, 0, $3D
spriteTile $30, $1E, 1, 4, 0, 0, 0, $3E
spriteTile $28, $28, 2, 4, 0, 0, 0, $29
spriteTile $30, $28, 2, 4, 0, 0, 0, $2A
spriteTile $28, $30, 2, 4, 0, 0, 0, $39
spriteTile $30, $30, 2, 4, 0, 0, 0, $3A
SPRITE_SCRAPPER_EXTRATILES:
spriteTile $18, $28, 0, 4, 0, 0, 0, $1D
spriteTile $10, $30, 0, 4, 0, 0, 0, $0C
spriteTile $18, $30, 0, 4, 0, 0, 0, $0D
spriteTile $10, $38, 0, 4, 0, 0, 0, $1C
spriteTile $18, $38, 0, 4, 0, 0, 0, $2F
spriteTile $28, $20, 1, 4, 0, 0, 0, $0E
spriteTile $30, $20, 1, 4, 0, 0, 0, $0F
spriteTile $28, $28, 1, 4, 0, 0, 0, $1E
spriteTile $30, $28, 1, 4, 0, 0, 0, $1F
SPRITE_FIRE_BALL_EXTRATILES:
spriteTile $18, $18, 0, 4, 0, 0, 0, $10
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 0, $12
spriteTile $28, $20, 0, 4, 0, 0, 0, $13
spriteTile $20, $28, 0, 4, 0, 0, 0, $19
spriteTile $28, $28, 0, 4, 0, 0, 0, $1A
SPRITE_CENTIPEDE_EXTRATILES:
spriteTile $10, $18, 1, 4, 0, 0, 0, $40
spriteTile $20, $18, 1, 4, 0, 0, 0, $41
spriteTile $18, $38, 1, 4, 0, 0, 0, $42
spriteTile $20, $38, 1, 4, 0, 0, 0, $43
spriteTile $28, $38, 1, 4, 0, 0, 0, $44
SPRITE_ARMOR_EXTRATILES:
spriteTile $10, $10, 0, 4, 0, 0, 0, $09
spriteTile $18, $10, 0, 4, 0, 0, 0, $0A
spriteTile $28, $10, 0, 4, 0, 0, 0, $0B
spriteTile $28, $18, 0, 4, 0, 0, 0, $1B
SPRITE_RATTLESNAKE_EXTRATILES:
spriteTile $28, $2F, 2, 4, 0, 0, 0, $45
spriteTile $30, $2F, 2, 4, 0, 0, 0, $46
spriteTile $28, $37, 2, 4, 0, 0, 0, $47
spriteTile $30, $37, 2, 4, 0, 0, 0, $48
SPRITE_STRAY_DOG_EXTRATILES:
spriteTile $38, $20, 0, 4, 0, 0, 0, $49
spriteTile $40, $20, 0, 4, 0, 0, 0, $4A
spriteTile $40, $28, 0, 4, 0, 0, 0, $4B
spriteTile $18, $10, 1, 4, 0, 0, 0, $4C
spriteTile $20, $10, 1, 4, 0, 0, 0, $4D
spriteTile $18, $18, 1, 4, 0, 0, 0, $0E
spriteTile $20, $18, 1, 4, 0, 0, 0, $4F
SPRITE_KELLY_EXTRATILES:
spriteTile $20, $10, 0, 4, 0, 0, 0, $22
SPRITE_JUANA_EXTRATILES:
spriteTile $10, $10, 1, 4, 0, 0, 0, $23
spriteTile $18, $10, 1, 4, 0, 0, 0, $24
spriteTile $20, $10, 1, 4, 0, 0, 0, $25
spriteTile $28, $10, 1, 4, 0, 0, 0, $26
spriteTile $10, $18, 1, 4, 0, 0, 0, $33
spriteTile $18, $18, 1, 4, 0, 0, 0, $34
spriteTile $20, $18, 1, 4, 0, 0, 0, $35
spriteTile $28, $18, 1, 4, 0, 0, 0, $36
SPRITE_GIEGUE_EXTRATILES:
spriteTile $28, $10, 1, 4, 0, 0, 0, $58
spriteTile $30, $10, 1, 4, 0, 0, 0, $59
spriteTile $28, $18, 1, 4, 0, 0, 0, $68
spriteTile $30, $18, 1, 4, 0, 0, 0, $69
spriteTile $28, $20, 1, 4, 0, 0, 0, $78
spriteTile $30, $20, 1, 4, 0, 0, 0, $79
spriteTile $28, $28, 1, 4, 0, 0, 0, $5A
spriteTile $30, $28, 1, 4, 0, 0, 0, $5B
spriteTile $28, $30, 1, 4, 0, 0, 0, $6A
spriteTile $30, $30, 1, 4, 0, 0, 0, $6B
spriteTile $28, $38, 1, 4, 0, 0, 0, $7A
spriteTile $30, $38, 1, 4, 0, 0, 0, $7B
spriteTile $08, $28, 0, 4, 0, 0, 0, $53
spriteTile $10, $28, 0, 4, 0, 0, 0, $54
spriteTile $00, $30, 0, 4, 0, 0, 0, $50
spriteTile $08, $30, 0, 4, 0, 0, 0, $51
spriteTile $10, $30, 0, 4, 0, 0, 0, $52
spriteTile $00, $38, 0, 4, 0, 0, 0, $60
spriteTile $08, $38, 0, 4, 0, 0, 0, $61
spriteTile $10, $38, 0, 4, 0, 0, 0, $62
spriteTile $00, $40, 0, 4, 0, 0, 0, $70
spriteTile $08, $40, 0, 4, 0, 0, 0, $71
spriteTile $10, $40, 0, 4, 0, 0, 0, $72
spriteTile $48, $28, 0, 4, 0, 0, 0, $63
spriteTile $50, $28, 0, 4, 0, 0, 0, $64
spriteTile $48, $30, 0, 4, 0, 0, 0, $55
spriteTile $50, $30, 0, 4, 0, 0, 0, $56
spriteTile $58, $30, 0, 4, 0, 0, 0, $57
spriteTile $48, $38, 0, 4, 0, 0, 0, $65
spriteTile $50, $38, 0, 4, 0, 0, 0, $66
spriteTile $58, $38, 0, 4, 0, 0, 0, $67
spriteTile $48, $40, 0, 4, 0, 0, 0, $75
spriteTile $50, $40, 0, 4, 0, 0, 0, $76
spriteTile $58, $40, 0, 4, 0, 0, 0, $77
SPRITE_SKY_YDDET_EXTRATILES:
spriteTile $10, $10, 1, 4, 0, 0, 0, $05
spriteTile $18, $10, 1, 4, 0, 0, 0, $06
spriteTile $10, $18, 1, 4, 0, 0, 0, $15
spriteTile $18, $18, 1, 4, 0, 0, 0, $16
spriteTile $30, $10, 1, 4, 0, 1, 0, $06
spriteTile $38, $10, 1, 4, 0, 1, 0, $05
spriteTile $30, $18, 1, 4, 0, 1, 0, $16
spriteTile $38, $18, 1, 4, 0, 1, 0, $15

SPRITEDEF_GIEGUECLIFF1:
spritePointerDef SPRITE_GIEGUECLIFF1, 0, 1, 0, 0, 0

SPRITEDEF_GIEGUECLIFF2:
spritePointerDef SPRITE_GIEGUECLIFF2, 0, 1, 0, 0, 0

SPRITE_GIEGUECLIFF1:
spriteTile $10, $20, 0, 4, 0, 0, 0, $6A
spriteTile $18, $20, 0, 4, 0, 0, 0, $6B
spriteTile $20, $20, 0, 0, 0, 0, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 0, $7A
spriteTile $18, $28, 0, 4, 0, 0, 0, $7B
spriteTile $20, $28, 0, 4, 0, 0, 0, $7C
SPRITE_GIEGUECLIFF2:
spriteTile $08, $20, 0, 4, 0, 0, 0, $6D
spriteTile $10, $20, 0, 4, 0, 0, 0, $6A
spriteTile $18, $20, 0, 4, 0, 0, 0, $6B
spriteTile $08, $28, 0, 4, 0, 0, 0, $7D
spriteTile $10, $28, 0, 4, 0, 0, 0, $7E
spriteTile $18, $28, 0, 4, 0, 0, 0, $7F

;are these tiles or pointers?
.ifndef VER_JP
SPRITEDEF_CREDITS_UNK0:
spritePointerDef SPRITE_CREDITS_UNK0, $F8, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK1:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK2:
spritePointerDef SPRITE_CHARUP1, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK3:
spritePointerDef SPRITE_CHARUP2, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK4:
spritePointerDef SPRITE_CHARRIGHT1, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK5:
spritePointerDef SPRITE_CHARRIGHT2, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK6:
spritePointerDef SPRITE_CHARDOWN1, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK7:
spritePointerDef SPRITE_CHARDOWN2, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK8:
spritePointerDef SPRITE_CHARLEFT1, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK9:
spritePointerDef SPRITE_CHARLEFT2, $60, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK10:
spritePointerDef SPRITE_60, $8, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK11:
spritePointerDef SPRITE_60, $28, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK12:
spritePointerDef SPRITE_60, $A, 1, 3, 0, 0
SPRITEDEF_CREDITS_UNK13:
spritePointerDef SPRITE_60, $2A, 1, 3, 0, 0
SPRITEDEF_CREDITS_UNK14:
spritePointerDef SPRITE_60, $C, 3, 1, 0, 0
SPRITEDEF_CREDITS_UNK15:
spritePointerDef SPRITE_60, $2C, 3, 1, 0, 0
SPRITEDEF_CREDITS_UNK16:
spritePointerDef SPRITE_60, $E, 3, 1, 0, 0
SPRITEDEF_CREDITS_UNK17:
spritePointerDef SPRITE_60, $2E, 3, 1, 0, 0
SPRITEDEF_CREDITS_UNK18:
spritePointerDef SPRITE_60, $48, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK19:
spritePointerDef SPRITE_60, $68, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK20:
spritePointerDef SPRITE_60, $4A, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK21:
spritePointerDef SPRITE_60, $6A, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK22:
spritePointerDef SPRITE_60, $4E, 3, 0, 0, 0
SPRITEDEF_CREDITS_UNK23:
spritePointerDef SPRITE_60, $6E, 3, 0, 0, 0
SPRITEDEF_CREDITS_UNK24:
spritePointerDef SPRITE_60, $4C, 2, 0, 0, 0
SPRITEDEF_CREDITS_UNK25:
spritePointerDef SPRITE_66, $6C, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK26:
spritePointerDef SPRITE_CHARUP1, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK27:
spritePointerDef SPRITE_CHARUP2, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK28:
spritePointerDef SPRITE_CHARRIGHT1, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK29:
spritePointerDef SPRITE_CHARRIGHT2, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK30:
spritePointerDef SPRITE_CHARDOWN1, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK31:
spritePointerDef SPRITE_CHARDOWN2, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK32:
spritePointerDef SPRITE_CHARLEFT1, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK33:
spritePointerDef SPRITE_CHARLEFT2, $80, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK34:
spritePointerDef SPRITE_CHARUP1, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK35:
spritePointerDef SPRITE_CHARUP2, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK36:
spritePointerDef SPRITE_CHARRIGHT1, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK37:
spritePointerDef SPRITE_CHARRIGHT2, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK38:
spritePointerDef SPRITE_CHARDOWN1, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK39:
spritePointerDef SPRITE_CHARDOWN2, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK40:
spritePointerDef SPRITE_CHARLEFT1, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK41:
spritePointerDef SPRITE_CHARLEFT2, $88, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK42:
spritePointerDef SPRITE_60, $A6, 2, 0, 0, 0
SPRITEDEF_CREDITS_UNK43:
spritePointerDef SPRITE_60, $C6, 2, 0, 0, 0
SPRITEDEF_CREDITS_UNK44:
spritePointerDef SPRITE_60, $AE, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK45:
spritePointerDef SPRITE_CREDITS_UNK4, $A0, 0, 0, 0, 0
SPRITEDEF_CREDITS_UNK46:
spritePointerDef SPRITE_CREDITS_UNK44, $A8, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK47:
spritePointerDef SPRITE_CREDITS_UNK44, $D8, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK48:
spritePointerDef SPRITE_CREDITS_UNK53, $A8, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK49:
spritePointerDef SPRITE_CREDITS_UNK53, $D8, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK50:
spritePointerDef SPRITE_CREDITS_UNK44, $AB, 1, 0, 0, 0
SPRITEDEF_CREDITS_UNK51:
spritePointerDef SPRITE_CHARUP1, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK52:
spritePointerDef SPRITE_CHARUP2, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK53:
spritePointerDef SPRITE_CHARRIGHT1, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK54:
spritePointerDef SPRITE_CHARRIGHT2, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK55:
spritePointerDef SPRITE_CHARDOWN1, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK56:
spritePointerDef SPRITE_CHARDOWN2, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK57:
spritePointerDef SPRITE_CHARLEFT1, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK58:
spritePointerDef SPRITE_CHARLEFT2, $80, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK59:
spritePointerDef SPRITE_CHARUP1, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK60:
spritePointerDef SPRITE_CHARUP2, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK61:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK62:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK63:
spritePointerDef SPRITE_CHARDOWN1, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK64:
spritePointerDef SPRITE_CHARDOWN2, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK65:
spritePointerDef SPRITE_CHARLEFT1, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK66:
spritePointerDef SPRITE_CHARLEFT2, $C0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK67:
spritePointerDef SPRITE_CHARUP1, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK68:
spritePointerDef SPRITE_CHARUP2, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK69:
spritePointerDef SPRITE_CHARRIGHT1, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK70:
spritePointerDef SPRITE_CHARRIGHT2, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK71:
spritePointerDef SPRITE_CHARDOWN1, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK72:
spritePointerDef SPRITE_CHARDOWN2, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK73:
spritePointerDef SPRITE_CHARLEFT1, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK74:
spritePointerDef SPRITE_CHARLEFT2, $E0, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK75:
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK76:
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK77:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK78:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK79:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK80:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK81:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK82:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK83:
spritePointerDef SPRITE_CHARUP1, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK84:
spritePointerDef SPRITE_CHARUP2, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK85:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK86:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK87:
spritePointerDef SPRITE_CHARDOWN1, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK88:
spritePointerDef SPRITE_CHARDOWN2, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK89:
spritePointerDef SPRITE_CHARLEFT1, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK90:
spritePointerDef SPRITE_CHARLEFT2, $A0, 2, 1, 0, 0
SPRITEDEF_CREDITS_UNK91:
spritePointerDef SPRITE_CHARUP1, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK92:
spritePointerDef SPRITE_CHARUP2, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK93:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK94:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK95:
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK96:
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK97:
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK98:
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 1, 0, 0
SPRITEDEF_CREDITS_UNK99:
spritePointerDef SPRITE_CHARUP1, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK100:
spritePointerDef SPRITE_CHARUP2, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK101:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK102:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK103:
spritePointerDef SPRITE_CHARDOWN1, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK104:
spritePointerDef SPRITE_CHARDOWN2, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK105:
spritePointerDef SPRITE_CHARLEFT1, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK106:
spritePointerDef SPRITE_CHARLEFT2, $C8, 2, 2, 0, 0
SPRITEDEF_CREDITS_UNK107:
spritePointerDef SPRITE_CHARUP1, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK108:
spritePointerDef SPRITE_CHARUP2, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK109:
spritePointerDef SPRITE_CHARRIGHT1, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK110:
spritePointerDef SPRITE_CHARRIGHT2, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK111:
spritePointerDef SPRITE_CHARDOWN1, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK112:
spritePointerDef SPRITE_CHARDOWN2, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK113:
spritePointerDef SPRITE_CHARLEFT1, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK114:
spritePointerDef SPRITE_CHARLEFT2, $E8, 3, 3, 0, 0
SPRITEDEF_CREDITS_UNK115:
spritePointerDef SPRITE_18, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK116:
spritePointerDef SPRITE_19, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK117:
spritePointerDef SPRITE_1A, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK118:
spritePointerDef SPRITE_1B, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK119:
spritePointerDef SPRITE_1C, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK120:
spritePointerDef SPRITE_1D, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK121:
spritePointerDef SPRITE_1E, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK122:
spritePointerDef SPRITE_1F, $E0, 1, 1, 1, 0
SPRITEDEF_CREDITS_UNK123:
spritePointerDef SPRITE_CHARUP1, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK124:
spritePointerDef SPRITE_CHARUP2, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK125:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK126:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK127:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK128:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK129:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 2, 1, 0
SPRITEDEF_CREDITS_UNK130:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 2, 1, 0

SPRITE_CREDITS_UNK0:
spriteTile $10, $20, 0, 4, 0, 0, 0, $00
spriteTile $18, $20, 0, 4, 0, 1, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 1, $00
spriteTile $18, $28, 0, 4, 0, 1, 1, $00
SPRITE_CREDITS_UNK4:
spriteTile $00, $00, 0, 4, 0, 0, 0, $00
spriteTile $08, $00, 0, 4, 0, 0, 0, $01
spriteTile $10, $00, 0, 4, 0, 0, 0, $02
spriteTile $18, $00, 0, 4, 0, 0, 0, $03
spriteTile $20, $00, 0, 4, 0, 0, 0, $04
spriteTile $28, $00, 0, 4, 0, 0, 0, $05
spriteTile $00, $08, 0, 4, 0, 0, 0, $10
spriteTile $08, $08, 0, 4, 0, 0, 0, $11
spriteTile $10, $08, 0, 4, 0, 0, 0, $12
spriteTile $18, $08, 0, 4, 0, 0, 0, $13
spriteTile $20, $08, 0, 4, 0, 0, 0, $14
spriteTile $28, $08, 0, 4, 0, 0, 0, $15
spriteTile $00, $10, 0, 4, 0, 0, 0, $20
spriteTile $08, $10, 0, 4, 0, 0, 0, $21
spriteTile $10, $10, 0, 4, 0, 0, 0, $22
spriteTile $18, $10, 0, 4, 0, 0, 0, $23
spriteTile $20, $10, 0, 4, 0, 0, 0, $24
spriteTile $28, $10, 0, 4, 0, 0, 0, $25
spriteTile $00, $18, 0, 4, 0, 0, 0, $30
spriteTile $08, $18, 0, 4, 0, 0, 0, $31
spriteTile $10, $18, 0, 4, 0, 0, 0, $32
spriteTile $18, $18, 0, 4, 0, 0, 0, $33
spriteTile $20, $18, 0, 4, 0, 0, 0, $34
spriteTile $28, $18, 0, 4, 0, 0, 0, $35
spriteTile $00, $20, 0, 4, 0, 0, 0, $40
spriteTile $08, $20, 0, 4, 0, 0, 0, $41
spriteTile $10, $20, 0, 4, 0, 0, 0, $42
spriteTile $18, $20, 0, 4, 0, 0, 0, $43
spriteTile $20, $20, 0, 4, 0, 0, 0, $44
spriteTile $28, $20, 0, 4, 0, 0, 0, $45
spriteTile $00, $28, 0, 4, 0, 0, 0, $50
spriteTile $08, $28, 0, 4, 0, 0, 0, $51
spriteTile $10, $28, 0, 4, 0, 0, 0, $52
spriteTile $18, $28, 0, 4, 0, 0, 0, $53
spriteTile $20, $28, 0, 4, 0, 0, 0, $54
spriteTile $28, $28, 0, 4, 0, 0, 0, $55
spriteTile $08, $30, 0, 4, 0, 0, 0, $46
spriteTile $10, $30, 0, 4, 0, 0, 0, $47
spriteTile $00, $38, 0, 4, 0, 0, 0, $56
spriteTile $08, $38, 0, 4, 0, 0, 0, $57
SPRITE_CREDITS_UNK44:
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $01
spriteTile $1C, $18, 0, 4, 0, 0, 0, $02
spriteTile $0C, $20, 0, 4, 0, 0, 0, $10
spriteTile $14, $20, 0, 4, 0, 0, 0, $11
spriteTile $1C, $20, 0, 4, 0, 0, 0, $12
spriteTile $0C, $28, 0, 4, 0, 0, 0, $20
spriteTile $14, $28, 0, 4, 0, 0, 0, $21
spriteTile $1C, $28, 0, 4, 0, 0, 0, $22
SPRITE_CREDITS_UNK53:
spriteTile $0C, $18, 0, 4, 0, 1, 0, $02
spriteTile $14, $18, 0, 4, 0, 1, 0, $01
spriteTile $1C, $18, 0, 4, 0, 1, 0, $00
spriteTile $0C, $20, 0, 4, 0, 1, 0, $12
spriteTile $14, $20, 0, 4, 0, 1, 0, $11
spriteTile $1C, $20, 0, 4, 0, 1, 0, $10
spriteTile $0C, $28, 0, 4, 0, 1, 0, $22
spriteTile $14, $28, 0, 4, 0, 1, 0, $21
spriteTile $1C, $28, 0, 4, 0, 1, 0, $20
.endif