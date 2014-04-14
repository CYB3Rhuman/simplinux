#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/func

red ": cleaning"
rm -rf $SRC/dash-*

red ": unpacking"
cd $SRC
tar xvf tarball/dash-$DASH_VER.tar.gz
cd dash-$DASH_VER

red ": patching"
./configure --prefix="$SRC/dash-bin" LDFLAGS="-L$SRC/lib-bin/lib" CC="${TOOLS}cc" CPP="${TOOLS}cpp" #--enable-static

red ": compiling"
make
make install
rm -rf $SRC/dash-bin/share

red ": done"
