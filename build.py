import subprocess
import os

DEFINES = ""

def addDefine(define):
    global DEFINES
    DEFINES+=f" -D{define}=1"
    DEFINES = DEFINES.strip()


def ca65HasNoUnicodeSupport(dir:str):

    from glob import glob
    kanjiToBytes = []
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
            if line.find("kanjifix") != -1:
                kanjiToBytes.append(file)
                print("charmapping "+file+"....")
                break
    if len(kanjiToBytes) == 0: return

    if not os.path.exists("build_artifacts/"):
        os.makedirs("build_artifacts/")

    from tools.ebToString import stringToEb
    for file in kanjiToBytes:
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
            elif line.find("kanjifix") != -1:
                kanji = line.split("kanjifix ")[-1].split(";")[0].strip()
                result = stringToEb(kanji, False)
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
            invalid = fixLines[i].find("$") != -1 or\
                    fixLines[i].startswith(".word 0") or\
                    fixLines[i].startswith(".byte")
            remove = fixLines[i].find(":") != -1 or\
                    fixLines[i].startswith(";") or\
                    fixLines[i] == "\n"
            if invalid:
                fixLines[i] = ""
            if remove:
                fixLines.pop(i)
                i -= 1
            i += 1

        i = 0
        array = []
        while i < len(fixLines):
            if i % 2 == 0 and fixLines[i].strip() != "":
                array.append(fixLines[i].strip().split("word ")[-1])
            i += 1

        #might as well fix the list itself while we're at it
        fixLines = baseLines.copy()
        for entry in array:
            i = 0
            while i < len(fixLines):
                if fixLines[i] == f".word {entry}\n" != -1 and fixLines[i].find(":") == -1:
                    if entry.startswith("MSG_"):
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
        #i was gonna glob them but i feel like thats super dangerous LOL
        dFiles = [
            "src/jp/dialogue1.asm",
            "src/jp/dialogue2.asm",
            "src/jp/dialogue3.asm",
            "src/jp/dialogue4.asm"
            ]

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

    import os
    filename = "build_artifacts/global/UMSG_list.asm"
    if not os.path.exists(filename):
        os.makedirs(os.path.dirname(filename))
    open(filename, "w").writelines(UMSGLIST_lines)
    print("UMSG_list generated!")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-j",
        "--japanese",
        help="Build japanese only assets",
        action="store_true",
    )

    parser.add_argument(
        "-kf",
        "--kanjifix",
        help="Build using the macro for japanese kanji",
        action="store_true",
    )

    DEFINES = ""

    args = parser.parse_args()

    if os.path.exists("build_artifacts/"):
        import shutil
        shutil.rmtree("build_artifacts/")

    dir = "us"
    if args.japanese:
        dir = "jp"
        addDefine("VER_JP")

    simplifyPointers(dir)

    if not args.kanjifix:
        if args.japanese: #remove this if we need kanji on us
            ca65HasNoUnicodeSupport(dir)
    else:
        print("have fun !")
        addDefine("kanjiMacro")

    linker = "linker.cfg"
    if args.japanese:
        linker = "linker-j.cfg"

    subprocess.run(f"ca65 {DEFINES} -o example.o -g src/{dir}/main.asm -t nes".strip(), shell = True, executable="/bin/bash")
    subprocess.run(f"ld65 -Ln linked.txt -C {linker} -o mother_rebuilt.nes example.o", shell = True, executable="/bin/bash")


