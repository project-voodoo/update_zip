#!/bin/bash

my_pwd=`dirname $(readlink -f $0)`

# parse command line options
while getopts "s:d:" opt
do
	case "$opt" in
		s) zImage=`readlink -f "$OPTARG"`;;
		d) dest_update_zip=`readlink -f "$OPTARG"`;;
	esac
done


# verify input arguments
if ! test -f "$zImage"; then
	echo "ERROR, source zImage file required as input"
	exit 1
fi

if ! test -n "$dest_update_zip"; then
	echo "ERROR, you must specify an output filename for the resulting update.zip"
	exit 1
fi


cd $my_pwd
mkdir -p `basename $dest_update_zip`
cp $zImage template/kernel_flasher/zImage || exit 1

cd template/
zip -r -9 $dest_update_zip *

du -sh $dest_update_zip
