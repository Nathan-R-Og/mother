.segment        "PRG15": absolute

;sprite
.macro spritePointerDef pointer, ppu, p1, p2, unkArg1, unkArg2
    .word pointer
    .byte ppu
    .byte (unkArg2 << 5) | (unkArg1 << 4) | (p2 << 2) | p1
.endmacro

.macro spriteTile posX, posY, palette, unkArg1, order, flipX, flipY, index
    .byte posX, posY
    .byte (flipY << 7) | (flipX << 6) | (order << 5) | (unkArg1 << 2) | palette
    .byte index
.endmacro

SPRITEDEF_0:
spritePointerDef SPRITE_CHARUP1, $0, 1, 3, 1, 0
SPRITEDEF_1:
spritePointerDef SPRITE_CHARUP2, $0, 1, 3, 1, 0
SPRITEDEF_2:
spritePointerDef SPRITE_CHARRIGHT1, $0, 1, 3, 1, 0
SPRITEDEF_3:
spritePointerDef SPRITE_CHARRIGHT2, $0, 1, 3, 1, 0
SPRITEDEF_NINTENDOWN1:
spritePointerDef SPRITE_CHARDOWN1, $0, 1, 3, 1, 0
SPRITEDEF_NINTENDOWN2:
spritePointerDef SPRITE_CHARDOWN2, $0, 1, 3, 1, 0
SPRITEDEF_6:
spritePointerDef SPRITE_CHARLEFT1, $0, 1, 3, 1, 0
SPRITEDEF_7:
spritePointerDef SPRITE_CHARLEFT2, $0, 1, 3, 1, 0
SPRITEDEF_8:
spritePointerDef SPRITE_CHARUP1, $40, 2, 2, 1, 0
SPRITEDEF_9:
spritePointerDef SPRITE_CHARUP2, $40, 2, 2, 1, 0
SPRITEDEF_A:
spritePointerDef SPRITE_CHARRIGHT1, $40, 2, 2, 1, 0
SPRITEDEF_B:
spritePointerDef SPRITE_CHARRIGHT2, $40, 2, 2, 1, 0
SPRITEDEF_C:
spritePointerDef SPRITE_CHARDOWN1, $40, 2, 2, 1, 0
SPRITEDEF_D:
spritePointerDef SPRITE_CHARDOWN2, $40, 2, 2, 1, 0
SPRITEDEF_E:
spritePointerDef SPRITE_CHARLEFT1, $40, 2, 2, 1, 0
SPRITEDEF_F:
spritePointerDef SPRITE_CHARLEFT2, $40, 2, 2, 1, 0
SPRITEDEF_10:
spritePointerDef SPRITE_10, $20, 1, 1, 1, 0
SPRITEDEF_11:
spritePointerDef SPRITE_11, $20, 1, 1, 1, 0
SPRITEDEF_12:
spritePointerDef SPRITE_12, $20, 1, 1, 1, 0
SPRITEDEF_13:
spritePointerDef SPRITE_13, $20, 1, 1, 1, 0
SPRITEDEF_14:
spritePointerDef SPRITE_14, $20, 1, 1, 1, 0
SPRITEDEF_15:
spritePointerDef SPRITE_15, $20, 1, 1, 1, 0
SPRITEDEF_16:
spritePointerDef SPRITE_16, $20, 1, 1, 1, 0
SPRITEDEF_17:
spritePointerDef SPRITE_17, $20, 1, 1, 1, 0
SPRITEDEF_18:
spritePointerDef SPRITE_18, $60, 1, 1, 1, 0
SPRITEDEF_19:
spritePointerDef SPRITE_19, $60, 1, 1, 1, 0
SPRITEDEF_1A:
spritePointerDef SPRITE_1A, $60, 1, 1, 1, 0
SPRITEDEF_1B:
spritePointerDef SPRITE_1B, $60, 1, 1, 1, 0
SPRITEDEF_1C:
spritePointerDef SPRITE_1C, $60, 1, 1, 1, 0
SPRITEDEF_1D:
spritePointerDef SPRITE_1D, $60, 1, 1, 1, 0
SPRITEDEF_1E:
spritePointerDef SPRITE_1E, $60, 1, 1, 1, 0
SPRITEDEF_1F:
spritePointerDef SPRITE_1F, $60, 1, 1, 1, 0
SPRITEDEF_20:
spritePointerDef SPRITE_CHARUP1, $8, 1, 2, 1, 0
SPRITEDEF_21:
spritePointerDef SPRITE_CHARUP2, $8, 1, 2, 1, 0
SPRITEDEF_22:
spritePointerDef SPRITE_CHARRIGHT1, $8, 1, 2, 1, 0
SPRITEDEF_23:
spritePointerDef SPRITE_CHARRIGHT2, $8, 1, 2, 1, 0
SPRITEDEF_24:
spritePointerDef SPRITE_CHARDOWN1, $8, 1, 2, 1, 0
SPRITEDEF_25:
spritePointerDef SPRITE_CHARDOWN2, $8, 1, 2, 1, 0
SPRITEDEF_26:
spritePointerDef SPRITE_CHARLEFT1, $8, 1, 2, 1, 0
SPRITEDEF_27:
spritePointerDef SPRITE_CHARLEFT2, $8, 1, 2, 1, 0
SPRITEDEF_28:
spritePointerDef SPRITE_28, $0, 0, 0, 0, 0
SPRITEDEF_29:
spritePointerDef SPRITE_29, $0, 0, 0, 0, 0
SPRITEDEF_2A:
spritePointerDef SPRITE_2A, $0, 0, 0, 0, 0
SPRITEDEF_2B:
spritePointerDef SPRITE_2B, $0, 0, 0, 0, 0
SPRITEDEF_2C:
spritePointerDef SPRITE_2C, $0, 0, 0, 0, 0
SPRITEDEF_2D:
spritePointerDef SPRITE_2D, $0, 0, 0, 0, 0
SPRITEDEF_2E:
spritePointerDef SPRITE_2E, $0, 0, 0, 0, 0
SPRITEDEF_2F:
spritePointerDef SPRITE_2F, $0, 0, 0, 0, 0
SPRITEDEF_30:
spritePointerDef SPRITE_30, $0, 0, 0, 0, 0
SPRITEDEF_31:
spritePointerDef SPRITE_31, $0, 0, 0, 0, 0
SPRITEDEF_32:
spritePointerDef SPRITE_32, $0, 0, 0, 0, 0
SPRITEDEF_33:
spritePointerDef SPRITE_33, $0, 0, 0, 0, 0
SPRITEDEF_34:
spritePointerDef SPRITE_34, $0, 0, 0, 0, 0
SPRITEDEF_35:
spritePointerDef SPRITE_35, $0, 0, 0, 0, 0
SPRITEDEF_36:
spritePointerDef SPRITE_36, $0, 0, 0, 0, 0
SPRITEDEF_37:
spritePointerDef SPRITE_37, $0, 0, 0, 0, 0
SPRITEDEF_38:
spritePointerDef SPRITE_38, $0, 0, 0, 0, 0
SPRITEDEF_39:
spritePointerDef SPRITE_39, $0, 0, 0, 0, 0
SPRITEDEF_3A:
spritePointerDef SPRITE_3A, $0, 0, 0, 0, 0
SPRITEDEF_3B:
spritePointerDef SPRITE_3B, $0, 0, 0, 0, 0
SPRITEDEF_3C:
spritePointerDef SPRITE_3C, $0, 0, 0, 0, 0
SPRITEDEF_3D:
spritePointerDef SPRITE_3D, $0, 0, 0, 0, 0
SPRITEDEF_3E:
spritePointerDef SPRITE_3E, $0, 0, 0, 0, 0
SPRITEDEF_3F:
spritePointerDef SPRITE_3F, $0, 0, 0, 0, 0
SPRITEDEF_40:
spritePointerDef SPRITE_40, $0, 0, 0, 0, 0
SPRITEDEF_41:
spritePointerDef SPRITE_41, $0, 0, 0, 0, 0
SPRITEDEF_42:
spritePointerDef SPRITE_42, $0, 0, 0, 0, 0
SPRITEDEF_43:
spritePointerDef SPRITE_43, $0, 0, 0, 0, 0
SPRITEDEF_44:
spritePointerDef SPRITE_44, $0, 0, 0, 0, 0
SPRITEDEF_45:
spritePointerDef SPRITE_45, $0, 0, 0, 0, 0
SPRITEDEF_46:
spritePointerDef SPRITE_46, $0, 0, 0, 0, 0
SPRITEDEF_47:
spritePointerDef SPRITE_47, $0, 0, 0, 0, 0
SPRITEDEF_48:
spritePointerDef SPRITE_48, $0, 0, 0, 0, 0
SPRITEDEF_49:
spritePointerDef SPRITE_49, $0, 0, 0, 0, 0
SPRITEDEF_4A:
spritePointerDef SPRITE_4A, $0, 0, 0, 0, 0
SPRITEDEF_4B:
spritePointerDef SPRITE_4B, $0, 0, 0, 0, 0
SPRITEDEF_4C:
spritePointerDef SPRITE_4C, $0, 0, 0, 0, 0
SPRITEDEF_4D:
spritePointerDef SPRITE_4D, $0, 0, 0, 0, 0
SPRITEDEF_4E:
spritePointerDef SPRITE_4E, $0, 0, 0, 0, 0
SPRITEDEF_4F:
spritePointerDef SPRITE_4F, $0, 0, 0, 0, 0
SPRITEDEF_50:
spritePointerDef SPRITE_CHARUP1, $A0, 1, 2, 0, 0
SPRITEDEF_51:
spritePointerDef SPRITE_CHARUP2, $A0, 1, 2, 0, 0
SPRITEDEF_52:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 2, 0, 0
SPRITEDEF_53:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 2, 0, 0
SPRITEDEF_54:
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 2, 0, 0
SPRITEDEF_55:
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 2, 0, 0
SPRITEDEF_56:
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 2, 0, 0
SPRITEDEF_57:
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 2, 0, 0
SPRITEDEF_58:
spritePointerDef SPRITE_58, $80, 1, 1, 0, 0
SPRITEDEF_59:
spritePointerDef SPRITE_58, $82, 1, 1, 0, 0
SPRITEDEF_5A:
spritePointerDef SPRITE_58, $84, 1, 1, 0, 0
SPRITEDEF_5B:
spritePointerDef SPRITE_58, $86, 1, 1, 0, 0
SPRITEDEF_5C:
spritePointerDef SPRITE_58, $88, 1, 1, 0, 0
SPRITEDEF_5D:
spritePointerDef SPRITE_58, $8A, 1, 1, 0, 0
SPRITEDEF_5E:
spritePointerDef SPRITE_58, $8C, 1, 1, 0, 0
SPRITEDEF_5F:
spritePointerDef SPRITE_58, $8E, 1, 1, 0, 0
SPRITEDEF_60:
spritePointerDef SPRITE_60, $68, 0, 0, 0, 0
SPRITEDEF_61:
spritePointerDef SPRITE_60, $68, 0, 0, 0, 0
SPRITEDEF_62:
spritePointerDef SPRITE_60, $6A, 1, 1, 0, 0
SPRITEDEF_63:
spritePointerDef SPRITE_60, $6C, 1, 1, 0, 0
SPRITEDEF_64:
spritePointerDef SPRITE_60, $6C, 0, 0, 0, 0
SPRITEDEF_65:
spritePointerDef SPRITE_60, $6E, 1, 1, 0, 0
SPRITEDEF_66:
spritePointerDef SPRITE_66, $3C, 1, 1, 0, 0
SPRITEDEF_67:
spritePointerDef SPRITE_67, $3C, 1, 1, 0, 0
SPRITEDEF_68:
spritePointerDef SPRITE_68, $3E, 0, 0, 0, 0
SPRITEDEF_69:
spritePointerDef SPRITE_69, $3E, 0, 0, 0, 0
SPRITEDEF_6A:
spritePointerDef SPRITE_CHARUP1, $80, 3, 3, 0, 0
SPRITEDEF_6B:
spritePointerDef SPRITE_CHARUP2, $80, 3, 3, 0, 0
SPRITEDEF_6C:
spritePointerDef SPRITE_CHARRIGHT1, $80, 3, 3, 0, 0
SPRITEDEF_6D:
spritePointerDef SPRITE_CHARRIGHT2, $80, 3, 3, 0, 0
SPRITEDEF_6E:
spritePointerDef SPRITE_CHARDOWN1, $80, 3, 3, 0, 0
SPRITEDEF_6F:
spritePointerDef SPRITE_CHARDOWN2, $80, 3, 3, 0, 0
SPRITEDEF_70:
spritePointerDef SPRITE_CHARLEFT1, $80, 3, 3, 0, 0
SPRITEDEF_71:
spritePointerDef SPRITE_CHARLEFT2, $80, 3, 3, 0, 0
SPRITEDEF_72:
spritePointerDef SPRITE_CHARUP1, $A0, 3, 3, 0, 0
SPRITEDEF_73:
spritePointerDef SPRITE_CHARUP2, $A0, 3, 3, 0, 0
SPRITEDEF_74:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 3, 3, 0, 0
SPRITEDEF_75:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 3, 3, 0, 0
SPRITEDEF_76:
spritePointerDef SPRITE_CHARDOWN1, $A0, 3, 3, 0, 0
SPRITEDEF_77:
spritePointerDef SPRITE_CHARDOWN2, $A0, 3, 3, 0, 0
SPRITEDEF_78:
spritePointerDef SPRITE_CHARLEFT1, $A0, 3, 3, 0, 0
SPRITEDEF_79:
spritePointerDef SPRITE_CHARLEFT2, $A0, 3, 3, 0, 0
SPRITEDEF_7A:
spritePointerDef SPRITE_10, $C0, 1, 1, 0, 0
SPRITEDEF_7B:
spritePointerDef SPRITE_11, $C0, 1, 1, 0, 0
SPRITEDEF_7C:
spritePointerDef SPRITE_12, $C0, 1, 1, 0, 0
SPRITEDEF_7D:
spritePointerDef SPRITE_13, $C0, 1, 1, 0, 0
SPRITEDEF_7E:
spritePointerDef SPRITE_14, $C0, 1, 1, 0, 0
SPRITEDEF_7F:
spritePointerDef SPRITE_15, $C0, 1, 1, 0, 0
SPRITEDEF_80:
spritePointerDef SPRITE_16, $C0, 1, 1, 0, 0
SPRITEDEF_81:
spritePointerDef SPRITE_17, $C0, 1, 1, 0, 0
SPRITEDEF_82:
spritePointerDef SPRITE_10, $E0, 1, 2, 0, 0
SPRITEDEF_83:
spritePointerDef SPRITE_11, $E0, 1, 2, 0, 0
SPRITEDEF_84:
spritePointerDef SPRITE_12, $E0, 1, 2, 0, 0
SPRITEDEF_85:
spritePointerDef SPRITE_13, $E0, 1, 2, 0, 0
SPRITEDEF_86:
spritePointerDef SPRITE_14, $E0, 1, 2, 0, 0
SPRITEDEF_87:
spritePointerDef SPRITE_15, $E0, 1, 2, 0, 0
SPRITEDEF_88:
spritePointerDef SPRITE_16, $E0, 1, 2, 0, 0
SPRITEDEF_89:
spritePointerDef SPRITE_17, $E0, 1, 2, 0, 0
SPRITEDEF_8A:
spritePointerDef SPRITE_CHARUP1, $88, 3, 3, 0, 0
SPRITEDEF_8B:
spritePointerDef SPRITE_CHARUP2, $88, 3, 3, 0, 0
SPRITEDEF_8C:
spritePointerDef SPRITE_CHARRIGHT1, $88, 3, 3, 0, 0
SPRITEDEF_8D:
spritePointerDef SPRITE_CHARRIGHT2, $88, 3, 3, 0, 0
SPRITEDEF_8E:
spritePointerDef SPRITE_CHARDOWN1, $88, 3, 3, 0, 0
SPRITEDEF_8F:
spritePointerDef SPRITE_CHARDOWN2, $88, 3, 3, 0, 0
SPRITEDEF_90:
spritePointerDef SPRITE_CHARLEFT1, $88, 3, 3, 0, 0
SPRITEDEF_91:
spritePointerDef SPRITE_CHARLEFT2, $88, 3, 3, 0, 0
SPRITEDEF_92:
spritePointerDef SPRITE_CHARUP1, $A8, 1, 2, 0, 0
SPRITEDEF_93:
spritePointerDef SPRITE_CHARUP2, $A8, 1, 2, 0, 0
SPRITEDEF_94:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 2, 0, 0
SPRITEDEF_95:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 2, 0, 0
SPRITEDEF_96:
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 2, 0, 0
SPRITEDEF_97:
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 2, 0, 0
SPRITEDEF_98:
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 2, 0, 0
SPRITEDEF_99:
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 2, 0, 0
SPRITEDEF_9A:
spritePointerDef SPRITE_CHARUP1, $C8, 1, 1, 0, 0
SPRITEDEF_9B:
spritePointerDef SPRITE_CHARUP2, $C8, 1, 1, 0, 0
SPRITEDEF_9C:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 1, 1, 0, 0
SPRITEDEF_9D:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 1, 1, 0, 0
SPRITEDEF_9E:
spritePointerDef SPRITE_CHARDOWN1, $C8, 1, 1, 0, 0
SPRITEDEF_9F:
spritePointerDef SPRITE_CHARDOWN2, $C8, 1, 1, 0, 0
SPRITEDEF_A0:
spritePointerDef SPRITE_CHARLEFT1, $C8, 1, 1, 0, 0
SPRITEDEF_A1:
spritePointerDef SPRITE_CHARLEFT2, $C8, 1, 1, 0, 0
SPRITEDEF_A2:
spritePointerDef SPRITE_CHARUP1, $E8, 1, 1, 0, 0
SPRITEDEF_A3:
spritePointerDef SPRITE_CHARUP2, $E8, 1, 1, 0, 0
SPRITEDEF_A4:
spritePointerDef SPRITE_CHARRIGHT1, $E8, 1, 1, 0, 0
SPRITEDEF_A5:
spritePointerDef SPRITE_CHARRIGHT2, $E8, 1, 1, 0, 0
SPRITEDEF_A6:
spritePointerDef SPRITE_CHARDOWN1, $E8, 1, 1, 0, 0
SPRITEDEF_A7:
spritePointerDef SPRITE_CHARDOWN2, $E8, 1, 1, 0, 0
SPRITEDEF_A8:
spritePointerDef SPRITE_CHARLEFT1, $E8, 1, 1, 0, 0
SPRITEDEF_A9:
spritePointerDef SPRITE_CHARLEFT2, $E8, 1, 1, 0, 0
SPRITEDEF_AA:
spritePointerDef SPRITE_AA, $80, 1, 1, 0, 0
SPRITEDEF_AB:
spritePointerDef SPRITE_AB, $80, 1, 1, 0, 0
SPRITEDEF_AC:
spritePointerDef SPRITE_AC, $80, 1, 1, 0, 0
SPRITEDEF_AD:
spritePointerDef SPRITE_AD, $80, 1, 1, 0, 0
SPRITEDEF_AE:
spritePointerDef SPRITE_AE, $80, 1, 1, 0, 0
SPRITEDEF_AF:
spritePointerDef SPRITE_AF, $80, 1, 1, 0, 0
SPRITEDEF_B0:
spritePointerDef SPRITE_B0, $80, 1, 1, 0, 0
SPRITEDEF_B1:
spritePointerDef SPRITE_B1, $80, 1, 1, 0, 0
SPRITEDEF_B2:
spritePointerDef SPRITE_B2, $80, 3, 3, 0, 0
SPRITEDEF_B3:
spritePointerDef SPRITE_B3, $80, 3, 3, 0, 0
SPRITEDEF_B4:
spritePointerDef SPRITE_B4, $80, 3, 3, 0, 0
SPRITEDEF_B5:
spritePointerDef SPRITE_B5, $80, 3, 3, 0, 0
SPRITEDEF_B6:
spritePointerDef SPRITE_B6, $80, 3, 3, 0, 0
SPRITEDEF_B7:
spritePointerDef SPRITE_B7, $80, 3, 3, 0, 0
SPRITEDEF_B8:
spritePointerDef SPRITE_B8, $80, 3, 3, 0, 0
SPRITEDEF_B9:
spritePointerDef SPRITE_B9, $80, 3, 3, 0, 0
SPRITEDEF_BA:
spritePointerDef SPRITE_BA, $80, 1, 1, 0, 0
SPRITEDEF_BB:
spritePointerDef SPRITE_BB, $80, 1, 1, 0, 0
SPRITEDEF_BC:
spritePointerDef SPRITE_BC, $80, 1, 1, 0, 0
SPRITEDEF_BD:
spritePointerDef SPRITE_BD, $80, 1, 1, 0, 0
SPRITEDEF_BE:
spritePointerDef SPRITE_BE, $80, 1, 1, 0, 0
SPRITEDEF_BF:
spritePointerDef SPRITE_BF, $80, 1, 1, 0, 0
SPRITEDEF_C0:
spritePointerDef SPRITE_C0, $80, 1, 1, 0, 0
SPRITEDEF_C1:
spritePointerDef SPRITE_C1, $80, 1, 1, 0, 0
SPRITEDEF_C2:
spritePointerDef SPRITE_CHARUP1, $80, 1, 3, 0, 0
SPRITEDEF_C3:
spritePointerDef SPRITE_CHARUP2, $80, 1, 3, 0, 0
SPRITEDEF_C4:
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 3, 0, 0
SPRITEDEF_C5:
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 3, 0, 0
SPRITEDEF_C6:
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 3, 0, 0
SPRITEDEF_C7:
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 3, 0, 0
SPRITEDEF_C8:
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 3, 0, 0
SPRITEDEF_C9:
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 3, 0, 0
SPRITEDEF_CA:
spritePointerDef SPRITE_CHARUP1, $A0, 2, 1, 0, 0
SPRITEDEF_CB:
spritePointerDef SPRITE_CHARUP2, $A0, 2, 1, 0, 0
SPRITEDEF_CC:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 2, 1, 0, 0
SPRITEDEF_CD:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 2, 1, 0, 0
SPRITEDEF_CE:
spritePointerDef SPRITE_CHARDOWN1, $A0, 2, 1, 0, 0
SPRITEDEF_CF:
spritePointerDef SPRITE_CHARDOWN2, $A0, 2, 1, 0, 0
SPRITEDEF_D0:
spritePointerDef SPRITE_CHARLEFT1, $A0, 2, 1, 0, 0
SPRITEDEF_D1:
spritePointerDef SPRITE_CHARLEFT2, $A0, 2, 1, 0, 0
SPRITEDEF_D2:
spritePointerDef SPRITE_CHARUP1, $C0, 3, 3, 0, 0
SPRITEDEF_D3:
spritePointerDef SPRITE_CHARUP2, $C0, 3, 3, 0, 0
SPRITEDEF_D4:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 3, 3, 0, 0
SPRITEDEF_D5:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 3, 3, 0, 0
SPRITEDEF_D6:
spritePointerDef SPRITE_CHARDOWN1, $C0, 3, 3, 0, 0
SPRITEDEF_D7:
spritePointerDef SPRITE_CHARDOWN2, $C0, 3, 3, 0, 0
SPRITEDEF_D8:
spritePointerDef SPRITE_CHARLEFT1, $C0, 3, 3, 0, 0
SPRITEDEF_D9:
spritePointerDef SPRITE_CHARLEFT2, $C0, 3, 3, 0, 0
SPRITEDEF_DA:
spritePointerDef SPRITE_10, $E0, 3, 3, 0, 0
SPRITEDEF_DB:
spritePointerDef SPRITE_11, $E0, 3, 3, 0, 0
SPRITEDEF_DC:
spritePointerDef SPRITE_12, $E0, 3, 3, 0, 0
SPRITEDEF_DD:
spritePointerDef SPRITE_13, $E0, 3, 3, 0, 0
SPRITEDEF_DE:
spritePointerDef SPRITE_14, $E0, 3, 3, 0, 0
SPRITEDEF_DF:
spritePointerDef SPRITE_15, $E0, 3, 3, 0, 0
SPRITEDEF_E0:
spritePointerDef SPRITE_16, $E0, 3, 3, 0, 0
SPRITEDEF_E1:
spritePointerDef SPRITE_17, $E0, 3, 3, 0, 0
SPRITEDEF_E2:
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
SPRITEDEF_E3:
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
SPRITEDEF_E4:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
SPRITEDEF_E5:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
SPRITEDEF_E6:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
SPRITEDEF_E7:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
SPRITEDEF_E8:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
SPRITEDEF_E9:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0
SPRITEDEF_EA:
spritePointerDef SPRITE_CHARUP1, $A8, 1, 2, 0, 0
SPRITEDEF_EB:
spritePointerDef SPRITE_CHARUP2, $A8, 1, 2, 0, 0
SPRITEDEF_EC:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 2, 0, 0
SPRITEDEF_ED:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 2, 0, 0
SPRITEDEF_EE:
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 2, 0, 0
SPRITEDEF_EF:
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 2, 0, 0
SPRITEDEF_F0:
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 2, 0, 0
SPRITEDEF_F1:
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 2, 0, 0
SPRITEDEF_F2:
spritePointerDef SPRITE_CHARUP1, $C8, 2, 2, 0, 0
SPRITEDEF_F3:
spritePointerDef SPRITE_CHARUP2, $C8, 2, 2, 0, 0
SPRITEDEF_F4:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 2, 2, 0, 0
SPRITEDEF_F5:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 2, 2, 0, 0
SPRITEDEF_F6:
spritePointerDef SPRITE_CHARDOWN1, $C8, 2, 2, 0, 0
SPRITEDEF_F7:
spritePointerDef SPRITE_CHARDOWN2, $C8, 2, 2, 0, 0
SPRITEDEF_F8:
spritePointerDef SPRITE_CHARLEFT1, $C8, 2, 2, 0, 0
SPRITEDEF_F9:
spritePointerDef SPRITE_CHARLEFT2, $C8, 2, 2, 0, 0
SPRITEDEF_FA:
spritePointerDef SPRITE_10, $E8, 3, 3, 0, 0
SPRITEDEF_FB:
spritePointerDef SPRITE_11, $E8, 3, 3, 0, 0
SPRITEDEF_FC:
spritePointerDef SPRITE_12, $E8, 3, 3, 0, 0
SPRITEDEF_FD:
spritePointerDef SPRITE_13, $E8, 3, 3, 0, 0
SPRITEDEF_FE:
spritePointerDef SPRITE_14, $E8, 3, 3, 0, 0
SPRITEDEF_FF:
spritePointerDef SPRITE_15, $E8, 3, 3, 0, 0
SPRITEDEF_100:
spritePointerDef SPRITE_16, $E8, 3, 3, 0, 0
SPRITEDEF_101:
spritePointerDef SPRITE_17, $E8, 3, 3, 0, 0
SPRITEDEF_102:
spritePointerDef SPRITE_AA, $80, 3, 3, 0, 0
SPRITEDEF_103:
spritePointerDef SPRITE_AB, $80, 3, 3, 0, 0
SPRITEDEF_104:
spritePointerDef SPRITE_AC, $80, 3, 3, 0, 0
SPRITEDEF_105:
spritePointerDef SPRITE_AD, $80, 3, 3, 0, 0
SPRITEDEF_106:
spritePointerDef SPRITE_AE, $80, 3, 3, 0, 0
SPRITEDEF_107:
spritePointerDef SPRITE_AF, $80, 3, 3, 0, 0
SPRITEDEF_108:
spritePointerDef SPRITE_B0, $80, 3, 3, 0, 0
SPRITEDEF_109:
spritePointerDef SPRITE_B1, $80, 3, 3, 0, 0
SPRITEDEF_10A:
spritePointerDef SPRITE_B2, $80, 3, 1, 0, 0
SPRITEDEF_10B:
spritePointerDef SPRITE_B3, $80, 3, 1, 0, 0
SPRITEDEF_10C:
spritePointerDef SPRITE_B4, $80, 3, 1, 0, 0
SPRITEDEF_10D:
spritePointerDef SPRITE_B5, $80, 3, 1, 0, 0
SPRITEDEF_10E:
spritePointerDef SPRITE_B6, $80, 3, 1, 0, 0
SPRITEDEF_10F:
spritePointerDef SPRITE_B7, $80, 3, 1, 0, 0
SPRITEDEF_110:
spritePointerDef SPRITE_B8, $80, 3, 1, 0, 0
SPRITEDEF_111:
spritePointerDef SPRITE_B9, $80, 3, 1, 0, 0
SPRITEDEF_112:
spritePointerDef SPRITE_BA, $80, 3, 3, 0, 0
SPRITEDEF_113:
spritePointerDef SPRITE_BB, $80, 3, 3, 0, 0
SPRITEDEF_114:
spritePointerDef SPRITE_BC, $80, 3, 3, 0, 0
SPRITEDEF_115:
spritePointerDef SPRITE_BD, $80, 3, 3, 0, 0
SPRITEDEF_116:
spritePointerDef SPRITE_BE, $80, 3, 3, 0, 0
SPRITEDEF_117:
spritePointerDef SPRITE_BF, $80, 3, 3, 0, 0
SPRITEDEF_118:
spritePointerDef SPRITE_C0, $80, 3, 3, 0, 0
SPRITEDEF_119:
spritePointerDef SPRITE_C1, $80, 3, 3, 0, 0
SPRITEDEF_11A:
spritePointerDef SPRITE_10, $80, 2, 2, 0, 0
SPRITEDEF_11B:
spritePointerDef SPRITE_11, $80, 2, 2, 0, 0
SPRITEDEF_11C:
spritePointerDef SPRITE_12, $80, 2, 2, 0, 0
SPRITEDEF_11D:
spritePointerDef SPRITE_13, $80, 2, 2, 0, 0
SPRITEDEF_11E:
spritePointerDef SPRITE_14, $80, 2, 2, 0, 0
SPRITEDEF_11F:
spritePointerDef SPRITE_15, $80, 2, 2, 0, 0
SPRITEDEF_120:
spritePointerDef SPRITE_16, $80, 2, 2, 0, 0
SPRITEDEF_121:
spritePointerDef SPRITE_17, $80, 2, 2, 0, 0
SPRITEDEF_122:
spritePointerDef SPRITE_CHARUP1, $A0, 1, 1, 0, 0
SPRITEDEF_123:
spritePointerDef SPRITE_CHARUP2, $A0, 1, 1, 0, 0
SPRITEDEF_124:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 1, 0, 0
SPRITEDEF_125:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 1, 0, 0
SPRITEDEF_126:
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 1, 0, 0
SPRITEDEF_127:
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 1, 0, 0
SPRITEDEF_128:
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 1, 0, 0
SPRITEDEF_129:
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 1, 0, 0
SPRITEDEF_12A:
spritePointerDef SPRITE_CHARUP1, $C0, 3, 3, 0, 0
SPRITEDEF_12B:
spritePointerDef SPRITE_CHARUP2, $C0, 3, 3, 0, 0
SPRITEDEF_12C:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 3, 3, 0, 0
SPRITEDEF_12D:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 3, 3, 0, 0
SPRITEDEF_12E:
spritePointerDef SPRITE_CHARDOWN1, $C0, 3, 3, 0, 0
SPRITEDEF_12F:
spritePointerDef SPRITE_CHARDOWN2, $C0, 3, 3, 0, 0
SPRITEDEF_130:
spritePointerDef SPRITE_CHARLEFT1, $C0, 3, 3, 0, 0
SPRITEDEF_131:
spritePointerDef SPRITE_CHARLEFT2, $C0, 3, 3, 0, 0
SPRITEDEF_132:
spritePointerDef SPRITE_CHARUP1, $88, 3, 3, 0, 0
SPRITEDEF_133:
spritePointerDef SPRITE_CHARUP2, $88, 3, 3, 0, 0
SPRITEDEF_134:
spritePointerDef SPRITE_CHARRIGHT1, $88, 3, 3, 0, 0
SPRITEDEF_135:
spritePointerDef SPRITE_CHARRIGHT2, $88, 3, 3, 0, 0
SPRITEDEF_136:
spritePointerDef SPRITE_CHARDOWN1, $88, 3, 3, 0, 0
SPRITEDEF_137:
spritePointerDef SPRITE_CHARDOWN2, $88, 3, 3, 0, 0
SPRITEDEF_138:
spritePointerDef SPRITE_CHARLEFT1, $88, 3, 3, 0, 0
SPRITEDEF_139:
spritePointerDef SPRITE_CHARLEFT2, $88, 3, 3, 0, 0
SPRITEDEF_13A:
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
SPRITEDEF_13B:
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
SPRITEDEF_13C:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
SPRITEDEF_13D:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
SPRITEDEF_13E:
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
SPRITEDEF_13F:
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
SPRITEDEF_140:
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
SPRITEDEF_141:
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0
SPRITEDEF_142:
spritePointerDef SPRITE_142, $A8, 1, 1, 0, 0
SPRITEDEF_143:
spritePointerDef SPRITE_10, $E0, 2, 2, 1, 0
SPRITEDEF_144:
spritePointerDef SPRITE_11, $E0, 2, 2, 1, 0
SPRITEDEF_145:
spritePointerDef SPRITE_12, $E0, 2, 2, 1, 0
SPRITEDEF_146:
spritePointerDef SPRITE_13, $E0, 2, 2, 1, 0
SPRITEDEF_147:
spritePointerDef SPRITE_14, $E0, 2, 2, 1, 0
SPRITEDEF_148:
spritePointerDef SPRITE_15, $E0, 2, 2, 1, 0
SPRITEDEF_149:
spritePointerDef SPRITE_16, $E0, 2, 2, 1, 0
SPRITEDEF_14A:
spritePointerDef SPRITE_17, $E0, 2, 2, 1, 0
SPRITEDEF_14B:
spritePointerDef SPRITE_10, $C8, 3, 3, 0, 0
SPRITEDEF_14C:
spritePointerDef SPRITE_11, $C8, 3, 3, 0, 0
SPRITEDEF_14D:
spritePointerDef SPRITE_12, $C8, 3, 3, 0, 0
SPRITEDEF_14E:
spritePointerDef SPRITE_13, $C8, 3, 3, 0, 0
SPRITEDEF_14F:
spritePointerDef SPRITE_14, $C8, 3, 3, 0, 0
SPRITEDEF_150:
spritePointerDef SPRITE_15, $C8, 3, 3, 0, 0
SPRITEDEF_151:
spritePointerDef SPRITE_16, $C8, 3, 3, 0, 0
SPRITEDEF_152:
spritePointerDef SPRITE_17, $C8, 3, 3, 0, 0
SPRITEDEF_153:
spritePointerDef SPRITE_60, $EC, 1, 1, 1, 0
SPRITEDEF_154:
spritePointerDef SPRITE_154, $E8, 3, 3, 0, 0
SPRITEDEF_155:
spritePointerDef SPRITE_155, $E8, 3, 3, 0, 0
SPRITEDEF_156:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0
SPRITEDEF_157:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0
SPRITEDEF_158:
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0
SPRITEDEF_159:
spritePointerDef SPRITE_142, $C0, 0, 0, 0, 0
SPRITEDEF_15A:
spritePointerDef SPRITE_CHARUP1, $80, 0, 0, 0, 0
SPRITEDEF_15B:
spritePointerDef SPRITE_CHARUP2, $80, 0, 0, 0, 0
SPRITEDEF_15C:
spritePointerDef SPRITE_CHARRIGHT1, $80, 0, 0, 0, 0
SPRITEDEF_15D:
spritePointerDef SPRITE_CHARRIGHT2, $80, 0, 0, 0, 0
SPRITEDEF_15E:
spritePointerDef SPRITE_CHARDOWN1, $80, 0, 0, 0, 0
SPRITEDEF_15F:
spritePointerDef SPRITE_CHARDOWN2, $80, 0, 0, 0, 0
SPRITEDEF_160:
spritePointerDef SPRITE_CHARLEFT1, $80, 0, 0, 0, 0
SPRITEDEF_161:
spritePointerDef SPRITE_CHARLEFT2, $80, 0, 0, 0, 0
SPRITEDEF_162:
spritePointerDef SPRITE_10, $A0, 1, 1, 0, 0
SPRITEDEF_163:
spritePointerDef SPRITE_11, $A0, 1, 1, 0, 0
SPRITEDEF_164:
spritePointerDef SPRITE_12, $A0, 1, 1, 0, 0
SPRITEDEF_165:
spritePointerDef SPRITE_13, $A0, 1, 1, 0, 0
SPRITEDEF_166:
spritePointerDef SPRITE_14, $A0, 1, 1, 0, 0
SPRITEDEF_167:
spritePointerDef SPRITE_15, $A0, 1, 1, 0, 0
SPRITEDEF_168:
spritePointerDef SPRITE_16, $A0, 1, 1, 0, 0
SPRITEDEF_169:
spritePointerDef SPRITE_17, $A0, 1, 1, 0, 0

