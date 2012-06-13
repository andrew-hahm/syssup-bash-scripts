#!/bin/bash

max_value=0
min_value=0

process_file() {
	while read value; do
		if [ -z $value ]; then
			continue
		fi
		max_value=$value
		min_value=$value
		break
	done < "$1"
	while read value; do
		if [ -z $value ]; then
			continue
		fi
		if [ $value -gt $max_value ]; then
			max_value=$value
		elif [ $value -lt $min_value ]; then
			min_value=$value
		fi
	done < "$1"
}

if [ $# -ne 1 ]; then
	echo "Usage: $(basename "$0") [file]"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "Error: Cannot find file '$1'."
	exit 1
fi

process_file $1
echo -e "Min value: $min_value\nMax value: $max_value"
