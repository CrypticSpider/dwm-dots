# You Can Insert Your Wallpaper And Path Here Like Follwing:
#feh --bg-scale /home/sdarker/Pictures/wallpapers/149.png &
# Set display scale for eDP1
#xrandr --output eDP1 --mode 1920x1080 --scale 0.8
setxkbmap -layout "us,ir" -option grp:alt_shift_toggle &
xautolock -time 10 -locker slock &
#llama-server -m /home/sdarker/Ai-Models/qwen2.5-coder-1.5b-q8_0.gguf --port 8012 &
exec dwm
