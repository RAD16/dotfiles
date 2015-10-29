#! /bin/bash

#======= TMUX bootstrap =========
# script launches tmux session menu
# when used with argument, it opens configured IDE session

#----- function: create a new IDE session ----- 
newide() 
{
			tmux new-session -s $1 -d 
			tmux new-window -t $1:1 -n 'code' -c ~/buildd/
			tmux new-window -t $1:2 -n 'bash' -c ~/buildd/
			tmux new-window -t $1:3 -n 'NOTES' -c ~/buildd/
			tmux select-window -t $1:1 # Create and size panes
			tmux split-window -v -p 20 -t $1
			tmux select-pane -t 0
			tmux split-window -h -p 30 -t $1
			tmux select-pane -t 0
			tmux attach -t $1
			tmux a -t "$1"
} 

#------- function: Menu for new session options ------
tmenu () 
{
#startup a "default" session if non currently exists
#tmux has-session -t _default || tmux new-session -s _default -d

# menu 
	PS3="Pick a session: "
	options=($(tmux list-sessions -F "#S") "NEW (IDE)" "OPEN")
	echo " "
	echo "TMUX Sessions"
	echo "------------------"
	select opt in "${options[@]}"
	do
		case $opt in
			"NEW (IDE)")
				read -p "Enter new IDE name: " session_name
				newide "$session_name"	
				break
				;;
			"OPEN")
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

# MAIN describe 
main () 
{
# abort if already inside a TMUX session
	[ "$TMUX" == "" ] || {
		echo "Already in tmux session -- exiting" 
		exit 0
	}

	if [ $# -eq 1 ]; then 
		`tmux has -t "$1"` 
		if [ $? -eq 1 ]; then
		  newide $1 # New IDE session
		else
			`tmux a -t "$1"`
		fi
	else
		tmenu  # Menu for creating new session 
	fi
}

# MAIN CALL 
 main $1
