#!/usr/bin/env bash
selected=`cat ~/scripts/tmux-cht-languages ~/scripts/tmux-cht-command | fzf`
read -p "Enter Query: " query

if grep -qs "$selected" ~/scripts/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
