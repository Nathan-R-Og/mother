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
    0x1b: "TRIGGER",
    0x29: "FLAGSET_SEE"
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

bytes = open("split/us/prg/bank8.bin", "rb").read()

use = bytes[0x2000:0x3EAB]
lines = ["OBJ_BANK_POINTERS2:\n"]

mainPointers = []
i = 0
while i < len(use):
    p = int.from_bytes(use[i:i+2], "little")
    mainPointers.append(p)
    i += 2
    if p == 0 or i+0x8000 == mainPointers[0]:
        break


objectLabels = []
b = 0
while b < len(mainPointers):
    bankid = hex(b+0x1A).upper().replace("0X","")
    pointerName = f"OBJ_BANK_{bankid}"
    lines.append(f".word {pointerName}\n")
    mypointers = []
    while i < len(use):
        p = int.from_bytes(use[i:i+2], "little")
        mypointers.append(p)
        i += 2
        if p == 0:
            break

    if i+0x8000 != mypointers[0]:
        print("ERR!!!!")

    pointerDatas = []
    x = 0
    while x < len(mypointers):
        if mypointers[x] == 0:
            break

        start = mypointers[x]
        end = 0
        if x < len(mypointers) - 1 and mypointers[x+1] != 0:
            end = mypointers[x+1]
        elif b < len(mainPointers) - 1:
            end = mainPointers[b+1]
        else:
            end = len(bytes)+0x8000
        start -= 0x8000
        end -= 0x8000
        pointerDatas.append(bytes[start:end])
        x += 1

    address = i
    parsedObjects = []
    fakeI = 0
    for pointerData in pointerDatas:
        if pointerData == "END": break
        addressCalc = False
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
                newObject.append(f".addr {word3} ;sprite\n")
                i += 2
            #the rest is behavior scripting
            #THIS is the part i cared to automate.

            #list of labels referenced inside itself
            internalLabels = []
            moveLabels = []
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
            0xC: "PJ_USE", #jump to j if not using psi p
            0xD: "IJ_USE", #jump to j if not using this item
            0xF: "RESET", #reset the nes
            0x10: "F_SETFLAG", #set flag f
            0x11: "F_CLEARFLAG", #clear flag f
            0x12: "FJ_JUMP", #jump to j if f == 0
            0x13: "C_DECCOUNTER", #decrements counter c
            0x14: "C_INCCOUNTER", #increments counter c
            0x15: "C_RESETCOUNTER", #resets counter c
            0x16: "CNJ_COMPCOUNTER", #jumps to j if counter c < int n
            0x18: "J_CHOOSECHAR", #choose character, jump if b pressed
            0x19: "C_SELECT", #select character
            0x1A: "CJ_CHARSELECTED", #jump to j if chararacter c not selected
            0x1B: "J_NONEWMONEY", #jump to j if no money has been gained since last call
            0x1D: "N_LOADNUMBER", #load number ????
            0x1F: "SHOWMONEY", #yeah
            0x20: "J_CHOOSEITEM", #jump to j if declined
            0x22: "IIIIJ_LIST", #jump if b pressed
            0x25: "I_PICKITEM", #load i into selected item
            0x26: "IJ_SELECTEDITEM", #jump to j if i isnt selected
            0x27: "IJ_HASITEM", #jump to j if i not in inventory
            0x28: "J_GIVEMONEY", #jump to j if cant hold money
            0x29: "J_TAKEMONEY", #jump to j if not enough money
            0x2C: "J_UNSELLABLE", #jump to j if item cannot be sold
            0x2D: "J_GIVEITEM", #jump to j if inventory full. else give selected item
            0x2E: "J_REMOVEITEM", #remove item, jump if doesn't have
            0x31: "IJ_PICKCHARITEM", #pick character's I'th item, jump if empty (0)
            0x32: "N_MULNUMBER", #$multiply number by n / 100
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
            0x42: "CJ_ADDCHAR", #add char c from party, jump to j if full
            0x43: "CJ_REMOVECHAR", #remove char c from party, jump to j if not in
            0x44: "B_BATTLE", #start battle b in battles list
            0x45: "CHARMULT", #multiply by number of characters
            0x46: "D_ROCKET", #spawn rocket in direction (?)
            0x47: "D_AIRPLANE", #spawn airplane in direction (?)
            0x48: "D_TANK", #spawn tank in direction (?)
            0x4C: "D_NOVEC", #spawn players in direction (?)
            0x4D: "PLANEEND", #end plane path
            0x4F: "J_UNK2", #jump to j if ?????
            0x50: "J_NOTMAX", #jump to j if < max hp
            0x51: "N_HEAL", #heal hp n
            0x52: "SJ_PRESENT", #jump to j if character has status s
            0x53: "S_REMOVEBUT", #remove all statuses but s
            0x55: "SLEEP", #sleep
            0x56: "SAVE", #self explanatory
            0x57: "GETCHARNEXTEXP", #get selected characters' needed exp
            0x58: "GETCASH", #get money
            0x59: "S_GIVESTATUS", #inflict s status
            0x5A: "M_MUSIC", #play m song
            0x5C: "S_PLAYSOUND", #play s
            0x60: "J_NOTMAXPP", #jump to j if < max pp
            0x61: "N_HEALPP", #heal pp n
            0x62: "J_REMOVEWEAPON", #jump to j if no weapon, else take
            0x63: "J_CONFISC", #get confiscated weapon, jump to j if none
            0x64: "LIVESHOW", #in ellay
            0x68: "LANDMINE", #in yucca desert
            }
            #can you tell why?
            addressCalc = True
            address += i
            while i < len(pointerData):
                stype = pointerData[i]
                doMoveSet = []
                for set in moveLabels:
                    if address+0x8000 == set[0]:
                        doMoveSet = set
                        break
                if doMoveSet != []:
                    newObject.append(f"        {doMoveSet[1]}:\n")
                    MOVE_CMD = {
                        0xE: "MOVEFACE",# move the tiles and face the same direction
                        0xF: "MOVE", #just moves the tiles, nothing else
                        0x1E: "ABOUTFACE"#turns on a dime to the direction
                    }
                    a = i
                    while a < len(pointerData):
                        #stop test
                        if pointerData[a] in [0, 3]:
                            newObject.append(f".byte {pointerData[a]}\n")
                            a += 1
                            break
                        #get the moveDef
                        word = bin(int.from_bytes(pointerData[a:a+2], "little"))[2:]
                        while len(word) < 16:
                            word = "0"+word
                        word = word[::-1]
                        #get values
                        direction = int(word[:3][::-1], 2)
                        cmd = int(word[3:8][::-1], 2)
                        tiles = int(word[8:][::-1], 2)

                        #asm convert
                        if direction in list(DIRECTIONS.keys()):
                            direction = "DIRECTIONS::"+DIRECTIONS[direction]
                        else:
                            direction = hex(direction).replace("0x","$").upper()
                        if cmd in list(MOVE_CMD.keys()):
                            cmd = "MOVE_CMD::"+MOVE_CMD[cmd]
                        else:
                            cmd = hex(cmd).replace("0x","$").upper()
                        tiles = hex(tiles).replace("0x","$").upper()
                        args = ", ".join([direction, cmd, tiles])
                        newObject.append(f"moveDef {args}\n")
                        a += 2
                    inc = a-i

                elif stype in list(SCRIPTS.keys()):
                    name = SCRIPTS[stype]
                    args = []
                    customhandle = False #for stuff like DIALOGUE that needs specific formatting, otherwise everything is a byte
                    noargs = False
                    inc = 1
                    goodFormat = -1
                    arg1 = None
                    if name == "DIALOGUE":
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
                        inc += 2
                    elif name == "N_LOADNUMBER":
                        customhandle = True
                        #arg1: the number (it is a word!)

                        pointer = hex(int.from_bytes(pointerData[i+1:i+3], "little")).replace("0x","$").upper()
                        while len(pointer) < 5:
                            pointer = pointer.replace("$", "$0")
                        args.append(pointer)
                        args.insert(0, "SCRIPTS::"+name)
                        newObject.append(f".byte {args[0]}\n")
                        newObject.append(f".word {args[1]}\n")
                        inc += 2
                    elif name == "M_MOVE":
                        customhandle = True
                        #arg1: label to use to move (word)
                        label_position = int.from_bytes(pointerData[i+1:i+3],"little")
                        useName = f"{newObjectName}_MOVE{len(moveLabels)}"
                        exists = False
                        for label in moveLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            moveLabels.append([label_position, useName])
                        #label_position = hex(label_position).replace("0x","$").upper()
                        #while len(label_position) < 5:
                        #    label_position = label_position.replace("$", "$0")
                        newObject.append(f".byte SCRIPTS::{name}\n")
                        newObject.append(f".addr {useName}\n")
                        inc += 2
                    elif name == "DA_TELEPORT":
                        customhandle = True
                        #arg1: doorArgDef
                        #get the doorArgDef
                        word3 = bin(int.from_bytes(pointerData[i+1:i+3], "little"))[2:]
                        word4 = bin(int.from_bytes(pointerData[i+3:i+5], "little"))[2:]
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
                        newObject.append(f".byte SCRIPTS::{name}\n")
                        newObject.append(f"doorArgDef {args}\n")
                        inc += 4
                    elif name == "OJ_SUBROUTINE":
                        customhandle = True
                        #arg1: object to use
                        #arg2: subroutine to jump to in said object
                        pointer = hex(int.from_bytes(pointerData[i+1:i+3], "little")).replace("0x","$").upper()
                        while len(pointer) < 5:
                            pointer = pointer.replace("$", "$0")
                        label_position = pointerData[i+3]
                        useobjectName = newObjectName
                        pnumber = 0
                        for realpointer in pointers:
                            if int(realpointer, 16)+0x8000 == int(pointer.replace("$",""), 16):
                                nameConver = hex(pnumber).upper().replace("0X","")
                                useobjectName = f"OBJ_THING{nameConver}"
                                break
                            pnumber += 1
                        args.append(useobjectName)

                        useName = f"{useobjectName}_OJSUBROUTINE{len(objectLabels)}"
                        exists = False
                        for label in objectLabels:
                            if label[0] == label_position and label[2] == pointer:
                                exists = True
                                useName = label[1]
                                useobjectName = label[3]
                                break
                        if not exists:
                            objectLabels.append([label_position, useName, pointer, useobjectName])
                        args.insert(0, "SCRIPTS::"+name)
                        newObject.append(f".byte {args[0]}\n")
                        newObject.append(f".addr {args[1]}\n")
                        newObject.append(f".byte {useName}-{useobjectName}\n")
                        inc += 3
                    elif name == "J_TALK":
                        #arg1: label (inside object) to jump to if not currently talking
                        goodFormat = 0
                        arg1 = "_JTALK"
                    elif name == "FJ_JUMP":
                        #arg1 : flag to determine whether or not to jump (specifically if 0)
                        #arg1 : where to jump to from ^
                        args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_FJJUMP{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "J_YESNO":
                        #arg1: label (inside object) to jump to if say no or press b
                        goodFormat = 0
                        arg1 = "_JYESNO"
                    elif name == "J_JUMP":
                        #arg1: label to jump to, with no condition
                        goodFormat = 0
                        arg1 = "J_JUMP"
                    elif name == "J_CHECK":
                        #arg1: label to jump to if not currently checking
                        goodFormat = 0
                        arg1 = "_JCHECK"
                    elif name == "J_TOUCH":
                        #arg1: label to jump to if not currently touching
                        goodFormat = 0
                        arg1 = "_JTOUCH"
                    elif name == "J_SIGNALED":
                        #arg1: label to jump to if signaled
                        goodFormat = 0
                        arg1 = "_JSIGNALED"
                    elif name == "O_SIGNAL":
                        #arg1 : object id to signal
                        #id in current objects?
                        goodFormat = 1
                    elif name == "J_GIVEITEM":
                        #arg1: label to jump to if inventory full. otherwise, give loaded item
                        goodFormat = 0
                        arg1 = "_JGIVEITEM"
                    elif name == "J_UNK":
                        #arg1: label to jump to if ?
                        goodFormat = 0
                        arg1 = "_JUNK"
                    elif name == "J_UNK2":
                        #arg1: label to jump to if ?
                        goodFormat = 0
                        arg1 = "_JUNK2"
                    elif name == "J_NOTMAX":
                        #arg1: label to jump to if hp is not max
                        goodFormat = 0
                        arg1 = "_JNOTMAX"
                    elif name == "J_REMOVEITEM":
                        #arg1: label to jump to if player doesnt have item
                        goodFormat = 0
                        arg1 = "_JREMOVEITEM"
                    elif name == "J_REMOVEWEAPON":
                        #arg1: label to jump to if player doesnt have weapon
                        goodFormat = 0
                        arg1 = "_JREMOVEWEAPON"
                    elif name == "J_CONFISC":
                        #arg1: label to jump to if player doesnt have confiscated weapons
                        goodFormat = 0
                        arg1 = "_JCONFISC"
                    elif name == "J_TAKEMONEY":
                        #arg1: label to jump to if player doesnt have money
                        goodFormat = 0
                        arg1 = "_JTAKEMONEY"
                    elif name == "J_GIVEMONEY":
                        #arg1: label to jump to if player doesnt have room
                        goodFormat = 0
                        arg1 = "_JGIVEMONEY"
                    elif name == "J_CHOOSEITEM":
                        #arg1: label to jump to if player doesnt choose an item from their inventory
                        goodFormat = 0
                        arg1 = "_JCHOOSEITEM"
                    elif name == "J_CHOOSECHAR":
                        #arg1: label to jump to if player doesnt choose an item from their inventory
                        goodFormat = 0
                        arg1 = "_JCHOOSECHAR"
                    elif name == "J_UNSELLABLE":
                        #arg1: label to jump to if item cannot be sold
                        goodFormat = 0
                        arg1 = "_JUNSELLABLE"
                    elif name == "T_CHANGETYPE":
                        #arg1: type in OBJ_TYPE to change to
                        type = pointerData[i+1]
                        if type in list(OBJ_TYPE.keys()):
                            type = f"OBJ_TYPE::{OBJ_TYPE[type]}"
                        else:
                            type = hex(type).replace("0x","$").upper()
                        args.append(type)
                        inc += 1
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
                        inc += 2
                    elif name == "IJ_PICKCHARITEM":
                        #arg1: item to pick for
                        #arg2: label to jump to if empty
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_IJPICKCHARITEM{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "IJ_SELECTEDITEM":
                        #arg1: item to check for
                        #arg2: label to jump to if not selected
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_IJSELECTEDITEM{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "IJ_USE":
                        #arg1: item to check for
                        #arg2: label to jump to if not used
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_IJUSE{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "IIIIJ_LIST":
                        #arg1: item1 in list
                        #arg2: item2 in list
                        #arg3: item3 in list
                        #arg4: item4 in list
                        #arg2: label to jump to if b pressed
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        item2 = hex(pointerData[i+2]).replace("0x", "$").upper()
                        item3 = hex(pointerData[i+3]).replace("0x", "$").upper()
                        item4 = hex(pointerData[i+4]).replace("0x", "$").upper()
                        args.append(item)
                        args.append(item2)
                        args.append(item3)
                        args.append(item4)
                        label_position = pointerData[i+5]
                        useName = f"{newObjectName}_IIIIJLIST{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 5
                    elif name == "PJ_USE":
                        #arg1: psi to check for
                        #arg2: label to jump to if not used
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_PJUSE{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CJ_SELECTPARTY":
                        #arg1: character to check for
                        #arg2: label to jump to if character is not in party
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_CJSELECTPARTY{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CJ_CHARSELECTED":
                        #arg1: character to check for
                        #arg2: label to jump to if character is not selected
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_CJCHARSELECTED{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CJ_ADDCHAR":
                        #arg1: character to add
                        #arg2: label to jump to if party is full
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_CJADDCHAR{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CJ_PRESENT":
                        #arg1: character to check
                        #arg2: label to jump to if not in party
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_CJPRESENT{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CJ_REMOVECHAR":
                        #arg1: character to remove
                        #arg2: label to jump to if not in party
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_CJREMOVECHAR{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "SJ_PRESENT":
                        #arg1: status to check
                        #arg2: label to jump to if in character
                        item = hex(pointerData[i+1]).replace("0x", "$").upper()
                        args.append(item)
                        label_position = pointerData[i+2]
                        useName = f"{newObjectName}_SJPRESENT{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 2
                    elif name == "CNJ_COMPCOUNTER":
                        #arg1: counter to compare
                        #arg2: int to compare
                        #arg3: label to jump to if c < i
                        args.append(hex(pointerData[i+1]).replace("0x", "$").upper())
                        args.append(hex(pointerData[i+2]).replace("0x", "$").upper())
                        label_position = pointerData[i+3]
                        useName = f"{newObjectName}_CNJCOMPCOUNTER{len(internalLabels)}"
                        exists = False
                        for label in internalLabels:
                            if label[0] == label_position:
                                exists = True
                                useName = label[1]
                                break
                        if not exists:
                            internalLabels.append([label_position, useName])
                        args.append(f"{useName}-{newObjectName}")
                        inc += 3
                    elif name == "F_DISAPPEAR":
                        #arg1 : flag to determine whether or not disappear (if 1)
                        goodFormat = 1
                    elif name == "F_APPEAR":
                        #arg1 : flag to determine whether or not appear (if 1)
                        goodFormat = 1
                    elif name == "B_BATTLE":
                        #arg1 : battle id to start
                        #id enum this now but im too lazy :P
                        goodFormat = 1
                    elif name == "F_SETFLAG":
                        #arg1 : flag to set to 1
                        goodFormat = 1
                    elif name == "F_CLEARFLAG":
                        #arg1 : flag to set to 0
                        goodFormat = 1
                    elif name == "I_PICKITEM":
                        #arg1 : item to load
                        goodFormat = 1
                    elif name == "C_RESETCOUNTER":
                        #arg1 : counter to reset
                        goodFormat = 1
                    elif name == "C_DECCOUNTER":
                        #arg1 : counter to decrement
                        goodFormat = 1
                    elif name == "C_INCCOUNTER":
                        #arg1 : counter to increment
                        goodFormat = 1
                    elif name == "S_PLAYSOUND":
                        #arg1 : sound to play
                        goodFormat = 1
                    elif name == "M_MUSIC":
                        #arg1 : song to play
                        goodFormat = 1
                    elif name == "C_SELECT":
                        #arg1 : character to select
                        goodFormat = 1
                    elif name == "T_DELAY":
                        #arg1 : delay of frames
                        goodFormat = 1
                    elif name == "N_HEAL":
                        #arg1 : heal hp by
                        goodFormat = 1
                    elif name == "S_GIVESTATUS":
                        #arg1 : status to inflict
                        goodFormat = 1
                    elif name == "S_REMOVEBUT":
                        #arg1 : status to keep
                        goodFormat = 1
                    elif name == "N_MULNUMBER":
                        #arg1 : number * 100 to multiply by
                        goodFormat = 1
                    elif name in ["D_ROCKET","D_AIRPLANE","D_TANK","D_NOVEC"]:
                        #arg1 : direction
                        targetDirection = pointerData[i+1]
                        if targetDirection in list(DIRECTIONS.keys()):
                            targetDirection = "DIRECTIONS::"+DIRECTIONS[targetDirection]
                        else:
                            targetDirection = hex(targetDirection).replace("0x","$").upper()
                        args.append(targetDirection)
                        inc += 1
                    elif name in ["GETCASH","LANDMINE","RETURN", "SLEEP", "LIVESHOW", "SHOWMONEY", "CHARMULT", "PLANEEND"]:
                        noargs = True
                    else:
                        print(f"ERR: SCRIPT BYTE {stype} HAS NO HANDLING !!!")

                    if not customhandle:
                        args.insert(0, "SCRIPTS::"+name)
                        if goodFormat == 0: #generic jump
                            label_position = pointerData[i+1]
                            useName = f"{newObjectName}{arg1}{len(internalLabels)}"
                            exists = False
                            for label in internalLabels:
                                if label[0] == label_position:
                                    exists = True
                                    useName = label[1]
                                    break
                            if not exists:
                                internalLabels.append([label_position, useName])
                            args.append(f"{useName}-{newObjectName}")
                            inc += 1
                        elif goodFormat == 1: #generic byte value
                            args.append(hex(pointerData[i+1]).replace("0x","$").upper())
                            inc += 1
                        if not noargs:
                            formatArgs = ", ".join(args)
                            newObject.append(f".byte {formatArgs}\n")
                        else:
                            newObject.append(f".byte {args[0]}\n")

                elif stype == 0: #stop this script path
                    newObject.append(f".byte 0\n")
                    inc = 1
                elif stype == 0x65: #unknown, related to melodies (jp)
                    newObject.append(f".byte $65\n")
                    inc = 1
                else:
                    print("ERR: UNKNOWN SCRIPT COMMAND")
                    hexer = hex(stype).upper().replace("0X","")
                    newObject.append(f".byte ${hexer}\n")
                    inc = 1
                address += inc
                i += inc
            i = 0
            x = 0
            #this was originally ran during but then i realized that doesnt work for ones
            #that only reference backwards. oops!
            while i < len(newObject):
                for label in internalLabels:
                    if label[0] == x: #when a queued internal label matches with the increment, plop it down
                        newObject.insert(i, f"      {label[1]}:\n")
                        i += 1
                        break
                if not newObject[i].endswith(":\n"):
                    if newObject[i].find("objectDef") != -1 or\
                    newObject[i].find("doorArgDef") != -1:
                        x += 4
                    elif newObject[i].find("moveDef") != -1:
                        x += 2
                    elif newObject[i].find("teleportFlagDef") != -1:
                        x += 1
                    elif newObject[i].find(".byte") != -1 or\
                        newObject[i].find(".word") != -1:
                        c = 1
                        if newObject[i].find(",") != -1:
                            c = len(newObject[i].split(","))
                        if newObject[i].find(".word") != -1:
                            c *= 2
                        x += c
                i += 1
        elif type in list(OBJ_TYPE.keys()):
            if OBJ_TYPE[type] == "FLAGSET_SEE":
                data = bin(pointerData[4])[2:]
                while len(data) < 8:
                    data = "0"+data
                data = data[::-1]
                #get values
                flag = hex(int(data[:3][::-1], 2)).replace("0x","$").upper()
                byte = hex(int(data[3:][::-1], 2)).replace("0x","$").upper()
                args = ", ".join([flag, byte])
                newObject.append(f"teleportFlagDef {args}\n")
                zeroProbably = hex(pointerData[5]).replace("0x","$").upper()
                newObject.append(f".byte {zeroProbably}\n")
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
        if not addressCalc:
            address += len(pointerData)

        fakeI += 1
        newObject.append("") #separation
        parsedObjects.append(newObject)

    #add subroutine labels
    #this is last since these are basically omniscient
    j = 0
    while j < len(objectLabels):
        i = 0
        while i < len(parsedObjects):
            if parsedObjects[i][0] == f"{objectLabels[j][3]}:\n":
                k = 0
                x = 0
                while k < len(parsedObjects[i]):
                    if x == objectLabels[j][0]:
                        parsedObjects[i].insert(k, f"      {objectLabels[j][1]}:\n")
                        break
                    if not parsedObjects[i][k].endswith(":\n"):
                        if newObject[k].find("objectDef") != -1 or\
                            parsedObjects[i][k].find("doorArgDef") != -1:
                            x += 4
                        elif parsedObjects[i][k].find("moveDef") != -1:
                            x += 2
                        elif parsedObjects[i][k].find("teleportFlagDef") != -1:
                            x += 1
                        elif parsedObjects[i][k].find(".byte") != -1 or\
                                parsedObjects[i][k].find(".word") != -1:
                            c = 1
                            if parsedObjects[i][k].find(",") != -1:
                                c = len(parsedObjects[i][k].split(","))
                            if parsedObjects[i][k].find(".word") != -1:
                                c *= 2
                            x += c
                    k += 1
                break
            i += 1
        j += 1


    for object in parsedObjects:
        print("".join(object))



    b += 1





