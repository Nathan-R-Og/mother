.segment        "PRG0": absolute

.include "../fontmap.asm"

;items
INAME_NULL:
.byte 0
INAME_BIG_BAG:
.byte   "Big Bag",stopText
INAME_PHONE_CARD:
.byte   "Phone Card",stopText
INAME_CRUMBS:
.byte   "Crumbs",stopText
INAME_REPEL_RING:
.byte   "Repel Ring",stopText
INAME_BUTTERKNIFE:
.byte   "ButterKnife",stopText
INAME_SURV_KNIFE:
.byte   "Surv.Knife",stopText
INAME_SWORD:
.byte   "Sword",stopText
INAME_KATANA:
.byte   "Katana",stopText
INAME_STUN_GUN:
.byte   "Stun Gun",stopText
INAME_AIR_GUN:
.byte   "Air Gun",stopText
INAME_PLASTIC_BAT:
.byte   "Plastic Bat",stopText
INAME_WOODEN_BAT:
.byte   "Wooden Bat",stopText
INAME_ALUMINUMBAT:
.byte   "AluminumBat",stopText
INAME_HANKS_BAT:
.byte   "Hank's Bat",stopText
INAME_FRYING_PAN:
.byte   "Frying Pan",stopText
INAME_NONSTICKPAN:
.byte   "NonstickPan",stopText
INAME_IRONSKILLET:
.byte   "IronSkillet",stopText
INAME_SLINGSHOT:
.byte   "Slingshot",stopText
INAME_BOOMERANG:
.byte   "Boomerang",stopText
INAME_INSECTICIDE:
.byte   "Insecticide",stopText
INAME_SUPER_SPRAY:
.byte   "Super Spray",stopText
INAME_FLEA_BAG:
.byte   "Flea Bag",stopText
INAME_WORDSOLOVE:
.byte   "WordsO'Love",stopText
INAME_SWEAR_WORDS:
.byte   "Swear Words",stopText
INAME_STKYMACHINE:
.byte   "StkyMachine",stopText
INAME_FLASHDARK:
.byte   "Flashdark",stopText
INAME_STONEORIGIN:
.byte   "StoneOrigin",stopText
INAME_POISNNEEDLE:
.byte   "PoisnNeedle",stopText
INAME_FL_THROWER:
.byte   "Fl Thrower",stopText
INAME_BOMB:
.byte   "Bomb",stopText
INAME_SUPER_BOMB:
.byte   "Super Bomb",stopText
INAME_LASER_BEAM:
.byte   "Laser Beam",stopText
INAME_PLASMA_BEAM:
.byte   "Plasma Beam",stopText
INAME_ROPE:
.byte   "Rope",stopText
INAME_PEACE_COIN:
.byte   "Peace Coin",stopText
INAME_PROTECTCOIN:
.byte   "ProtectCoin",stopText
INAME_MAGIC_COIN:
.byte   "Magic Coin",stopText
INAME_BRASS_RING:
.byte   "Brass Ring",stopText
INAME_SILVER_RING:
.byte   "Silver Ring",stopText
INAME_GOLD_RING:
.byte   "Gold Ring",stopText
INAME_H2O_PENDANT:
.byte   "H2o Pendant",stopText
INAME_FIREPENDANT:
.byte   "FirePendant",stopText
INAME_EARTHPENDNT:
.byte   "EarthPendnt",stopText
INAME_SEA_PENDANT:
.byte   "Sea Pendant",stopText

