from hashlib import md5

rebuilt_rom = "mother_rebuilt.nes"
hash_us = ["5bacf7ba94c539a1caf623dbe12059a3", "54387b6e68142d69083a38b437196450"]
hash_jp = ["218503a880999363ac83945096040492"]

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
        "--kanafix",
        help="Build using the macro for japanese kana",
        action="store_true",
    )

    args = parser.parse_args()

    hash1 = hash_us #us hash
    if args.japanese:
        hash1 = hash_jp #jp hash

    for hash in hash1:
        if hash == md5(open(rebuilt_rom, "rb").read()).hexdigest():
            print("OK")
            exit()
    #if no match
    raise Exception("Hashes do not match")