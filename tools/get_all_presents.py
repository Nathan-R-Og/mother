from glob import glob
from typing import Any

files = glob("src/global/objects/1/*.asm", recursive=True)
files += glob("src/global/objects/2/*.asm", recursive=True)
files += glob("src/global/objects/3/*.asm", recursive=True)

class EbbPresent(object):
    def __init__(self, lines) -> None:
        self.name = lines[0].replace(":", "").strip()
        ob_header = lines[1].split(",")
        self.obtype = 0x20
        self.x = int(ob_header[1].strip())
        self.direction = ob_header[2].strip()
        self.y = int(ob_header[3].strip())
        self.item = int(lines[3].split(" ")[1])
        self.flag = int(lines[4].split(" ")[1])
        print(f"{self.name}, {self.item}, {self.flag}")

presents : list[EbbPresent] = []

for file in files:
    lines = open(file, "r").readlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        if line.startswith("objectDef OBJ_TYPE::PRESENT"):
            presents.append(EbbPresent(lines[i-1:i+4]))
            i += 4-1
        i += 1

print(len(presents))