INAME_ORANGEJUICE:
.byte   "OrangeJuice",stopText
INAME_FRENCHFRIES:
.byte   "FrenchFries",stopText
INAME_MAGIC_HERB:
.byte   "Magic Herb",stopText
INAME_HAMBURGER:
.byte   "Hamburger",stopText
INAME_SPROTSDRINK:
.byte   "SportsDrink",stopText
INAME_LIFEUPCREAM:
.byte   "LifeUpCream",stopText
INAME_ASTHMASPRAY:
.byte   "AsthmaSpray",stopText
INAME_ANTIDOTE:
.byte   "Antidote",stopText
INAME_MOUTHWASH:
.byte   "Mouthwash",stopText
INAME_BERRY_TOFU:
.byte   "berry Tofu",stopText
INAME_BREAD:
.byte   "Bread",stopText
INAME_NOBLE_SEED:
.byte   "Noble Seed",stopText
INAME_PSI_STONE:
.byte   "PSI Stone",stopText
INAME_MAGICRIBBON:
.byte   "MagicRibbon",stopText
INAME_MAGIC_CANDY:
.byte   "Magic Candy",stopText
INAME_QUICKCAPSUL:
.byte   "QuickCapsul",stopText
INAME_WISDOM_CAPS:
.byte   "Wisdom Caps",stopText
INAME_PHYSICALCAP:
.byte   "PhysicalCap",stopText
INAME_FORCECAPSUL:
.byte   "ForceCapsul",stopText
INAME_FIGHTCAPSUL:
.byte   "FightCapsul",stopText
INAME_BASEMENTKEY:
.byte   "BasementKey",stopText
INAME_ZOO_KEY:
.byte   "Zoo Key",stopText
INAME_GHOST_KEY:
.byte   "Ghost Key",stopText
INAME_GGFS_DIARY:
.byte   "GGF's Diary",stopText
INAME_PASS:
.byte   "Pass",stopText
INAME_TICKET:
.byte   "Ticket",stopText
INAME_CANARYCHICK:
.byte   "CanaryChick",stopText
INAME_BOTTLROCKET:
.byte   "BottlRocket",stopText
INAME_HAT:
.byte   "Hat",stopText
INAME_DENTURES:
.byte   "Dentures",stopText
INAME_TICKET_STUB:
.byte   "Ticket Stub",stopText
INAME_IC_CHIP:
.byte   "IC-chip",stopText
INAME_OCARINA:
.byte   "Ocarina",stopText
INAME_FRANKLNBDGE:
.byte   "FranklnBdge",stopText
INAME_FRNDSHPRING:
.byte   "FrndshpRing",stopText
INAME_ONYX_HOOK:
.byte   "Onyx Hook",stopText
INAME_LAST_WEAPON:
.byte   "Last Weapon",stopText
INAME_RULER:
.byte   "Ruler",stopText
INAME_CASH_CARD:
.byte   "Cash Card",stopText
INAME_RED_WEED:
.byte   "Red Weed",stopText
INAME_BULLHORN:
.byte   "Bullhorn",stopText
INAME_MAP:
.byte   "Map",stopText
INAME_DEBUG:
.byte   "Debug",stopText

;choicers
CHOICER_NULL:
.byte 0
CHOICER_FLIGHTPLANS:
.byte   "FlightplanA",stopText
.byte   "FlightplanB",stopText
.byte   "FlightplanC",stopText
CHOICER_HINTS:
.byte   "Hint 1",stopText
.byte   "Hint 2",stopText
.byte   "Hint 3",stopText
CHOICER_SCIENTIST:
.byte   "Real Rocket",stopText
.byte   "TimeMachine",stopText

;teleport locales
TELEPORT_NULL:
.byte 0
TELEPORT_MYHOME:
.byte   "MyHome",stopText
TELEPORT_PODUNK:
.byte   "Podunk",stopText
TELEPORT_MERRYSVILLE:
.byte   "Merrysville",stopText
TELEPORT_REINDEER:
.byte   "Reindeer",stopText
TELEPORT_SPOOKANE:
.byte   "Spookane",stopText
TELEPORT_SNOWMAN:
.byte   "Snowman",stopText
TELEPORT_YOUNGTOWN:
.byte   "Youngtown",stopText
TELEPORT_ELLAY:
.byte   "Ellay",stopText
TELEPORT_UNION:
.byte   "Union",stopText

