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
    for file in glob(f"src/{dir}/**/*.asm", recursive=True):
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
    
    if not args.kanjifix:
        ca65HasNoUnicodeSupport(dir)
    else:
        print("have fun !")
        addDefine("kanjiMacro")

    linker = "linker.cfg"
    if args.japanese:
        linker = "linker-j.cfg"

    subprocess.run(f"ca65 {DEFINES} -o example.o -g src/{dir}/main.asm -t none".strip(), shell = True, executable="/bin/bash")
    subprocess.run(f"ld65 -Ln linked.txt -C {linker} -o mother_rebuilt.nes example.o", shell = True, executable="/bin/bash")

    
    