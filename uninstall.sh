#!/bin/bash
sudo dkms remove -m snd-acp6x-fb1xxx -v 2.0 --all
sudo rm -rv /usr/src/snd-acp6x-fb1xxx-2.0 &>/dev/null