;PSI
PSI_NULL:
.byte 0
PSI_TELEPATHY:
.byte   "Telepathy",stopText
PSI_TELEPORT:
.byte   "Teleport",stopText
PSI_LIFEUP_ALPHA:
.byte   "LifeUp ",alpha,stopText
PSI_LIFEUP_BETA:
.byte   "LifeUp ",beta,stopText
PSI_LIFEUP_GAMMA:
.byte   "LifeUp ",gamma,stopText
PSI_LIFEUP_PI:
.byte   "LifeUp ",pi,stopText
PSI_LIFEUP_OMEGA:
.byte   "LifeUp ",omega,stopText
PSI_HEALING_ALPHA:
.byte   "Healing ",alpha,stopText
PSI_HEALING_BETA:
.byte   "Healing ",beta,stopText
PSI_HEALING_GAMMA:
.byte   "Healing ",gamma,stopText
PSI_HEALING_PI:
.byte   "Healing ",pi,stopText
PSI_SUPRHEALING:
.byte   "SuprHealing",stopText
PSI_PSISHIELD_ALPHA:
.byte   "PSIShield ",alpha,stopText
PSI_PSISHIELD_BETA:
.byte   "PSIShield ",beta,stopText
PSI_POWERSHIELD:
.byte   "PowerShield",stopText
PSI_BRAINSHOCK:
.byte   "BrainShock",stopText
PSI_BRAINCYCLON:
.byte   "BrainCyclon",stopText
PSI_HYPNOSIS:
.byte   "Hypnosis",stopText
PSI_PARALYSIS:
.byte   "Paralysis",stopText
PSI_DARKNESS:
.byte   "Darkness",stopText
PSI_PSI_MAGNET:
.byte   "PSI-Magnet",stopText
PSI_SHIELD_OFF:
.byte   "Shield-Off",stopText
PSI_PSI_BLOCK:
.byte   "PSI-Block",stopText
PSI_OFFENSEUP:
.byte   "OffenseUp",stopText
PSI_DEFENSEUP_ALPHA:
.byte   "DefenseUp ",alpha,stopText
PSI_DEFENSEUP_BETA:
.byte   "DefenseUp ",beta,stopText
PSI_QUICKUP:
.byte   "QuickUp",stopText
PSI_DEF_DOWN_ALPHA:
.byte   "Def.Down ",alpha,stopText
PSI_DEF_DOWN_BETA:
.byte   "Def.Down ",beta,stopText
PSI_4TH_D_SLIP:
.byte   "4th-D Slip",stopText
PSI_PK_FREEZE_ALPHA:
.byte   "PK Freeze ",alpha,stopText
PSI_PK_FREEZE_BETA:
.byte   "PK Freeze ",beta,stopText
PSI_PK_FREEZE_GAMMA:
.byte   "PK Freeze ",gamma,stopText
PSI_PK_FREEZE_OMEGA:
.byte   "PK Freeze ",omega,stopText
PSI_PK_FIRE_ALPHA:
.byte   "PK Fire ",alpha,stopText
PSI_PK_FIRE_BETA:
.byte   "PK Fire ",beta,stopText
PSI_PK_FIRE_GAMMA:
.byte   "PK Fire ",gamma,stopText
PSI_PK_FIRE_OMEGA:
.byte   "PK Fire ",omega,stopText
PSI_PK_BEAM_ALPHA:
.byte   "PK Beam ",alpha,stopText
PSI_PK_BEAM_BETA:
.byte   "PK Beam ",beta,stopText
PSI_PK_BEAM_GAMMA:
.byte   "PK Beam ",gamma,stopText
PSI_PK_BEAM_OMEGA:
.byte   "PK Beam ",omega,stopText
PSI_PK_THUNDERALPHA:
.byte   "PK Thunder",alpha,stopText
PSI_PK_THUNDERBETA:
.byte   "PK Thunder",beta,stopText
PSI_PK_THUNDERGAMMA:
.byte   "PK Thunder",gamma,stopText
PSI_STOP:

;status
STATUS_FAINTD:
.byte   "Faintd",stopText
STATUS_STONE:
.byte   " Stone",stopText
STATUS_PARLZD:
.byte   "Parlzd",stopText
STATUS_ASLEEP:
.byte   "Asleep",stopText
STATUS_CONFSD:
.byte   "Confsd",stopText
STATUS_PUZZLD:
.byte   "Puzzld",stopText
STATUS_POISON:
.byte   "Poison",stopText
STATUS_COLD:
.byte   "  Cold",stopText

