#!/bin/bash

# Andrew Hahm, Matt Lotocki, Mark Mchedlishvili

inc=3
a=1
b=1
prev=0

echo -n "How many numbers? "
read num

if [ $num == 1 ]; then
   	echo -n "1"
elif [ $num == 2 ]; then
	echo -n "1 1"
elif [ $num -lt 1 ]; then
	echo -n " "
else
	echo -n "1 1 "
	while [ $inc -le $num ]; do
		let "c=a+b"
		if [ $prev -gt $c ]
		then
			echo
			echo -n "Cannot list all $num Fibonacci numbers."
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
