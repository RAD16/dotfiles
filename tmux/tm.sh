#! /bin/bash

#---- tmux IDE bootstrap -----

tmux new-session -d -s $1

tmux new-window -t $1:1 -n 'code'
tmux new-window -t $1:2 -n 'bash'
tmux new-window -t $1:3 -n 'bash'

# Create and size panes
tmux select-window -t $1:1
tmux split-window -v -p 10 -t $1
tmux select-pane -t 0
tmux split-window -h -p 30 -t $1
tmux select-pane -t 0

tmux attach -t ide

