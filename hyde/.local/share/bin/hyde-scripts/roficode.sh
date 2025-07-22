
#!/bin/bash

# A basic script to detect keypresses in Rofi
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
RofiConf="${XDG_CONFIG_HOME:-$HOME/.config}/rofi/clipboard.rasi" # Can be changed later

cursor() {
    args=("$@")
    (nohup ~/Applications/Cursor.AppImage "${args[@]}" --ozone-platform-hint=wayland --disable-gpu --no-sandbox </dev/null >/dev/null 2>&1 &)
}

user_file="$(eval echo ${2})"

if [[ "$user_file" = /* ]]
then
  config_file="$user_file"
else
  cwd=$(dirname $0)
  config_file="${cwd}/${user_file}"
fi

json=$(cat ${config_file})

output=""

while IFS="|" read -r name command icon
do
  if [[ $name == "null" ]]; then
    continue
  fi        
  if [[ $icon == "null" ]]; then
    # icon="/home/patrix/.local/share/icons/Reversal-grey-dark/actions/16/format-text-code.svg"
    icon="/home/patrix/.local/share/icons/Tokyonight-Moon/actions/16/code-context.svg"
  fi      
#  echo -en "${name}\0icon\x1f${icon}\n"
   output+="${name}\0icon\x1f${icon}"
   output+=$'\n'

 done < <(echo $json | jq -cr '.[] | "\(.name)|\(.command)|\(.icon)"')

output=${output%$'\n'}
# Start rofi in dmenu mode with custom keybindings
choice=$(echo -e "$output" | rofi -i -dmenu -p "Keypress" -kb-custom-1 "Control-Delete" -config $RofiConf)

exit_code=$?
if [ $exit_code -eq 1 ]; then
  exit
elif [ $exit_code -eq 0 ]; then
  selected="$choice"
  task=$(echo $json | jq ".[] | select(.name == \"$selected\")")

  if [[ $task == "" ]]; then
    exit 1
  fi

  dir=$(echo $task | jq -j ".directory")

  if [[ $command == "null" ]]; then
    dir=$(echo $task | jq -j ".name")
  fi

  if [[ $1 == "code" ]]; then
    coproc bash -c "$1 --ozone-platform-hint=wayland --disable-gpu $dir"
  else
    coproc cursor $dir
  fi

  exit
elif [ $exit_code -eq 10 ]; then
  selected="$choice"
  echo $selected
  task=$(echo $json |  jq --arg selected "$selected" 'del(.[] | select(.name == $selected))')
  echo $task>'log.txt'
  echo $task > $user_file
  exit
else
  echo "Unknown key pressed!"
fi
