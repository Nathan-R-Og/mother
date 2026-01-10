from glob import glob
from typing import Any

files = glob("src/global/objects/1/*.asm", recursive=True)
files += glob("src/global/objects/2/*.asm", recursive=True)
files += glob("src/global/objects/3/*.asm", recursive=True)

do_sets = {}

for file in files:
    lines = open(file, "r").readlines()
    i = 0
    current_object = ""
    while i < len(lines):
        line = lines[i]


        if line.startswith("OBJ_") and line.strip().endswith(":"):
            current_object = line.strip()

        if line.startswith("OBJ_SET_FLAG") or \
            line.startswith("OBJ_CLEAR_FLAG") or \
            line.startswith("OBJ_FLAG_APPEAR") or \
            line.startswith("OBJ_FLAG_DISAPPEAR"):
            arg = line.split(" ")[-1].strip()
            if arg.find("$") != -1:
                arg = int(arg.replace("$", "0x"), 16)
            else:
                arg = int(arg)

            kind = line.split(" ")[0].strip()

            if not current_object in list(do_sets.keys()):
                do_sets[current_object] = []
            do_sets[current_object].append([arg, kind])
        if line.startswith("teleportFlagDef"):
            arg = line.split(" ", 1)[-1].strip().split(",")
            balls = []
            for a in arg:
                if a.find("$") != -1:
                    a = int(a.replace("$", "0x"), 16)
                else:
                    a = int(a)

                balls.append(a)

            arg = balls[0] + (balls[1] * 8)
            if not current_object in list(do_sets.keys()):
                do_sets[current_object] = []
            do_sets[current_object].append([arg, "teleportFlagDef"])
        elif line.startswith("OBJ_IS_NOT_FLAG"):
            arg = line.split(" ", 1)[-1].strip().split(",")
            a = arg[0]
            if a.find("$") != -1:
                a = int(a.replace("$", "0x"), 16)
            else:
                a = int(a)

            if not current_object in list(do_sets.keys()):
                do_sets[current_object] = []
            do_sets[current_object].append([a, "OBJ_IS_NOT_FLAG"])



        i += 1

all_present_flags = {
    0: "Basement 1",
    1: "Basement 2",
    2: "Basement 3",
    3: "Mansion Present 1",
    4: "Sweet's Present 2",
    5: "Sweet's Present 3",
    6: "Sweet's Present 4",
    7: "Sweet's Present 5",
    8: "Sweet's Present 6",
    9: "Sweet's Present 7",
    10: "Sweet's Present 8",
    11: "Sweet's Present 9",
    12: "Sweet's Present 10",
    13: "Sweet's Present 11",
    14: "Sweet's Present 12",
    15: "Sweet's Present 13",
    16: "Sweet's Present 14",
    17: "Sweet's Present 15",
    18: "Sweet's Present 1",
    #19: ?
    20: "Mansion Present 2",
    21: "Mansion Present 3",
    22: "Mansion Present 4",
    23: "Mansion Present 5",
    24: "Mansion Present 6",
    25: "Zoo Present 1",
    26: "Zoo Present 2",
    27: "Zoo Present 3",
    28: "Zoo Present 4",
    29: "Monkey Present 1",
    30: "Monkey Present 2",
    31: "Monkey Present 3",
    32: "Mt. Itoi Present",
    33: "CoMI Present 1",
    34: "CoMI Present 2",
    35: "CoMI Present 3",
    36: "CoMI Present 4",
    37: "CoMI Present 5",
    38: "CoMI Present 6",
    39: "Castle Present 1",
    40: "Castle Present 2",
    41: "Castle Present 3",
    42: "Castle Present 4",
    43: "Castle Present 5",
    44: "Castle Present 6",
    45: "Castle Present 7",
    46: "Dungeon Present 1",
    47: "Dungeon Present 2",
    48: "Dungeon Present 3",
    49: "Dungeon Present 4",
    50: "Twinkle Present 1",
    51: "Twinkle Present 2",
    52: "Onyx Hook",
    53: "Duncan's Present 1",
    54: "Duncan's Present 2",
    55: "Duncan's Present 3",
    56: "Duncan's Present 4",
    57: "Duncan's Present 5",
    58: "Duncan's Present 6",
    59: "Duncan's Present 7",
    60: "Duncan's Present 8",
    61: "Duncan's Present 9",
    62: "Duncan's Present 10",
    63: "Duncan's Present 11",
    64: "Duncan's Present 12",
    65: "Duncan's Present 13",
    66: "Duncan's Present 14",
    67: "Duncan's Present 15",
    68: "Duncan's Present 16",
    69: "Duncan's Present 17",
    70: "Duncan's Present 18",
    71: "Duncan's Present 19",
    72: "Duncan's Present 20",
    73: "Castle MultiPresent",
}

