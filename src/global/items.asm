; Item Table
.macro ItemEntry name, key, food, users, data, oa, ba, cost
    ; name ptr
    .ifblank name
        .word 0
    .else
        .addr name
    .endif
    .ifblank key
        .ifblank food
            .ifblank users
                .byte 0
            .else
                .byte users
            .endif
        .else
            .byte (food << 6) | users
        .endif
    .else
        .ifblank food
            .byte (key << 7) | users
        .else
            .byte (key << 7) | (food << 6) | users
        .endif
    .endif
    ; data
    .ifblank data
        .byte 0
    .else
        .byte data
    .endif
    ; o, b actions
    .ifblank oa
        .byte 0
    .else
        .byte oa
    .endif
    .ifblank ba
        .byte 0
    .else
        .byte ba
    .endif
    ; cost
    .ifblank cost
        .word 0
    .else
        .word cost
    .endif
.endmacro

ItemTable:
;   ItemEntry name_itemname         , k, f, % users,   data,                oa,                ba,  cost
    ; 0 - 7
    ItemEntry INAME_NULL            ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_BIG_BAG         ,  ,  , %111111,       ,               $10,               $75,     0
    ItemEntry INAME_PHONE_CARD      ,  ,  , %111111,       ,               $07,                  ,    50
    ItemEntry INAME_CRUMBS          ,  ,  , %111111,       ,               $1F,                  ,     0

    .ifdef VER_JP
    ItemEntry INAME_REPEL_RING      ,  ,  ,        ,       ,                  ,                  ,    40
    .else
    ItemEntry INAME_REPEL_RING      ,  ,  , %111111,       ,               $08,                  ,   160
    .endif

    ItemEntry INAME_UNKITEM5        ,  ,  ,        ,       ,                  ,                  ,    50
    ItemEntry INAME_UNKITEM6        ,  ,  ,        ,       ,                  ,                  ,    60
    ItemEntry INAME_UNKITEM7        ,  ,  ,        ,       ,                  ,                  ,    70
    ; 8 - f
    ItemEntry INAME_UNKITEM8        ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM9        ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_BUTTERKNIFE     ,  ,  ,  %01000,     15,               $02,                  ,   580
    ItemEntry INAME_SURV_KNIFE      ,  ,  ,  %01000,     38,               $02,                  ,  1200
    ItemEntry INAME_SWORD           ,  ,  ,  %01000,     46,               $02,                  ,  1280
    ItemEntry INAME_KATANA          ,  ,  ,  %01000,     58,               $02,                  ,  1360
    ItemEntry INAME_STUN_GUN        ,  ,  ,  %00100,     15,               $02,                  ,   300
    ItemEntry INAME_AIR_GUN         ,  ,  ,  %00100,     42,               $02,                  ,  1400
    ; 10 - 17
    ItemEntry INAME_PLASTIC_BAT     ,  ,  ,  %00001,      3,               $02,                  ,    80
    ItemEntry INAME_WOODEN_BAT      ,  ,  ,  %00001,     12,               $02,                  ,   500
    ItemEntry INAME_ALUMINUMBAT     ,  ,  ,  %00001,     30,               $02,                  ,  1000
    ItemEntry INAME_HANKS_BAT       ,  ,  ,  %00001,     48,               $02,                  ,  1400
    ItemEntry INAME_FRYING_PAN      ,  ,  ,  %00010,      8,               $02,                  ,   300
    ItemEntry INAME_NONSTICKPAN     ,  ,  ,  %00010,     16,               $02,                  ,   700
    ItemEntry INAME_IRONSKILLET     ,  ,  ,  %00010,     36,               $02,                  ,  1120
    ItemEntry INAME_SLINGSHOT       ,  ,  , %111111,      7,               $02,                  ,   120
    ; 18 - 1f
    ItemEntry INAME_BOOMERANG       ,  ,  , %111111,     32,               $02,                  ,  1100
    ItemEntry INAME_INSECTICIDE     ,  ,  , %111111,       ,                  ,               $16,   300
    ItemEntry INAME_SUPER_SPRAY     ,  ,  , %111111,       ,                  ,               $77,  1500
    ItemEntry INAME_FLEA_BAG        ,  ,  , %111111,       ,                  ,               $60,     0
    ItemEntry INAME_WORDSOLOVE      ,  ,  , %111111,       ,                  ,               $78,     0
    ItemEntry INAME_SWEAR_WORDS     ,  ,  , %111111,       ,                  ,               $79,     0
    ItemEntry INAME_STKYMACHINE     ,  ,  ,  %00100,       ,                  ,               $6e,  3200
    ItemEntry INAME_FLASHDARK       ,  ,  , %111111,       ,                  ,               $6d,     0
    ; 20 - 27
    ItemEntry INAME_STONEORIGIN     ,  ,  , %111111,       ,                  ,               $3e,     0
    ItemEntry INAME_POISNNEEDLE     ,  ,  , %111111,       ,                  ,               $3d,     0
    ItemEntry INAME_FL_THROWER      ,  ,  ,  %00100,       ,                  ,               $67,     0

    ;these items had no price originally
    .ifdef VER_JP
    ItemEntry INAME_BOMB            ,  ,  ,  %00100,       ,                  ,               $10,     0
    ItemEntry INAME_SUPER_BOMB      ,  ,  ,  %00100,       ,                  ,               $11,     0
    ItemEntry INAME_LASER_BEAM      ,  ,  ,  %00100,       ,                  ,               $69,     0
    ItemEntry INAME_PLASMA_BEAM     ,  ,  ,  %00100,       ,                  ,               $6a,     0
    .else
    ItemEntry INAME_BOMB            ,  ,  ,  %00100,       ,                  ,               $10,   280
    ItemEntry INAME_SUPER_BOMB      ,  ,  ,  %00100,       ,                  ,               $11,  1800
    ItemEntry INAME_LASER_BEAM      ,  ,  ,  %00100,       ,                  ,               $69,   760
    ItemEntry INAME_PLASMA_BEAM     ,  ,  ,  %00100,       ,                  ,               $6a,  1300
    .endif

    ItemEntry INAME_UNKITEM27       ,  ,  ,        ,       ,                  ,                  ,      
    ; 28 - 2f
    ItemEntry INAME_ROPE            ,  ,  , %111111,       ,                  ,               $47,  600
    ItemEntry INAME_UNKITEM29       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM2A       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM2B       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM2C       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_PEACE_COIN      ,  ,  , %111111, $40| 5,               $02,                  ,  260
    ItemEntry INAME_PROTECTCOIN     ,  ,  , %111111, $40|11,               $02,                  ,  648
    ItemEntry INAME_MAGIC_COIN      ,  ,  , %111111, $40|20,               $02,                  , 1200
    ; 30 - 37
    ItemEntry INAME_BRASS_RING      ,  ,  , %111111, $80| 8,               $02,                  ,  460
    ItemEntry INAME_SILVER_RING     ,  ,  , %111111, $80|14,               $02,                  ,  825
    ItemEntry INAME_GOLD_RING       ,  ,  , %111111, $80|28,               $02,                  , 1510
    ItemEntry INAME_H2O_PENDANT     ,  ,  , %111111,    $e0,               $02,                  ,  700
    ItemEntry INAME_FIREPENDANT     ,  ,  , %111111,    $d0,               $02,                  ,  700
    ItemEntry INAME_EARTHPENDNT     ,  ,  , %111111,    $c8,               $02,                  ,  700
    ItemEntry INAME_SEA_PENDANT     ,  ,  , %111111,    $f8,               $02,                  , 2860
    ItemEntry INAME_UNKITEM37       ,  ,  ,        ,       ,                  ,                  ,      
    ; 38 - 3f
    ItemEntry INAME_UNKITEM38       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM39       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM3A       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM3B       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_ORANGEJUICE     ,  , 1, %111111,       ,               $0a,               $71,    5
    ItemEntry INAME_FRENCHFRIES     ,  , 1, %111111,       ,               $0b,               $72,   15
    ItemEntry INAME_MAGIC_HERB      ,  , 1, %111111,       ,               $0c,               $73,   30
    ItemEntry INAME_HAMBURGER       ,  , 1, %111111,       ,               $0d,               $7a,   25
    ; 40 - 47
    ItemEntry INAME_SPORTSDRINK     ,  , 1, %111111,       ,               $0e,               $74,   75
    ItemEntry INAME_LIFEUPCREAM     ,  ,  , %111111,       ,               $0f,               $7b,  194
    ItemEntry INAME_ASTHMASPRAY     ,  ,  ,  %00001,       ,                  ,               $76,  148
    ItemEntry INAME_ANTIDOTE        ,  , 1, %111111,       ,               $11,               $7C,   20
    ItemEntry INAME_MOUTHWASH       ,  ,  , %111111,       ,               $12,                  ,  175
    ItemEntry INAME_BERRY_TOFU      ,  , 1, %111111,       ,               $06,                  ,  975
    ItemEntry INAME_UNKITEM46       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_BREAD           ,  , 1, %111111,       ,               $05,               $84,   30
    ; 48 - 4f
    ItemEntry INAME_NOBLE_SEED      ,  ,  , %111111,       ,                  ,               $5F,    0
    ItemEntry INAME_PSI_STONE       ,  ,  ,  %00011,       ,               $13,               $2F,    0
    ItemEntry INAME_UNKITEM4A       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_MAGICRIBBON     ,  ,  ,  %00010,       ,               $14,                  ,    0
    ItemEntry INAME_MAGIC_CANDY     ,  , 1,  %00100,       ,               $15,                  ,    0
    ItemEntry INAME_UNKITEM4D       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_QUICKCAPSUL     ,  , 1, %111111,       ,               $16,                  ,    0
    ItemEntry INAME_WISDOM_CAPS     ,  , 1, %111111,       ,               $17,                  ,    0
    ; 50 - 57
    ItemEntry INAME_PHYSICALCAP     ,  , 1, %111111,       ,               $18,                  ,    0
    ItemEntry INAME_FORCECAPSUL     ,  , 1, %111111,       ,               $19,                  ,    0
    ItemEntry INAME_FIGHTCAPSUL     ,  , 1, %111111,       ,               $1a,                  ,    0
    ItemEntry INAME_UNKITEM53       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM54       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_BASEMENTKEY     , 1,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_ZOO_KEY         ,  ,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_GHOST_KEY       , 1,  , %111111,       ,               $01,                  ,    0
    ; 58 - 5f
    ItemEntry INAME_GGFS_DIARY      , 1,  , %111111,       ,               $1b,                  ,    0
    ItemEntry INAME_PASS            , 1,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_TICKET          ,  ,  , %111111,       ,               $01,                  ,  350
    ItemEntry INAME_UNKITEM5B       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_UNKITEM5C       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_UNKITEM5D       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_UNKITEM5E       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_CANARYCHICK     , 1,  , %111111,       ,               $01,                  ,   85
    ; 60 - 67
    ItemEntry INAME_UNKITEM60       ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_BOTTLROCKET     ,  ,  ,  %00100,       ,                  ,               $7d,    0
    ItemEntry INAME_HAT             , 1,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_DENTURES        , 1,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_TICKET_STUB     ,  ,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_IC_CHIP         , 1,  ,  %00100,       ,               $01,                  ,    0
    ItemEntry INAME_OCARINA         , 1,  , %111111,       ,               $23,                  ,    0
    ItemEntry INAME_UNKITEM67       ,  ,  ,        ,       ,                  ,                  ,     
    ; 68 - 6f
    ItemEntry INAME_FRANKLNBDGE     ,  ,  , %111111,       ,                  ,                  ,    0
    ItemEntry INAME_FRNDSHPRING     ,  ,  ,        ,       ,                  ,                  ,     
    ItemEntry INAME_UNKITEM6A       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_ONYX_HOOK       , 1,  , %111111,       ,               $1e,                  ,    0
    ItemEntry INAME_LAST_WEAPON     ,  ,  , %111111,       ,               $20,                  , 1048
    ItemEntry INAME_RULER           ,  ,  , %111111,       ,               $21,                  ,   22
    ItemEntry INAME_CASH_CARD       , 1,  , %111111,       ,               $01,                  ,    0
    ItemEntry INAME_RED_WEED        ,  ,  , %111111,       ,               $01,                  ,    0
    ; 70 - 77
    ItemEntry INAME_BULLHORN        ,  ,  , %111111,       ,                  ,               $3C,    0
    ItemEntry INAME_MAP             , 1,  , %111111,       ,               $22,                  ,    0
    ItemEntry INAME_UNKITEM72       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM73       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM74       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM75       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM76       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM77       ,  ,  ,        ,       ,                  ,                  ,      
    ; 78 - 7f
    ItemEntry INAME_UNKITEM78       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM79       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM7A       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM7B       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM7C       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM7D       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_UNKITEM7E       ,  ,  ,        ,       ,                  ,                  ,      
    ItemEntry INAME_DEBUG           , 1,  , %111111,       ,               $09,                  ,     0