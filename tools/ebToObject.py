from copy import deepcopy

bytes = open("split/us/obj/OBJ_MTITOI_CABINCUTSCENE.bin", "rb").read()
ramstart = 0x8000
objstart = 0x290

SCRIPT_TABLE = {
    0: ["OBJ_STOP"],
    1: ["OBJ_JUMP", 'oaddr'], #just jump
    2: ["OBJ_SUBROUTINE", 'addr', 'byte'], #call pointer j of object o
    3: ["OBJ_RETURN"], #return from subroutine
    4: ["OBJ_DELAY", 'byte'], #delay for t frames
    5: ["OBJ_FLAG_DISAPPEAR", 'byte'], #disappear if f == 1
    6: ["OBJ_FLAG_APPEAR", 'byte'], #appear if f == 1
    8: ["OBJ_DIALOGUE", 'word'], #display dialogue from msg_pointerlist
    9: ["OBJ_YESNO_IS_NO", 'oaddr'], #ask yes or no, jump if no/b
    0xA: ["OBJ_IS_NOT_TALKING", 'oaddr'], #jump to j if not talking
    0xB: ["OBJ_IS_NOT_CHECKING", 'oaddr'], #jump to j if not checking
    0xC: ["OBJ_IS_NOT_CASTING", 'byte', 'oaddr'], #jump to j if not using psi p
    0xD: ["OBJ_IS_NOT_USING", 'byte', 'oaddr'], #jump to j if not using this item
    0xF: ["OBJ_RESET"], #reset the nes
    0x10: ["OBJ_SET_FLAG", 'byte'], #set flag f
    0x11: ["OBJ_CLEAR_FLAG", 'byte'], #clear flag f
    0x12: ["OBJ_IS_NOT_FLAG", 'byte', 'oaddr'], #jump to j if f == 0
    0x13: ["OBJ_DECREMENT_COUNTER", 'byte'], #decrements counter c
    0x14: ["OBJ_INCREMENT_COUNTER", 'byte'], #increments counter c
    0x15: ["OBJ_RESET_COUNTER", 'byte'], #resets counter c
    0x16: ["OBJ_COUNTERLESSTHAN", 'byte', 'byte', 'oaddr'], #jumps to j if counter c < int n
    0x18: ["OBJ_CHOOSE_CHARACTER", 'oaddr'], #choose character, jump if b pressed
    0x19: ["OBJ_PICK_CHARACTER", 'byte'], #select character
    0x1A: ["OBJ_NOT_CHARACTER_SELECTED", 'byte', 'oaddr'], #jump to j if chararacter c not selected
    0x1B: ["OBJ_NO_NEW_MONEY", 'oaddr'], #jump to j if no money has been gained since last call
    0x1D: ["OBJ_LOAD_NUMBER", 'word'], #load number ????
    0x1F: ["OBJ_SHOW_MONEY"], #yeah
    0x20: ["OBJ_CHOOSE_ITEM", 'oaddr'], #jump to j if declined
    0x21: ["OBJ_CHOOSE_ITEM_CLOSET", 'oaddr'], #jump to j if declined
    0x22: ["OBJ_DISPLAY_ITEMS", 'byte', 'byte', 'byte', 'byte', 'oaddr'], #jump if b pressed
    0x25: ["OBJ_PICK_ITEM", 'byte'], #load i into selected item
    0x26: ["OBJ_IS_NOT_SELECTED", 'byte', 'oaddr'], #jump to j if i isnt selected
    0x27: ["OBJ_NOT_HAS_ITEM", 'byte', 'oaddr'], #jump to j if i not in inventory
    0x28: ["OBJ_GIVE_MONEY", 'oaddr'], #jump to j if cant hold money
    0x29: ["OBJ_TAKE_MONEY", 'oaddr'], #jump to j if not enough money
    0x2C: ["OBJ_UNSELLABLE", 'oaddr'], #jump to j if item cannot be sold
    0x2D: ["OBJ_GIVE_ITEM", 'oaddr'], #jump to j if inventory full. else give selected item
    0x2E: ["OBJ_REMOVE_ITEM", 'oaddr'], #remove item, jump if doesn't have
    0x2F: ["OBJ_ADD_ITEM_TO_CLOSET", 'oaddr'], #add item to closet, jump to j if closet full
    0x30: ["OBJ_TAKE_ITEM_FROM_CLOSET", 'oaddr'], #remove item to closet, jump to j if not available
    0x31: ["OBJ_PICK_CHARACTER_ITEM", 'byte', 'oaddr'], #pick character's I'th item, jump if empty (0)
    0x32: ["OBJ_MULTIPLY_NUMBER", 'byte'], #multiply number by n / 100
    0x33: ["OBJ_NOT_HAS_CHARACTER", 'byte', 'oaddr'], #jump to j if character is not in party
    0x35: ["OBJ_IS_NOT_TOUCHING", 'oaddr'], #jump to j if not touching
    0x36: ["J_UNK", 'oaddr'], #jump to j if ??????
    0x37: ["OBJ_MENU", 'word', 'oaddr', 'oaddr'], #display menu pointer, jump to j1 if option 2, jump to j2 if b pressed
    0x38: ["OBJ_NO_ITEMS", 'oaddr'], #jump to j if no items
    0x39: ["OBJ_NO_ITEMS_CLOSET", 'oaddr'], #jump to j if no items in closet
    0x3A: ["OBJ_PICK_CHARACTER_J", 'byte', 'oaddr'], #select character c in party, jump to j if not present
    0x3B: ["OBJ_CHANGE_TYPE", 'byte'], #change object type to t
    0x3D: ["OBJ_TELEPORT", 'doorArgDef'], #teleport player to doorArgDef (basically, runs a door command)
    0x3E: ["OBJ_MOVE", 'addr'], #move using m pointer (word)
    0x3F: ["OBJ_SIGNAL", 'byte'], #signal object o (index)
    0x40: ["OBJ_IS_SIGNAL", 'oaddr'], #jump to j if not signaled
    0x41: ["OBJ_TELEPORT_TO_SAVEGAME"], #teleport to saved game location
    0x42: ["OBJ_ADD_CHARACTER", 'byte', 'oaddr'], #add char c from party, jump to j if full
    0x43: ["OBJ_REMOVE_CHARACTER", 'byte', 'oaddr'], #remove char c from party, jump to j if not in
    0x44: ["OBJ_BATTLE", 'byte'], #start battle b in battles list
    0x45: ["OBJ_MULTIPLY_BY_PARTY"], #multiply by number of characters
    0x46: ["OBJ_ROCKET", 'byte'], #spawn rocket in direction (?)
    0x47: ["OBJ_AIRPLANE", 'byte'], #spawn airplane in direction (?)
    0x48: ["OBJ_TANK", 'byte'], #spawn tank in direction (?)
    0x4C: ["OBJ_NOVEC", 'byte'], #spawn players in direction (?)
    0x4D: ["OBJ_END_PLANE"], #end plane path
    0x4F: ["J_UNK2", 'oaddr'], #jump to j if ?????
    0x50: ["OBJ_NOT_MAX_HEALTH", 'oaddr'], #jump to j if < max hp
    0x51: ["OBJ_HEAL", 'byte'], #heal hp n
    0x52: ["OBJ_HAS_STATUS", 'byte', 'oaddr'], #jump to j if character has status s
    0x53: ["OBJ_AND_STATUS", 'byte'], #remove all statuses but s
    0x54: ["OBJ_BELOW_LEVEL", 'byte', 'oaddr'], #jump to j if character < n
    0x55: ["OBJ_SLEEP"], #sleep
    0x56: ["OBJ_SAVE"], #self explanatory
    0x57: ["OBJ_GET_NEXT_EXP"], #get selected characters' needed exp
    0x58: ["OBJ_GET_CASH"], #get money
    0x59: ["OBJ_GIVE_STATUS", 'byte'], #inflict s status
    0x5A: ["OBJ_PLAY_MUSIC", 'byte'], #play m song
    0x5B: ["OBJ_PLAY_SOUND2", 'byte'], #play s
    0x5C: ["OBJ_PLAY_SOUND", 'byte'], #play s
    0x60: ["OBJ_NOT_MAX_PP", 'oaddr'], #jump to j if < max pp
    0x61: ["OBJ_PPHEAL", 'byte'], #heal pp n
    0x62: ["OBJ_TAKE_WEAPON", 'oaddr'], #jump to j if no weapon, else take
    0x63: ["OBJ_SELECT_CONFWEAPON", 'oaddr'], #get confiscated weapon, jump to j if none
    0x64: ["OBJ_DO_LIVE_SHOW"], #in ellay
    0x65: ["OBJ_INCOMPLETE_MELODIES", 'oaddr'], #jump to j if not all melodies learnt
    0x66: ["OBJ_REGISTER_NAME"], #register name
    0x68: ["OBJ_LAND_MINE"], #in yucca desert
}


