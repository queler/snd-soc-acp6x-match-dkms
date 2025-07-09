#!/usr/bin/env bashq
. dkms.conf
echo "unpacking"
if [[ -f fake.tar ]]  then
	echoing 'unpacking fake.tar for faster testing'
	tar xvf "fake.tar." linux-source-${kgenver}/${modpath}/${modsrc} --strip-components=1
else
	tar xvf "$tarball" linux-source-${kgenver}/${modpath}/${modsrc} --strip-components=1
fi
echo 'patching'
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch

make -C "$ksrc" M="$modpath" modules

