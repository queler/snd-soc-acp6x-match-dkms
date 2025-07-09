#!/bin/bash
sudo dkms add .
sudo dkms build  -m snd-acp6x-fb1xxx -v 2.0 2>&1 |sudo tee /usr/src/snd-acp6x-fb1xxx-2.0/dkms.log

