#!/usr/bin/env bash
# gen_patch.sh  – run from dkms root
if [[ ! -f dkms.conf ]];then 
	echo "run in dkms root"
	exit 1
fi
src="sound/soc/amd/yc/acp6x-mach.c"
[[ -f ${src}.orig && -f $src ]] || { echo "missing file(s)"; exit 2; }
patch="acp6x-mach-fb1xxx.patch"
git diff --no-index  ${src}.orig ${src}  |tee "$patch"
echo "patch hopefully written to $patch"
