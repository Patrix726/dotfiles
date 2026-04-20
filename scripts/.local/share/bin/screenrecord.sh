#!/bin/bash

active=$(pacmd list-sources | awk 'c&&!--c;/* index*/{c=1}' | awk '{gsub(/<|>/,"",$0); print $NF}')
now=$(date +%F_%T.mp4)
filename="$now"
filedir="$HOME/Videos/Screencasts"

mkdir -p "$filedir"

echo "active sink: $active"
echo "$filename"

notify_recording() {
    local state="$1"
    local app="Screen Recorder"
    local tag="screen-record"

    if [[ "$state" == "started" ]]; then
        notify-send \
            -a "$app" \
            -u low \
            -i "media-record" \
            "● Recording Started" \
            "Screen capture is now active" \
            -h string:x-dunst-stack-tag:$tag

    elif [[ "$state" == "stopped" ]]; then
        notify-send \
            -a "$app" \
            -u normal \
            -i "media-playback-stop" \
            "■ Recording Stopped" \
            "Screen capture saved" \
            -h string:x-dunst-stack-tag:$tag
    fi
}

if [ -z $(pgrep wf-recorder) ];
then notify_recording "started"
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
    notify_recording "stopped"
    while [ ! -z $(pgrep -x wf-recorder) ]; do wait; done
    pkill -RTMIN+8 waybar
    name="$(zenity --entry --text "Enter a filename")"
    old_name="$(ls -d "$filedir"/* -t | head -n1)"
    mv "$old_name" "$filedir/$name.mp4"
fi
