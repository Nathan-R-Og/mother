
import subprocess
from glob import glob
import os
import shutil

def split(rom:str, dir:str):
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

    if not os.path.exists("split/"+dir):
        os.makedirs(f"split/{dir}/prg")
        os.makedirs(f"split/{dir}/chr")

    i = 0
    for bank in prg:
        result = hex(i).replace("0x", "")
        open(f"split/{dir}/prg/bank"+result+".bin", "wb").write(bank)
        i += 1
    for bank in chr:
        result = hex(i).replace("0x", "")
        open(f"split/{dir}/chr/bank"+result+".bin", "wb").write(bank)
        i += 1
    
#TODO: make this into a yaml-like format, or some other kinda indexing
#this is manually coded for now
#the aim is to retrieve all same binary assets between versions
#namely chr, since a ton of graphics in all releases of this game are the same
#prg will come too, just later
def splitMerger():
    if not os.path.exists("split/global"):
        os.makedirs(f"split/global/prg")
        os.makedirs(f"split/global/chr")

    #make sure the user has either split
    usedir = []
    for lang in ["jp", "us"]:
        if os.path.exists(f"split/{lang}/"):
            usedir.append(lang)

    shutil.copyfile(f"split/{usedir[0]}/chr/bank13.bin", "split/global/chr/bank13.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank14.bin", "split/global/chr/bank14.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank15.bin", "split/global/chr/bank15.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank16.bin", "split/global/chr/bank16.bin") #minor diffs


    shutil.copyfile(f"split/{usedir[0]}/chr/bank1a.bin", "split/global/chr/bank1a.bin")







if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-d",
        "--disassemble",
        help="Disassemble the rom's banks",
        action="store_true",
    )

    args = parser.parse_args()

    if os.path.exists("split/"):
        shutil.rmtree("split/")
    
    valids = {
        "218503a880999363ac83945096040492": "jp",
        "5bacf7ba94c539a1caf623dbe12059a3": "us",
    }

    langs = []
    splitters = []
    import hashlib
    for rom in glob("*.nes"):
        hash = hashlib.md5(open(rom,'rb').read()).hexdigest()
        if hash in list(valids.keys()) and not valids[hash] in langs:
            splitters.append([rom, valids[hash]])
            langs.append(valids[hash])
    for splitt in splitters:
        print(f"spliting rom "+splitt[0]+" for ver "+splitt[1]+" assets")
        split(splitt[0], splitt[1])
    if len(splitters) > 0:
        splitMerger()


    ##convert to asm from those banks

    if os.path.exists("disasm/"):
        shutil.rmtree("disasm/")
    if args.disassemble:
        os.makedirs("disasm/prg")
        os.makedirs("disasm/chr")

        infos = glob("infos/**/*.cfg")
        for info in infos:
            file = info.replace("infos", "split").replace(".cfg", ".bin")
            if not os.path.exists("file"): continue
            print(f"disasm {file}")
            subprocess.run(f"da65 -i {info} {file}", shell = True, executable="/bin/bash")