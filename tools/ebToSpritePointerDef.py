
bytes = open("split/us/sprites.bin", "rb").read()[0x19f8:0x1c04]

lines = []
i = 0
index = 0
while i < len(bytes):
    mine = bytes[i:i+4]
    myName = f"SPRITEDEF_CREDITS_UNK{index}"
    pointerVal = hex(int.from_bytes(mine[:2], "little")).upper().replace("0X","$")
    ppuoffset = hex(mine[2]).upper().replace("0X","$")

    palette1 = mine[3] & 0b00000011
    palette2 = (mine[3] & 0b00001100) >> 2
    unk1 = (mine[3] & 0b00010000) >> 4
    unk2 = (mine[3] & 0b11100000) >> 5
    values = [pointerVal, ppuoffset, palette1, palette2, unk1, unk2]
    for x in range(len(values)):
        values[x] = str(values[x])
    args = ", ".join(values)
    lines.append(f"{myName}:")
    lines.append(f"spritePointerDef {args}")
    i += 4
    index += 1
for line in lines:
    print(line)