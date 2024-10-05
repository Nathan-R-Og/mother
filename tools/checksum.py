import subprocess
def compare(rom1="mother.nes", rom2="mother_rebuilt.nes"):
    result = subprocess.run(
        ['md5sum', rom1],
        capture_output = True, # Python >= 3.7 only
        text = True # Python >= 3.7 only
    )
    sum1 = result.stdout.replace(rom1, "").strip()

    result2 = subprocess.run(
        ['md5sum', rom2],
        capture_output = True, # Python >= 3.7 only
        text = True # Python >= 3.7 only
    )
    sum2 = result2.stdout.replace(rom2, "").strip()
    if sum1 != sum2:
        raise Exception("Hashes do not match")
    else:
        print("OK")
    
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

    rom1 = "mother.nes"
    if args.japanese:
        rom1 = "mother-j.nes"
    compare(rom1)
