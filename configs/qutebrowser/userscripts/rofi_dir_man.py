#!/usr/bin/env python

##### TODO #####
# substitute custom user keys if present in rofi config

from rofi import Rofi
import glob, os
from pathlib import Path
import sys


def listdirs(folder):
    return [
        d for d in os.listdir(folder)
        if os.path.isdir(os.path.join(folder, d))
    ]


def listdirs_full(folder):
    return [
        d for d in (os.path.join(folder, d1) for d1 in os.listdir(folder))
        if os.path.isdir(d)
    ]


def display_rofi(ls_dir, r):
    ls_dir.insert(0, "./")
    ls_dir.insert(0, "../")
    ret = r.select("files", ls_dir, key1=["Right", ""], key2=["Left", ""])

    return ret


def invoke_dir_man(default_dir):
    dir_path = default_dir
    r = Rofi(lines=10, rofi_args=["-font", "Inconsolata Bold 12"])

    ls_dir = listdirs_full(dir_path)

    num, key = display_rofi(ls_dir, r)

    while key != 0 or (key == 0 and num == 0):
        if key == -1:
            return -1

        if key == 2 or num == 0:
            dir_path = os.path.abspath(os.path.join(dir_path, "../"))
        elif key == 1:
            curr_name = os.path.basename(ls_dir[num])
            dir_path = os.path.join(dir_path, curr_name)

        ls_dir = listdirs_full(dir_path)
        num, key = display_rofi(ls_dir, r)

    if key == 0:
        if num != 1:
            curr_name = os.path.basename(ls_dir[num])
            dir_path = os.path.join(dir_path, curr_name)

        return dir_path


# default_dir = "/tools/git_repos"
# invoke_dir_man(default_dir)
