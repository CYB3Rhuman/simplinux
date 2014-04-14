#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/lib-bin

red ": copying"
mkdir -p $SRC/lib-bin/lib
cp $TOOLS_SYSROOT/lib/ld-2.17.so $SRC/lib-bin/lib/
cp $TOOLS_SYSROOT/lib/libc-2.17.so $SRC/lib-bin/lib/
chmod 755 $SRC/lib-bin/lib/*
cd $SRC/lib-bin/lib
ln -s ld-2.17.so ld-linux-x86-64.so.2
ln -s libc-2.17.so libc.so.6
cd $SRC/lib-bin
ln -s lib lib32
ln -s lib lib64

red ": done"
