#!/bin/bash

string=$(i3-msg -t get_tree | grep -oP 'class":"[^",]*' | cut -d'"' -f3 | grep -Ev 'i3bar' | tr '\n' "|" | sed 's/|/ | /g' | rev | cut -c 2- | rev )
echo $string

# echo '<span foreground="#1FFB00">[<i>$(string)</i>]</span>'
