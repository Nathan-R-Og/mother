file = "src/jp/prg/bank8.asm"
lines = open(file, "r").readlines()
bank = "OBJ_BANK_2"
i = 0
pointers = []
reading = False
while i < len(lines):
    if not reading:
        if lines[i].find(bank+":") != -1:
            reading = True
    else:
        if lines[i].find(".word 0") != -1:
            break
        get = lines[i].split("word $")[-1].strip()
        fix = hex(int(get, 16) - 0x8000).replace("0x", "").upper()
        while len(fix) < 4:
            fix = "0"+fix
        pointers.append(fix)
    i += 1
binaryFile = file.replace("src","split").replace(".asm",".bin")
bytes = open(binaryFile, "rb").read()
pointerDatas = []
i = 0
while i < len(pointers):
    start = int(pointers[i], 16)
    #TODO: unhardcode this
    if i == len(pointers)-1:
        end = 0x608
    else:
        end = int(pointers[i+1], 16)

    pointerDatas.append(bytes[start:end])
    i += 1

OBJ_TYPE = {
    0: "NULL",
    1: "DOOR",
    2: "DOOR_UNK",
    3: "STAIRS",
    4: "HOLE",
    0x10: "STATIONARY_NPC2",
    0x11: "WANDERING_NPC2",
    0x12: "WANDERINGFAST_NPC",
    0x13: "SPINNING_NPC",
    0x15: "WANDERING_NPC",
    0x1b: "TRIGGER"
}

DIRECTIONS = {
    0: "UP",
    1: "UP_RIGHT",
    2: "RIGHT",
    3: "DOWN_RIGHT",
    4: "DOWN",
    5: "DOWN_LEFT",
    6: "LEFT",
    7: "UP_LEFT",
    8: "IN_PLACE"
}