SPRITEDEF_16A:
spritePointerDef SPRITE_CHARUP1, $C0, 2, 2, 0, 0
SPRITEDEF_16B:
spritePointerDef SPRITE_CHARUP2, $C0, 2, 2, 0, 0
SPRITEDEF_16C:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 2, 2, 0, 0
SPRITEDEF_16D:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 2, 2, 0, 0
SPRITEDEF_16E:
spritePointerDef SPRITE_CHARDOWN1, $C0, 2, 2, 0, 0
SPRITEDEF_16F:
spritePointerDef SPRITE_CHARDOWN2, $C0, 2, 2, 0, 0
SPRITEDEF_170:
spritePointerDef SPRITE_CHARLEFT1, $C0, 2, 2, 0, 0
SPRITEDEF_171:
spritePointerDef SPRITE_CHARLEFT2, $C0, 2, 2, 0, 0

SPRITEDEF_172:
spritePointerDef SPRITE_CHARUP1, $E0, 2, 1, 0, 0
SPRITEDEF_173:
spritePointerDef SPRITE_CHARUP2, $E0, 2, 1, 0, 0
SPRITEDEF_174:
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 1, 0, 0
SPRITEDEF_175:
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 1, 0, 0
SPRITEDEF_176:
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 1, 0, 0
SPRITEDEF_177:
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 1, 0, 0
SPRITEDEF_178:
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 1, 0, 0
SPRITEDEF_179:
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 1, 0, 0
SPRITEDEF_17A:
spritePointerDef SPRITE_17A, $88, 0, 0, 0, 0

