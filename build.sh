#!/bin/bash

THIS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $THIS/func

red ":: downloading sources"
$THIS/download.sh

red ":: installing crosstools"
$THIS/build_ctng.sh

red ":: building toolchain"
$THIS/build_toolchain.sh

red ":: building kernel"
$THIS/build_kernel.sh

red ":: building toybox"
$THIS/build_toybox.sh

red ":: building rootfs"
$THIS/build_rootfs.sh

red ":: executing"
$THIS/run.sh