i = 0
lines = []
header = int.from_bytes(bytes[i:i+2], "little")
obtype = header & 0b0000000000111111
posX = (header & 0b1111111111000000) >> 6
header2 = int.from_bytes(bytes[i+2:i+4], "little")
direction = header2 & 0b0000000000111111
posY = (header2 & 0b1111111111000000) >> 6
lines.append(f"objectDef {obtype}, {posX}, {direction}, {posY}")
i += 4
pointer = int.from_bytes(bytes[i:i+2], "little")
hasSprite = pointer in range(0x8000, 0xFFFF+1)
if hasSprite:
    word3 = hex(pointer).replace("0x","$").upper()
    lines.append(f".addr {word3} ;sprite")
    i += 2
oldI = i

labels = []
move_labels = []

labelstore = []
move_labelstore = []

interpret = []
movement_data = []
while i < len(bytes):
    #stop at first move label - indicates start of movement data
    move_found = False
    for label in move_labels:
        ramat = ramstart+objstart+i
        if label[1] == ramat:
            move_found = True
            break
    if move_found:
        #END OF NORMAL INTERPRETATION
        labelstore = deepcopy(labels)
        move_labelstore = deepcopy(move_labels)


        #MOVE mode. interpret movement data
        movement_bytes = bytes[i:]
        x = 0
        while x < len(movement_bytes):
            for label in move_labels:
                ramat = ramstart+objstart+i
                if label[1] == ramat:
                    movement_data.append("\t"+label[0]+":")
                    move_labels.remove(label)

            if movement_bytes[x] in [3, 0]:
                if movement_bytes[x] == 3:
                    movement_data.append("OBJ_RETURN")
                else:
                    movement_data.append("OBJ_STOP")
                x += 1
                i += 1
                continue
            direction = movement_bytes[x+1] & 0b00000111
            cmd = (movement_bytes[x+1] & 0b11111000) >> 3
            tiles = movement_bytes[x]
            movement_data.append(f"moveDef {direction}, {cmd}, {tiles}")

            x += 2
            i += 2

        break

    #interpret
    print(bytes[i:].hex())
    args = deepcopy(SCRIPT_TABLE[bytes[i]])
    args = args
    for x in range(len(args)):
        arg = args[x]
        if x == 0:
            i += 1
        else:
            if arg == "byte":
                args[x] = bytes[i]
                i += 1
            elif arg == "oaddr":
                #check if label exists
                found = False
                for label in labels:
                    if label[1] == bytes[i]:
                        found = True
                        break
                if not found:
                    labels.append([args[0], bytes[i]])
                args[x] = [arg, bytes[i]]
                i += 1
            elif arg == "word":
                args[x] = int.from_bytes(bytes[i:i+2], "little")
                i += 2
            elif arg == "addr":
                value = int.from_bytes(bytes[i:i+2], "little")
                if args[0] == "OBJ_MOVE":
                    #check if label exists
                    found = False
                    for label in move_labels:
                        if label[1] == value:
                            found = True
                            break
                    if not found:
                        move_labels.append([f"OBJ_MOVE_{len(move_labels)}", value])
                else:
                    #check if label exists
                    found = False
                    for label in labels:
                        if label[1] == value:
                            found = True
                            break
                    if not found:
                        labels.append([args[0], value])
                args[x] = [arg, value]
                i += 2
            elif arg == "doorArgDef":
                split1 = int.from_bytes(bytes[i:i+2], 'little')
                telemusic = split1 & 0b0000000000111111
                telex = (split1 & 0b1111111111000000) >> 6
                split2 = int.from_bytes(bytes[i+2:i+4], 'little')
                teledir = split2 & 0b0000000000111111
                teley = (split2 & 0b1111111111000000) >> 6
                args[x] = f"{telemusic}, {telex}, {teledir}, {teley}"
                i += 4
    interpret.append(args)

