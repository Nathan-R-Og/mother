import subprocess

DEFINES = ""

def addDefine(define):
    global DEFINES
    DEFINES+=f" -D{define}=1"
    DEFINES = DEFINES.strip()

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-j",
        "--japanese",
        help="Build japanese only assets",
        action="store_true",
    )

    DEFINES = ""
    
    args = parser.parse_args()

    if args.japanese:
        addDefine("VER_JP")

    linker = "linker.cfg"
    if args.japanese:
        linker = "linker-j.cfg"

    subprocess.run(f"ca65 {DEFINES} -o example.o -g src/main.asm".strip(), shell = True, executable="/bin/bash")
    subprocess.run(f"ld65 -C {linker} -o mother_rebuilt.nes example.o", shell = True, executable="/bin/bash")

    
    