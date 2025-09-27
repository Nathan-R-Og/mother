.define PAD_A 1 << 7
.define PAD_B 1 << 6
.define PAD_SELECT 1 << 5
.define PAD_START 1 << 4
.define PAD_UP 1 << 3
.define PAD_DOWN 1 << 2
.define PAD_LEFT 1 << 1
.define PAD_RIGHT 1 << 0

;https://github.com/Herringway/ebbsrc/blob/main/src/hardware.asm
;where to put it
.enum BANK
    CHR0000 = 0 ;spr $0000
    CHR0800 = 1 ;spr $0800
    CHR1000 = 2 ;bg $0000
    CHR1400 = 3 ;bg $0400
    CHR1800 = 4 ;bg $0800
    CHR1C00 = 5 ;bg $0c00
    PRG8000 = 6
    PRGA000 = 7
.endenum


;NES registers
.define PPUCTRL $2000
;76543210
;--------
;VPHBSINN
;||||||||
;||||||++- Base nametable address
;||||||    (0 = $2000; 1 = $2400; 2 = $2800; 3 = $2C00)
;|||||+--- VRAM address increment per CPU read/write of PPUDATA
;|||||     (0: add 1, going across; 1: add 32, going down)
;||||+---- Sprite pattern table address for 8x8 sprites
;||||      (0: $0000; 1: $1000; ignored in 8x16 mode)
;|||+------ Background pattern table address (0: $0000; 1: $1000)
;||+------- Sprite size (0: 8x8 pixels; 1: 8x16 pixels – see PPU OAM#Byte 1)
;|+-------- PPU master/slave select
;|          (0: read backdrop from EXT pins; 1: output color on EXT pins)
;+--------- Vblank NMI enable (0: off, 1: on)

.define PPUC_SPR_TableF 1 << 3



.define PPUMASK $2001
.define PPUSTATUS $2002
.define OAMADDR $2003
.define OAMDATA $2004
.define PPUSCROLL $2005
.define PPUADDR $2006
.define PPUDATA $2007

.define SQ1 $4000
.define SQ1_VOL $4000
.define SQ1_SWEEP $4001
.define SQ1_LO $4002
.define SQ1_HI $4003
.define SQ2 $4004
.define SQ2_VOL $4004
.define SQ2_SWEEP $4005
.define SQ2_LO $4006
.define SQ2_HI $4007
.define TRI $4008
.define TRI_LINEAR $4008
.define TRI_LO $400A
.define TRI_HI $400B
.define NOISE $400C
.define NOISE_VOL $400C
.define NOISE_LO $400E
.define NOISE_HI $400F
.define DMC $4010
.define DMC_FREQ $4010
.define DMC_RAW $4011
.define DMC_START $4012
.define DMC_LEN $4013
.define OAMDMA $4014
.define SND_CHN $4015
.define JOY1 $4016
.define JOY2 $4017 ;read
.define FRAME_COUNTER JOY2 ;write

;MMC3 registers
.define BANKSELECT $8000
.define BANKDATA $8001
.define MIRROR $A000
.define PRGRAMPROTECT $A001
.define IRQLATCH $C000
.define IRQRELOAD $C001
.define IRQDISABLE $E000
.define IRQENABLE $E001