flag_list = {
    0: "OBJ_TEMP",
    1: "OBJ_ANIMTEMP",
    2: "Unused 1",
    3: "Unused 2",
    4: "Unused 3",
    5: "Unused 4",
    6: "Unused 5",
    7: "Unused 6",
    8: "Unused 7",
    9: "Unused 8",
    #is only set after talking to mom/phone and fighting the doll
    10: "Invasion Completed",
    11: "Returned Pippi to Mayor",
    12: "Returned Chick to Laura",
    13: "Saved the Zoo",
    14: "Unused 9",
    15: "Checked the Mansion Piano",
    16: "Unused 10",
    17: "Unused 11",
    18: "Unused 12",
    19: "Unused 13",
    20: "Podunk Zombie 1",
    21: "Podunk Zombie 2",
    22: "Unused 14",
    #also used to control 26, but mainly used for flying
    23: "Pilot is at Yucca Desert",
    24: "Is Riding Tank",
    25: "Can Ride Plane",
    26: "Destroyed the Pilot's Tank",
    27: "Graveyard Casket 1",
    28: "Graveyard Casket 2",
    29: "Graveyard Casket 3",
    30: "Graveyard Casket 4",
    31: "Graveyard Pippi Exists",
    32: "Zoo Gate Exists",
    33: "Zoo Key Stolen",
    34: "Unused 15",
    35: "Twinke Janitor Moving to Roof",
    36: "Lloyd Moving to Lab",
    37: "Minnie Lamp Killed",
    38: "Mimmie Doll Killed",
    39: "Lloyd is out of the trash",
    40: "LloydIntro exists",
    41: "Forgotten Man exists",
    42: "Idle Boat exists",
    43: "Ellay Arrest Scene",
    44: "Pippi Walked to Mayor",
    45: "Pippi at Home and Swamp",
    46: "Cop tried to take weapon",
    47: "Ana Hat Woman",
    #this one is hard to describe because it is disabled then renabled between battles
    #the only thing that technically relies on it is the lamp trigger. so
    48: "Lamp Trigger is Active",
    49: "Hint Girl is Active",
    #The family also uses this to know when you've beaten the invasion
    50: "Left Home",
    51: "Gotten BasementKey",
    52: "Accepted a drink",
    53: "Swapped Lloyd for Teddy",
    54: "Reindeer Money Guy",
    55: "Unused 16",
    56: "Got Ghost Key",
    57: "Unused 17",
    58: "Talked to Pilot Once",
    59: "Stepped on the Mine",
    60: "Twinkle Roof is unlocked",
    61: "Unused 18",
    62: "Unused 19",
    63: "Unused 20",
    64: "Invasion answered the phone",
    65: "Mislay Inventory Filled",
    66: "Got the Canary Chick",
    67: "Twinkle Scientist Progress",
    68: "Talked to TrashLloyd",
    69: "Quick Capsule Monkey",
    70: "Blew up science lab",
    71: "Unused 21",
    72: "Unused 22",
    73: "Magic Ribbon Cat",
    74: "Magic Candy Cat",
    75: "Talked to Magicant Guard",
    76: "Telepathy'd Magicant Guard",
    77: "Unused 23",
    78: "Nickname Man Calls you Noodlenoggin",
    #Nickname Man asks if you want a nickname
    79: "Philosophy Man says Nickname man has Good Taste",
    #Philosophy Man sees through you
    80: "Nickname Man lie",
    81: "Got Ocarina",
    82: "Unused 24",
    83: "Talked to Red Weed Girl", #not read
    84: "Got Big Bag",
    85: "Cash Card given from Big Bag Guy",
    86: "Cash Card taken by Big Bag Guy",
    87: "Got WordsO'Love",
    88: "Gave Able berry Tofu",
    89: "Got Swear Words",
    90: "Unused 25",
    91: "Checked Twinkle Roof",
    92: "Recruited Ana",
    93: "Accepted Pippi Quest",
    94: "Accepted Zoo Quest",
    95: "Got Zoo Key",
    96: "Fixed Magicant Spoon",
    97: "Unused 26",
    98: "Got Franklin Badge",
    99: "Weapon was Confiscated",
    100: "Recruited Flying Man 1",
    101: "Recruited Flying Man 2",
    102: "Recruited Flying Man 3",
    103: "Recruited Flying Man 4",
    104: "Recruited Flying Man 5",
    105: "Killed Flying Man 1",
    106: "Killed Flying Man 2",
    107: "Killed Flying Man 3",
    108: "Killed Flying Man 4",
    109: "Killed Flying Man 5",
    110: "Killed a Flying Man", #?
    111: "Finished Questionairre",
    112: "Benevolent Old Man Exists",
    113: "Used Duncan Rocket",
    114: "Is Riding Boat",
    115: "Is Riding Tank (real)", #?
    116: "Got Dentures",
    117: "Fought The Fish",
    118: "Recruited Lloyd", #not read
    119: "Escaped Magicant",
    120: "Fought R7037",
    121: "Ellay Rocket",
    122: "Fought Spookane Bellhop",
    123: "Teddy Sleeping", #functionally not used
    124: "Mt Itoi Healer Fail", #?
    125: "Fallin' Love",
    126: "Duncan Factory Dog",
    127: "Talked to Ellay Fake Healer",
    128: "Player gave name",
    129: "Beat the Dragon",
    130: "Unused 27",
    131: "Unused 28",
    132: "Bugerror is now Ninten",
    133: "Got Pass",
    134: "Slept at Swamp House",
    #Used to control output to either Merrysville or Youngtown
    135: "Entered from Podunk Magicave",
    136: "Can ride Tank",
    137: "On FlightplanA",
    138: "On FlightplanB",
    139: "On FlightplanC",
    140: "Teddy has been injured (Music flag)",
    141: "Talked to injured Teddy",
    142: "Lloyd is with Teddy while he's injured",
    143: "FakeHealer is with Teddy while he's injured",
    144: "Fought R7037 (not read)", #not read
    145: "Fought R7038XX",
    146: "EVE died (top of mountain)",
    #also called on game over
    #probably failsafe but also man thats annoying
    147: "EVE died (bottom of mountain)",
    148: "Learnt Teleport from Baby",
    149: "EVE Trigger cracks",
    150: "Unused 29",
    151: "EVE crack anim 1",
    152: "EVE crack anim 2",
    153: "EVE crack anim 3",
    154: "EVE crack anim 4",
    155: "EVE crack anim 5",
    156: "Unused 30",
    157: "Unused 31",
    158: "Unused 32",
    159: "Unused 33",
    160: "Unused 34",
    161: "Unused 35",
    162: "Unused 36",
    163: "Unused 37",
    164: "Unused 38",
    165: "Unused 39",
    166: "Unused 40",
    167: "Unused 41",
    168: "Unused 42",
    169: "Unused 43",
    170: "Unused 44",
    171: "Unused 45",
    172: "Unused 46",
    173: "Unused 47",
    174: "Unused 48",
    175: "Unused 49",
    176: "Unused 50",
    177: "Unused 51",
    178: "Unused 52",
    179: "Unused 53",
    180: "Unused 54",
    181: "Unused 55",
    182: "Unused 56",
    183: "Unused 57",
    184: "Unused 58",
    185: "Unused 59",
    186: "Unused 60",
    187: "Unused 61",
    188: "Unused 62",
    189: "Unused 63",
    190: "Unused 64",
    191: "Unused 65",
    192: "Has EVE",
    193: "Fought R7038XX (not read)", #not read
    194: "Unused 66",
    195: "Unused 67",
    196: "Unused 68",
    197: "Unused 69",
    198: "Unused 70",
    199: "Unused 71",
    200: "Fallin' Love Finished",
    201: "LloydSave Lloyd appear",
    202: "LloydSave Ninten appear",
    203: "LloydSave Ana appear",
    204: "LloydSave Teddy appear",
    205: "Unused 72",
    206: "Unused 73",
    207: "Unused 74",
    208: "Unused 75",
    209: "Unused 76",
    210: "Unused 77",
    211: "Unused 78",
    212: "Unused 79",
    213: "Unused 80",
    214: "Unused 81",
    215: "Unused 82",
    216: "Unused 83",
    217: "Unused 84",
    218: "Unused 85",
    219: "Unused 86",
    220: "Unused 87",
    221: "Unused 88",
    222: "Unused 89",
    223: "Unused 90",
    224: "Magicant is gone",
    225: "Unused 91",
    226: "Unused 92",
    227: "Unused 93",
    228: "Unused 94",
    229: "Unused 95",
    230: "Unused 96",
    231: "Unused 97",
    232: "Has MyHome Teleport",
    233: "Has Podunk Teleport",
    234: "Has Merrysville Teleport",
    235: "Has Reindeer Teleport",
    236: "Has Spookane Teleport",
    237: "Has Snowman Teleport",
    238: "Has Youngtown Teleport",
    239: "Has Ellay Teleport",
    240: "Got Tombstone Melody",
    241: "Got EVE Melody",
    242: "Got Dragon Melody",
    243: "Got Cactus Melody",
    244: "Got Piano Melody",
    245: "Got Monkey Melody",
    246: "Got Canary Melody",
    247: "Got Doll Melody",
    248: "Invasion Effect is Active",
    249: "Unused 98",
    250: "Unused 99",
    251: "Unused 100",
    252: "Unused 101",
    253: "Unused 102",
    254: "Has EVE (not read)", #not read
    255: "Mt. Itoi Animating"
}

for set in do_sets.keys():
    #print(set)
    for group in do_sets[set]:
        flag, kind = group
        if flag not in list(flag_list.keys()):
            pass
        else:
            if flag_list[flag].startswith("Unused"):
                print(set)
                print(group)