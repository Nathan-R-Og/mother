
import subprocess
from glob import glob
import os
import shutil
import tools.yamlSplit
import tools.sameFileRetriever


versions = ["jp", "us"]

def split_old(rom:str, dir:str):
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

#TODO: make this into a yaml-like format, or some other kinda indexing
#this is manually coded for now
#the aim is to retrieve all same binary assets between versions
#namely chr, since a ton of graphics in all releases of this game are the same
#prg will come too, just later
#specifically the same kind of prg that is split into global/**.asm, for easier chunking
def splitMerger():
    if not os.path.exists("split/global"):
        os.makedirs(f"split/global")

    #make sure the user has either split
    usedir = []
    for lang in versions:
        if os.path.exists(f"split/{lang}/"):
            usedir.append(lang)

    if len(usedir) == 0:
        return

    global_list = open("globalList.txt", "r").readlines()
    for entry in global_list:
        use_entry = entry.strip()
        file = f"split/{usedir[0]}/{use_entry}"
        new_file = f"split/global/{use_entry}"
        new_path = new_file.split("/")
        new_path.pop(-1)
        new_path = "/".join(new_path)
        if not os.path.exists(new_path):
            os.makedirs(new_path)
        shutil.copyfile(file, new_file)

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

    anySplit = False
    for version in versions:
        # the call to `doSplit()` has to come first, otherwise once one split
        # succeeds, it will short-circuit and not evaluate `doSplit()` again
        anySplit = tools.yamlSplit.doSplit(version) or anySplit
    if not anySplit:
        raise(Exception("ERROR: did not find any ROM files to extract. Please put a clean\n"
              "MOTHER or Earthbound ROM in the same directory as configure.py"))

    tools.sameFileRetriever.do()
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