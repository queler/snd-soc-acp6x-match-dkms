#!/bin/bash

function dvar() { for i in $@; do echo "${i}=${!i}";done;}
echo "kernelver=$kernelver"
echo "uname -r=$(uname -r)"
kver="${kernelver:-$(uname -r)}"
echo "using $kver"
kgenver="${kver%%-*}"
odpath="$(realpath 'sound/soc/amd/yc/')"
ksrc=/usr/src/linux-headers-$kver
dvar kernelver kver kengenver modpath ksrc
echo "cleaning  make -C \"$ksrc\" M=\"$modpath\" clean"
make -C "$ksrc" M="$modpath" clean

