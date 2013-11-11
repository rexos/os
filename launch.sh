#! /bin/sh
SOURCE="bios.asm"
DEST="boot_sect.bin"
CONFIG=".bochsrc.txt"

function boot
{
    bochs -qf $CONFIG
}

# compiles the boot loader source into binary code
nasm $SOURCE -f bin -o $DEST

# launches bochs with given config file
$(boot)