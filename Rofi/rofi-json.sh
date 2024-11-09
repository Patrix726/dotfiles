#!/bin/bash

user_file="$(eval echo ${1})"

if [[ "$user_file" = /* ]]
then
  config_file="$user_file"
else
  cwd=$(dirname $0)
  config_file="${cwd}/${user_file}"
fi

json=$(cat ${config_file})

if [ $# -eq 1 ]; then
  echo $json | jq -cr '.[] | "\(.name)|\(.command)|\(.icon)"' |
  while IFS="|" read -r name command icon
  do
    if [[ $name == "null" ]]; then
      continue
    fi        
    if [[ $icon == "null" ]]; then
      icon="~/.local/share/icons/Reversal-red-dark/apps/scalable/visual-studio-code.svg"
    fi      
    echo -en "${name}\0icon\x1f${icon}\n"
  done  
  exit 1
fi

if [ $# -eq 2 ]; then

  selected=$2
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

fi
