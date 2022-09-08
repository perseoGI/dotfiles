if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f3 | cut -d"+" -f1); do
    polybar --reload $m &
  done
else
  polybar --reload  &
fi
