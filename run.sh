#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/vars

$QEMU -kernel $OUT/linux-$KERNEL_VER -initrd $OUT/initramfs.cpio.lzma

