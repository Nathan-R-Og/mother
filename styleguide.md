# Mother Style Guide

This is an incredibly brief explanation on how I style things!

This isn't so much as a requirement for contributing as much as it is a guide on what I think looks cool.

## Assembly

All lowercase baby!!!

### LAME
```asm
    LDA #$55
```
### AWESOME
```asm
    lda #$55
```
just helps differentiate between names and code, i think

All integers in hexadecimal until you know what it does.

### LAME
```asm
    lda #55 ;??????
```
### AWESOME
```asm
    lda #$37 ;??????
```

that way, if something else uses that or you need to cross reference the binary of the roms, the byte is right there! ez pz

If a label starts a routine, no tabs. If a label jumps in the middle of one or is part of that same routine, one tab to line up with code.

### LAME
```asm
    ThisRoutine:
    lda #55
    sta $55
ThisRoutines_label: beq ThisRoutines_label
```
### AWESOME
```asm
ThisRoutine:
    lda #55
    sta $55
    ThisRoutines_label:
    beq ThisRoutines_label
```
imho makes it look more like a proper tree structure. a little shaky on out of nowhere jumps into routines, but thats what labels are for baby !!!

Try to use `.define` instead of `.macro` for smaller conversions. If it gets REALLY big, THEN go for `.macro`.

### LAME
```asm
.macro thisSmallThing argX
    .byte argX >> 2
.endmacro
```
### AWESOME
```asm
.define thisSmallThing(argX) .byte argX >> 2
```

saves lines and makes it VERY clear this is a quick and easy macro.



## Data

Generally, if you do not know what it is does, don't include the `.byte`s.

### LAME
```asm
;????
.byte 94857938457983758934758934789574935743895347985987345897437985438795
```
### AWESOME
```asm
;????
.incbin "whereYouGotItFrom.bin", $ThatAddress
```

makes it more orderly and clearly shouts "THIS NEEDS WORK!!!"

the more notation and conversion to readable data, the more reason it has to be in this repo! otherwise someone could just look at a hex editor.


## Conclusion

i think thats it???? ill update the more i find myself doing things :P

(please catch me if you see me going against any of these :))
