#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars
. $THIS/links
. $THIS/func

red ": downloading"
mkdir -p $SRC/tarball
cd $SRC/tarball
download $CTNG_LINK
download $KERNEL_LINK
download $TOYBOX_LINK
download $DASH_LINK

red ": done"
