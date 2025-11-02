#!/bin/bash

entries="Area\nActive\nScreen\nOutput\nWindow"

selected=$(echo -e "$entries" | rofi -dmenu \
    -p "Screenshot" \
    -i \
    -lines 5 \
    -width 20 \
    -location 0 \
    -xoffset 870 \
    -yoffset 455 \
    -theme-str '
        window {
            location: center;
            anchor: center;
            width: 20ch;
        }
        listview {
            scrollbar: false;
            lines: 5;
            fixed-height: true;
        }
        entry {
            enabled: false;
        }
        element {
            padding: 10px;   /* increase vertical height */
        }
        element-text {
            vertical-align: 0.5;  /* center text vertically */
        }') 

export XDG_SCREENSHOTS_DIR=~/Pictures/screenshots

case $selected in
  Active)
    grimshot --notify save active ;;
  Screen)
    grimshot --notify save screen ;;
  Output)
    grimshot --notify save output ;;
  Area)
    grimshot --notify save area ;;
  Window)
    grimshot --notify save window ;;
esac

