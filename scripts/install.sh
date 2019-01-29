#!/bin/bash

printf "\n" >> ~/.bashrc
printf 'export PATH="$PATH:' >> ~/.bashrc
printf $(pwd)/PulseAudioVolume >> ~/.bashrc
printf '"\n' >> ~/.bashrc
echo export PULSEAUDIOSCRIPTS_DIR="$(pwd)/PulseAudioVolume/" >> ~/.bashrc
