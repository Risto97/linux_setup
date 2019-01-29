import subprocess
import re

getVolume = " pacmd list-sinks | \
        awk '/^\svolume:/{i++} i=='$(pacmd list-sinks | \
        awk '/index:/{i++} /* index:/{print i; exit}')'{print $5; exit}'"

incrVolume = " pactl -- set-sink-volume 0 +10% "

bashRet = subprocess.check_output(['bash','-c', getVolume])

volumeLevel = int( re.findall(r'\d+', str( bashRet ))[0] )
print(volumeLevel)

if volumeLevel < 100:
    subprocess.call(['bash', '-c', incrVolume])
