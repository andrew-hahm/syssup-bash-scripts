#!/bin/bash

input=$1
num=$2

function triangular {
	incr=1
	x=0
	top=$1

	if [ $top -lt 1 ]; then
	   	echo -n " "
	else
		while [ $incr -le $top ]; do
			let "x=incr+x"
			echo -n "$x "
			let "incr=incr+1"
		done
	fi
	echo
}

function fibonacci_lucas {
	inc=3
	limit=$1
	a=$2
	b=1
	type_string=$3
	prev=0

	if [ $limit == 1 ]; then
	   	echo -n $a
	elif [ $limit == 2 ]; then
		echo -n "$a 1"
	elif [ $limit -lt 1 ]; then
		echo -n " "
	else
		echo -n "$a 1 "
		while [ $inc -le $limit ]; do
			let "c=a+b"
			if [ $prev -gt $c ]
			then
				echo
				echo -n "Cannot list all $limit $type_string numbers."
				break
			fi
			a=$b
			b=$c
			let "inc += 1"
			echo -n $c
			echo -n " "
			prev=$c
		done
	fi
	echo
}

function fibonacci {
	fibonacci_lucas $1 1 "Fibonacci"
}

function lucas {
	fibonacci_lucas $1 2 "Lucas"
}

case $input in 
	"")
		echo "Usage: ./sequence.sh <sequence type> <num elements>"
		;;
	"fib")
		fibonacci $num
		;;
	"luc")
		lucas $num
		;;
	"tri")
		triangular $num
		;;
	*)
		echo "Error: Unrecognized sequence type 'bad'."
		;;
esac
