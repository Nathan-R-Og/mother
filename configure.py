
import subprocess
from glob import glob
import os
import shutil

romMap = {
    "map.bin": ["prg/bank1",
                "prg/bank2", "prg/bank3", "prg/bank4", "prg/bank5", "prg/bank6", "prg/bank7", "prg/bank8",
                "prg/bank9", "prg/banka", "prg/bankb", "prg/bankc", "prg/bankd", "prg/banke", "prg/bankf"]
}

romMap_j = {
    "map.bin": ["prg/bank1",
                "prg/bank2", "prg/bank3", "prg/bank4", "prg/bank5", "prg/bank6", "prg/bank7", "prg/bank8",
                "prg/bank9", "prg/banka", "prg/bankb", "prg/bankc", "prg/bankd", "prg/banke", "prg/bankf"]
}

def groupSplit(ver:str):
    import os
    usemap = {}
    if ver == "us":
        usemap = romMap
    elif ver == "jp":
        usemap = romMap_j
    for key in list(usemap.keys()):
        file = f"split/{ver}/{key}"
        data = bytearray()
        for entry in usemap[key]:
            if type(entry) is str:
                path = f"split/{ver}/{entry}.bin"
                data += open(path, "rb").read()
                os.remove(path)
        open(file, "wb").write(data)




def split(rom:str, dir:str):
    #split into banks
    data = open(rom, "rb").read()
    prg = []
    chr = []
    i = 0x10
    while i < len(data):
        if i < 0x40010:
            prg.append(data[i:i+0x2000])
        else:
            chr.append(data[i:i+0x2000])
        i += 0x2000

    if not os.path.exists("split/"+dir):
        os.makedirs(f"split/{dir}/prg")
        os.makedirs(f"split/{dir}/chr")

    i = 0
    for bank in prg:
        result = hex(i).replace("0x", "")
        open(f"split/{dir}/prg/bank"+result+".bin", "wb").write(bank)
        i += 1
    i = 0
    for bank in chr:
        result = hex(i).replace("0x", "")
        open(f"split/{dir}/chr/bank"+result+".bin", "wb").write(bank)
        i += 1
    groupSplit(dir)

#TODO: make this into a yaml-like format, or some other kinda indexing
#this is manually coded for now
#the aim is to retrieve all same binary assets between versions
#namely chr, since a ton of graphics in all releases of this game are the same
#prg will come too, just later
#specifically the same kind of prg that is split into global/**.asm, for easier chunking
def splitMerger():
    if not os.path.exists("split/global"):
        os.makedirs(f"split/global/prg")
        os.makedirs(f"split/global/chr")

    #make sure the user has either split
    usedir = []
    for lang in ["jp", "us"]:
        if os.path.exists(f"split/{lang}/"):
            usedir.append(lang)

    shutil.copyfile(f"split/{usedir[0]}/chr/bank0.bin", "split/global/chr/bank0.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bank1.bin", "split/global/chr/bank1.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bank2.bin", "split/global/chr/bank2.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bank3.bin", "split/global/chr/bank3.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank4.bin", "split/global/chr/bank4.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank5.bin", "split/global/chr/bank5.bin")
    shutil.copyfile(f"split/{usedir[0]}/chr/bank6.bin", "split/global/chr/bank6.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bank7.bin", "split/global/chr/bank7.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bank8.bin", "split/global/chr/bank8.bin") #shared portions
    shutil.copyfile(f"split/{usedir[0]}/chr/bank9.bin", "split/global/chr/bank9.bin") #last half in both versions is the same
    shutil.copyfile(f"split/{usedir[0]}/chr/banka.bin", "split/global/chr/banka.bin")

    shutil.copyfile(f"split/{usedir[0]}/chr/bankc.bin", "split/global/chr/bankc.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/bankd.bin", "split/global/chr/bankd.bin") #minor diffs
    shutil.copyfile(f"split/{usedir[0]}/chr/banke.bin", "split/global/chr/banke.bin") #minor diffs







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
            file = info.replace("infos", "split/us").replace(".cfg", ".bin")
            if not os.path.exists(file): continue
            print(f"disasm {file}")
            subprocess.run(f"da65 -i {info} {file}", shell = True, executable="/bin/bash")