#!/usr/bin/env bash

function dvar() { for i in $@; do echo "${i}=${!i}";done;}
echo "kernelver=$kernelver"
echo "uname -r=$(uname -r)"
kver="${kernelver:-$(uname -r)}"
echo "using $kver"
kgenver="${kver%%-*}"
patch_file="acp6x-mach-fb1xxx.patch"
tarball=$(find "/usr/src/" -maxdepth 1 -iname "linux-source-${kgenver}.tar.*"|head -n1)
dvar kernelver kver kgenver patch_file tarball
echo "unpacking"
tar xvf "$tarball" linux-source-6.8.0/sound/soc/amd/yc/acp6x-mach.c --strip-components=1
echo 'patching
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch

