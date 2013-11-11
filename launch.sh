#! /bin/sh
SOURCE="bios.asm"
DEST="boot_sect.bin"
CONFIG=".bochsrc.txt"

function boot
{
    bochs -qf $CONFIG
}

# compiles the boot loader source into a binary cde
nasm $SOURCE -f bin -o $DEST

# launchs bochs with given config file
$(boot)