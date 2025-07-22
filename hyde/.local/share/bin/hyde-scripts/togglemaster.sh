#!/bin/bash
# Modified Jakoolit Script
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# for changing Hyprland Layouts (Master or Dwindle) on the fly

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
	hyprctl keyword unbind ALT,TAB

  notify-send -a "t1" -i "$HOME/.config/dunst/icons/hyprdots.png" "Dwindle layout mode"
	;;
"dwindle")
	hyprctl keyword general:layout master
	hyprctl keyword unbind ALT,TAB

	hyprctl keyword bind ALT,TAB,layoutmsg,rollnext

  notify-send -a "t1" -i "$HOME/.config/dunst/icons/hyprdots.png" "Master layout mode"
	;;
*) ;;

esac
