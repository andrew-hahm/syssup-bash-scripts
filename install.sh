#!/bin/bash

function do_install {
	sudo cp $1 $2
	cd $2
	sudo chown root $1
	sudo chown :root $1
	sudo chmod 755 $1
	cd ~
	echo "Installation complete."
}

if [ $# -eq 2 ]; then
	if [[ ! (-a $1) ]]; then
		echo "Error: Source file '$1' does not exist."
		exit 1
	elif [[ ! (-d $2) ]]; then
		echo "Error: Target directory '$2' does not exist."
		exit 1
	else
		cd $2
		if [[ -a $1 ]]; then
			echo -n "$2/$1 exists. Overwrite (Y/N)? "
			read answer
			case $answer in
				"Y")
					sudo rm $1
					cd ~
					do_install $1 $2
					;;
				"y")
					sudo rm $1
					cd ~
					do_install $1 $2
					;;
				"N")
					echo "No changes made. Exiting."
					cd ~
					;;
				"n")
					echo "No changes made. Exiting."
					cd ~
					;;
			esac
		else
			cd ~
			do_install $1 $2
			exit 0
		fi
	fi
else
	echo "Usage: ./install.sh [source file] [target directory]"
fi
