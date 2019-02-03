#!/bin/bash

variables_fn=variables.sh
rm $variables_fn

printf "#!/bin/bash\n" >> $variables_fn
printf "\n" >> $variables_fn
printf 'export PATH="$PATH:' >> $variables_fn
printf $(pwd)/PulseAudioVolume >> $variables_fn
printf '"\n' >> $variables_fn
echo export PULSEAUDIOSCRIPTS_DIR="$(pwd)/PulseAudioVolume/" >> $variables_fn

printf 'export PATH="$PATH:' >> $variables_fn
printf $(pwd) >> $variables_fn
printf '"\n' >> $variables_fn
printf 'export PATH="$PATH:' >> $variables_fn
printf $(pwd)/search_tool/search_scripts >> $variables_fn
printf '"\n' >> $variables_fn
printf 'export PATH="$PATH:' >> $variables_fn
printf $(pwd)/search_tool >> $variables_fn
printf '"\n' >> $variables_fn
echo export SEARCH_SCRIPTS_DIR="$(pwd)/search_tool/search_scripts/" >> $variables_fn

printf "Append this to bash_profile or profile: \n"
printf "source $(pwd)/$variables_fn\n"
