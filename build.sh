#!/usr/bin/env bash
. dkms.conf
echo "unpacking"
if [[ -f ".cache/$(basename ${tarball%.*}" ]]  then
	echoing 'unpacking cacched tar for faster testing'
	tar xvf ".cache/$(basename ${tarball%.*}" linux-source-${kgenver}/${modpath}/ --strip-components=1
else
	tar xvf "$tarball" linux-source-${kgenver}/${modpath}/ --strip-components=1
fi
echo 'patching'
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch

make -C "$ksrc" M="$modpath" modules
