import subprocess
import sys
import os
dir_path = os.path.dirname(os.path.realpath(__file__))

a = ["English ", "Serbian latin", "Serbian "]
strings = ["Eng", "Srpski", "Српски"]
cmd = ["setxkbmap us", "setxkbmap rs -variant latin", "setxkbmap rs"]

check_layout = f"{dir_path}/xkblayout-state print '%n %v'"


def main():
    b = subprocess.getoutput(check_layout)
    index = a.index(b)

    return strings[index]

if __name__ == "__main__":
    ret = main()
    sys.exit(ret)


# setxkbmap -model pc104 -layout us,rs,rs -variant ,latin, -option grp:alt_shift_toggle
