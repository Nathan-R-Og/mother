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
CHOICER_FLIGHTPLANSA:
.byte   "FlightplanA",stopText
CHOICER_FLIGHTPLANSB:
.byte   "FlightplanB",stopText
CHOICER_FLIGHTPLANSC:
.byte   "FlightplanC",stopText
CHOICER_HINTS1:
.byte   "Hint 1",stopText
CHOICER_HINTS2:
.byte   "Hint 2",stopText
CHOICER_HINTS3:
.byte   "Hint 3",stopText
CHOICER_SCIENTIST1:
.byte   "Real Rocket",stopText
CHOICER_SCIENTIST2:
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
.endrepeat
.byte   $48, $59
.repeat $FD
.byte   0
.endrepeat
.byte   $48, $59
.repeat $b1
.byte   0
.endrepeat

;battle ui stuff
incbinRange "../../split/us/prg/bank0.bin", $C00, $E81

;battle palettes
incbinRange "../../split/us/prg/bank0.bin", $E81, $1081

;naming screen (???)
incbinRange "../../split/us/prg/bank0.bin", $1081, $1800

ITEMUSE_NITNEN = 1
ITEMUSE_ANA = 1 << 1
ITEMUSE_LLOYD = 1 << 2
ITEMUSE_TEDDY = 1 << 3
;guesses????
ITEMUSE_EVE = 1 << 4
ITEMUSE_FLYINGMAN = 1 << 5
;
ITEMUSE_ALL = $3F

.macro itemDef name, usableBy, edible, keyitem, type1, type2, overworldAction, battleAction, msgPrice
    .word name
    .byte (keyitem << 7) | (edible << 6) | usableBy
    .byte (type2 << 6) | type1
    .byte overworldAction,battleAction
    .word msgPrice