;enemies
ENAME_NULL:
.byte 0
ENAME_BIGWOODOH:
.byte   "BigWoodoh",stopText
ENAME_DRAGON:
.byte   "Dragon",stopText
ENAME_R7038:
.byte   "R7038",stopText
ENAME_ELEPHANT:
.byte   "Elephant",stopText
ENAME_BEAR:
.byte   "Bear",stopText
ENAME_BIG_FOOT:
.byte   "Big Foot",stopText
ENAME_MAD_TRUCK:
.byte   "Mad Truck",stopText
ENAME_OLD_ROBOT:
.byte   "Old Robot",stopText
ENAME_MEGABORG:
.byte   "Megaborg",stopText
ENAME_GARGOYLE:
.byte   "Gargoyle",stopText
ENAME_GABILAN:
.byte   "Gabilan",stopText
ENAME_GORILLA:
.byte   "Gorilla",stopText
ENAME_BISON:
.byte   "Bison",stopText
ENAME_TIGER:
.byte   "Tiger",stopText
ENAME_MAD_CAR:
.byte   "Mad Car",stopText
ENAME_RAEB_YDDET:
.byte   "Raeb Yddet",stopText
ENAME_MAGIC_SNAIL:
.byte   "Magic Snail",stopText
ENAME_TITANEES:
.byte   "Titanees",stopText
ENAME_GIEGUE:
.byte   "Giegue",stopText
ENAME_EAGLE:
.byte   "Eagle",stopText
ENAME_WOLF:
.byte   "Wolf",stopText
ENAME_SEAGULL:
.byte   "Seagull",stopText
ENAME_ALLIGATOR:
.byte   "Alligator",stopText
ENAME_ENERGYROBOT:
.byte   "EnergyRobot",stopText
ENAME_THE_FISH:
.byte   "The Fish",stopText
ENAME_FUGITIVE:
.byte   "Fugitive",stopText
ENAME_BBS_BOSS:
.byte   "B.B.'s Boss",stopText
ENAME_BARBOT:
.byte   "Barbot",stopText
ENAME_NANCY:
.byte   "Nancy",stopText
ENAME_STARMAN:
.byte   "Starman",stopText
ENAME_ULLRICH:
.byte   "Ullrich",stopText
ENAME_CEREBRUM:
.byte   "Cerebrum",stopText
ENAME_MOOK:
.byte   "Mook",stopText
ENAME_ARMOR:
.byte   "Armor",stopText
ENAME_WOODOH:
.byte   "Woodoh",stopText
ENAME_WALLY:
.byte   "Wally",stopText
ENAME_THE_HIPPIE:
.byte   "The Hippie",stopText
ENAME_BAG_LADY:
.byte   "Bag Lady",stopText
ENAME_BB_GANG:
.byte   "B.B. Gang",stopText
ENAME_DR_DISTORTO:
.byte   "Dr.Distorto",stopText
ENAME_GANG_ZOMBIE:
.byte   "Gang Zombie",stopText
ENAME_PSEUDOZOMBI:
.byte   "PseudoZombi",stopText
ENAME_CROW:
.byte   "Crow",stopText
ENAME_SNAKE:
.byte   "Snake",stopText
ENAME_HYENA:
.byte   "Hyena",stopText
ENAME_COUGAR:
.byte   "Cougar",stopText
ENAME_CENTIPEDE:
.byte   "Centipede",stopText
ENAME_DUST_BALL:
.byte   "Dust Ball",stopText
ENAME_FLY:
.byte   "Fly",stopText
ENAME_SPIDER:
.byte   "Spider",stopText
ENAME_SCORPION:
.byte   "Scorpion",stopText
ENAME_ROPE:
.byte   "Rope",stopText
ENAME_FIRE_BALL:
.byte   "Fire Ball",stopText
ENAME_WATCHER:
.byte   "Watcher",stopText
ENAME_GROUCHO:
.byte   "Groucho",stopText
ENAME_GHOST:
.byte   "Ghost",stopText
ENAME_LIL_SAUCER:
.byte   "Lil Saucer",stopText
ENAME_MR_BAT:
.byte   "Mr. Bat",stopText
ENAME_STARMAN_JR:
.byte   "Starman Jr.",stopText
ENAME_SKUNK:
.byte   "Skunk",stopText
ENAME_SHROUDLEY:
.byte   "Shroudley",stopText
ENAME_RAT:
.byte   "Rat",stopText
ENAME_BOMBER:
.byte   "Bomber",stopText
ENAME_DOLL:
.byte   "Doll",stopText
ENAME_LAMP:
.byte   "Lamp",stopText
ENAME_BIONICCENTI:
.byte   "BionicCenti",stopText
ENAME_BIONICSCORP:
.byte   "BionicScorp",stopText
ENAME_RED_SNAKE:
.byte   "Red Snake",stopText
ENAME_LONE_WOLF:
.byte   "Lone Wolf",stopText
ENAME_POLAR_BEAR:
.byte   "Polar Bear",stopText
ENAME_RATTLESNAKE:
.byte   "Rattlesnake",stopText
ENAME_TARANTULA:
.byte   "Tarantula",stopText
ENAME_CROCODILE:
.byte   "Crocodile",stopText
ENAME_BUFFALO:
.byte   "Buffalo",stopText
ENAME_BIONIC_BAT:
.byte   "Bionic Bat",stopText
ENAME_STRAY_DOG:
.byte   "Stray Dog",stopText
ENAME_PSYCHO_CAR:
.byte   "Psycho Car",stopText
ENAME_PSYCHOTRUCK:
.byte   "PsychoTruck",stopText
ENAME_MANIACTRUCK:
.byte   "ManiacTruck",stopText
ENAME_ALARM_GHOST:
.byte   "Alarm Ghost",stopText
ENAME_FOUREYES:
.byte   "Foureyes",stopText
ENAME_DADSEYES:
.byte   "Dadseyes",stopText
ENAME_MOMSEYES:
.byte   "Momseyes",stopText
ENAME_SKY_YDDET:
.byte   "Sky Yddet",stopText
ENAME_GIGA_BORG:
.byte   "Giga Borg",stopText
ENAME_OMEGA_BORG:
.byte   "Omega Borg",stopText
ENAME_SCRAPPER:
.byte   "Scrapper",stopText
ENAME_ULTRABARBOT:
.byte   "UltraBarbot",stopText
ENAME_OMEGASAUCER:
.byte   "OmegaSaucer",stopText
ENAME_KELLY:
.byte   "Kelly",stopText
ENAME_STAR_MINER:
.byte   "Star Miner",stopText
ENAME_SUPERENERGY:
.byte   "SuperEnergy",stopText
ENAME_JUANA:
.byte   "Juana",stopText
ENAME_BLUESTARMAN:
.byte   "BlueStarman",stopText
ENAME_ROCKOYLE:
.byte   "Rockoyle",stopText
ENAME_TITANIAN:
.byte   "Titanian",stopText
ENAME_OH_MOOK:
.byte   "Oh-Mook",stopText
ENAME_ZOMBIE:
.byte   "Zombie",stopText
ENAME_NASTYZOMBIE:
.byte   "NastyZombie",stopText
ENAME_SILVER_WOLF:
.byte   "Silver Wolf",stopText
ENAME_R7037:
.byte   "R7037",stopText
ENAME_GRIZZLYBEAR:
.byte   "GrizzlyBear",stopText
ENAME_R7038XX:
.byte   "R7038XX",stopText
ENAME_LASTSTARMAN:
.byte   "LastStarman",stopText

