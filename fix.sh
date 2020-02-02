#!/bin/bash
set -e

. dependencies.sh

clear

act=$(menu)
if [ $act == 'q' ]; then
	echo 'goodbye!'
	exit
fi

clear

act=$(home)

clear

homeresolve $act

#echo "you $act"

endnotdead

backtoshell
