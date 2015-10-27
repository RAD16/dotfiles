#! /bin/bash
#======= TMUX bootstrap =========
#----- function: create a new IDE session ----- 
newide() 
{
tmux new-session -s $1 -d 

tmux new-window -t $1:0 -n 'code' -c ~/buildd/
tmux new-window -t $1:1 -n 'bash' -c ~/buildd/

# Create and size panes
tmux select-window -t $1:0
tmux split-window -v -p 20 -t $1
tmux select-pane -t 0
tmux split-window -h -p 30 -t $1
tmux select-pane -t 0

tmux attach -t $1
} 

#------- function: Menu for new session options ------
tmenu () 
{
echo "menu jesus"
#export PATH=$PATH:/usr/local/bin
#startup a "default" session if non currently exists
#tmux has-session -t _default || tmux new-session -s _default -d

# menu 
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

# MAIN describe 
main () 
{
# abort if we're already inside a TMUX session
	[ "$TMUX" == "" ] || {
		echo "Already in tmux session -- exiting" 
		exit 0
	}

	if [ $# -gt 0 ]; then 
		newide $1 # New IDE session
	else
		tmenu  # Menu for creating new session 
	fi
}

# MAIN CALL 
main $1
echo "my jesus!!!"
