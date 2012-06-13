#!/bin/bash

dir_count=0
file_count=0

recurse_dir() {
	local file_list=($(ls "$1" 2>/dev/null))
	local count=1
	for file in ${file_list[@]}; do
		for i in $(seq 1 $(($2-1))); do
			echo -n "    "
		done
		echo -n "$2 "
		echo $file
		if [ -d "$1/$file" ]; then
			(( ++dir_count ))
			recurse_dir "$1/$file" $(( $2 + 1 ))
		else
			(( ++file_count ))
		fi
		(( ++count ))
	done
}

print_dir() {
	echo "$1"
	recurse_dir "$1" 1
	echo
	if [ $dir_count -eq 1 ]; then
		echo -n "1 directory, "
	else
		echo -n "$dir_count directories, "
	fi
	if [ $file_count -eq 1 ]; then
		echo "1 file"
	else
		echo "$file_count files"
	fi
}

if [ $# -gt 1 ]; then
	echo "Error: Too many arguments."
	exit 1
fi		

if [ $# -eq 1 ]; then
	print_dir "$1"
else
	# Question: Does . need to be in quotes?
	print_dir .
fi
