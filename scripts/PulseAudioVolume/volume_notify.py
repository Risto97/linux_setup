import subprocess
import re

icons_path = "/home/risto/.config/dunst/icons/volume/"

getVolume = " pacmd list-sinks | \
        awk '/^\svolume:/{i++} i=='$(pacmd list-sinks | \
        awk '/index:/{i++} /* index:/{print i; exit}')'{print $5; exit}'"

bashRet = subprocess.check_output(['bash','-c', getVolume])
volumeLevel = int( re.findall(r'\d+', str( bashRet ))[0] )

if volumeLevel == 0:
    icon_name = "audio-volume-muted.png"
elif volumeLevel < 35 and volumeLevel > 0:
    icon_name = "audio-volume-low.png"
elif volumeLevel >= 35 and volumeLevel <= 65:
    icon_name = "audio-volume-medium.png"
elif volumeLevel > 65:
    icon_name = "audio-volume-high.png"

volumeLevel_str = str(volumeLevel)
sendNotification = f"notify-send -t 400 'Volume up' '{volumeLevel_str}' -i {icons_path}{icon_name}"

subprocess.call(['bash', '-c', sendNotification])
