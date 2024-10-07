.segment        "PRG0": absolute

.include "../fontmap.asm"

.byte 0

;items
.byte   "Big Bag",stopText
.byte   "Phone Card",stopText
.byte   "Crumbs",stopText
.byte   "Repel Ring",stopText
.byte   "ButterKnife",stopText
.byte   "Surv.Knife",stopText
.byte   "Sword",stopText
.byte   "Katana",stopText
.byte   "Stun Gun",stopText
.byte   "Air Gun",stopText
.byte   "Plastic Bat",stopText
.byte   "Wooden Bat",stopText
.byte   "AluminumBat",stopText
.byte   "Hank's Bat",stopText
.byte   "Frying Pan",stopText
.byte   "NonstickPan",stopText
.byte   "IronSkillet",stopText
.byte   "Slingshot",stopText
.byte   "Boomerang",stopText
.byte   "Insecticide",stopText
.byte   "Super Spray",stopText
.byte   "Flea Bag",stopText
.byte   "WordsO'Love",stopText
.byte   "Swear Words",stopText
.byte   "StkyMachine",stopText
.byte   "Flashdark",stopText
.byte   "StoneOrigin",stopText
.byte   "PoisnNeedle",stopText
.byte   "Fl Thrower",stopText
.byte   "Bomb",stopText
.byte   "Super Bomb",stopText
.byte   "Laser Beam",stopText
.byte   "Plasma Beam",stopText
.byte   "Rope",stopText
.byte   "Peace Coin",stopText
.byte   "ProtectCoin",stopText
.byte   "Magic Coin",stopText
.byte   "Brass Ring",stopText
.byte   "Silver Ring",stopText
.byte   "Gold Ring",stopText
.byte   "H2o Pendant",stopText
.byte   "FirePendant",stopText
.byte   "EarthPendnt",stopText
.byte   "Sea Pendant",stopText
.byte   "OrangeJuice",stopText
.byte   "FrenchFries",stopText
.byte   "Magic Herb",stopText
.byte   "Hamburger",stopText
.byte   "SportsDrink",stopText
.byte   "LifeUpCream",stopText
.byte   "AsthmaSpray",stopText
.byte   "Antidote",stopText
.byte   "Mouthwash",stopText
.byte   "berry Tofu",stopText
.byte   "Bread",stopText
.byte   "Noble Seed",stopText
.byte   "PSI Stone",stopText
.byte   "MagicRibbon",stopText
.byte   "Magic Candy",stopText
.byte   "QuickCapsul",stopText
.byte   "Wisdom Caps",stopText
.byte   "PhysicalCap",stopText
.byte   "ForceCapsul",stopText
.byte   "FightCapsul",stopText
.byte   "BasementKey",stopText
.byte   "Zoo Key",stopText
.byte   "Ghost Key",stopText
.byte   "GGF's Diary",stopText
.byte   "Pass",stopText
.byte   "Ticket",stopText
.byte   "CanaryChick",stopText
.byte   "BottlRocket",stopText
.byte   "Hat",stopText
.byte   "Dentures",stopText
.byte   "Ticket Stub",stopText
.byte   "IC-chip",stopText
.byte   "Ocarina",stopText
.byte   "FranklnBdge",stopText
.byte   "FrndshpRing",stopText
.byte   "Onyx Hook",stopText
.byte   "Last Weapon",stopText
.byte   "Ruler",stopText
.byte   "Cash Card",stopText
.byte   "Red Weed",stopText
.byte   "Bullhorn",stopText
.byte   "Map",stopText
.byte   "Debug",stopText
.byte 0

;choicers

.byte   "FlightplanA",stopText
.byte   "FlightplanB",stopText
.byte   "FlightplanC",stopText

.byte   "Hint 1",stopText
.byte   "Hint 2",stopText
.byte   "Hint 3",stopText

.byte   "Real Rocket",stopText
.byte   "TimeMachine",stopText
.byte 0

;teleport locales
.byte   "MyHome",stopText
.byte   "Podunk",stopText
.byte   "Merrysville",stopText
.byte   "Reindeer",stopText
.byte   "Spookane",stopText
.byte   "Snowman",stopText
.byte   "Youngtown",stopText
.byte   "Ellay",stopText
.byte   "Union",stopText
.byte 0

;PSI
.byte   "Telepathy",stopText
.byte   "Teleport",stopText
.byte   "LifeUp ",alpha,stopText
.byte   "LifeUp ",beta,stopText
.byte   "LifeUp ",gamma,stopText
.byte   "LifeUp ",pi,stopText
.byte   "LifeUp ",omega,stopText
.byte   "Healing ",alpha,stopText
.byte   "Healing ",beta,stopText
.byte   "Healing ",gamma,stopText
.byte   "Healing ",pi,stopText
.byte   "SuprHealing",stopText
.byte   "PSIShield ",alpha,stopText
.byte   "PSIShield ",beta,stopText
.byte   "PowerShield",stopText
.byte   "BrainShock",stopText
.byte   "BrainCyclon",stopText
.byte   "Hypnosis",stopText
.byte   "Paralysis",stopText
.byte   "Darkness",stopText
.byte   "PSI-Magnet",stopText
.byte   "Shield-Off",stopText
.byte   "PSI-Block",stopText
.byte   "OffenseUp",stopText
.byte   "DefenseUp ",alpha,stopText
.byte   "DefenseUp ",beta,stopText
.byte   "QuickUp",stopText
.byte   "Def.Down ",alpha,stopText
.byte   "Def.Down ",beta,stopText
.byte   "4th-D Slip",stopText
.byte   "PK Freeze ",alpha,stopText
.byte   "PK Freeze ",beta,stopText
.byte   "PK Freeze ",gamma,stopText
.byte   "PK Freeze ",omega,stopText
.byte   "PK Fire ",alpha,stopText
.byte   "PK Fire ",beta,stopText
.byte   "PK Fire ",gamma,stopText
.byte   "PK Fire ",omega,stopText
.byte   "PK Beam ",alpha,stopText
.byte   "PK Beam ",beta,stopText
.byte   "PK Beam ",gamma,stopText
.byte   "PK Beam ",omega,stopText
.byte   "PK Thunder",alpha,stopText
.byte   "PK Thunder",beta,stopText
.byte   "PK Thunder",gamma,stopText

