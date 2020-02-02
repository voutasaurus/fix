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

establishingshot

clear

act=$(smalldroid)

clear

smalldroidresolve $act

stderr -n 'Press enter to continue'
continueprompt

clear

act=$(meandroid)

clear

meandroidresolve $act

stderr -n 'Press enter to continue'
continueprompt

clear

endnotdead

backtoshell
