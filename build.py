import subprocess
import os
from tools.ebToString import stringToEb
from glob import glob
import argparse
import shutil
import time

DEFINES = ""
output = "mother_rebuilt.nes"

def addDefine(define):
    global DEFINES
    DEFINES+=f" -D{define}=1"
    DEFINES = DEFINES.strip()


def ca65HasNoUnicodeSupport(dir:str):
    kanaToBytes = []
    for file in glob(f"src/{dir}/**/*.asm", recursive=True) + glob(f"src/global/**/*.asm", recursive=True):
        blacklist = [
            "fontmap.asm",
            "header.asm",
            "main.asm",
        ]
        nope = False
        for blacklisted in blacklist:
            if file.find(blacklisted) != -1:
                nope = True
                break
        if nope: continue

        lines = open(file, "r").readlines()
        for line in lines:
            if line.find("kanafix") != -1:
                kanaToBytes.append(file)
                break
    if len(kanaToBytes) == 0: return

    if not os.path.exists("build_artifacts/"):
        os.makedirs("build_artifacts/")

    for file in kanaToBytes:
        print("charmapping "+file+"....")
        outfile = file.replace("src/", "build_artifacts/")
        justdir = outfile.split("/")
        justdir.pop(-1)
        justdir = "/".join(justdir)
        if not os.path.exists(justdir):
            os.makedirs(justdir)
        lines = open(file, "r").readlines()

        dots = ""
        for i in range(len(justdir.split("/"))):
            dots += "../"

        i = 0
        while i < len(lines):
            line = lines[i]
            if line.find(".include") != -1:
                path = line.split(".include ")[-1].replace('"', "").strip()
                newpath = path.split("/")
                x = 0
                while x < len(newpath):
                    if newpath[x] == "..":
                        newpath.pop(x)
                        break
                    x += 1
                lines[i] = f'.include "{dots}src/jp/{"/".join(newpath)}"\n'
            #because ca65 absolute hates anything but english for some reason
            elif line.find("kanafix") != -1:
                kana = line.split("kanafix ")[-1].split(";")[0].strip()
                result = stringToEb(kana, False)
                result = "$"+result.replace(" ",",$")
                lines[i] = f".byte   {result}\n"


            i += 1

        open(outfile, "w").writelines(lines)

#The localized version of MOTHER includes a gigantic dialogue pointer list.
#This list was NOT in the original, thus making parity way harder.
#This is meant to mitigate that, though is only required by proxy
#of making my life way easier. I don't wanna do this manually, damnit!
def simplifyPointers(dir:str):
    if dir == "us":
        print("fixing pointers...")
        i = 0
        baseLines = open("src/us/text_pointers.asm", "r").readlines()
        fixLines = baseLines.copy()
        while i < len(fixLines):
            remove = fixLines[i].find("MSG_") == -1 or fixLines[i].find("UMSG") != -1
            if remove:
                fixLines.pop(i)
                i -= 1
            i += 1

        i = 0
        array = []
        while i < len(fixLines):
            if fixLines[i].find(".faraddr") != -1:
                array.append(fixLines[i].strip().split("faraddr ")[-1])
            i += 1

        #might as well fix the list itself while we're at it
        fixLines = baseLines.copy()
        for entry in array:
            i = 0
            while i < len(fixLines):
                if fixLines[i] == f".faraddr {entry}\n" != -1 and \
                   fixLines[i].find(":") == -1 and \
                   entry.startswith("MSG_"):


                    convert = entry.replace("MSG_","UMSG_",1)
                    #if one doesnt exist, add
                    if fixLines[i-1].find("UMSG") == -1:
                        fixLines.insert(i, f"{convert}:\n")
                        i -= 1
                    #otherwise regen anyways
                    else:
                        fixLines[i-1] = f"{convert}:\n"
                i += 1

        print("text_pointers fixed!")
        open("src/us/text_pointers.asm", "w").writelines(fixLines)

        UMSGLIST_lines = [
        ".define MSGID(ta) (ta-MSG_pointerList)/3\n"
        ".scope   UMSG\n"
        ]

        for entry in array:
            use = entry
            useMessage = use
            if not use.startswith("MSG_"): continue
            use = use.replace("MSG_","",1)
            useMessage = useMessage.replace("MSG_","UMSG_",1)

            UMSGLIST_lines.append(f"        {use} = MSGID({useMessage})\n")

        UMSGLIST_lines.append(".endscope\n")

    elif dir == "jp":
        #if other files in jp are referenced using the same
        #system as objects, add them here
        dFiles = glob("src/jp/text/*.asm", recursive=True)

        array = []
        for file in dFiles:
            lines = open(file, "r").readlines()
            for line in lines:
                if line.find("MSG_") != -1 and line.find(":") != -1:
                    array.append(line.split(":")[0])

        UMSGLIST_lines = [
        ".scope   UMSG\n"
        ]

        for entry in array:
            use = entry.replace("MSG_","",1)
            UMSGLIST_lines.append(f"        {use} = {entry}\n")

        UMSGLIST_lines.append(".endscope\n")

    filename = "build_artifacts/global/UMSG_list.asm"
    if not os.path.exists(filename):
        os.makedirs(os.path.dirname(filename))
    open(filename, "w").writelines(UMSGLIST_lines)
    print("UMSG_list generated!")

if __name__ == "__main__":
    #pre cleanup
    if os.path.exists(output):
        os.remove(output)

    start_time = time.time()
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-j",
        "--japanese",
        help="Build japanese only assets",
        action="store_true",
    )

    parser.add_argument(
        "-kf",
        "--kanafix",
        help="Build using the macro for japanese kana",
        action="store_true",
    )

    DEFINES = ""

    args = parser.parse_args()

    if os.path.exists("build_artifacts/"):
        shutil.rmtree("build_artifacts/")

    dir = "us"
    if args.japanese:
        dir = "jp"
        addDefine("VER_JP")

    simplifyPointers(dir)

    if not args.kanafix:
        if args.japanese: #remove this if we need kana on us
            ca65HasNoUnicodeSupport(dir)
    else:
        print("have fun !")
        addDefine("kanaMacro")

    linker = "linker.cfg"
    if args.japanese:
        linker = "linker-j.cfg"

    subprocess.run(f"ca65 {DEFINES} -o example.o -g src/{dir}/main.asm -t nes".strip(), shell = True)
    subprocess.run(f"ld65 -Ln linked.txt -C {linker} -o {output} example.o", shell = True)

    resultTime = (time.time() - start_time)
    print(f"Assembly took {resultTime} seconds!")


    #post cleanup
    if os.path.exists(output):
        print(f"rom made!")
    else:
        print(f"ERR!")
        #fail cleanup
        os.remove("mother_rebuilt.nes.deb")

    os.remove("example.o")
