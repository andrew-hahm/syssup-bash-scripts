#!/bin/bash
# Andrew Hahm

declare -a isset
base=
dir_count=0
file_count=0

base_name() {
	local name="${1##*/}"
	local opt="$2"
	[ -n "$opt" ] && name="${name%.$opt}"
	base="${name%$2}"
}

recurse_dir() {
	local num_files=$(ls -1 "$1" 2>/dev/null | wc -l)
	if [ $num_files -eq 0 ]; then
		return
	fi
	local count=1
	for file in "$1"/*; do
		base_name "$file"
		for (( i=1; i<$2; ++i )); do
			if [ ${isset[$i]} -ne 0 ]; then
				echo -n "|"
			else
				echo -n " "		
			fi	
			echo -n "    "
		done
		if [ $count -eq $num_files ]; then
			isset[$2]=0
			echo -n "└── "
		else
			isset[$2]=1
			echo -n "├── "
		fi

		echo -n "$2 "
		if [ -h "$file" ]; then
			echo "$base -> $(readlink "$file")"
			if [ -d $link_content ]; then
				(( ++dir_count ))
			else
				(( ++file_count ))
			fi
		elif [ -d "$1/$base" ]; then
			echo $base
			(( ++dir_count ))
			recurse_dir "$1/$base" $(( $2 + 1 ))
		else
			echo $base
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