if len(labelstore) != len(labels):
    labelstore = deepcopy(labels)


i = oldI
x = 0
while x < len(interpret):
    found = False
    for label in labels:
        if i == label[1]:
            interpret.insert(x, "\tJMP_"+label[0]+":")
            labels.remove(label)
            found = True
            break
    if found:
        x += 1
        continue


    #move
    for key in list(SCRIPT_TABLE.keys()):
        if SCRIPT_TABLE[key][0] == interpret[x][0]:
            for a in range(len(SCRIPT_TABLE[key])):
                if a == 0:
                    i += 1
                else:
                    if SCRIPT_TABLE[key][a] == "byte":
                        i += 1
                    elif SCRIPT_TABLE[key][a] == "oaddr":
                        i += 1
                    elif SCRIPT_TABLE[key][a] == "word":
                        i += 2
                    elif SCRIPT_TABLE[key][a] == "addr":
                        i += 2
                    elif SCRIPT_TABLE[key][a] == "doorArgDef":
                        i += 4
            break


    #replace label originators with the labels
    a = 0
    while a < len(interpret[x]):
        if type(interpret[x][a]) == list:
            if interpret[x][a][0] == 'oaddr':
                for label in labelstore:
                    if label[1] == interpret[x][a][1]:
                        interpret[x][a] = "JMP_"+label[0]
                        break
            elif interpret[x][a][0] == 'addr':
                for movelabel in move_labelstore:
                    if movelabel[1] == interpret[x][a][1]:
                        interpret[x][a] = "MOVE_"+movelabel[0]
                        break

        #cleanup
        if type(interpret[x][a]) != str:
            interpret[x][a] = str(interpret[x][a])

        a += 1

    #cleanup
    interpret[x] = " ".join(interpret[x])


    x += 1

lines += interpret
lines += movement_data

for line in lines:
    print(line)