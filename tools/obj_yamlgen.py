symbols = open("linked.txt", "r").readlines()
version = "jp"

def splitfile(file):
    lines = open(file, "r").readlines()
    yamlines = []
    ver = -1
    for line in lines:
        if line.find(".if") != -1:
            if line.find(".ifndef") != -1:
                ver = int(version != "jp")
            elif line.find(".ifdef") != -1:
                ver = int(version == "jp")
        if line.find(".else") != -1 and ver != -1:
            ver ^= 1
        if line.find(".endif") != -1:
            ver = -1

        if ver == 0:
            continue

        if line.find(".include") != -1:
            dir = file.split("/")
            dir.pop(-1)
            dir = "/".join(dir)+"/"
            s = line.split("include ")[-1].replace('"', "").strip()
            yamlines += splitfile(dir+s)
            continue
        elif line.startswith("OBJ") and line.strip().endswith(":"):
            symbol = line.split(":")[0]
            addr = ""

            for x in symbols:
                if x.find("."+symbol+"\n") != -1:
                    addr = hex(int(x.split(" ")[1][2:], 16) - 0x8000).upper().replace("0X","0x")
                    break

            if symbol.find("OBJ_BANK_POINTERS") != -1:
                symbol = symbol.replace("OBJ_BANK_POINTERS", "obj_area_lut")
            elif symbol.find("OBJ_BANK_") != -1:
                symbol = symbol.replace("OBJ_BANK_", "obj_bank")+"_lut"

            newline = f"      - [{addr}, obj/{symbol}]\n"
            yamlines.append(newline)
    yamlines.append("\n")
    return yamlines

yamlines = splitfile("src/global/objects/1.asm")
for file in yamlines:
    print(file)

open("tools/outputs/yamlet.txt", "w").writelines(yamlines)