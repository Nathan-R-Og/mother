from hashlib import md5

rebuilt_rom = "mother_rebuilt.nes"
hash_us = "5bacf7ba94c539a1caf623dbe12059a3"
hash_jp = "218503a880999363ac83945096040492"

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

    args = parser.parse_args()

    hash1 = hash_us #us hash
    if args.japanese:
        hash1 = hash_jp #jp hash

    if hash1 != md5(open(rebuilt_rom, "rb").read()).hexdigest():
        raise Exception("Hashes do not match")
    else:
        print("OK")
