#!/bin/bash

function sighandler
{
	if [ $1 == "SIGUSR1" ]; then
		echo "I, process $$, received a $1 and will now stop."
		exit
	else
		echo "I, process $$, received a $1, but I'm still running!!!"
	fi
}

trap 'sighandler SIGHUP' 1
trap 'sighandler SIGINT' 2
trap 'sighandler SIGQUIT' 3
trap 'sighandler SIGABRT' 6
trap 'sighandler SIGKILL' 9
trap 'sighandler SIGUSR1' 10
trap 'sighandler SIGTERM' 15

while [ true ]; do
	:
done
