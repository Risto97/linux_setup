#!/bin/bash

# python /home/risto/scripts/keyboard_layout.py

proba=$($(pwd)/xkblayout-state print '%n %v')
if [ "$proba" = "English " ]; then
    echo "English"
elif [ "$proba" = "Serbian latin" ]; then
    echo "Srpski "
elif [ "$proba" = "Serbian " ]; then
    echo "Српски "
else
    echo $proba
fi
# setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'
