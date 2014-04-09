#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/toolchain
mkdir -p $SRC/toolchain

red ": patching"
tar xvf $SRC/tarball/linux-$KERNEL_VER.tar.bz2
mv linux-$KERNEL_VER kernel
cp $CNF/ct-ng-$CTNG_VER .config
$CT_NG oldconfig

red ": compiling"
$CT_NG build

red ": done"
