#!/bin/bash

bad_usage=0
no_flag=0

function error_message {
	echo "Usage: junk.sh [-hlp] [list of files]" 
	cat << EOCAT
	-h: Display help.
	-l: List junked files.
	-p: Purge all files.
	[list of files] with no other arguments to junk those files.
EOCAT
}

if [[ ! (-d ~/.junk) ]]; then
	mkdir ~/.junk
fi

if [ $# -eq 0 ]; then
	error_message
	exit 0
fi

if [[ $# -ge 2 && ! (-a $1) ]]; then
	echo "Error: Too many options enabled."
	error_message
	exit 1
fi

while getopts ":plh" Option
do
	case $Option in 
		p) rm -rf ~/.junk/*; no_flag=1;;
		l) ls -lF ~/.junk; no_flag=1;;
		h) error_message; no_flag=1;;
		?) printf "Error: Illegal option '-%s'.\n" $OPTARG >&2; bad_usage=1; no_flag=2;;
	esac
done

if [ $no_flag -eq 1 ]; then
	exit 0
fi

if [ $no_flag -eq 0 ]; then
	for filename in $@
	do
		mv $filename ~/.junk
	done
	exit 0
fi

if [ $bad_usage -eq 1 ]; then
	error_message
	exit 1
fi
