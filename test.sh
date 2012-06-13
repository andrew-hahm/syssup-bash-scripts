#!/bin/bash 
n=$1
echo $n 
function quit {
	exit
}  
function e {
	a=1
	echo $n
	echo $a $1 $2
} 
case "$n" in
	"asdf")
		echo "this passes!"
		;;
	"asdfj")
		echo "this passes, j!"
		;;
	"")
		echo "nothing?"
		;;
	*)
		echo "This also passes, i suppose"
		;;
esac
 
e Hello World
e World Hello
quit
echo foo 
