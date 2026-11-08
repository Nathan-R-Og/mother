new_rom = open("mother.nes", "rb").read()[0x10:]
bank = 0x19
bank_bytes = list(new_rom[bank*0x2000:(bank+1)*0x2000])
Bank_Checksum1_label = 0xA48F
Bank_Checksum2_label = 0xA88C
if bank == 0x19:
    #label calc :P
    Bank_Checksum1_label -= 0xa000
    Bank_Checksum2_label -= 0xa000

    Bank_Checksum1 = Bank_Checksum1_label+10
    Bank_Checksum1_comp = Bank_Checksum1_label+22

    Bank_Checksum2 = Bank_Checksum2_label+10
    Bank_Checksum2_comp = Bank_Checksum2_label+22

    #zero out this bank
    bank_bytes[Bank_Checksum1:Bank_Checksum1+2] = [0,0]
    bank_bytes[Bank_Checksum2:Bank_Checksum2+2] = [0,0]
    #compliment 0
    bank_bytes[Bank_Checksum1_comp:Bank_Checksum1_comp+2] = [0xFF,0xFF]
    bank_bytes[Bank_Checksum2_comp:Bank_Checksum2_comp+2] = [0xFF,0xFF]

    #math time
    bank_checksum = sum(bank_bytes) & 0xFFFF
    compliment = bank_checksum ^ 0xFFFF

    #test
    bank_bytes[Bank_Checksum1:Bank_Checksum1+2] = int.to_bytes(bank_checksum, 2, 'big')
    bank_bytes[Bank_Checksum2:Bank_Checksum2+2] = int.to_bytes(bank_checksum, 2, 'big')
    bank_bytes[Bank_Checksum1_comp:Bank_Checksum1_comp+2] = int.to_bytes(compliment, 2, 'little')
    bank_bytes[Bank_Checksum2_comp:Bank_Checksum2_comp+2] = int.to_bytes(compliment, 2, 'little')
    print(f"result compliment is .word ${compliment:4X}")

bank_checksum = sum(bank_bytes) & 0xFFFF
b_lo = bank_checksum & 0xff
b_hi = bank_checksum >> 8
print(f"result checksum is .byte ${b_hi:2X},${b_lo:2X}")