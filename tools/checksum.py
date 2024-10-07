import subprocess
def compare(hash1, rom2="mother_rebuilt.nes"):
    result2 = subprocess.run(
        ['md5sum', rom2],
        capture_output = True, # Python >= 3.7 only
        text = True # Python >= 3.7 only
    )
    sum2 = result2.stdout.replace(rom2, "").strip()
    if hash1 != sum2:
        raise Exception("Hashes do not match")
    else:
        print("OK")
    
if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Configure the project")
    parser.add_argument(
        "-j",
        "--japanese",
        help="Check the checksum of a japanese built rom",
        action="store_true",
    )

    #here because it passes the same args as build.py
    parser.add_argument(
        "-kf",
        "--kanjifix",
        help="Build using the macro for japanese kanji",
        action="store_true",
    )

    DEFINES = ""
    
    args = parser.parse_args()

    hash1 = "5bacf7ba94c539a1caf623dbe12059a3" #us hash
    if args.japanese:
        hash1 = "218503a880999363ac83945096040492" #jp hash
    compare(hash1)
