lines1 = open("src/global/item_names.asm", "r").readlines()

symbol = {}

i = 0
while i < len(lines1):
    line = lines1[i]
    if line.startswith(".ifdef VER_JP"):
        while not line.startswith(".else"):
            line = lines1[i]
            i += 1

    if line.strip().endswith(":"):
        label = line.strip().replace(":", "")
        i += 1
        line = lines1[i]
        if line.find('"') != -1:
            data = line.strip().split('"')[1]
            symbol[label] = data
        else:
            data = 0
            symbol[label] = data

    i += 1

lines = open("src/global/items.asm", "r").readlines()
i = 0
while i < len(lines):
    line = lines[i]

    if line.startswith(".ifdef VER_JP"):
        while not line.startswith(".else"):
            line = lines[i]
            i += 1
        i -= 1


    if line.startswith("itemDef"):
        label = line.split("itemDef")[-1].split(",")[0].strip()
        print(symbol[label])
    i += 1