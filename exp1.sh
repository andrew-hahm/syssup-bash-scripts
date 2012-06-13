#!/bin/bash

function exp {
	local base=$1
	local exponent=$2
	local result=$(( $base**$exponent ))
	echo $result
}

echo -n "Enter base: "
read a
echo -n "Enter exponent: "
read b

printout=$(exp $a $b)

echo -e "$a^$b = $printout\n"

# declare -i return_value
# function power {
#	return_value=$(( $1**$2 ))
# }
# power 3 7
# echo "$return_value"

# sum of numbers between lower and upper bound
# function return type command line arguments
