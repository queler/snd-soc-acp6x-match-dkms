#!/usr/bin/env bash


echo "kernelver=$kernelver"
echo "uname -r=$(uname -r)"
kver="${kernelver:-$(uname -r)}"
echo "using $kver"
kgenver="${kver%%-*}"
echo "generic version:$kgenver"

