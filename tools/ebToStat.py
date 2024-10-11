bytes = open("split/us/prg/bankb.bin", "rb").read()
stats = []
lines = []

enemyflags = {
    1 << 0: "SPRAYS",
    1 << 1: "R_PK_BEAM",
    1 << 2: "R_DEFDOWN_CONFSLEEP",
    1 << 3: "UNK",
    1 << 4: "R_PK_THUNDER",
    1 << 5: "R_PK_FREEZE",
    1 << 6: "R_PK_FIRE",
    1 << 7: "GOD",
}

i = 0x240
while i < len(bytes):
    newStat = []
    symbol = hex(i).replace("0x","")
    lines.append(f"STATS_UNK{symbol}:")
    x = 0
    while x < 0x20:
        if x == 0:
            lines.append(f"        .byte ${bytes[x+i]}")
        elif x == 1:
            lines.append("        ;init status")
            lines.append(f"        .byte ${bytes[x+i]}")
        elif x == 2:
            lines.append("        ;flags")
            flags = []
            flagbyte = bytes[x+i]
            for key in list(enemyflags.keys()):
                if flagbyte & key:
                    flags.append("ENEMY_FLAGS::"+enemyflags[key])
            if len(flags) == 0:
                flags.append("ENEMY_FLAGS::NONE")
            result = " | ".join(flags)
            lines.append(f"        .byte {result}")
        elif x == 3:
            lines.append("        ;health, subpal, gtile")
            thebyte = "{0:b}".format(int.from_bytes(bytes[x+i:x+i+2], "little"))
            while len(thebyte) < 16:
                thebyte = "0"+thebyte
            #reverse since bits are read right to left
            thebyte = thebyte[::-1]
            #reverse them back to int since binary to int actually works properly
            health = int(thebyte[:10][::-1], 2)
            subpal = int(thebyte[10:12][::-1], 2)
            gtile = int(thebyte[12:][::-1], 2)
            lines.append(f"        ething1 {health}, {subpal}, {gtile}")
            x += 1
        elif x == 5:
            lines.append("        ;pp, gfx")
            thebyte = "{0:b}".format(int.from_bytes(bytes[x+i:x+i+2], "little"))
            while len(thebyte) < 16:
                thebyte = "0"+thebyte
            #reverse since bits are read right to left
            thebyte = thebyte[::-1]
            #reverse them back to int since binary to int actually works properly
            pp = int(thebyte[:10][::-1], 2)
            gfx = int(thebyte[10:][::-1], 2)
            lines.append(f"        ething2 {pp}, {gfx}")
            x += 1
        elif x == 7:
            lines.append("        ;offense, finalAction, altitude")
            thebyte = "{0:b}".format(int.from_bytes(bytes[x+i:x+i+2], "little"))
            while len(thebyte) < 16:
                thebyte = "0"+thebyte
            #reverse since bits are read right to left
            thebyte = thebyte[::-1]
            #reverse them back to int since binary to int actually works properly
            offense = int(thebyte[:10][::-1], 2)
            finalAction = int(thebyte[10:13][::-1], 2)
            altitude = int(thebyte[13:][::-1], 2)
            lines.append(f"        ething3 {offense}, {finalAction}, {altitude}")
            x += 1
        elif x == 9:
            lines.append("        ;defense, messageDefeat, unkParam")
            thebyte = "{0:b}".format(int.from_bytes(bytes[x+i:x+i+2], "little"))
            while len(thebyte) < 16:
                thebyte = "0"+thebyte
            #reverse since bits are read right to left
            thebyte = thebyte[::-1]
            #reverse them back to int since binary to int actually works properly
            defense = int(thebyte[:10][::-1], 2)
            messageDefeat = int(thebyte[10:13][::-1], 2)
            unkParam = int(thebyte[13:][::-1], 2)
            lines.append(f"        ething4 {defense}, {messageDefeat}, {unkParam}")
            x += 1
        elif x == 0xB:
            lines.append("        ;fight")
            lines.append(f"        .byte {bytes[x+i]}")
        elif x == 0xC:
            lines.append("        ;speed")
            lines.append(f"        .byte {bytes[x+i]}")
        elif x == 0xD:
            lines.append("        ;wisdom")
            lines.append(f"        .byte {bytes[x+i]}")
        elif x == 0xE:
            lines.append("        ;strength")
            lines.append(f"        .byte {bytes[x+i]}")
        elif x == 0xF:
            lines.append("        ;force")
            lines.append(f"        .byte {bytes[x+i]}")
        elif x == 0x10:
            lines.append("        ;battle actions")
            num = []
            while x < 0x18:
                res = hex(bytes[x+i]).upper().replace("0X", "$")
                while len(res) < 3:
                    res = res.replace("$", "$0")
                num.append(res)
                x += 1
            result = ",".join(num)
            lines.append(f"        .byte {result}")
            x -= 1
        elif x == 0x18:
            lines.append("        ;name pointer")
            result = hex(int.from_bytes(bytes[x+i:x+i+2], "little")).upper().replace("0X","$")
            lines.append(f"        .word {result}")
            x += 1
        elif x == 0x1A:
            lines.append("        ;exp")
            result = int.from_bytes(bytes[x+i:x+i+2], "little")
            lines.append(f"        .word {result}")
            x += 1
        elif x == 0x1C:
            lines.append("        ;money")
            result = int.from_bytes(bytes[x+i:x+i+2], "little")
            lines.append(f"        .word {result}")
            x += 1
        elif x == 0x1E:
            lines.append("        ;item")
            result = hex(bytes[x+i]).upper().replace("0X","$")
            while len(result) < 3:
                result = result.replace("$", "$0")
            lines.append(f"        .byte {result}")
        elif x == 0x1F:
            lines.append("        ;graphic")
            result = hex(bytes[x+i]).upper().replace("0X","$")
            while len(result) < 3:
                result = result.replace("$", "$0")
            lines.append(f"        .byte {result}")
        x += 1
    lines.append("")
    i += x
    if i == 0xf40: break
i = 0
while i < len(lines):
    lines[i] += "\n"
    i += 1
open("tools/outputs/asm.asm", "w").writelines(lines)