SPRITEDEF_CHARDOGUP1:
spritePointerDef SPRITE_CHARUP1, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGUP2:
spritePointerDef SPRITE_CHARUP2, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGRIGHT1:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGRIGHT2:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGDOWN1:
spritePointerDef SPRITE_CHARDOWN1, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGDOWN2:
spritePointerDef SPRITE_CHARDOWN2, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGLEFT1:
spritePointerDef SPRITE_CHARLEFT1, $A8, 0, 0, 0, 0
SPRITEDEF_CHARDOGLEFT2:
spritePointerDef SPRITE_CHARLEFT2, $A8, 0, 0, 0, 0

SPRITEDEF_183:
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
SPRITEDEF_184:
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
SPRITEDEF_185:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
SPRITEDEF_186:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
SPRITEDEF_187:
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
SPRITEDEF_188:
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
SPRITEDEF_189:
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
SPRITEDEF_18A:
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0
SPRITEDEF_18B:
spritePointerDef SPRITE_CHARUP1, $E8, 2, 2, 0, 0
SPRITEDEF_18C:
spritePointerDef SPRITE_CHARUP2, $E8, 2, 2, 0, 0
SPRITEDEF_18D:
spritePointerDef SPRITE_CHARRIGHT1, $E8, 2, 2, 0, 0
SPRITEDEF_18E:
spritePointerDef SPRITE_CHARRIGHT2, $E8, 2, 2, 0, 0
SPRITEDEF_18F:
spritePointerDef SPRITE_CHARDOWN1, $E8, 2, 2, 0, 0
SPRITEDEF_190:
spritePointerDef SPRITE_CHARDOWN2, $E8, 2, 2, 0, 0
SPRITEDEF_191:
spritePointerDef SPRITE_CHARLEFT1, $E8, 2, 2, 0, 0
SPRITEDEF_192:
spritePointerDef SPRITE_CHARLEFT2, $E8, 2, 2, 0, 0
SPRITEDEF_193:
spritePointerDef SPRITE_193, $80, 0, 0, 0, 0
SPRITEDEF_194:
spritePointerDef SPRITE_194, $80, 0, 0, 0, 0
SPRITEDEF_195:
spritePointerDef SPRITE_195, $80, 0, 0, 0, 0
SPRITEDEF_196:
spritePointerDef SPRITE_196, $80, 0, 0, 0, 0
SPRITEDEF_197:
spritePointerDef SPRITE_197, $80, 0, 0, 0, 0
SPRITEDEF_198:
spritePointerDef SPRITE_198, $80, 0, 0, 0, 0
SPRITEDEF_199:
spritePointerDef SPRITE_199, $80, 0, 0, 0, 0
SPRITEDEF_19A:
spritePointerDef SPRITE_19A, $80, 0, 0, 0, 0
SPRITEDEF_19B:
spritePointerDef SPRITE_142, $C0, 3, 3, 0, 0
SPRITEDEF_19C:
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0
SPRITEDEF_19D:
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0
SPRITEDEF_19E:
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0
SPRITEDEF_19F:
spritePointerDef SPRITE_CHARUP1, $E8, 1, 1, 0, 0
SPRITEDEF_1A0:
spritePointerDef SPRITE_CHARUP2, $E8, 1, 1, 0, 0
SPRITEDEF_1A1:
spritePointerDef SPRITE_CHARRIGHT1, $E8, 1, 1, 0, 0
SPRITEDEF_1A2:
spritePointerDef SPRITE_CHARRIGHT2, $E8, 1, 1, 0, 0
SPRITEDEF_1A3:
spritePointerDef SPRITE_CHARDOWN1, $E8, 1, 1, 0, 0
SPRITEDEF_1A4:
spritePointerDef SPRITE_CHARDOWN2, $E8, 1, 1, 0, 0
SPRITEDEF_1A5:
spritePointerDef SPRITE_CHARLEFT1, $E8, 1, 1, 0, 0
SPRITEDEF_1A6:
spritePointerDef SPRITE_CHARLEFT2, $E8, 1, 1, 0, 0
SPRITEDEF_1A7:
spritePointerDef SPRITE_10, $80, 3, 3, 0, 0
SPRITEDEF_1A8:
spritePointerDef SPRITE_11, $80, 3, 3, 0, 0
SPRITEDEF_1A9:
spritePointerDef SPRITE_12, $80, 3, 3, 0, 0
SPRITEDEF_1AA:
spritePointerDef SPRITE_13, $80, 3, 3, 0, 0
SPRITEDEF_1AB:
spritePointerDef SPRITE_14, $80, 3, 3, 0, 0
SPRITEDEF_1AC:
spritePointerDef SPRITE_15, $80, 3, 3, 0, 0
SPRITEDEF_1AD:
spritePointerDef SPRITE_16, $80, 3, 3, 0, 0
SPRITEDEF_1AE:
spritePointerDef SPRITE_17, $80, 3, 3, 0, 0
SPRITEDEF_1AF:
spritePointerDef SPRITE_CHARUP1, $A8, 1, 1, 0, 0
SPRITEDEF_1B0:
spritePointerDef SPRITE_CHARUP2, $A8, 1, 1, 0, 0
SPRITEDEF_1B1:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 1, 1, 0, 0
SPRITEDEF_1B2:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 1, 1, 0, 0
SPRITEDEF_1B3:
spritePointerDef SPRITE_CHARDOWN1, $A8, 1, 1, 0, 0
SPRITEDEF_1B4:
spritePointerDef SPRITE_CHARDOWN2, $A8, 1, 1, 0, 0
SPRITEDEF_1B5:
spritePointerDef SPRITE_CHARLEFT1, $A8, 1, 1, 0, 0
SPRITEDEF_1B6:
spritePointerDef SPRITE_CHARLEFT2, $A8, 1, 1, 0, 0
SPRITEDEF_1B7:
spritePointerDef SPRITE_CHARUP1, $A0, 1, 1, 0, 0
SPRITEDEF_1B8:
spritePointerDef SPRITE_CHARUP2, $A0, 1, 1, 0, 0
SPRITEDEF_1B9:
spritePointerDef SPRITE_CHARRIGHT1, $A0, 1, 1, 0, 0
SPRITEDEF_1BA:
spritePointerDef SPRITE_CHARRIGHT2, $A0, 1, 1, 0, 0
SPRITEDEF_1BB:
spritePointerDef SPRITE_CHARDOWN1, $A0, 1, 1, 0, 0
SPRITEDEF_1BC:
spritePointerDef SPRITE_CHARDOWN2, $A0, 1, 1, 0, 0
SPRITEDEF_1BD:
spritePointerDef SPRITE_CHARLEFT1, $A0, 1, 1, 0, 0
SPRITEDEF_1BE:
spritePointerDef SPRITE_CHARLEFT2, $A0, 1, 1, 0, 0
SPRITEDEF_1BF:
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
SPRITEDEF_1C0:
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
SPRITEDEF_1C1:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
SPRITEDEF_1C2:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
SPRITEDEF_1C3:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
SPRITEDEF_1C4:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
SPRITEDEF_1C5:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
SPRITEDEF_1C6:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0
SPRITEDEF_1C7:
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
SPRITEDEF_1C8:
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
SPRITEDEF_1C9:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
SPRITEDEF_1CA:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
SPRITEDEF_1CB:
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
SPRITEDEF_1CC:
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
SPRITEDEF_1CD:
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
SPRITEDEF_1CE:
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0
SPRITEDEF_1CF:
spritePointerDef SPRITE_CHARUP1, $E0, 2, 2, 0, 0
SPRITEDEF_1D0:
spritePointerDef SPRITE_CHARUP2, $E0, 2, 2, 0, 0
SPRITEDEF_1D1:
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 2, 0, 0
SPRITEDEF_1D2:
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 2, 0, 0
SPRITEDEF_1D3:
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 2, 0, 0
SPRITEDEF_1D4:
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 2, 0, 0
SPRITEDEF_1D5:
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 2, 0, 0
SPRITEDEF_1D6:
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 2, 0, 0
SPRITEDEF_1D7:
spritePointerDef SPRITE_CHARUP1, $C0, 1, 1, 0, 0
SPRITEDEF_1D8:
spritePointerDef SPRITE_CHARUP2, $C0, 1, 1, 0, 0
SPRITEDEF_1D9:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 1, 1, 0, 0
SPRITEDEF_1DA:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 1, 1, 0, 0
SPRITEDEF_1DB:
spritePointerDef SPRITE_CHARDOWN1, $C0, 1, 1, 0, 0
SPRITEDEF_1DC:
spritePointerDef SPRITE_CHARDOWN2, $C0, 1, 1, 0, 0
SPRITEDEF_1DD:
spritePointerDef SPRITE_CHARLEFT1, $C0, 1, 1, 0, 0
SPRITEDEF_1DE:
spritePointerDef SPRITE_CHARLEFT2, $C0, 1, 1, 0, 0
SPRITEDEF_1DF:
spritePointerDef SPRITE_1DF, $80, 2, 1, 0, 3
SPRITEDEF_1E0:
spritePointerDef SPRITE_1DF, $80, 2, 1, 0, 3
SPRITEDEF_1E1:
spritePointerDef SPRITE_AA, $80, 1, 1, 0, 0
SPRITEDEF_1E2:
spritePointerDef SPRITE_AB, $80, 1, 1, 0, 0
SPRITEDEF_1E3:
spritePointerDef SPRITE_AC, $80, 1, 1, 0, 0
SPRITEDEF_1E4:
spritePointerDef SPRITE_AD, $80, 1, 1, 0, 0
SPRITEDEF_1E5:
spritePointerDef SPRITE_AE, $80, 1, 1, 0, 0
SPRITEDEF_1E6:
spritePointerDef SPRITE_AF, $80, 1, 1, 0, 0
SPRITEDEF_1E7:
spritePointerDef SPRITE_B0, $80, 1, 1, 0, 0
SPRITEDEF_1E8:
spritePointerDef SPRITE_B1, $80, 1, 1, 0, 0
SPRITEDEF_1E9:
spritePointerDef SPRITE_CHARUP1, $80, 3, 3, 0, 0
SPRITEDEF_1EA:
spritePointerDef SPRITE_CHARUP2, $80, 3, 3, 0, 0
SPRITEDEF_1EB:
spritePointerDef SPRITE_CHARRIGHT1, $80, 3, 3, 0, 0
SPRITEDEF_1EC:
spritePointerDef SPRITE_CHARRIGHT2, $80, 3, 3, 0, 0
SPRITEDEF_1ED:
spritePointerDef SPRITE_CHARDOWN1, $80, 3, 3, 0, 0
SPRITEDEF_1EE:
spritePointerDef SPRITE_CHARDOWN2, $80, 3, 3, 0, 0
SPRITEDEF_1EF:
spritePointerDef SPRITE_CHARLEFT1, $80, 3, 3, 0, 0
SPRITEDEF_1F0:
spritePointerDef SPRITE_CHARLEFT2, $80, 3, 3, 0, 0
SPRITEDEF_1F1:
spritePointerDef SPRITE_10, $C0, 1, 1, 0, 0
SPRITEDEF_1F2:
spritePointerDef SPRITE_11, $C0, 1, 1, 0, 0
SPRITEDEF_1F3:
spritePointerDef SPRITE_12, $C0, 1, 1, 0, 0
SPRITEDEF_1F4:
spritePointerDef SPRITE_13, $C0, 1, 1, 0, 0
SPRITEDEF_1F5:
spritePointerDef SPRITE_14, $C0, 1, 1, 0, 0
SPRITEDEF_1F6:
spritePointerDef SPRITE_15, $C0, 1, 1, 0, 0
SPRITEDEF_1F7:
spritePointerDef SPRITE_16, $C0, 1, 1, 0, 0
SPRITEDEF_1F8:
spritePointerDef SPRITE_17, $C0, 1, 1, 0, 0
SPRITEDEF_1F9:
spritePointerDef SPRITE_CHARUP1, $E0, 2, 2, 0, 0
SPRITEDEF_1FA:
spritePointerDef SPRITE_CHARUP2, $E0, 2, 2, 0, 0
SPRITEDEF_1FB:
spritePointerDef SPRITE_CHARRIGHT1, $E0, 2, 2, 0, 0
SPRITEDEF_1FC:
spritePointerDef SPRITE_CHARRIGHT2, $E0, 2, 2, 0, 0
SPRITEDEF_1FD:
spritePointerDef SPRITE_CHARDOWN1, $E0, 2, 2, 0, 0
SPRITEDEF_1FE:
spritePointerDef SPRITE_CHARDOWN2, $E0, 2, 2, 0, 0
SPRITEDEF_1FF:
spritePointerDef SPRITE_CHARLEFT1, $E0, 2, 2, 0, 0
SPRITEDEF_200:
spritePointerDef SPRITE_CHARLEFT2, $E0, 2, 2, 0, 0
SPRITEDEF_201:
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
SPRITEDEF_202:
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
SPRITEDEF_203:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
SPRITEDEF_204:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
SPRITEDEF_205:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
SPRITEDEF_206:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
SPRITEDEF_207:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
SPRITEDEF_208:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0
SPRITEDEF_209:
spritePointerDef SPRITE_10, $A8, 2, 2, 0, 0
SPRITEDEF_20A:
spritePointerDef SPRITE_11, $A8, 2, 2, 0, 0
SPRITEDEF_20B:
spritePointerDef SPRITE_12, $A8, 2, 2, 0, 0
SPRITEDEF_20C:
spritePointerDef SPRITE_13, $A8, 2, 2, 0, 0
SPRITEDEF_20D:
spritePointerDef SPRITE_14, $A8, 2, 2, 0, 0
SPRITEDEF_20E:
spritePointerDef SPRITE_15, $A8, 2, 2, 0, 0
SPRITEDEF_20F:
spritePointerDef SPRITE_16, $A8, 2, 2, 0, 0
SPRITEDEF_210:
spritePointerDef SPRITE_17, $A8, 2, 2, 0, 0
SPRITEDEF_211:
spritePointerDef SPRITE_CHARUP1, $C8, 0, 0, 0, 0
SPRITEDEF_212:
spritePointerDef SPRITE_CHARUP2, $C8, 0, 0, 0, 0
SPRITEDEF_213:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 0, 0, 0, 0
SPRITEDEF_214:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 0, 0, 0, 0
SPRITEDEF_215:
spritePointerDef SPRITE_CHARDOWN1, $C8, 0, 0, 0, 0
SPRITEDEF_216:
spritePointerDef SPRITE_CHARDOWN2, $C8, 0, 0, 0, 0
SPRITEDEF_217:
spritePointerDef SPRITE_CHARLEFT1, $C8, 0, 0, 0, 0
SPRITEDEF_218:
spritePointerDef SPRITE_CHARLEFT2, $C8, 0, 0, 0, 0
SPRITEDEF_219:
spritePointerDef SPRITE_154, $E8, 3, 3, 0, 0
SPRITEDEF_21A:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0
SPRITEDEF_21B:
spritePointerDef SPRITE_154, $EC, 0, 0, 0, 0
SPRITEDEF_21C:
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0
SPRITEDEF_21D:
spritePointerDef SPRITE_60, $EE, 0, 0, 0, 0
SPRITEDEF_21E:
spritePointerDef SPRITE_193, $80, 0, 0, 0, 0
SPRITEDEF_21F:
spritePointerDef SPRITE_194, $80, 0, 0, 0, 0
SPRITEDEF_220:
spritePointerDef SPRITE_195, $80, 0, 0, 0, 0
SPRITEDEF_221:
spritePointerDef SPRITE_196, $80, 0, 0, 0, 0
SPRITEDEF_222:
spritePointerDef SPRITE_197, $80, 0, 0, 0, 0
SPRITEDEF_223:
spritePointerDef SPRITE_198, $80, 0, 0, 0, 0
SPRITEDEF_224:
spritePointerDef SPRITE_199, $80, 0, 0, 0, 0
SPRITEDEF_225:
spritePointerDef SPRITE_19A, $80, 0, 0, 0, 0
SPRITEDEF_226:
spritePointerDef SPRITE_142, $C0, 2, 2, 0, 5
SPRITEDEF_227:
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0
SPRITEDEF_228:
spritePointerDef SPRITE_CHARUP1, $80, 1, 3, 0, 0
SPRITEDEF_229:
spritePointerDef SPRITE_CHARUP2, $80, 1, 3, 0, 0
SPRITEDEF_22A:
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 3, 0, 0
SPRITEDEF_22B:
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 3, 0, 0
SPRITEDEF_22C:
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 3, 0, 0
SPRITEDEF_22D:
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 3, 0, 0
SPRITEDEF_22E:
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 3, 0, 0
SPRITEDEF_22F:
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 3, 0, 0
SPRITEDEF_230:
spritePointerDef SPRITE_CHARUP1, $88, 2, 2, 0, 0
SPRITEDEF_231:
spritePointerDef SPRITE_CHARUP2, $88, 2, 2, 0, 0
SPRITEDEF_232:
spritePointerDef SPRITE_CHARRIGHT1, $88, 2, 2, 0, 0
SPRITEDEF_233:
spritePointerDef SPRITE_CHARRIGHT2, $88, 2, 2, 0, 0
SPRITEDEF_234:
spritePointerDef SPRITE_CHARDOWN1, $88, 2, 2, 0, 0
SPRITEDEF_235:
spritePointerDef SPRITE_CHARDOWN2, $88, 2, 2, 0, 0
SPRITEDEF_236:
spritePointerDef SPRITE_CHARLEFT1, $88, 2, 2, 0, 0
SPRITEDEF_237:
spritePointerDef SPRITE_CHARLEFT2, $88, 2, 2, 0, 0
SPRITEDEF_238:
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
SPRITEDEF_239:
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
SPRITEDEF_23A:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
SPRITEDEF_23B:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
SPRITEDEF_23C:
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
SPRITEDEF_23D:
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
SPRITEDEF_23E:
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
SPRITEDEF_23F:
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0
SPRITEDEF_240:
spritePointerDef SPRITE_CHARUP1, $80, 1, 1, 0, 0
SPRITEDEF_241:
spritePointerDef SPRITE_CHARUP2, $80, 1, 1, 0, 0
SPRITEDEF_242:
spritePointerDef SPRITE_CHARRIGHT1, $80, 1, 1, 0, 0
SPRITEDEF_243:
spritePointerDef SPRITE_CHARRIGHT2, $80, 1, 1, 0, 0
SPRITEDEF_244:
spritePointerDef SPRITE_CHARDOWN1, $80, 1, 1, 0, 0
SPRITEDEF_245:
spritePointerDef SPRITE_CHARDOWN2, $80, 1, 1, 0, 0
SPRITEDEF_246:
spritePointerDef SPRITE_CHARLEFT1, $80, 1, 1, 0, 0
SPRITEDEF_247:
spritePointerDef SPRITE_CHARLEFT2, $80, 1, 1, 0, 0

