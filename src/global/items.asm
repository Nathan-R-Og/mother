;the main table of items to use
;the only real differences between jp and us is the name stuff again
;and the repel ring, obviously

;as defined per PlayerUsableBitfieldLUT
ITEMUSE_NINTEN = 1
ITEMUSE_ANA = 1 << 1
ITEMUSE_LLOYD = 1 << 2
ITEMUSE_TEDDY = 1 << 3
ITEMUSE_PIPPI = 1 << 4
ITEMUSE_EVE = 1 << 5
;while this is never used (and is shared with EVE anyways),
;this does work (on equipment at least) on technicality of SELECTION_USE
;prioritizing Equip over anything else.
ITEMUSE_FLYINGMAN = 1 << 6 ;error prone due to sharing `edible` flag

;EVE and Flying Man can never equip items in the first place.
;PlayerUsableBitfieldLUT defines them both to share Bit 5.
ITEMUSE_NPC = 1 << 5

ITEMUSE_ALL = ITEMUSE_NINTEN | ITEMUSE_ANA | ITEMUSE_LLOYD | ITEMUSE_TEDDY | ITEMUSE_PIPPI | ITEMUSE_NPC


.macro itemDef name, usableBy, edible, keyitem, effectValue, armorType, overworldAction, battleAction, msgPrice
    .addr name
    .byte (keyitem << 7) | (edible << 6) | usableBy
    ;armor 0 == null
    ;armor 1 == coin
    ;armor 2 == ring
    ;armor 3 == pendant
    .byte (armorType << 6) | effectValue
    .byte overworldAction, battleAction
    .word msgPrice
.endmacro

Item_Data:
itemDef INAME_NULL, 0, 0, 0, 0, 0, 0, 0, 0
itemDef INAME_BIG_BAG, ITEMUSE_ALL, 0, 0, 0, 0, $10, $75, 0
itemDef INAME_PHONE_CARD, ITEMUSE_ALL, 0, 0, 0, 0, $07, $00, 50
itemDef INAME_CRUMBS, ITEMUSE_ALL, 0, 0, 0, 0, $1F, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM4, 0, 0, 0, 0, 0, $00, $00, 40
itemDef INAME_UNKITEM5, 0, 0, 0, 0, 0, $00, $00, 50
itemDef INAME_UNKITEM6, 0, 0, 0, 0, 0, $00, $00, 60
itemDef INAME_UNKITEM7, 0, 0, 0, 0, 0, $00, $00, 70
itemDef INAME_UNKITEM8, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM9, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_REPEL_RING, ITEMUSE_ALL, 0, 0, 0, 0, $08, $00, 160
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 50
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 60
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 70
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_BUTTERKNIFE, ITEMUSE_TEDDY, 0, 0, 15, 0, $02, $00, 580
itemDef INAME_SURV_KNIFE, ITEMUSE_TEDDY, 0, 0, 38, 0, $02, $00, 1200
itemDef INAME_SWORD, ITEMUSE_TEDDY, 0, 0, 46, 0, $02, $00, 1280
itemDef INAME_KATANA, ITEMUSE_TEDDY, 0, 0, 58, 0, $02, $00, 1360
itemDef INAME_STUN_GUN, ITEMUSE_LLOYD, 0, 0, 15, 0, $02, $00, 300
itemDef INAME_AIR_GUN, ITEMUSE_LLOYD, 0, 0, 42, 0, $02, $00, 1400
itemDef INAME_PLASTIC_BAT, ITEMUSE_NINTEN, 0, 0, 3, 0, $02, $00, 80
itemDef INAME_WOODEN_BAT, ITEMUSE_NINTEN, 0, 0, 12, 0, $02, $00, 500
itemDef INAME_ALUMINUMBAT, ITEMUSE_NINTEN, 0, 0, 30, 0, $02, $00, 1000
itemDef INAME_HANKS_BAT, ITEMUSE_NINTEN, 0, 0, 48, 0, $02, $00, 1400
itemDef INAME_FRYING_PAN, ITEMUSE_ANA, 0, 0, 8, 0, $02, $00, 300
itemDef INAME_NONSTICKPAN, ITEMUSE_ANA, 0, 0, 16, 0, $02, $00, 700
itemDef INAME_IRONSKILLET, ITEMUSE_ANA, 0, 0, 36, 0, $02, $00, 1120
itemDef INAME_SLINGSHOT, ITEMUSE_ALL, 0, 0, 7, 0, $02, $00, 120
itemDef INAME_BOOMERANG, ITEMUSE_ALL, 0, 0, 32, 0, $02, $00, 1100
itemDef INAME_INSECTICIDE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $16, 300
itemDef INAME_SUPER_SPRAY, ITEMUSE_ALL, 0, 0, 0, 0, $00, $77, 1500
itemDef INAME_FLEA_BAG, ITEMUSE_ALL, 0, 0, 0, 0, $00, $60, 0
itemDef INAME_WORDSOLOVE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $78, 0
itemDef INAME_SWEAR_WORDS, ITEMUSE_ALL, 0, 0, 0, 0, $00, $79, 0
itemDef INAME_STKYMACHINE, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $6E, 3200
itemDef INAME_FLASHDARK, ITEMUSE_ALL, 0, 0, 0, 0, $00, $6D, 0
itemDef INAME_STONEORIGIN, ITEMUSE_ALL, 0, 0, 0, 0, $00, $3E, 0
itemDef INAME_POISNNEEDLE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $3D, 0
itemDef INAME_FL_THROWER, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $67, 0

