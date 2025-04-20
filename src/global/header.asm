;iNES Emulator Header File.
.segment        "HEADER":absolute

;----------------------------------------------------------------------------------------------------

;Bytes 0-3.
;      NES   EOF
.literal "NES", $1A        ;ASCII NES followed by MS-DOS end-of-file.

;----------------------------------------------------------------------------------------------------

;Byte 4.
.byte 16                       ;PRG ROM size LSB: 16 banks * 16KB = 256KB.

;----------------------------------------------------------------------------------------------------

;Byte 5.
.ifdef VER_JP
.byte 16                       ;CHR ROM size LSB: 16 banks * 8KB = 128KB.
.else
.byte 32                       ;CHR ROM size LSB: 32 banks * 8KB = 256KB.
.endif

;----------------------------------------------------------------------------------------------------

;7654 3210
;---------
;NNNN FTBM
;|||| |||+-- Hard-wired nametable layout
;|||| |||     0: Vertical arrangement ("mirrored horizontally") or mapper-controlled
;|||| |||     1: Horizontal arrangement ("mirrored vertically")
;|||| ||+--- "Battery" and other non-volatile memory
;|||| ||      0: Not present
;|||| ||      1: Present
;|||| |+--- 512-byte Trainer
;|||| |      0: Not present
;|||| |      1: Present between Header and PRG-ROM data
;|||| +---- Alternative nametables (for mapper 4/MMC3, whether RAM is present at PPU $2000-$2FFF)
;||||        0: No
;||||        1: Yes
;++++------ Mapper Number D3..D0
;
;Byte 6.
.byte $42                       ; persistent memory, mapper 4 (MMC3)

;----------------------------------------------------------------------------------------------------

;7654 3210
;---------
;NNNN 10TT
;|||| ||++- Console type
;|||| ||     0: Nintendo Entertainment System/Family Computer
;|||| ||     1: Nintendo Vs. System
;|||| ||     2: Nintendo Playchoice 10
;|||| ||     3: Extended Console Type
;|||| ++--- NES 2.0 identifier
;++++------ Mapper Number D7..D4
;
;Byte 7.
.byte $08 ; Mapper 04 (MMC3), NES 2.0

;----------------------------------------------------------------------------------------------------

;Mapper MSB/Submapper
;7654 3210
;---------
;SSSS NNNN
;|||| ++++- Mapper number D11..D8
;++++------ Submapper number;
;
;Byte 8.
.byte $00                       ; Mapper 4, submapper 0

;----------------------------------------------------------------------------------------------------

;PRG-ROM/CHR-ROM size MSB
;7654 3210
;---------
;CCCC PPPP
;|||| ++++- PRG-ROM size MSB
;++++------ CHR-ROM size MSB
;
;Byte 9.
.byte $00                       ; PRG-ROM and CHR-ROM sizes fit in earlier bytes

;----------------------------------------------------------------------------------------------------

;PRG-RAM/EEPROM size
;7654 3210
;---------
;pppp PPPP
;|||| ++++- PRG-RAM (volatile) shift count
;++++------ PRG-NVRAM/EEPROM (non-volatile) shift count
;If the shift count is zero, there is no PRG-(NV)RAM.
;If the shift count is non-zero, the actual size is
;"64 << shift count" bytes, i.e. 8192 bytes for a shift count of 7.
;
;Byte 10.
.byte $70                       ; 8192 bytes of PRG-accessible save memory

;----------------------------------------------------------------------------------------------------

;CHR-RAM size
;7654 3210
;---------
;cccc CCCC
;|||| ++++- CHR-RAM size (volatile) shift count
;++++------ CHR-NVRAM size (non-volatile) shift count
;If the shift count is zero, there is no CHR-(NV)RAM.
;If the shift count is non-zero, the actual size is
;"64 << shift count" bytes, i.e. 8192 bytes for a shift count of 7.
;
;Byte 11.
.byte $00                       ; No CHR-RAM

;----------------------------------------------------------------------------------------------------

;CPU/PPU Timing
;7654 3210
;---------
;.... ..VV
;       ++- CPU/PPU timing mode
;            0: RP2C02 ("NTSC NES")
;            1: RP2C07 ("Licensed PAL NES")
;            2: Multiple-region
;            3: UA6538 ("Dendy")
;
;Byte 12.
.byte $00                       ; NTSC NES

;----------------------------------------------------------------------------------------------------

;When Byte 7 AND 3 =1: Vs. System Type
;7654 3210
;---------
;MMMM PPPP
;|||| ++++- Vs. PPU Type
;++++------ Vs. Hardware Type
;
;When Byte 7 AND 3 =3: Extended Console Type
;7654 3210
;---------
;.... CCCC
;     ++++- Extended Console Type
;
;Byte 13.
.byte $00                       ; None of these apply for a normal NES game

;----------------------------------------------------------------------------------------------------

;Miscellaneous ROMs
;7654 3210
;---------
;.... ..RR
;       ++- Number of miscellaneous ROMs present
;
;Byte 14.
.byte $00                       ; No extra ROM chips

;----------------------------------------------------------------------------------------------------

;Default Expansion Device
;7654 3210
;---------
;..DD DDDD
;  ++-++++- Default Expansion Device;
;
;Byte 15
.byte $01                       ; Use normal NES/Famicom controllers by default
