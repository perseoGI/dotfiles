#!/usr/bin/env bash
selected=`cat ~/.config/dotpyle/scripts/tmux-cht-languages ~/.config/dotpyle/scripts/tmux-cht-command | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/dotpyle/scripts/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