SPRITEDEF_248:
spritePointerDef SPRITE_CHARUP1, $C0, 2, 2, 0, 0
SPRITEDEF_249:
spritePointerDef SPRITE_CHARUP2, $C0, 2, 2, 0, 0
SPRITEDEF_24A:
spritePointerDef SPRITE_CHARRIGHT1, $C0, 2, 2, 0, 0
SPRITEDEF_24B:
spritePointerDef SPRITE_CHARRIGHT2, $C0, 2, 2, 0, 0
SPRITEDEF_24C:
spritePointerDef SPRITE_CHARDOWN1, $C0, 2, 2, 0, 0
SPRITEDEF_24D:
spritePointerDef SPRITE_CHARDOWN2, $C0, 2, 2, 0, 0
SPRITEDEF_24E:
spritePointerDef SPRITE_CHARLEFT1, $C0, 2, 2, 0, 0
SPRITEDEF_24F:
spritePointerDef SPRITE_CHARLEFT2, $C0, 2, 2, 0, 0

SPRITEDEF_250:
spritePointerDef SPRITE_60, $88, 3, 3, 0, 0
SPRITEDEF_251:
spritePointerDef SPRITE_CHARUP1, $A8, 3, 3, 0, 0
SPRITEDEF_252:
spritePointerDef SPRITE_CHARUP2, $A8, 3, 3, 0, 0
SPRITEDEF_253:
spritePointerDef SPRITE_CHARRIGHT1, $A8, 3, 3, 0, 0
SPRITEDEF_254:
spritePointerDef SPRITE_CHARRIGHT2, $A8, 3, 3, 0, 0
SPRITEDEF_255:
spritePointerDef SPRITE_CHARDOWN1, $A8, 3, 3, 0, 0
SPRITEDEF_256:
spritePointerDef SPRITE_CHARDOWN2, $A8, 3, 3, 0, 0
SPRITEDEF_257:
spritePointerDef SPRITE_CHARLEFT1, $A8, 3, 3, 0, 0
SPRITEDEF_258:
spritePointerDef SPRITE_CHARLEFT2, $A8, 3, 3, 0, 0
SPRITEDEF_259:
spritePointerDef SPRITE_CHARUP1, $C8, 3, 3, 0, 0
SPRITEDEF_25A:
spritePointerDef SPRITE_CHARUP2, $C8, 3, 3, 0, 0
SPRITEDEF_25B:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 3, 3, 0, 0
SPRITEDEF_25C:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 3, 3, 0, 0
SPRITEDEF_25D:
spritePointerDef SPRITE_CHARDOWN1, $C8, 3, 3, 0, 0
SPRITEDEF_25E:
spritePointerDef SPRITE_CHARDOWN2, $C8, 3, 3, 0, 0
SPRITEDEF_25F:
spritePointerDef SPRITE_CHARLEFT1, $C8, 3, 3, 0, 0
SPRITEDEF_260:
spritePointerDef SPRITE_CHARLEFT2, $C8, 3, 3, 0, 0
SPRITEDEF_261:
spritePointerDef SPRITE_60, $E8, 0, 0, 0, 0
SPRITEDEF_262:
spritePointerDef SPRITE_60, $EA, 0, 0, 0, 0
SPRITEDEF_263:
spritePointerDef SPRITE_263, $0, 1, 1, 0, 0
SPRITEDEF_264:
spritePointerDef SPRITE_263, $0, 1, 1, 0, 0
SPRITEDEF_265:
spritePointerDef SPRITE_265, $0, 1, 1, 0, 0
SPRITEDEF_266:
spritePointerDef SPRITE_265, $0, 1, 1, 0, 0
SPRITEDEF_267:
spritePointerDef SPRITE_267, $0, 1, 1, 0, 0
SPRITEDEF_268:
spritePointerDef SPRITE_268, $0, 1, 1, 0, 0
SPRITEDEF_269:
spritePointerDef SPRITE_269, $E0, 1, 1, 0, 0
SPRITEDEF_26A:
spritePointerDef SPRITE_269, $E0, 1, 1, 0, 0
SPRITEDEF_26B:
spritePointerDef SPRITE_26B, $E0, 1, 1, 0, 0
SPRITEDEF_26C:
spritePointerDef SPRITE_26B, $E0, 1, 1, 0, 0
SPRITEDEF_26D:
spritePointerDef SPRITE_26D, $E0, 1, 1, 0, 0
SPRITEDEF_26E:
spritePointerDef SPRITE_26D, $E0, 1, 1, 0, 0
SPRITEDEF_26F:
spritePointerDef SPRITE_26F, $E0, 1, 1, 0, 0
SPRITEDEF_270:
spritePointerDef SPRITE_26F, $E0, 1, 1, 0, 0
SPRITEDEF_271:
.ifdef VER_JP
spritePointerDef SPRITE_142, $A8, 5, 0, 0, 0
.else
spritePointerDef SPRITE_142, $A8, 0, 0, 0, 0
.endif
SPRITEDEF_272:
spritePointerDef SPRITE_60, $EC, 1, 1, 0, 0
SPRITEDEF_273:
spritePointerDef SPRITE_60, $EE, 1, 1, 0, 0
SPRITEDEF_274:
spritePointerDef SPRITE_60, $8A, 3, 3, 0, 0
SPRITEDEF_275:
spritePointerDef SPRITE_60, $8C, 1, 1, 0, 0
SPRITEDEF_276:
spritePointerDef SPRITE_60, $8E, 3, 3, 0, 0
SPRITEDEF_277:
spritePointerDef SPRITE_CHARUP1, $C8, 2, 2, 0, 0
SPRITEDEF_278:
spritePointerDef SPRITE_CHARUP2, $C8, 2, 2, 0, 0
SPRITEDEF_279:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 2, 2, 0, 0
SPRITEDEF_27A:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 2, 2, 0, 0
SPRITEDEF_27B:
spritePointerDef SPRITE_CHARDOWN1, $C8, 2, 2, 0, 0
SPRITEDEF_27C:
spritePointerDef SPRITE_CHARDOWN2, $C8, 2, 2, 0, 0
SPRITEDEF_27D:
spritePointerDef SPRITE_CHARLEFT1, $C8, 2, 2, 0, 0
SPRITEDEF_27E:
spritePointerDef SPRITE_CHARLEFT2, $C8, 2, 2, 0, 0
SPRITEDEF_27F:
spritePointerDef SPRITE_CHARUP1, $C8, 1, 1, 0, 0
SPRITEDEF_280:
spritePointerDef SPRITE_CHARUP2, $C8, 1, 1, 0, 0
SPRITEDEF_281:
spritePointerDef SPRITE_CHARRIGHT1, $C8, 1, 1, 0, 0
SPRITEDEF_282:
spritePointerDef SPRITE_CHARRIGHT2, $C8, 1, 1, 0, 0
SPRITEDEF_283:
spritePointerDef SPRITE_CHARDOWN1, $C8, 1, 1, 0, 0
SPRITEDEF_284:
spritePointerDef SPRITE_CHARDOWN2, $C8, 1, 1, 0, 0
SPRITEDEF_285:
spritePointerDef SPRITE_CHARLEFT1, $C8, 1, 1, 0, 0
SPRITEDEF_286:
spritePointerDef SPRITE_CHARLEFT2, $C8, 1, 1, 0, 0
SPRITEDEF_287:
spritePointerDef SPRITE_60, $8E, 2, 2, 0, 0
SPRITEDEF_288:
spritePointerDef SPRITE_60, $8E, 1, 1, 0, 0
SPRITEDEF_289:
spritePointerDef SPRITE_60, $8C, 3, 3, 0, 0
SPRITEDEF_28A:
spritePointerDef SPRITE_28A, $80, 0, 0, 0, 0
SPRITEDEF_28B:
spritePointerDef SPRITE_28B, $80, 0, 0, 0, 0
SPRITEDEF_28C:
spritePointerDef SPRITE_28A, $80, 0, 0, 0, 0
SPRITEDEF_28D:
spritePointerDef SPRITE_28D, $80, 0, 0, 0, 0
SPRITEDEF_28E:
spritePointerDef SPRITE_28E, $80, 0, 0, 0, 0
SPRITEDEF_28F:
spritePointerDef SPRITE_28F, $80, 0, 0, 0, 0
SPRITEDEF_290:
spritePointerDef SPRITE_28E, $80, 0, 0, 0, 0
SPRITEDEF_291:
spritePointerDef SPRITE_291, $80, 0, 0, 0, 0
SPRITEDEF_292:
spritePointerDef SPRITE_292, $80, 1, 1, 0, 0
SPRITEDEF_293:
spritePointerDef SPRITE_293, $80, 1, 0, 0, 0
SPRITEDEF_294:
spritePointerDef SPRITE_293, $80, 1, 0, 0, 0
SPRITEDEF_295:
spritePointerDef SPRITE_295, $80, 1, 1, 0, 0
SPRITEDEF_296:
spritePointerDef SPRITE_296, $80, 1, 1, 0, 0
SPRITEDEF_297:
spritePointerDef SPRITE_297, $80, 1, 1, 0, 0
SPRITEDEF_298:
spritePointerDef SPRITE_298, $80, 1, 1, 0, 0
SPRITEDEF_299:
spritePointerDef SPRITE_299, $80, 1, 1, 0, 0
SPRITEDEF_29A:
spritePointerDef SPRITE_29A, $80, 1, 1, 0, 0
SPRITEDEF_29B:
spritePointerDef SPRITE_29B, $80, 1, 1, 0, 0
SPRITEDEF_29C:
spritePointerDef SPRITE_29C, $80, 1, 1, 0, 0
SPRITEDEF_29D:
spritePointerDef SPRITE_295, $80, 0, 0, 0, 0
SPRITEDEF_29E:
spritePointerDef SPRITE_296, $80, 0, 0, 0, 0
SPRITEDEF_29F:
spritePointerDef SPRITE_297, $80, 0, 0, 0, 0
SPRITEDEF_2A0:
spritePointerDef SPRITE_298, $80, 0, 0, 0, 0
SPRITEDEF_2A1:
spritePointerDef SPRITE_299, $80, 0, 0, 0, 0
SPRITEDEF_2A2:
spritePointerDef SPRITE_29A, $80, 0, 0, 0, 0
SPRITEDEF_2A3:
spritePointerDef SPRITE_29B, $80, 0, 0, 0, 0
SPRITEDEF_2A4:
spritePointerDef SPRITE_29C, $80, 0, 0, 0, 0
SPRITEDEF_2A5:
spritePointerDef SPRITE_295, $80, 3, 3, 0, 0
SPRITEDEF_2A6:
spritePointerDef SPRITE_296, $80, 3, 3, 0, 0
SPRITEDEF_2A7:
spritePointerDef SPRITE_297, $80, 3, 3, 0, 0
SPRITEDEF_2A8:
spritePointerDef SPRITE_298, $80, 3, 3, 0, 0
SPRITEDEF_2A9:
spritePointerDef SPRITE_299, $80, 3, 3, 0, 0
SPRITEDEF_2AA:
spritePointerDef SPRITE_29A, $80, 3, 3, 0, 0
SPRITEDEF_2AB:
spritePointerDef SPRITE_29B, $80, 3, 3, 0, 0
SPRITEDEF_2AC:
spritePointerDef SPRITE_29C, $80, 3, 3, 0, 0
SPRITEDEF_2AD:
spritePointerDef SPRITE_2AD, $0, 0, 0, 0, 0
SPRITEDEF_2AE:
spritePointerDef SPRITE_2AD, $0, 0, 0, 0, 0
SPRITEDEF_2AF:
spritePointerDef SPRITE_2AF, $0, 0, 0, 0, 0
SPRITEDEF_2B0:
spritePointerDef SPRITE_2AF, $0, 0, 0, 0, 0
SPRITEDEF_2B1:
spritePointerDef SPRITE_2B1, $0, 0, 0, 0, 0
SPRITEDEF_2B2:
spritePointerDef SPRITE_2B1, $0, 0, 0, 0, 0
SPRITEDEF_2B3:
spritePointerDef SPRITE_2B3, $0, 0, 0, 0, 0
SPRITEDEF_2B4:
spritePointerDef SPRITE_2B3, $0, 0, 0, 0, 0
SPRITEDEF_2B5:
spritePointerDef SPRITE_CHARUP1, $88, 1, 1, 0, 0
SPRITEDEF_2B6:
spritePointerDef SPRITE_CHARUP2, $88, 1, 1, 0, 0
SPRITEDEF_2B7:
spritePointerDef SPRITE_CHARRIGHT1, $88, 1, 1, 0, 0
SPRITEDEF_2B8:
spritePointerDef SPRITE_CHARRIGHT2, $88, 1, 1, 0, 0
SPRITEDEF_2B9:
spritePointerDef SPRITE_CHARDOWN1, $88, 1, 1, 0, 0
SPRITEDEF_2BA:
spritePointerDef SPRITE_CHARDOWN2, $88, 1, 1, 0, 0
SPRITEDEF_2BB:
spritePointerDef SPRITE_CHARLEFT1, $88, 1, 1, 0, 0
SPRITEDEF_2BC:
spritePointerDef SPRITE_CHARLEFT2, $88, 1, 1, 0, 0
SPRITEDEF_2BD:
spritePointerDef SPRITE_60, $C6, 3, 3, 0, 0
SPRITEDEF_2BE:
spritePointerDef SPRITE_60, $C6, 1, 1, 1, 0
SPRITEDEF_2BF:
spritePointerDef SPRITE_2BF, $80, 1, 1, 1, 2
SPRITEDEF_2C0:
spritePointerDef SPRITE_2C0, $80, 1, 1, 1, 2
SPRITEDEF_2C1:
spritePointerDef SPRITE_2C1, $80, 1, 1, 1, 2
SPRITEDEF_2C2:
spritePointerDef SPRITE_2C2, $80, 1, 1, 1, 2
SPRITEDEF_2C3:
spritePointerDef SPRITE_2C3, $80, 1, 1, 1, 2
SPRITEDEF_2C4:
spritePointerDef SPRITE_2C4, $80, 1, 1, 1, 2
SPRITEDEF_2C5:
spritePointerDef SPRITE_2C5, $80, 1, 1, 1, 2
SPRITEDEF_2C6:
spritePointerDef SPRITE_2C6, $80, 1, 1, 1, 2
SPRITEDEF_2C7:
spritePointerDef SPRITE_2C7, $E0, 0, 0, 0, 0
SPRITEDEF_2C8:
spritePointerDef SPRITE_2C8, $E0, 0, 0, 0, 0
SPRITEDEF_2C9:
spritePointerDef SPRITE_2C9, $E0, 0, 0, 0, 0
SPRITEDEF_2CA:
spritePointerDef SPRITE_2CA, $E0, 0, 0, 0, 0
SPRITEDEF_2CB:
spritePointerDef SPRITE_2CB, $E0, 0, 0, 0, 0
SPRITEDEF_2CC:
spritePointerDef SPRITE_2CC, $E0, 0, 0, 0, 0
SPRITEDEF_2CD:
spritePointerDef SPRITE_2CD, $E0, 0, 0, 0, 0
SPRITEDEF_2CE:
spritePointerDef SPRITE_2CE, $E0, 0, 0, 0, 0
SPRITEDEF_2CF:
spritePointerDef SPRITE_2C7, $A0, 3, 3, 1, 7
SPRITEDEF_2D0:
spritePointerDef SPRITE_2C8, $A0, 3, 3, 1, 7
SPRITEDEF_2D1:
spritePointerDef SPRITE_2C9, $A0, 3, 3, 1, 7
SPRITEDEF_2D2:
spritePointerDef SPRITE_2CA, $A0, 3, 3, 1, 7
SPRITEDEF_2D3:
spritePointerDef SPRITE_2CB, $A0, 3, 3, 1, 7
SPRITEDEF_2D4:
spritePointerDef SPRITE_2CC, $A0, 3, 3, 1, 7
SPRITEDEF_2D5:
spritePointerDef SPRITE_2CD, $A0, 3, 3, 1, 7
SPRITEDEF_2D6:
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
spriteTile $CC, $96, 0, 1, 0, 0, 0, $00
spriteTile $CC, $96, 0, 2, 0, 0, 0, $00
spriteTile $CC, $96, 0, 3, 0, 0, 0, $00
spriteTile $CC, $96, 0, 0, 0, 1, 0, $00
spriteTile $CC, $96, 0, 1, 0, 1, 0, $00
spriteTile $CC, $96, 0, 2, 0, 1, 0, $00
spriteTile $CC, $96, 0, 3, 0, 1, 0, $00
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
spriteTile $18, $97, 1, 3, 1, 1, 0, $00
spriteTile $18, $97, 2, 3, 1, 1, 0, $00
spriteTile $30, $97, 0, 0, 0, 0, 0, $00
spriteTile $00, $00, 0, 4, 1, 0, 0, $00
spriteTile $08, $00, 0, 4, 1, 0, 0, $00
spriteTile $10, $00, 0, 4, 1, 0, 0, $00
spriteTile $18, $00, 0, 4, 1, 0, 0, $00
spriteTile $20, $00, 0, 4, 1, 0, 0, $00
spriteTile $28, $00, 0, 4, 1, 0, 0, $00
spriteTile $00, $00, 0, 4, 0, 0, 0, $6F
spriteTile $08, $00, 0, 4, 0, 0, 0, $7D
spriteTile $10, $00, 0, 4, 0, 0, 0, $7E
spriteTile $18, $00, 0, 4, 0, 0, 0, $7F
spriteTile $80, $97, 0, 0, 0, 0, 0, $39
spriteTile $90, $97, 0, 0, 0, 0, 0, $39
spriteTile $A0, $97, 0, 0, 0, 0, 0, $39
spriteTile $B4, $97, 0, 0, 0, 0, 0, $39
spriteTile $C4, $97, 0, 0, 0, 0, 0, $39
spriteTile $04, $98, 0, 0, 0, 0, 0, $39
spriteTile $64, $98, 0, 0, 0, 0, 0, $39
spriteTile $88, $98, 0, 0, 0, 0, 0, $39
spriteTile $A4, $98, 0, 0, 0, 0, 0, $39
spriteTile $B8, $98, 0, 0, 0, 0, 0, $39
spriteTile $C8, $98, 0, 0, 0, 0, 0, $39
spriteTile $D8, $98, 0, 0, 0, 0, 0, $39
spriteTile $F4, $98, 0, 0, 0, 0, 0, $39
spriteTile $F8, $98, 0, 0, 0, 0, 0, $39
spriteTile $18, $99, 0, 0, 0, 0, 0, $39
spriteTile $A0, $99, 0, 0, 0, 0, 0, $39
spriteTile $0F, $0C, 0, 4, 0, 0, 0, $20
spriteTile $17, $0C, 0, 4, 0, 0, 0, $21
spriteTile $20, $0C, 0, 4, 0, 1, 0, $21
spriteTile $28, $0C, 0, 4, 0, 1, 0, $20
spriteTile $0F, $0C, 0, 4, 0, 0, 0, $30
spriteTile $17, $0C, 0, 4, 0, 0, 0, $31
spriteTile $20, $0C, 0, 4, 0, 1, 0, $31
spriteTile $28, $0C, 0, 4, 0, 1, 0, $30
spriteTile $10, $20, 0, 4, 0, 0, 0, $01
spriteTile $10, $28, 0, 4, 0, 0, 0, $11
spriteTile $40, $18, 0, 4, 0, 0, 0, $03
spriteTile $48, $18, 0, 4, 0, 0, 0, $04
spriteTile $48, $20, 0, 4, 0, 0, 0, $14
spriteTile $28, $28, 1, 4, 0, 0, 0, $29
spriteTile $30, $28, 1, 4, 0, 0, 0, $2A
spriteTile $28, $30, 1, 4, 0, 0, 0, $39
spriteTile $30, $30, 1, 4, 0, 0, 0, $3A
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
spriteTile $18, $28, 0, 4, 0, 0, 0, $1D
spriteTile $10, $30, 0, 4, 0, 0, 0, $0C
spriteTile $18, $30, 0, 4, 0, 0, 0, $0D
spriteTile $10, $38, 0, 4, 0, 0, 0, $1C
spriteTile $18, $38, 0, 4, 0, 0, 0, $2F
spriteTile $28, $20, 1, 4, 0, 0, 0, $0E
spriteTile $30, $20, 1, 4, 0, 0, 0, $0F
spriteTile $28, $28, 1, 4, 0, 0, 0, $1E
spriteTile $30, $28, 1, 4, 0, 0, 0, $1F
spriteTile $18, $18, 0, 4, 0, 0, 0, $10
spriteTile $10, $20, 0, 4, 0, 0, 0, $02
spriteTile $18, $20, 0, 4, 0, 0, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 0, $12
spriteTile $28, $20, 0, 4, 0, 0, 0, $13
spriteTile $20, $28, 0, 4, 0, 0, 0, $19
spriteTile $28, $28, 0, 4, 0, 0, 0, $1A
spriteTile $10, $18, 1, 4, 0, 0, 0, $40
spriteTile $20, $18, 1, 4, 0, 0, 0, $41
spriteTile $18, $38, 1, 4, 0, 0, 0, $42
spriteTile $20, $38, 1, 4, 0, 0, 0, $43
spriteTile $28, $38, 1, 4, 0, 0, 0, $44
spriteTile $10, $10, 0, 4, 0, 0, 0, $09
spriteTile $18, $10, 0, 4, 0, 0, 0, $0A
spriteTile $28, $10, 0, 4, 0, 0, 0, $0B
spriteTile $28, $18, 0, 4, 0, 0, 0, $1B
spriteTile $28, $2F, 2, 4, 0, 0, 0, $45
spriteTile $30, $2F, 2, 4, 0, 0, 0, $46
spriteTile $28, $37, 2, 4, 0, 0, 0, $47
spriteTile $30, $37, 2, 4, 0, 0, 0, $48
spriteTile $38, $20, 0, 4, 0, 0, 0, $49
spriteTile $40, $20, 0, 4, 0, 0, 0, $4A
spriteTile $40, $28, 0, 4, 0, 0, 0, $4B
spriteTile $18, $10, 1, 4, 0, 0, 0, $4C
spriteTile $20, $10, 1, 4, 0, 0, 0, $4D
spriteTile $18, $18, 1, 4, 0, 0, 0, $0E
spriteTile $20, $18, 1, 4, 0, 0, 0, $4F
spriteTile $20, $10, 0, 4, 0, 0, 0, $22
spriteTile $10, $10, 1, 4, 0, 0, 0, $23
spriteTile $18, $10, 1, 4, 0, 0, 0, $24
spriteTile $20, $10, 1, 4, 0, 0, 0, $25
spriteTile $28, $10, 1, 4, 0, 0, 0, $26
spriteTile $10, $18, 1, 4, 0, 0, 0, $33
spriteTile $18, $18, 1, 4, 0, 0, 0, $34
spriteTile $20, $18, 1, 4, 0, 0, 0, $35
spriteTile $28, $18, 1, 4, 0, 0, 0, $36
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
spriteTile $10, $10, 1, 4, 0, 0, 0, $05
spriteTile $18, $10, 1, 4, 0, 0, 0, $06
spriteTile $10, $18, 1, 4, 0, 0, 0, $15
spriteTile $18, $18, 1, 4, 0, 0, 0, $16
spriteTile $30, $10, 1, 4, 0, 1, 0, $06
spriteTile $38, $10, 1, 4, 0, 1, 0, $05
spriteTile $30, $18, 1, 4, 0, 1, 0, $16
spriteTile $38, $18, 1, 4, 0, 1, 0, $15
spriteTile $C8, $99, 0, 0, 0, 0, 0, $01
spriteTile $E0, $99, 0, 0, 0, 0, 0, $01
spriteTile $10, $20, 0, 4, 0, 0, 0, $6A
spriteTile $18, $20, 0, 4, 0, 0, 0, $6B
spriteTile $20, $20, 0, 0, 0, 0, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 0, $7A
spriteTile $18, $28, 0, 4, 0, 0, 0, $7B
spriteTile $20, $28, 0, 4, 0, 0, 0, $7C
spriteTile $08, $20, 0, 4, 0, 0, 0, $6D
spriteTile $10, $20, 0, 4, 0, 0, 0, $6A
spriteTile $18, $20, 0, 4, 0, 0, 0, $6B
spriteTile $08, $28, 0, 4, 0, 0, 0, $7D
spriteTile $10, $28, 0, 4, 0, 0, 0, $7E
spriteTile $18, $28, 0, 4, 0, 0, 0, $7F

