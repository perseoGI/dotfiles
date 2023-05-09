kill -9 $(pgrep polybar)

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f3 | cut -d"+" -f1); do
    polybar $m --reload --config=~/.config/polybar/config.ini &
  done
else
  polybar 5120x1440 --reload --config=~/.config/polybar/config.ini &
fi
