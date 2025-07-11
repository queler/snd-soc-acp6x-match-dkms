#!/bin/bash
. dms.conf
sudo dkms remove -m "${PACKAGE_NAME}" -v "${PACKAGE_VERSION}" --all
sudo rm -rv "/usr/src/${PACKAGE_NAME}-${PACKAGE_VERSION}" &>/dev/null
