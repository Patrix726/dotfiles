#!/bin/sh

active=$(pacmd list-sources | awk 'c&&!--c;/* index*/{c=1}' | awk '{gsub(/<|>/,"",$0); print $NF}')
now=$(date +%F_%T.mkv)
filename="$now"
filedir="$HOME/Videos/Screencasts"

mkdir -p "$filedir"

echo active sink: $active 
echo $filename

if [ -z $(pgrep wf-recorder) ];
	then notify-send "Recording Started ($active)"
	if [ "$1" = "-sa" ]
		then wf-recorder -f "$filedir/$filename" -a "$active" -C aac -g "$(slurp -c "#FFFFFF")" >/dev/null 2>&1 &
			pkill -RTMIN+8 waybar
	elif [ "$1" = "-s" ]
		then wf-recorder -f "$filedir/$filename" -g "$(slurp -c "#FFFFFF")" >/dev/null 2>&1 &
			 pkill -RTMIN+8 waybar
	elif [ "$1" = "-a" ]
		then
			wf-recorder -f "$filedir/$filename" -a "$active" -C aac >/dev/null 2>&1 &
			pkill -RTMIN+8 waybar
	else
		wf-recorder -f "$filedir/$filename" >/dev/null 2>&1 &
		pkill -RTMIN+8 waybar
	fi
else
	killall -s SIGINT wf-recorder
	notify-send "Recording Complete"
	while [ ! -z $(pgrep -x wf-recorder) ]; do wait; done
	pkill -RTMIN+8 waybar
	name="$(zenity --entry --text "Enter a filename")"
	old_name="$(ls -d $filedir/* -t | head -n1)"
	mv "$old_name" "$filedir/$name.mkv"
fi