.endmacro
itemDef INAME_NULL, 0, 0, 0, 0, 0, 0, 0, 0
itemDef INAME_BIG_BAG, ITEMUSE_ALL, 0, 0, 0, 0, $10, $75, 0
itemDef INAME_PHONE_CARD, ITEMUSE_ALL, 0, 0, 0, 0, $07, $00, 50
itemDef INAME_CRUMBS, ITEMUSE_ALL, 0, 0, 0, 0, $1F, $00, 0
itemDef INAME_REPEL_RING, ITEMUSE_ALL, 0, 0, 0, 0, $08, $00, 160
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 50
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 60
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 70
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BUTTERKNIFE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BUTTERKNIFE, ITEMUSE_TEDDY, 0, 0, 15, 0, $02, $00, 580
itemDef INAME_SURV_KNIFE, ITEMUSE_TEDDY, 0, 0, 38, 0, $02, $00, 1200
itemDef INAME_SWORD, ITEMUSE_TEDDY, 0, 0, 46, 0, $02, $00, 1280
itemDef INAME_KATANA, ITEMUSE_TEDDY, 0, 0, 58, 0, $02, $00, 1360
itemDef INAME_STUN_GUN, ITEMUSE_LLOYD, 0, 0, 15, 0, $02, $00, 300
itemDef INAME_AIR_GUN, ITEMUSE_LLOYD, 0, 0, 42, 0, $02, $00, 1400
itemDef INAME_PLASTIC_BAT, ITEMUSE_NITNEN, 0, 0, 3, 0, $02, $00, 80
itemDef INAME_WOODEN_BAT, ITEMUSE_NITNEN, 0, 0, 12, 0, $02, $00, 500
itemDef INAME_ALUMINUMBAT, ITEMUSE_NITNEN, 0, 0, 30, 0, $02, $00, 1000
itemDef INAME_HANKS_BAT, ITEMUSE_NITNEN, 0, 0, 48, 0, $02, $00, 1400
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
itemDef INAME_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $10, 280
itemDef INAME_SUPER_BOMB, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $11, 1800
itemDef INAME_LASER_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $69, 760
itemDef INAME_PLASMA_BEAM, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $6A, 1300
itemDef INAME_ROPE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ROPE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $47, 600
itemDef INAME_PEACE_COIN, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_PEACE_COIN, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_PEACE_COIN, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_PEACE_COIN, 0, 0, 0, 0, 0, $00, $00, 0
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
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ORANGEJUICE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ORANGEJUICE, ITEMUSE_ALL, 1, 0, 0, 0, $0A, $71, 5
itemDef INAME_FRENCHFRIES, ITEMUSE_ALL, 1, 0, 0, 0, $0B, $72, 15
itemDef INAME_MAGIC_HERB, ITEMUSE_ALL, 1, 0, 0, 0, $0C, $73, 30
itemDef INAME_HAMBURGER, ITEMUSE_ALL, 1, 0, 0, 0, $0D, $7A, 25
itemDef INAME_SPROTSDRINK, ITEMUSE_ALL, 1, 0, 0, 0, $0E, $74, 75
itemDef INAME_LIFEUPCREAM, ITEMUSE_ALL, 0, 0, 0, 0, $0F, $7B, 194
itemDef INAME_ASTHMASPRAY, ITEMUSE_NITNEN, 0, 0, 0, 0, $00, $76, 148
itemDef INAME_ANTIDOTE, ITEMUSE_ALL, 1, 0, 0, 0, $11, $7C, 20
itemDef INAME_MOUTHWASH, ITEMUSE_ALL, 0, 0, 0, 0, $12, $00, 175
itemDef INAME_BERRY_TOFU, ITEMUSE_ALL, 1, 0, 0, 0, $06, $00, 975
itemDef INAME_BREAD, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BREAD, ITEMUSE_ALL, 1, 0, 0, 0, $05, $84, 30
itemDef INAME_NOBLE_SEED, ITEMUSE_ALL, 0, 0, 0, 0, $00, $5F, 0
itemDef INAME_PSI_STONE, ITEMUSE_NITNEN | ITEMUSE_ANA, 0, 0, 0, 0, $13, $2F, 0
itemDef INAME_MAGICRIBBON, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_MAGICRIBBON, ITEMUSE_ANA, 0, 0, 0, 0, $14, $00, 0
itemDef INAME_MAGIC_CANDY, ITEMUSE_LLOYD, 1, 0, 0, 0, $15, $00, 0
itemDef INAME_QUICKCAPSUL, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_QUICKCAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $16, $00, 0
itemDef INAME_WISDOM_CAPS, ITEMUSE_ALL, 1, 0, 0, 0, $17, $00, 0
itemDef INAME_PHYSICALCAP, ITEMUSE_ALL, 1, 0, 0, 0, $18, $00, 0
itemDef INAME_FORCECAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $19, $00, 0
itemDef INAME_FIGHTCAPSUL, ITEMUSE_ALL, 1, 0, 0, 0, $1A, $00, 0
itemDef INAME_BASEMENTKEY, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BASEMENTKEY, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BASEMENTKEY, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_ZOO_KEY, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_GHOST_KEY, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_GGFS_DIARY, ITEMUSE_ALL, 0, 1, 0, 0, $1B, $00, 0
itemDef INAME_PASS, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_TICKET, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 350
itemDef INAME_CANARYCHICK, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_CANARYCHICK, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_CANARYCHICK, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_CANARYCHICK, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_CANARYCHICK, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 85
itemDef INAME_BOTTLROCKET, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_BOTTLROCKET, ITEMUSE_LLOYD, 0, 0, 0, 0, $00, $7D, 0
itemDef INAME_HAT, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_DENTURES, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_TICKET_STUB, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_IC_CHIP, ITEMUSE_LLOYD, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_OCARINA, ITEMUSE_ALL, 0, 1, 0, 0, $23, $00, 0
itemDef INAME_FRANKLNBDGE, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_FRANKLNBDGE, ITEMUSE_ALL, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_FRNDSHPRING, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ONYX_HOOK, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_ONYX_HOOK, ITEMUSE_ALL, 0, 1, 0, 0, $1E, $00, 0
itemDef INAME_LAST_WEAPON, ITEMUSE_ALL, 0, 0, 0, 0, $20, $00, 1048
itemDef INAME_RULER, ITEMUSE_ALL, 0, 0, 0, 0, $21, $00, 22
itemDef INAME_CASH_CARD, ITEMUSE_ALL, 0, 1, 0, 0, $01, $00, 0
itemDef INAME_RED_WEED, ITEMUSE_ALL, 0, 0, 0, 0, $01, $00, 0
itemDef INAME_BULLHORN, ITEMUSE_ALL, 0, 0, 0, 0, $00, $3C, 0
itemDef INAME_MAP, ITEMUSE_ALL, 0, 1, 0, 0, $22, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, 0, 0, 0, 0, 0, $00, $00, 0
itemDef INAME_DEBUG, ITEMUSE_ALL, 0, 1, 0, 0, $09, $00, 0

