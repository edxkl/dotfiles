#!/usr/bin/env bash

# options
shutdown=" Desligar"
reboot=" Reiniciar"
logout=" Deslogar"
suspend="⏾ Suspender"

ENTRIES="$logout\n$suspend\n$reboot\n$shutdown"

CONFIG=$HOME/.config/sway/apps/wofi/power-menu/config-power
STYLE=$HOME/.config/sway/apps/wofi/power-menu/style-powermenu.css

selected=$(echo -e $ENTRIES | wofi --conf=$CONFIG --style=$STYLE | awk '{print tolower($2)}')

case $selected in
  deslogar)
    swaymsg exit
  ;;
  suspender)
    exec systemctl suspend
  ;;
  reiniciar)
    exec systemctl reboot
  ;;
  desligar)
    exec systemctl poweroff -i
  ;;
esac
