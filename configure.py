
import subprocess
from glob import glob
import os

def split(rom):
    #split into banks
    data = open(rom, "rb").read()
    header = data[0:0x10]
    prg = []
    chr = []
    i = 0x10
    mode = 0
    while i < len(data):
        if i == 0x40010: mode = 1
        lener = 0x4000 if mode == 0 else 0x2000
        if mode == 0:
            prg.append(data[i:i+lener])
        else:
            chr.append(data[i:i+lener])
        i += lener

    if os.path.exists("split/"):
        import shutil
        shutil.rmtree("split/")
    os.makedirs("split/prg")
    os.makedirs("split/chr")

    i = 0
    for bank in prg:
        result = hex(i).replace("0x", "")
        open("split/prg/bank"+result+".bin", "wb").write(bank)
        i += 1
    for bank in chr:
        result = hex(i).replace("0x", "")
        open("split/chr/bank"+result+".bin", "wb").write(bank)
        i += 1
    ###


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-j",
        "--japanese",
        help="Build japanese only assets",
        action="store_true",
    )

    args = parser.parse_args()

    if args.japanese:
        split("mother-j.nes")
    else:
        split("mother.nes")


    ##convert to asm from those banks
    if os.path.exists("disasm/"):
        import shutil
        shutil.rmtree("disasm/")
    os.makedirs("disasm/prg")
    os.makedirs("disasm/chr")

    infos = glob("infos/**/*.cfg")
    for info in infos:
        file = info.replace("infos", "split").replace(".cfg", ".bin")
        if not os.path.exists("file"): continue
        print(f"disasm {file}")
        subprocess.run(f"da65 -i {info} {file}", shell = True, executable="/bin/bash")
    ####