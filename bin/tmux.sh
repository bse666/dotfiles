#!/bin/sh

# variables for the script
mpdhost="127.0.0.1"

## do not edit here
name=`uname -n`
tmux has-session -t $name 2>/dev/null
if [ "$?" -eq 1 ] ; then
		tmux start-server
		tmux new-session -d -s $name
		tmux new-window -k -t$name:1 -n 'local'
		tmux new-window -k -t$name:2 -n 'remotes'
		tmux new-window -k -t$name:3 -n 'files'
		tmux new-window -k -t$name:4 -n 'notes'
		tmux new-window -k -t$name:5 -n 'music'
		tmux new-window -k -t$name:6 -n 'mails'
		tmux kill-window -t $name:0

		tmux send-keys -t$name:1 'cd ~/Downloads;clear' C-m
		tmux send-keys -t$name:2 'ssh freenas -t "tmux a||tmux"' C-m
		tmux send-keys -t$name:3 'ranger' C-m
		tmux send-keys -t$name:4 "vim $HOME/notes/notes.txt" C-m
		tmux send-keys -t$name:5 "ncmpcpp -h $mpdhost" C-m
		tmux send-keys -t$name:6 'alpine' C-m
		tmux select-window -t$name:1
else
		echo "Session found. Connecting."
fi
tmux attach-session -t $name
