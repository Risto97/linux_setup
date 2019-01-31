#!/bin/bash

printf "\n" >> ~/.bash_profile
printf 'export PATH="$PATH:' >> ~/.bash_profile
printf $(pwd)/PulseAudioVolume >> ~/.bash_profile
printf '"\n' >> ~/.bash_profile
echo export PULSEAUDIOSCRIPTS_DIR="$(pwd)/PulseAudioVolume/" >> ~/.bash_profile

printf 'export PATH="$PATH:' >> ~/.bash_profile
printf $(pwd) >> ~/.bash_profile
printf '"\n' >> ~/.bash_profile
printf 'export PATH="$PATH:' >> ~/.bash_profile
printf $(pwd)/mlocal >> ~/.bash_profile
printf '"\n' >> ~/.bash_profile
