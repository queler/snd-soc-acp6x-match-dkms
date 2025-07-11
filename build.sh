#!/usr/bin/env bash
. dkms.conf
echo "unpacking"
if [[ -f "../$(basename ${tarball%.*})" ]] ; then
	echo 'unpacking cached tar for faster testing'
	tar xvf "../$(basename ${tarball%.*})" "linux-source-${kgenver}/${modpath}/$modsrc" --strip-components=1
else
	tar xvf "$tarball" "linux-source-${kgenver}/${modpath}/$modsrc" --strip-components=1
fi
echo 'patching'
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch
echo "MODULE_DKMS(\"$PACKAGE_NAME/$PACKAGE_VERSION-$(git rev-parse --short  HEAD 2>/dev/null)\")">> "$modpath/$modsrc"
make -C "$ksrc" M="$PWD/$modpath" modules
