#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -f $OUT/linux-$KERNEL_VER
rm -rf $SRC/linux-*

red ": unpacking"
cd $SRC
tar xvf tarball/linux-$KERNEL_VER.tar.xz
cd linux-$KERNEL_VER

red ": patching"
make mrproper
make defconfig
#cp $CNF/linux-$KERNEL_VER .config
#make oldconfig

red ": compiling"
make CROSS_COMPILE=$TOOLS
mkdir -p $OUT
cp arch/x86/boot/bzImage $OUT/linux-$KERNEL_VER

red ": done"
