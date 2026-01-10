ram = open("src/ram.asm", "r").readlines()

symbols = {}
for line in ram:
    if line.find(":") == -1:
        continue
    if line.startswith("."):
        continue
    if line.startswith(";"):
        continue

    addr = 0

    if line.startswith("UNK_"):
        addr = int(line.split("_")[-1].split(":")[0], 16)
    elif line.find(";") != -1:
        addr = line.split(";")[1]
        if addr.find("-") != -1:
            addr = addr.split(" - ")[0]
        addr = addr.strip()[1:]
        addr = int(addr, 16)
    else:
        continue



    name = line.split(":")[0]

    symbols[addr] = name

cpu_l = open("linked.txt", "r").readlines()

cpu = {}
for line in cpu_l:
    if line.find("@") != -1:
        continue

    addr = int(line.split(" ")[1], 16)
    name = line.split(".")[1].strip()

    if addr < 0xC000:
        continue

    cpu[addr] = name

l = open("src/prg/bank14.asm", "r").readlines()

opcodes = {
    "jsr": "cpu_addr",
    "jmp": "cpu_addr",
    #"ASMCALL": "cpu_addr",
    #"A_JSR": "cpu_addr",
    #"ONPOSITION": "cpu_addr",
    #"ONDRAW": "cpu_addr",
    #"ONMOVE": "cpu_addr",
    #"ONTICK": "long_addr",
    #"SPRITEMAP": "long_addr",
    #"_is_faraddr": "long_addr",
    #"JML": "long_addr",
    "and": "ram_addr",
    #"MOV": "ram_addr",
    "lda": "ram_addr",
    "dec": "ram_addr",
    "sta": "ram_addr",
    "ldx": "ram_addr",
    "ldy": "ram_addr",
    "sty": "ram_addr",
    "eor": "ram_addr",


}

addrs = []

i = 0
while i < len(l):
    line = l[i].strip()

    found = False
    if line.find("$") != -1:
        for opcode in list(opcodes.keys()):
            if line.startswith(opcode):
                if opcode == "ASMCALL":
                    print("fuck")


                get = line
                if line.find(";") != -1:
                    get = line.split(";")[0]
                if get.find("$") == -1:
                    break

                if opcode != "MOV":
                    if get.find(",") != -1:
                        get = get.split(",")[0]
                    if get.find("#") != -1:
                        break

                    get = get.split("$")[1]
                else:
                    get = get.split(" ", 1)[1].strip()
                    if get.find(",") != -1:
                        get = get.split(",")
                        for e in get:
                            if e.find("#") != -1:
                                continue
                            if e.find("$") !=- 1:
                                get = e
                    if type(get) == list:
                        break
                    get = get.replace("$", "")

                if get.find(" ") != -1:
                    get = get.split(" ")[0]
                if get.find(")") != -1:
                    get = get.split(")")[0]
                get = get.strip()

                get_int = int(get, 16)
                get = "$"+get


                if opcodes[opcode] == "ram_addr":
                    if get_int in list(symbols.keys()):
                        get_symbol = symbols[get_int]
                        l[i] = l[i].replace(get, get_symbol)
                elif opcodes[opcode] == "cpu_addr":
                    if get_int in list(cpu.keys()):
                        get_symbol = cpu[get_int]
                        l[i] = l[i].replace(get, get_symbol)

                if get_int == 0xde4b:
                    print(l[i])

                found = True
                break
    if found:
        i += 1
        continue

    i += 1

out_lines = []
for addr in addrs:
    if type(addr) == int:
        out_lines.append(hex(addr)+"\n")
    else:
        out_lines.append(addr+" ; {}\n")


open("mesen_test.asm", "w").writelines(l)