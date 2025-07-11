#!/bin/bash
. dkms.conf
sudo dkms add .
sudo dkms build --debug  -m "$PACKAGE_NAME" -v "${PACKAGE_VERSION}" 2>&1 |sudo tee "/usr/src/snd-acp6x-fb1xxx-${PACKAGE_VERSION}/dkms.log"
