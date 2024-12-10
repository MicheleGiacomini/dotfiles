#!/bin/nu

let wallpaper = ls /home/michele/.config/hypr/wallpapers/ | shuffle | first | get name | path expand 

# notify-send "setting wallpaper" $"($wallpaper)"
# notify-send "command" $"swaybg -i ($wallpaper)"
swaybg -i $wallpaper
