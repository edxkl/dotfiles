#!/usr/bin/env bash

## Author : Aditya Shakya - @adi1090x

dir="~/.config/awesome/core/misc/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" 󰐥 Desligar"
reboot=" 󰑓 Reiniciar"
lock="  Bloquear"
suspend="  Hibernar"
logout=" 󰍃 Deslogar"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"
chosen="$(echo -e "$options" | $rofi_command -p "Atividade: $uptime" -dmenu -selected-row 0)"

case $chosen in
    $shutdown)
        systemctl poweroff
    ;;
    $reboot)
        systemctl reboot
    ;;
    $lock)
        if [[ -f /usr/bin/i3lock ]]; then
            i3lock
        elif [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l
        fi
    ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
    ;;
    $logout)
        if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
            openbox --exit
        elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
            bspc quit
        elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
            i3-msg exit
        elif [[ "$DESKTOP_SESSION" == "awesome" ]]; then
            echo -E "awesome.quit()" | awesome-client
        fi
    ;;
esac
