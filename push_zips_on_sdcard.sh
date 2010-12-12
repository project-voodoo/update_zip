#!/bin/sh
for x in output/*update.zip; do
	echo "pushing $x..."
	adb push "$x" /sdcard/
done

