#!/bin/bash

link_count=0

recurse_dir() {
	for file in "$1"/*; do
		if [ -h "$file" ]; then
			echo "$file -> $(readlink "$file")"
			(( ++link_count ))
		elif [ -d "$file" ]; then
			recurse_dir "$file"
		fi
	done
}

print_dir() {
	recurse_dir "$1"
	echo
	if [ $link_count -eq 1 ]; then
		echo "1 symlink found."
	else
		echo "$link_count symlinks found."
	fi
}

if [ $# -gt 1 ]; then
	echo "Error: Too many arguments."
	exit 1
fi		

if [ $# -eq 1 ]; then
	print_dir "$1"
else
	print_dir .
fi