;not JUST teleport defs, by the way!
;name, (posX << 6)| music, (posY << 6)| startDirection, msgPrice
.macro choicerDef name, music, posX, direction, posY, msgPrice
    .word name
    .word (posX << 6) | music
    .word (posY << 6) | direction
    .word msgPrice
.endmacro

;ACTUAL teleport defs
choicerDef TELEPORT_MYHOME,6,$CE,6,$145,0
choicerDef TELEPORT_PODUNK,6,$AB,2,$1A7,0
choicerDef TELEPORT_MERRYSVILLE,6,$14B,2,$1CF,0
choicerDef TELEPORT_REINDEER,6,$1CA,6,$3BF,0
choicerDef TELEPORT_SPOOKANE,6,$2DD,2,$364,0
choicerDef TELEPORT_SNOWMAN,10,$398,4,$3BE,0
choicerDef TELEPORT_YOUNGTOWN,$30,$2E2,6,$1D3,0
choicerDef TELEPORT_ELLAY,6,$32A,6,$12E,0

.repeat 8
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat

;union station
choicerDef TELEPORT_REINDEER,$14,$13E,5,$14F,16
choicerDef TELEPORT_SPOOKANE,$14,$13E,5,$14F,25
choicerDef TELEPORT_SNOWMAN,$14,$13E,5,$14F,36
;reindeer station
choicerDef TELEPORT_UNION,$14,$205,6,$33F,16
;spookane station
choicerDef TELEPORT_UNION,$14,$2AD,6,$33F,25
;snowman station
choicerDef TELEPORT_UNION,$14,$35B,6,$3DF,36
;reindeer station 2
choicerDef TELEPORT_SPOOKANE,$14,$206,2,$33F,9
choicerDef TELEPORT_SNOWMAN,$14,$206,2,$33F,20
;spookane station 2
choicerDef TELEPORT_REINDEER,$14,$2AD,6,$33F,9
choicerDef TELEPORT_SNOWMAN,$14,$2AE,2,$33F,11
;snowman station 2
choicerDef TELEPORT_REINDEER,$14,$35B,6,$3DF,20
choicerDef TELEPORT_SPOOKANE,$14,$35B,6,$3DF,11

;flight plan choicers
choicerDef CHOICER_FLIGHTPLANSA,0,0,0,0,5
choicerDef CHOICER_FLIGHTPLANSB,0,0,0,0,10
choicerDef CHOICER_FLIGHTPLANSC,0,0,0,0,15

;hint choicers
choicerDef CHOICER_HINTS1,0,0,0,0,0
choicerDef CHOICER_HINTS2,0,0,0,0,0
choicerDef CHOICER_HINTS3,0,0,0,0,0

.repeat 4
choicerDef CHOICER_SCIENTIST1,0,0,0,0,0
.endrepeat

;scientist gag choicers
choicerDef CHOICER_SCIENTIST1,0,0,0,0,3485
choicerDef CHOICER_SCIENTIST2,0,0,0,0,2775

.repeat $10
choicerDef INAME_NULL,0,0,0,0,0
.endrepeat



;character defs
;exp,arg1,ppLevel,fight,speed,wisdom,strength,force
;exp rate == 256/exp (inversely proportional)
;????/null
.byte 200,$00,0,4,4,4,4,4
;ninten
.byte 214,$00,2,4,4,4,4,4
;ana
.byte 203,$00,3,0,2,6,2,7
;lloyd
.byte 192,$00,0,3,1,7,3,2
;teddy
.byte 150,$00,0,8,8,1,5,3
;pippi
.byte 150,$00,0,8,8,1,5,3
;eye
.byte 200,$00,0,5,3,5,7,1
;flying man
.byte 200,$00,0,6,0,0,8,5

.include "../../global/psi_data.asm"

;map data 1
.incbin "../../split/us/prg/bank0.bin", $2000

.code

