#!/bin/bash
set -e

. dependencies.sh

act=$(menu)
if [ $act == 'q' ]; then
	echo 'goodbye!'
	exit
fi

act=$(home)

echo "you $act"

endnotdead

backtoshell
