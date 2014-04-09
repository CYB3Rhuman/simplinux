#!/bin/bash

[ "$HOME" != "" ] && exec -c $0
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

red ": done"
