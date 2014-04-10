#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/toybox-*

red ": unpacking"
cd $SRC
tar xvf tarball/toybox-$TOYBOX_VER.tar.bz2
cd toybox-$TOYBOX_VER

red ": patching"
make clean
cp $CNF/mount.c toys/pending/mount.c
cp $CNF/toybox-$TOYBOX_VER .config
make oldconfig

red ": compiling"
CFLAGS="--static" CROSS_COMPILE=$TOOLS make

red ": done"
