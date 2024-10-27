#this script basically dissasembles all of the sprite bank :)

bytes = open("split/us/prg/banka.bin", "rb").read()[0x2000:0x2b5c]

lines = []
pointers = []
i = 0
index = 0
while i < len(bytes):
    useHexer = hex(index).upper().replace("0X","")
    myName = f"SPRITEDEF_{useHexer}"
    mine = bytes[i:i+4]
    pointerVal = int.from_bytes(mine[0:2], "little")
    labelName = f"SPRITE_{useHexer}"
    found = False
    for a in pointers:
        if a[0] == pointerVal:
            labelName = a[1]
            break
    if not found:
        pointers.append([pointerVal, labelName])
    #pointer = hex(pointerVal).upper().replace("0X","$")
    #while len(pointer) < 5:
    #    pointer = pointer.replace("$","$0")


    ppuoffset = hex(mine[2]).upper().replace("0X","$")
    byte2 = bin(mine[3])[2:]
    while len(byte2) < 8:
        byte2 = "0"+byte2
    byte2 = byte2[::-1]
    #get values
    palette1 = int(byte2[:2][::-1], 2)
    palette2 = int(byte2[2:4][::-1], 2)
    unk1 = int(byte2[4:5][::-1], 2)
    unk2 = int(byte2[5:][::-1], 2)
    args = ", ".join([labelName, ppuoffset, str(palette1), str(palette2), str(unk1), str(unk2)])
    lines.append(f"{myName}:\n")
    lines.append(f"spritePointerDef {args}\n")
    i += 4
    index += 1

lines.append("\n")
bytes = open("split/us/prg/banka.bin", "rb").read()[0x2b5c:0x3cfc]

addr = i+0x8000
i = 0
while i < len(bytes):
    mine = bytes[i:i+0x10]
    x = 0
    while x < len(mine):
        for a in pointers:
            if a[0] == addr:
                lines.append(a[1]+":\n")
                pointers.pop(pointers.index(a))
                break
        posX = hex(mine[x]).upper().replace("0X","$")
        posY = hex(mine[x+1]).upper().replace("0X","$")
        byte2 = bin(mine[x+2])[2:]
        while len(byte2) < 8:
            byte2 = "0"+byte2
        byte2 = byte2[::-1]
        index = hex(mine[x+3]).upper().replace("0X","$")
        while len(posX) < 3:
            posX = posX.replace("$", "$0")
        while len(posY) < 3:
            posY = posY.replace("$", "$0")
        while len(index) < 3:
            index = index.replace("$", "$0")
        #get values
        palette = int(byte2[:2][::-1], 2)
        unkArg1 = int(byte2[2:5][::-1], 2)
        order = int(byte2[5:6][::-1], 2)
        flipX = int(byte2[6:7][::-1], 2)
        flipY = int(byte2[7:][::-1], 2)
        args = ", ".join([posX, posY, str(palette), str(unkArg1), str(order), str(flipX), str(flipY), index])
        lines.append(f"spriteTile {args}\n")
        addr += 4
        x += 4
    i += x

open("tools/outputs/asm.asm", "w").writelines(lines)