;these items had no price originally
;also might as well include the unused item
.ifdef VER_JP
itemDef INAME_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $10, 0
itemDef INAME_SUPER_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $11, 0
itemDef INAME_LASER_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $69, 0
itemDef INAME_PLASMA_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $6A, 0
itemDef INAME_UNKITEM27, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $10, 280
itemDef INAME_SUPER_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $11, 1800
itemDef INAME_LASER_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $69, 760
itemDef INAME_PLASMA_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $6A, 1300
itemDef INAME_ROPE, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_ROPE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $47, 600

.ifdef VER_JP
itemDef INAME_UNKITEM29, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM2A, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM2B, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM2C, 0, 0, 0, 0, 0, $00, $00, 0
.else
.repeat 4
itemDef INAME_PEACE_COIN, 0, 0, 0, 0, 0, $00, $00, 0
.endrepeat
.endif

itemDef INAME_PEACE_COIN, ITEMUSE_ALL, 0, 0, 5, 1, $02, $00, 260
itemDef INAME_PROTECTCOIN, ITEMUSE_ALL, 0, 0, 11, 1, $02, $00, 648
itemDef INAME_MAGIC_COIN, ITEMUSE_ALL, 0, 0, 20, 1, $02, $00, 1200
itemDef INAME_BRASS_RING, ITEMUSE_ALL, 0, 0, 8, 2, $02, $00, 460
itemDef INAME_SILVER_RING, ITEMUSE_ALL, 0, 0, 14, 2, $02, $00, 825
itemDef INAME_GOLD_RING, ITEMUSE_ALL, 0, 0, 28, 2, $02, $00, 1510
itemDef INAME_H2O_PENDANT, ITEMUSE_ALL, 0, 0, 32, 3, $02, $00, 700
itemDef INAME_FIREPENDANT, ITEMUSE_ALL, 0, 0, 16, 3, $02, $00, 700
itemDef INAME_EARTHPENDNT, ITEMUSE_ALL, 0, 0, 8, 3, $02, $00, 700
itemDef INAME_SEA_PENDANT, ITEMUSE_ALL, 0, 0, 56, 3, $02, $00, 2860

.ifdef VER_JP
itemDef INAME_UNKITEM37, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM38, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM39, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM3A, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM3B, 0, 0, 0, 0, 0, $00, $00, 0
.else
.repeat 5
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
.endrepeat
.endif

itemDef INAME_ORANGEJUICE, ITEMUSE_ALL, 1, 0, 0, 0, $0A, $71, 5
itemDef INAME_FRENCHFRIES, ITEMUSE_ALL, 1, 0, 0, 0, $0B, $72, 15
itemDef INAME_MAGIC_HERB, ITEMUSE_ALL, 1, 0, 0, 0, $0C, $73, 30
itemDef INAME_HAMBURGER, ITEMUSE_ALL, 1, 0, 0, 0, $0D, $7A, 25
itemDef INAME_SPORTSDRINK, ITEMUSE_ALL, 1, 0, 0, 0, $0E, $74, 75
itemDef INAME_LIFEUPCREAM, ITEMUSE_ALL, 0, 0, 0, 0, $0F, $7B, 194
itemDef INAME_ASTHMASPRAY, ITEMUSE_NINTEN, 0, 0, 0, 0, $00, $76, 148
itemDef INAME_ANTIDOTE, ITEMUSE_ALL, 1, 0, 0, 0, $11, $7C, 20
itemDef INAME_MOUTHWASH, ITEMUSE_ALL, 0, 0, 0, 0, $12, $00, 175
itemDef INAME_BERRY_TOFU, ITEMUSE_ALL, 1, 0, 0, 0, $06, $00, 975

