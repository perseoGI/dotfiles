if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f3 | cut -d"+" -f1); do
    polybar --reload --config=~/.config/polybar/config.ini $m &
  done
else
  polybar --reload --config=~/.config/polybar/config.ini 5120x1440 &
fi
