#script to get unlinked sprites from object files

from glob import glob

sprites = glob("src/global/objects/**/*.asm", recursive=True)


actual_sprites = []

for file in sprites:
    if file.find("bank") == -1:
        continue

    lines = open(file, "r").readlines()
    for i in range(len(lines)):
        if lines[i].find("objectDef ") != -1:
            arg = lines[i].split("objectDef ")[-1].split(",")[0]
            if arg.find("$") == -1:
                continue
            actual_sprites.append(int(arg.replace("$",""),16))
actual_sprites.sort()
for i in range(len(actual_sprites)):
    actual_sprites[i] = hex(actual_sprites[i]).upper().replace("0X","")
print(actual_sprites)
