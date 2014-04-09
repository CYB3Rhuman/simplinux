#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": unpacking"
cd $SRC
tar xvf tarball/crosstool-ng-$CTNG_VER.tar.bz2

red ": compiling"
cd crosstool-ng-$CTNG_VER
./configure --prefix="$SRC/ct-ng"
make
make install

red ": done"
