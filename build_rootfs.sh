#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/rootfs
rm -rf $OUT/initramfs.cpio*

red ": copying"
mkdir -p $SRC/rootfs
mkdir -p $SRC/to-rootfs
cp -R $SRC/to-rootfs/* $SRC/rootfs
cp $CNF/init $SRC/rootfs/init

red ": packing"
cd $SRC/rootfs
find . | cpio -R 0:0 -H newc -o | lzma -9 -e > $OUT/initramfs.cpio.lzma

red ": done"