.ifdef VER_JP
itemDef INAME_UNKITEM46, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_BREAD, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_BREAD, ITEMUSE_ALL, 1, 0, 0, 0, $05, $84, 30
itemDef INAME_NOBLE_SEED, ITEMUSE_ALL, 0, 0, 0, 0, $00, $5F, 0
itemDef INAME_PSI_STONE, ITEMUSE_NINTEN | ITEMUSE_ANA, 0, 0, 0, 0, $13, $2F, 0

.ifdef VER_JP
itemDef INAME_UNKITEM4A, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_MAGICRIBBON, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_MAGICRIBBON, ITEMUSE_ANA, 0, 0, 0, 0, $14, $00, 0
itemDef INAME_MAGIC_CANDY, ITEMUSE_LLOYD, 1, 0, 0, 0, $15, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM4D, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_QUICKCAPSUL, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_QUICKCAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $16, $00, 0
itemDef INAME_WISDOM_CAPS, ITEMUSE_ALL, 1, 0, 0, 0, $17, $00, 0
itemDef INAME_PHYSICALCAP, ITEMUSE_ALL, 1, 0, 0, 0, $18, $00, 0
itemDef INAME_FORCECAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $19, $00, 0
itemDef INAME_FIGHTCAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $1A, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM53, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM54, 0, 0, 0, 0, 0, $00, $00, 0
.else
.repeat 2
itemDef INAME_BASEMENTKEY, 0, 0, 0, 0, 0, $00, $00, 0
.endrepeat
.endif

itemDef INAME_BASEMENTKEY, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_ZOO_KEY, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_GHOST_KEY, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_GGFS_DIARY, ITEMUSE_ALL, 0, 1, 0, 0, $1B, $00, 0
itemDef INAME_PASS, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_TICKET, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 350

.ifdef VER_JP
itemDef INAME_UNKITEM5B, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM5C, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM5D, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM5E, 0, 0, 0, 0, 0, $00, $00, 0
.else
.repeat 4
itemDef INAME_CANARYCHICK, 0, 0, 0, 0, 0, $00, $00, 0
.endrepeat
.endif

itemDef INAME_CANARYCHICK, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 85

.ifdef VER_JP
itemDef INAME_UNKITEM60, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_BOTTLROCKET, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_BOTTLROCKET, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $7D, 0
itemDef INAME_HAT, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_DENTURES, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_TICKET_STUB, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_IC_CHIP, ITEMUSE_LLOYD, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_OCARINA, ITEMUSE_ALL, 0, 1, 0, 0, $23, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM67, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_FRANKLNBDGE, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_FRANKLNBDGE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_FRNDSHPRING, 0, 0, 0, 0, 0, $00, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM6A, 0, 0, 0, 0, 0, $00, $00, 0
.else
itemDef INAME_ONYX_HOOK, 0, 0, 0, 0, 0, $00, $00, 0
.endif

itemDef INAME_ONYX_HOOK, ITEMUSE_ALL, 0, 1, 0, 0, $1E, $00, 0
itemDef INAME_LAST_WEAPON, ITEMUSE_ALL, 0, 0, 0, 0, $20, $00, 1048
itemDef INAME_RULER, ITEMUSE_ALL, 0, 0, 0, 0, $21, $00, 22
itemDef INAME_CASH_CARD, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_RED_WEED, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_BULLHORN, ITEMUSE_ALL, 0, 0, 0, 0, $00, $3C, 0
itemDef INAME_MAP, ITEMUSE_ALL, 0, 1, 0, 0, $22, $00, 0

.ifdef VER_JP
itemDef INAME_UNKITEM72, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM73, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM74, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM75, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM76, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM77, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM78, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM79, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM7A, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM7B, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM7C, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM7D, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_UNKITEM7E, 0, 0, 0, 0, 0, $00, $00, 0
.else
.repeat 13
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
.endrepeat
.endif

itemDef INAME_DEBUG, ITEMUSE_ALL, 0, 1, 0, 0, $09, $00, 0