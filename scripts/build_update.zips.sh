#!/bin/sh
test -n "$1" || exit 1

mkdir -p output
zimage_file=`readlink -f "$1"`
start_pwd=$PWD

cp $zimage_file unsigned_for_cwm/kernel_flasher/zImage || exit 1

# clean old update.zip
rm -f output/*.zip

cd unsigned_for_cwm/
zip -r ../output/unsigned-update.zip *

cd $start_pwd
ls -lh output/unsigned-update.zip
