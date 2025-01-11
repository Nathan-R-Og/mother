#script to get unlinked sprites from object files

sprites = open("src/us/prg/credits.asm", "r").readlines()

for i in range(len(sprites)):
    line = sprites[i]

    if line.find("ENDING_CMD_0A_MOVESPRITE") != -1 and line.find("$") != -1:
        ext = line.split("ENDING_CMD_0A_MOVESPRITE")[0]
        args = line.split("ENDING_CMD_0A_MOVESPRITE")[-1].strip().split(",")
        for x in range(len(args)):
            args[x] = int(args[x].strip().replace("$",""), 16)
            if x == 1:
                #signed 16 bit
                if args[x] & 0b1000000000000000:
                    args[x] = -(args[x] ^ 0xFFFF) - 1
            elif x in [2, 3]:
                #signed 8 bit
                if args[x] & 0b10000000:
                    args[x] = -(args[x] ^ 0xFF) - 1
        for arg in args:
            print(arg)
        sprites[i] = f"{ext}ENDING_CMD_0A_MOVESPRITE {args[0]}, {args[1]}, {args[2]}, {args[3]}\n"

open("tools/outputs/output.asm", "w").writelines(sprites)