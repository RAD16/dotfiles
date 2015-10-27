#! /bin/bash

#---- tmux IDE bootstrap -----

tmux new-session -d -s $1

tmux new-window -t $1:1 -n 'code'
tmux new-window -t $1:2 -n 'bash'
tmux new-window -t $1:3 -n 'bash'

tmux select-window -t $1:1
tmux attach -t ide

