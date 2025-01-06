mine = "split/us/prg/bank1c.bin"
bytes = open(mine, "rb").read()[0x1c35:0x1c54]

#internally, the triangle channel is an octave lower even though it uses the same parameters
#to compensate, have a -1!
#pulse == 1
#triangle == 2
#noise == 3
inst = 3

table = {
    4: "nl_whole",
    3: "nl_half",
    2: "nl_quarter",
    1: "nl_eighth",
    0: "nl_sixteenth",
    0xa: "nl_thirtysecond",#!

    #dotted
    6: "nl_d_half",
    5: "nl_d_quarter",
    7: "nl_d_eighth",

    #triplet
    8: "nl_t_quarter",#!
    9: "nl_t_eighth",#!
}

note_table = {
    2: "C",
    3: "CS",
    4: "D",
    5: "DS",
    6: "E",
    7: "F",
    8: "FS",
    9: "G",
    10: "GS",
    11: "A",
    12: "AS",
    13: "B",
}

def fixHex(int):
    fix = hex(int).upper().replace("0X","$")
    while len(fix) < 3:
        fix = fix.replace("$", "$0")
    return fix


lines = []
i = 0
smode = -1
while i < len(bytes):
    if bytes[i] == 0x9F:
        byte1 = fixHex(bytes[i+1])
        byte2 = fixHex(bytes[i+2])
        lines.append(f".byte $9F,{byte1},{byte2}\n")
        i += 2
    elif bytes[i] == 0x00:
        lines.append("Track_End\n")
    elif bytes[i] == 0xFF:
        lines.append("Note_End_Repeat\n")
    elif bytes[i] > 0xC0:
        amount = bytes[i] - 0xc0
        lines.append(f"Note_Repeat({amount})\n")
    elif bytes[i] >= 0xB0:
        amount = bytes[i] - 0xB0
        lines.append(f"Note_Length({table[amount]})\n")
    elif bytes[i] == 2:
        lines.append("Note_Rest\n")
    elif bytes[i] in range(0x4,0x84+1) and bytes[i] % 2 == 0 and inst != 3:
        number = bytes[i]
        truenumber = (number // 2) - 2
        note = (truenumber % 0xC) + 2
        octave = (truenumber // 0xC) + 2
        if inst == 1:
            lines.append(f"Note_{note_table[note]}({octave})\n")
        else:
            lines.append(f"Note_{note_table[note]}({octave-1}+1)\n")
    elif inst == 3:
        #DDpppppp
        dpcmBits = (bytes[i] & 0b11000000) >> 6
        noiseBits = bytes[i] & 0b00111111
        lines.append(f"Note_Noise({dpcmBits}, {noiseBits})\n")



    i += 1

open("tools/outputs/asm.asm", "w").writelines(lines)