parsedObjects = []
fakeI = 0
for pointerData in pointerDatas:
    fakerI = hex(fakeI).replace("0x","").upper()
    newObjectName = f"OBJ_THING{fakerI}"
    newObject = [f"{newObjectName}:\n"]
    #get the objectDef
    word1 = bin(int.from_bytes(pointerData[0:2], "little"))[2:]
    word2 = bin(int.from_bytes(pointerData[2:4], "little"))[2:]
    while len(word1) < 16:
        word1 = "0"+word1
    while len(word2) < 16:
        word2 = "0"+word2
    word1 = word1[::-1]
    word2 = word2[::-1]
    #get values
    type = int(word1[:6][::-1], 2)
    posX = int(word1[6:][::-1], 2)
    direction = int(word2[:6][::-1], 2)
    posY = int(word2[6:][::-1], 2)

    args = []
    #asm convert
    if type in list(OBJ_TYPE.keys()):
        args.append("OBJ_TYPE::"+OBJ_TYPE[type])
    else:
        args.append(hex(type).replace("0x","$"))
    args.append(hex(posX).replace("0x","$"))
    if direction in list(DIRECTIONS.keys()):
        args.append("DIRECTIONS::"+DIRECTIONS[direction])
    else:
        args.append(hex(direction).replace("0x","$"))
    args.append(hex(posY).replace("0x","$"))
    args = ", ".join(args)
    newObject.append(f"objectDef {args}\n")

    #door-adjacent object
    if type in list(range(1, 4+1)):
        #get the doorArgDef
        word3 = bin(int.from_bytes(pointerData[4:6], "little"))[2:]
        word4 = bin(int.from_bytes(pointerData[6:8], "little"))[2:]
        while len(word3) < 16:
            word3 = "0"+word3
        while len(word4) < 16:
            word4 = "0"+word4
        word3 = word3[::-1]
        word4 = word4[::-1]
        #get values
        music = int(word3[:6][::-1], 2)
        targetPosX = int(word3[6:][::-1], 2)
        targetDirection = int(word4[:6][::-1], 2)
        targetPosY = int(word4[6:][::-1], 2)

        #asm convert
        music = hex(music).replace("0x","$").upper()
        targetPosX = hex(targetPosX).replace("0x","$").upper()
        if targetDirection in list(DIRECTIONS.keys()):
            targetDirection = "DIRECTIONS::"+DIRECTIONS[targetDirection]
        else:
            targetDirection = hex(targetDirection).replace("0x","$").upper()
        targetPosY = hex(targetPosY).replace("0x","$").upper()
        args = ", ".join([music, targetPosX, targetDirection, targetPosY])
        newObject.append(f"doorArgDef {args}\n")
    elif len(pointerData) > 6:
        #other types usually start with a sprite pointer
        #check if it isnt, this bugged IMMEDIATELY
        i = 4
        numba = int.from_bytes(pointerData[4:6], "little")
        hasSprite = numba in range(0x8000, 0xFFFF+1)
        if hasSprite:
            word3 = hex(numba).replace("0x","$").upper()
            newObject.append(f".word {word3} ;sprite\n")
            i += 2
        #the rest is behavior scripting
        #THIS is the part i cared to automate.

        #list of labels referenced inside itself
        internalLabels = []
        SCRIPTS = {
        1: "J_JUMP", #just jump
        2: "OJ_SUBROUTINE", #call pointer j of object o
        3: "RETURN", #return from subroutine
        4: "T_DELAY", #delay for t frames
        5: "F_DISAPPEAR", #disappear if f == 1
        6: "F_APPEAR", #appear if f == 1
        8: "DIALOGUE", #display dialogue from msg_pointerlist
        9: "J_YESNO", #ask yes or no, jump if no/b
        0xA: "J_TALK", #jump to j if not talking
        0xB: "J_CHECK", #jump to j if not checking
        0xD: "IJ_USE", #jump to j if not using this item
        0xF: "RESET", #reset the nes
        0x10: "F_SETFLAG", #set flag f
        0x11: "F_CLEARFLAG", #clear flag f
        0x12: "FJ_JUMP", #jump to j if f == 0
        0x19: "C_SELECT", #select character
        0x1B: "J_NONEWMONEY", #jump to j if no money has been gained since last call
        0x25: "I_PICKITEM", #load i into selected item
        0x27: "IJ_HASITEM", #jump to j if i not in inventory
        0x2D: "J_GIVEITEM", #jump to j if inventory full. else give selected item
        0x2E: "J_REMOVEITEM", #remove item, jump if doesn't have
        0x31: "IJ_PICKCHARITEM", #pick character's I'th item, jump if empty (0)
        0x33: "CJ_PRESENT", #jump to j if character is not in party
        0x35: "J_TOUCH", #jump to j if not touching
        0x36: "J_UNK", #jump to j if ??????
        0x37: "JJ_CUSTOMMENU", #display menu pointer, jump to j1 if option 2, jump to j2 if b pressed
        0x3A: "CJ_SELECTPARTY", #select character c in party, jump to j if not present
        0x3B: "T_CHANGETYPE", #change object type to t
        0x3D: "DA_TELEPORT", #teleport player to doorArgDef (basically, runs a door command)
        0x3E: "M_MOVE", #move using m pointer (word)
        0x3F: "O_SIGNAL", #signal object o (index)
        0x40: "J_SIGNALED", #jump to j if not signaled
        0x43: "CJ_REMOVECHAR", #remove char c from party, jump to j if not in
        0x44: "B_BATTLE", #start battle b in battles list
        0x50: "J_NOTMAX", #jump to j if < max hp
        0x51: "N_HEAL", #heal hp n
        0x52: "SJ_PRESENT", #jump to j if character has status s
        0x53: "S_REMOVEBUT", #remove all statuses but s
        0x56: "SAVE", #self explanatory
        0x57: "GETCHARNEXTEXP", #get selected characters' needed exp
        0x5A: "M_MUSIC", #play m song
        0x5C: "S_PLAYSOUND", #play s
        0x60: "J_NOTMAXPP", #jump to j if < max pp
        0x61: "N_HEALPP", #heal pp n
        }
        #can you tell why?
        while i < len(pointerData):
            for label in internalLabels:
                if label[0] == i: #when a queued internal label matches with the increment, plop it down
                    newObject.append(f"      {label[1]}:\n")
            stype = pointerData[i]
            if stype in list(SCRIPTS.keys()):
                name = SCRIPTS[stype]
                args = []
                customhandle = False #for stuff like DIALOGUE that needs specific formatting, otherwise everything is a byte
                if name == "J_TALK":
                    #arg1: label (inside object) to jump to if not currently talking
                    label_position = pointerData[i+1]
                    useName = f"{newObjectName}_JTALK{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    #since these labels are relative, subtract by the main object label
                    args.append(f"{useName}-{newObjectName}")
                    i += 1
                elif name == "FJ_JUMP":
                    #arg1 : flag to determine whether or not to jump (specifically if 0)
                    #arg1 : where to jump to from ^
                    args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                    label_position = pointerData[i+2]
                    useName = f"{newObjectName}_FJTALK{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    args.append(f"{useName}-{newObjectName}")
                    i += 2
                elif name == "DIALOGUE":
                    customhandle = True
                    #arg1: the dialogue pointer
                    #i am leaving these hardcoded until a full editor is made. i hate this so much
                    #TWO THINGS!!
                    #1. it is a word!
                    #2. jp uses the actual pointer! us does not!!!
                    #those are my reasonings. if you disagree do it yourself

                    pointer = hex(int.from_bytes(pointerData[i+1:i+3], "little")).replace("0x","$").upper()
                    while len(pointer) < 5:
                        pointer = pointer.replace("$", "$0")
                    args.append(pointer)
                    args.insert(0, "SCRIPTS::"+name)
                    newObject.append(f".byte {args[0]}\n")
                    newObject.append(f".word {args[1]}\n")
                    i += 2
                elif name == "J_YESNO":
                    #arg1: label (inside object) to jump to if say no or press b
                    label_position = pointerData[i+1]
                    useName = f"{newObjectName}_JYESNO{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    args.append(f"{useName}-{newObjectName}")
                    i += 1
                elif name == "J_JUMP":
                    #arg1: label to jump to, with no condition
                    label_position = pointerData[i+1]
                    useName = f"{newObjectName}_JJUMP{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    args.append(f"{useName}-{newObjectName}")
                    i += 1
                elif name == "J_CHECK":
                    #arg1: label to jump to if not currently checking
                    label_position = pointerData[i+1]
                    useName = f"{newObjectName}_JCHECK{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    args.append(f"{useName}-{newObjectName}")
                    i += 1
                elif name == "T_CHANGETYPE":
                    #arg1: type in OBJ_TYPE to change to
                    type = pointerData[i+1]
                    if type in list(OBJ_TYPE.keys()):
                        type = f"OBJ_TYPE::{OBJ_TYPE[type]}"
                    else:
                        type = hex(type).replace("0x","$").upper()
                    args.append(type)
                    i += 1
                elif name == "IJ_HASITEM":
                    #arg1: item to check for
                    #arg2: label to jump to if player does not have
                    item = hex(pointerData[i+1]).replace("0x", "$").upper()
                    args.append(item)
                    label_position = pointerData[i+2]
                    useName = f"{newObjectName}_IJHASITEM{len(internalLabels)}"
                    exists = False
                    for label in internalLabels:
                        if label[0] == label_position:
                            exists = True
                            useName = label[1]
                            break
                    if not exists:
                        internalLabels.append([label_position, useName])
                    args.append(f"{useName}-{newObjectName}")
                    i += 2
                elif name == "F_DISAPPEAR":
                    #arg1 : flag to determine whether or not disappear (if 1)
                    args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                    i += 1
                elif name == "B_BATTLE":
                    #arg1 : battle id to start
                    #id enum this now but im too lazy :P
                    args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                    i += 1
                elif name == "F_SETFLAG":
                    #arg1 : flag to set to 1
                    args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                    i += 1
                else:
                    print(f"ERR: SCRIPT BYTE {stype} HAS NO HANDLING !!!")

                if not customhandle:
                    args.insert(0, "SCRIPTS::"+name)
                    formatArgs = ", ".join(args)
                    newObject.append(f".byte {formatArgs}\n")


            elif stype == 0: #stop this script path
                newObject.append(f".byte 0\n")
            else:
                print("ERR: UNKNOWN SCRIPT COMMAND")
            i += 1
    else:
        #untested
        i = 4
        print("unknown type! falling back to hex for now")
        while i < len(pointerData):
            output = ""
            if i + 8 > len(pointerData) - 1:
                output = pointerData[i:]
                if len(output) == 1:
                    output = hex(output).replace("0x", "").upper()
                else:
                    output = output.hex()
            else:
                output = pointerData[i:i+8].hex()
            x = 2
            while x < len(output):
                output = output[:x]+",$"+output[x:]
                x += 4
            output = "$"+output
            newObject.append(f".byte {output}\n")
            i += 8

    fakeI += 1
    newObject.append("") #separation
    parsedObjects.append(newObject)
for object in parsedObjects:
    print("".join(object))