;???????
.repeat $82
.byte   0
.endrep
.byte   $48, $59
.repeat $FD
.byte   0
.endrep
.byte   $48, $59
.repeat $b1
.byte   0
.endrep

;battle ui stuff
incbinRange "../../split/us/prg/bank0.bin", $C00, $E81

;battle palettes
incbinRange "../../split/us/prg/bank0.bin", $E81, $1081

;naming screen (???)
incbinRange "../../split/us/prg/bank0.bin", $1081, $1800

;item data
incbinRange "../../split/us/prg/bank0.bin", $1800, $1c00

;teleport targets (?)
incbinRange "../../split/us/prg/bank0.bin", $1c00, $1dc0

;character levelup table
;TODO: decipher
;i imagine its like: exp,force,fight,speed, etc
.byte $C8,$00,$00,$04,$04,$04,$04,$04
.byte $D6,$00,$02,$04,$04,$04,$04,$04
.byte $CB,$00,$03,$00,$02,$06,$02,$07
.byte $C0,$00,$00,$03,$01,$07,$03,$02
.byte $96,$00,$00,$08,$08,$01,$05,$03
.byte $96,$00,$00,$08,$08,$01,$05,$03
.byte $C8,$00,$00,$05,$03,$05,$07,$01
.byte $C8,$00,$00,$06,$00,$00,$08,$05


;psi data
;TODO: what does arg5 do???????
;NOTE- battleEffect both use BATTLE_ACTION_POINTERS as an array.
;(or at least i think it does)
;what table overworldEffect uses is probably an item table of sorts, where idk
;also i only made a macro out of this because i dont wanna seperate one word and six bytes
.macro psiDef name, nintenLevel, anaLevel, overworldEffect, battleEffect, arg5, cost
    .word name

    ;the levels have to be PASSED to gain the psi, specifically
    .ifblank nintenLevel
    .byte $FF
    .else
    .byte nintenLevel
    .endif

    .ifblank anaLevel
    .byte $FF
    .else
    .byte anaLevel
    .endif

    .byte overworldEffect, battleEffect, arg5, cost
.endmacro

