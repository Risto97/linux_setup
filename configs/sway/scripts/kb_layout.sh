#!/usr/bin/env bash

case $(setxkbmap -query | grep layout | awk '{ print $2 }') in
          us) setxkbmap sr-cy ;;
       sr-cy) setxkbmap sr-latin ;;
    sr-latin) setxkbmap us -variant altgr-intl ;;
           *) setxkbmap us -variant altgr-intl ;;
esac

