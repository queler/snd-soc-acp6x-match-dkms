#!/usr/bin/env bash
. dkms.conf
echo "unpacking"
tar xvf "$tarball" linux-source-${kgenver}/${modpath}/${modsrc} --strip-components=1
echo 'patching'
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch
echo "making make -C \"$ksrc\" M=\"$modpath\""
make -C "$ksrc" M="$modpath" modules

