#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/toolchain
mkdir -p $SRC/toolchain

red ": patching"
cd $SRC/toolchain
cp $CNF/ct-ng-$CTNG_VER .config
$CT_NG oldconfig

red ": compiling"
SRC=$SRC KERNEL_VER=$KERNEL_VER $CT_NG build

red ": done"