;status
.byte   "Faintd",stopText
.byte   " Stone",stopText
.byte   "Parlzd",stopText
.byte   "Asleep",stopText
.byte   "Confsd",stopText
.byte   "Puzzld",stopText
.byte   "Poison",stopText
.byte   "  Cold",stopText
.byte 0

;enemies
.byte   "BigWoodoh",stopText
.byte   "Dragon",stopText
.byte   "R7038",stopText
.byte   "Elephant",stopText
.byte   "Bear",stopText
.byte   "Big Foot",stopText
.byte   "Mad Truck",stopText
.byte   "Old Robot",stopText
.byte   "Megaborg",stopText
.byte   "Gargoyle",stopText
.byte   "Gabilan",stopText
.byte   "Gorilla",stopText
.byte   "Bison",stopText
.byte   "Tiger",stopText
.byte   "Mad Car",stopText
.byte   "Raeb Yddet",stopText
.byte   "Magic Snail",stopText
.byte   "Titanees",stopText
.byte   "Giegue",stopText
.byte   "Eagle",stopText
.byte   "Wolf",stopText
.byte   "Seagull",stopText
.byte   "Alligator",stopText
.byte   "EnergyRobot",stopText
.byte   "The Fish",stopText
.byte   "Fugitive",stopText
.byte   "B.B.'s Boss",stopText
.byte   "Barbot",stopText
.byte   "Nancy",stopText
.byte   "Starman",stopText
.byte   "Ullrich",stopText
.byte   "Cerebrum",stopText
.byte   "Mook",stopText
.byte   "Armor",stopText
.byte   "Woodoh",stopText
.byte   "Wally",stopText
.byte   "The Hippie",stopText
.byte   "Bag Lady",stopText
.byte   "B.B. Gang",stopText
.byte   "Dr.Distorto",stopText
.byte   "Gang Zombie",stopText
.byte   "PseudoZombi",stopText
.byte   "Crow",stopText
.byte   "Snake",stopText
.byte   "Hyena",stopText
.byte   "Cougar",stopText
.byte   "Centipede",stopText
.byte   "Dust Ball",stopText
.byte   "Fly",stopText
.byte   "Spider",stopText
.byte   "Scorpion",stopText
.byte   "Rope",stopText
.byte   "Fire Ball",stopText
.byte   "Watcher",stopText
.byte   "Groucho",stopText
.byte   "Ghost",stopText
.byte   "Lil Saucer",stopText
.byte   "Mr. Bat",stopText
.byte   "Starman Jr.",stopText
.byte   "Skunk",stopText
.byte   "Shroudley",stopText
.byte   "Rat",stopText
.byte   "Bomber",stopText
.byte   "Doll",stopText
.byte   "Lamp",stopText
.byte   "BionicCenti",stopText
.byte   "BionicScorp",stopText
.byte   "Red Snake",stopText
.byte   "Lone Wolf",stopText
.byte   "Polar Bear",stopText
.byte   "Rattlesnake",stopText
.byte   "Tarantula",stopText
.byte   "Crocodile",stopText
.byte   "Buffalo",stopText
.byte   "Bionic Bat",stopText
.byte   "Stray Dog",stopText
.byte   "Psycho Car",stopText
.byte   "PsychoTruck",stopText
.byte   "ManiacTruck",stopText
.byte   "Alarm Ghost",stopText
.byte   "Foureyes",stopText
.byte   "Dadseyes",stopText
.byte   "Momseyes",stopText
.byte   "Sky Yddet",stopText
.byte   "Giga Borg",stopText
.byte   "Omega Borg",stopText
.byte   "Scrapper",stopText
.byte   "UltraBarbot",stopText
.byte   "OmegaSaucer",stopText
.byte   "Kelly",stopText
.byte   "Star Miner",stopText
.byte   "SuperEnergy",stopText
.byte   "Juana",stopText
.byte   "BlueStarman",stopText
.byte   "Rockoyle",stopText
.byte   "Titanian",stopText
.byte   "Oh-Mook",stopText
.byte   "Zombie",stopText
.byte   "NastyZombie",stopText
.byte   "Silver Wolf",stopText
.byte   "R7037",stopText
.byte   "GrizzlyBear",stopText
.byte   "R7038XX",stopText
.byte   "LastStarman",stopText
.byte   0

.repeat $81
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

.incbin "../../split/us/prg/bank0.bin", $C00, $3400

.code