psiDef            PSI_NULL,  ,  ,$00,$00,$00,0
psiDef       PSI_TELEPATHY, 0, 0,$25,$00,$00,1
psiDef        PSI_TELEPORT,  ,  ,$26,$00,$00,3
.repeat 5
psiDef    PSI_LIFEUP_ALPHA,  ,  ,$00,$00,$00,0
.endrepeat
psiDef    PSI_LIFEUP_ALPHA, 2,  ,$27,$29,$00,3
psiDef     PSI_LIFEUP_BETA,28, 0,$28,$2A,$00,5
psiDef    PSI_LIFEUP_GAMMA,32,11,$29,$2B,$00,9
psiDef       PSI_LIFEUP_PI,37,21,$00,$2C,$00,17
psiDef    PSI_LIFEUP_OMEGA,  ,33,$00,$2D,$00,48
.repeat 3
psiDef   PSI_HEALING_ALPHA,  ,  ,$00,$00,$00,0
.endrepeat
psiDef   PSI_HEALING_ALPHA, 4, 5,$2C,$5B,$00,3
psiDef    PSI_HEALING_BETA,15,12,$00,$63,$00,6
psiDef   PSI_HEALING_GAMMA,18,13,$2A,$86,$00,6
psiDef      PSI_HEALING_PI,21,14,$00,$64,$00,6
psiDef     PSI_SUPRHEALING,34,17,$2D,$65,$00,36
psiDef PSI_PSISHIELD_ALPHA,12, 3,$00,$38,$00,4
psiDef  PSI_PSISHIELD_BETA,29, 8,$00,$39,$00,9
psiDef     PSI_POWERSHIELD,33,23,$00,$37,$00,9
psiDef      PSI_BRAINSHOCK,  , 1,$00,$42,$00,5
psiDef     PSI_BRAINCYCLON,  ,25,$00,$43,$00,12
psiDef        PSI_HYPNOSIS,  , 8,$00,$44,$00,5
psiDef       PSI_PARALYSIS,  ,14,$00,$45,$00,8
psiDef        PSI_DARKNESS,  ,19,$00,$31,$00,10
psiDef      PSI_PSI_MAGNET,  , 6,$00,$30,$00,0
psiDef      PSI_SHIELD_OFF,  ,18,$00,$66,$00,8
psiDef       PSI_PSI_BLOCK,  , 7,$00,$36,$00,7
psiDef       PSI_OFFENSEUP,17,  ,$00,$1B,$00,6
psiDef PSI_DEFENSEUP_ALPHA, 6,  ,$00,$1D,$00,3
psiDef  PSI_DEFENSEUP_BETA,23,  ,$00,$1E,$00,8
psiDef         PSI_QUICKUP,13,  ,$00,$1F,$00,3
psiDef  PSI_DEF_DOWN_ALPHA, 8,  ,$00,$25,$00,3
psiDef   PSI_DEF_DOWN_BETA,26,  ,$00,$82,$00,9
psiDef      PSI_4TH_D_SLIP,10,  ,$00,$5C,$00,16
psiDef        PSI_HYPNOSIS, 3,  ,$00,$44,$00,5
psiDef PSI_PK_FREEZE_ALPHA,  , 0,$00,$0C,$00,3
psiDef  PSI_PK_FREEZE_BETA,  , 6,$00,$0D,$00,5
psiDef PSI_PK_FREEZE_GAMMA,  ,20,$00,$0F,$00,8
psiDef PSI_PK_FREEZE_OMEGA,  ,28,$00,$0E,$00,13
psiDef   PSI_PK_FIRE_ALPHA,  ,16,$00,$09,$00,8
psiDef    PSI_PK_FIRE_BETA,  ,26,$00,$0A,$00,12
psiDef   PSI_PK_FIRE_GAMMA,  ,30,$00,$0B,$00,14
psiDef   PSI_PK_FIRE_OMEGA,  ,34,$00,$85,$00,30
psiDef   PSI_PK_BEAM_ALPHA,  , 4,$00,$12,$00,4
psiDef    PSI_PK_BEAM_BETA,  ,10,$00,$13,$00,7
psiDef   PSI_PK_BEAM_GAMMA,  ,24,$00,$15,$00,12
psiDef   PSI_PK_BEAM_OMEGA,  ,32,$00,$14,$00,24
psiDef PSI_PK_THUNDERALPHA,  , 2,$00,$17,$00,3
psiDef  PSI_PK_THUNDERBETA,  , 8,$00,$18,$00,6
psiDef PSI_PK_THUNDERGAMMA,  ,27,$00,$83,$00,12
.repeat 9
psiDef            PSI_STOP,  ,  ,$00,$00,$00,0
.endrepeat

;map data 1
.incbin "../../split/us/prg/bank0.bin", $2000

.code