.ifndef VER_JP
spriteTile $04, $9C, 0, 6, 1, 1, 1, $00
spriteTile $AC, $8E, 2, 2, 1, 1, 1, $00
spriteTile $5C, $8B, 0, 0, 1, 1, 0, $06
spriteTile $6C, $8B, 0, 0, 1, 1, 0, $06
spriteTile $7C, $8B, 0, 0, 1, 1, 0, $06
spriteTile $8C, $8B, 0, 0, 1, 1, 0, $06
spriteTile $9C, $8B, 0, 0, 1, 1, 0, $06
spriteTile $AC, $8B, 0, 0, 1, 1, 0, $06
spriteTile $BC, $8B, 0, 0, 1, 1, 0, $06
spriteTile $CC, $8B, 0, 0, 1, 1, 0, $06
spriteTile $AC, $8E, 0, 2, 0, 0, 0, $01
spriteTile $AC, $8E, 0, 2, 1, 0, 0, $01
spriteTile $AC, $8E, 2, 2, 0, 0, 0, $0D
spriteTile $AC, $8E, 2, 2, 1, 0, 0, $0D
spriteTile $AC, $8E, 0, 3, 0, 0, 0, $07
spriteTile $AC, $8E, 0, 3, 1, 0, 0, $07
spriteTile $AC, $8E, 2, 3, 0, 0, 0, $07
spriteTile $AC, $8E, 2, 3, 1, 0, 0, $07
spriteTile $AC, $8E, 0, 2, 0, 1, 0, $05
spriteTile $AC, $8E, 0, 2, 1, 1, 0, $05
spriteTile $AC, $8E, 2, 2, 0, 1, 0, $0A
spriteTile $AC, $8E, 2, 2, 1, 1, 0, $0A
spriteTile $AC, $8E, 2, 3, 0, 1, 0, $03
spriteTile $AC, $8E, 2, 3, 1, 1, 0, $03
spriteTile $AC, $8E, 0, 3, 0, 1, 0, $02
spriteTile $DC, $8E, 0, 3, 1, 1, 0, $01
spriteTile $5C, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $6C, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $7C, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $8C, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $9C, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $AC, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $BC, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $CC, $8B, 0, 0, 0, 0, 1, $0A
spriteTile $5C, $8B, 0, 2, 0, 0, 1, $00
spriteTile $6C, $8B, 0, 2, 0, 0, 1, $00
spriteTile $7C, $8B, 0, 2, 0, 0, 1, $00
spriteTile $8C, $8B, 0, 2, 0, 0, 1, $00
spriteTile $9C, $8B, 0, 2, 0, 0, 1, $00
spriteTile $AC, $8B, 0, 2, 0, 0, 1, $00
spriteTile $BC, $8B, 0, 2, 0, 0, 1, $00
spriteTile $CC, $8B, 0, 2, 0, 0, 1, $00
spriteTile $AC, $8E, 2, 1, 1, 0, 1, $02
spriteTile $AC, $8E, 2, 1, 0, 1, 1, $02
spriteTile $AC, $8E, 2, 3, 1, 0, 1, $01
spriteTile $14, $9C, 0, 0, 1, 0, 1, $00
spriteTile $B4, $9C, 0, 2, 1, 0, 1, $01
spriteTile $B4, $9C, 0, 6, 0, 1, 1, $01
spriteTile $D8, $9C, 0, 2, 1, 0, 1, $01
spriteTile $D8, $9C, 0, 6, 0, 1, 1, $01
spriteTile $B4, $9C, 3, 2, 1, 0, 1, $01
spriteTile $5C, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $6C, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $7C, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $8C, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $9C, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $AC, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $BC, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $CC, $8B, 0, 0, 0, 0, 1, $0F
spriteTile $5C, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $6C, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $7C, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $8C, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $9C, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $AC, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $BC, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $CC, $8B, 0, 0, 0, 1, 1, $0F
spriteTile $5C, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $6C, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $7C, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $8C, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $9C, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $AC, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $BC, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $CC, $8B, 0, 0, 1, 1, 1, $0F
spriteTile $5C, $8B, 0, 2, 0, 0, 1, $05
spriteTile $6C, $8B, 0, 2, 0, 0, 1, $05
spriteTile $7C, $8B, 0, 2, 0, 0, 1, $05
spriteTile $8C, $8B, 0, 2, 0, 0, 1, $05
spriteTile $9C, $8B, 0, 2, 0, 0, 1, $05
spriteTile $AC, $8B, 0, 2, 0, 0, 1, $05
spriteTile $BC, $8B, 0, 2, 0, 0, 1, $05
spriteTile $CC, $8B, 0, 2, 0, 0, 1, $05
spriteTile $5C, $8B, 0, 0, 1, 0, 1, $06
spriteTile $6C, $8B, 0, 0, 1, 0, 1, $06
spriteTile $7C, $8B, 0, 0, 1, 0, 1, $06
spriteTile $8C, $8B, 0, 0, 1, 0, 1, $06
spriteTile $9C, $8B, 0, 0, 1, 0, 1, $06
spriteTile $AC, $8B, 0, 0, 1, 0, 1, $06
spriteTile $BC, $8B, 0, 0, 1, 0, 1, $06
spriteTile $CC, $8B, 0, 0, 1, 0, 1, $06
spriteTile $5C, $8B, 0, 2, 1, 0, 1, $05
spriteTile $6C, $8B, 0, 2, 1, 0, 1, $05
spriteTile $7C, $8B, 0, 2, 1, 0, 1, $05
spriteTile $8C, $8B, 0, 2, 1, 0, 1, $05
spriteTile $9C, $8B, 0, 2, 1, 0, 1, $05
spriteTile $AC, $8B, 0, 2, 1, 0, 1, $05
spriteTile $BC, $8B, 0, 2, 1, 0, 1, $05
spriteTile $CC, $8B, 0, 2, 1, 0, 1, $05
spriteTile $5C, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $6C, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $7C, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $8C, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $9C, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $AC, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $BC, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $CC, $8B, 0, 2, 0, 1, 1, $0A
spriteTile $5C, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $6C, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $7C, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $8C, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $9C, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $AC, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $BC, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $CC, $8B, 0, 2, 1, 1, 1, $0F
spriteTile $DC, $8D, 0, 0, 1, 1, 1, $15
spriteTile $EC, $8D, 0, 0, 1, 1, 1, $15
spriteTile $FC, $8D, 0, 0, 1, 1, 1, $15
spriteTile $0C, $8E, 0, 0, 1, 1, 1, $15
spriteTile $1C, $8E, 0, 0, 1, 1, 1, $15
spriteTile $2C, $8E, 0, 0, 1, 1, 1, $15
spriteTile $3C, $8E, 0, 0, 1, 1, 1, $15
spriteTile $4C, $8E, 0, 0, 1, 1, 1, $15
spriteTile $5C, $8B, 0, 2, 0, 0, 1, $19
spriteTile $6C, $8B, 0, 2, 0, 0, 1, $19
spriteTile $7C, $8B, 0, 2, 0, 0, 1, $19
spriteTile $8C, $8B, 0, 2, 0, 0, 1, $19
spriteTile $9C, $8B, 0, 2, 0, 0, 1, $19
spriteTile $AC, $8B, 0, 2, 0, 0, 1, $19
spriteTile $BC, $8B, 0, 2, 0, 0, 1, $19
spriteTile $CC, $8B, 0, 2, 0, 0, 1, $19
spriteTile $10, $20, 0, 4, 0, 0, 0, $00
spriteTile $18, $20, 0, 4, 0, 1, 0, $00
spriteTile $10, $28, 0, 4, 0, 0, 1, $00
spriteTile $18, $28, 0, 4, 0, 1, 1, $00
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
spriteTile $0C, $18, 0, 4, 0, 0, 0, $00
spriteTile $14, $18, 0, 4, 0, 0, 0, $01
spriteTile $1C, $18, 0, 4, 0, 0, 0, $02
spriteTile $0C, $20, 0, 4, 0, 0, 0, $10
spriteTile $14, $20, 0, 4, 0, 0, 0, $11
spriteTile $1C, $20, 0, 4, 0, 0, 0, $12
spriteTile $0C, $28, 0, 4, 0, 0, 0, $20
spriteTile $14, $28, 0, 4, 0, 0, 0, $21
spriteTile $1C, $28, 0, 4, 0, 0, 0, $22
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