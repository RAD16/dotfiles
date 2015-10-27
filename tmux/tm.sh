#! /bin/bash

newide() 
{

tmux new-session -s $1 -d 

tmux new-window -t $1:1 -n 'code'
tmux new-window -t $1:2 -n 'bash'

# Create and size panes
tmux select-window -t $1:1
tmux split-window -v -p 20 -t $1
tmux select-pane -t 0
tmux split-window -h -p 30 -t $1
tmux select-pane -t 0

tmux attach -t $1
} 


tmenu () 
{

# export PATH=$PATH:/usr/local/bin

# startup a "default" session if non currently exists
# tmux has-session -t _default || tmux new-session -s _default -d

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S") "New IDE Session" "Blank Session")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
	case $opt in
		"New IDE Session")
			read -p "Enter new IDE name: " session_name
		  newide "$session_name"	
			#tmux new -s "$SESSION_NAME"
			break
			;;
		"Blank Session")
			read -p "Enter new session name: " session_name
			tmux new -s "$session_name"
			break;;
		*)
			tmux attach-session -t $opt
			break
			;;
	esac
done
}

# MAIN FUNCTION CALL 
main () 
{
# abort if we're already inside a TMUX session
# [ "$TMUX" == "" ] || exit 0

if [ $# -gt 0 ]; then 
	newide $1
else
	tmenu 
fi
}
main $1
# newide $1
#tmenu 

