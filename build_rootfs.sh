#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/rootfs
rm -rf $OUT/initramfs.cpio

red ": copying"
mkdir -p $SRC/rootfs
cp -R $SRC/*-bin/* $SRC/rootfs
cp $CNF/init $SRC/rootfs/init

red ": packing"
cd $SRC/rootfs
find . | cpio -R 0:0 -H newc -o > $OUT/initramfs.cpio

red ": done"
