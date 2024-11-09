
#!/bin/bash

# A basic script to detect keypresses in Rofi

user_file="$(eval echo ${1})"

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
    icon="~/.local/share/icons/Reversal-red-dark/apps/scalable/visual-studio-code.svg"
  fi      
#  echo -en "${name}\0icon\x1f${icon}\n"
   output+="${name}\0icon\x1f${icon}"
   output+=$'\n'

 done < <(echo $json | jq -cr '.[] | "\(.name)|\(.command)|\(.icon)"')

output=${output%$'\n'}
# Start rofi in dmenu mode with custom keybindings
choice=$(echo -e "$output" | rofi -dmenu -p "Keypress" -kb-custom-1 "Control-Delete")
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

  coproc bash -c "code $dir"
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
