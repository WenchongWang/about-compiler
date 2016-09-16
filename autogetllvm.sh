#!/bin/sh
if [ -f /usr/bin/git ]; then
	echo "founding git"
else
	echo "installing git"
	sudo apt-get install git
fi 
