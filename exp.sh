#!/bin/bash

answer=1
inc=1

echo -n "Enter base: "
read base
echo -n "Enter exponent: "
read exponent
echo -e "$base^$exponent = $(( $base**exponent ))\n"
#if [ $exponent == 0 ]; then
#   	echo "$base^$exponent = 1"
#else 
#	while [ $inc -le $exponent ]; do
#		answer=$(( $base*$answer ))
#		inc=$(( $inc+1 ))
#	done
#	echo "$base^$exponent = $answer"
#fi
#echo

# case: 4, 9, "4^9 = 262144"
# case: 2, 3, "2^3 = 8"
# case: 1234, 15, "1234^15 = 23427578159707888905981888711157141234541953024"
# case: 19, 3, "19^3 = 6859"
# case: 2, 10, "2^10 = 1024"
