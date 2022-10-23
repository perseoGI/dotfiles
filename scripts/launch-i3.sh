if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f3 | cut -d"+" -f1); do
    polybar 5120x1440 --reload $m --config=~/.config/polybar/config.ini &
  done
else
  polybar --reload --config=~/.config/polybar/config.ini &
fi
