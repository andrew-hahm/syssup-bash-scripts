#!/bin/bash

function compute_sum {
	local x=$1
	local total=0
	if [ $x -ge $2 ]; then
		echo 0
	else
		while [ $x -le $2 ]; do
			total=$(( $x+$total ))
			x=$(( $x+1 ))
		done
		echo $total
	fi
}

case $3 in
	"")
		case $2 in
			"")
				echo "Usage: ./sum.sh [lower bound] [upper bound]"
				;;
			*)
				echo "sum[$1..$2] = $(compute_sum $1 $2)"
				;;
		esac
		;;
	*)
		echo "Usage: $_ [lower bound] [upper bound]"
		;;
esac
