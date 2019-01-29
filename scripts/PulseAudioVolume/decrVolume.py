import subprocess

getVolume = " pacmd list-sinks | \
        awk '/^\svolume:/{i++} i=='$(pacmd list-sinks | \
        awk '/index:/{i++} /* index:/{print i; exit}')'{print $5; exit}'"

decrVolume = " pactl -- set-sink-volume 0 -10% "

subprocess.call(['bash', '-c', decrVolume])
