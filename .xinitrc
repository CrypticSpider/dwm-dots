# ~/Programing/sh/helpful/Unmute-Audio.sh &
# Add Your Picture Path Here
# feh --bg-scale /home/sdarker/Pictures/wallpapers/149.png &
# Set display scale for eDP1
#xrandr --output eDP1 --mode 1920x1080 --scale 0.8
# You Can Set Keyboard Laygout Like This:
# setxkbmap -layout "us,ir" -option grp:alt_shift_toggle &
xautolock -time 10 -locker slock &
# buckle 2/dev/null &
# llama-server -m /home/sdarker/Ai-Models/qwen2.5-coder-1.5b-q8_0.gguf --port 8012 &
# exec dwm
# pactl set-sink-mute @DEFAULT_SINK@ 0
# pipewire &  
# wireplumber &  
exec dbus-launch --exit-with-session dwm
