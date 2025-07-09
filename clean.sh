#!/bin/bash

. buildenv
if [[ -d "$modpath" ]]; then
	realmodpath="$(realpath 'sound/soc/amd/yc/')"
	ksrc=/usr/src/linux-headers-$kver
	dvar kernelver kver kengenver realmodpath ksrc
	echo "cleaning  make -C \"$ksrc\" M=\"$modpath\" clean"
	make -C "$ksrc" M="$modpath" clean 2>&1 |tee clean.log
else
	echo "nothing to clean"
fi
