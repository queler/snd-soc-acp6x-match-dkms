#!/usr/bin/env bash
. dkms.conf
bzopt=()
case "$tarball" in
    *.tar.bz2|*.tbz2)
        bzcmd=$(command -v lbzip2 || command -v pbzip2 || command -v bzip2)
        if [[ -n "$bzcmd" ]]; then
            bzopt=(--use-compress-program="$bzcmd")
        else
            echo "No bzip2-compatible decompressor found." >&2
            exit 1
        fi
        ;;
esac
dvar bzopt[@] bzcmd[@]
echo "Unpacking..."
tar "${bzopt[@]}" -xvf "$tarball" "linux-source-${kgenver}/${modpath}/" --strip-components=1
echo 'patching'
patch  --verbose -p1   < acp6x-mach-fb1xxx.patch
echo "MODULE_VERSION(\"${PACKAGE_VERSION}-dkms$(git rev-parse --short HEAD||date "+%s")\");" >> sound/soc/amd/yc/acp6x-mach.c
make -C "$ksrc" M="$PWD/$modpath/" $BUILT_MODULE_NAME.ko
