#!/bin/bash
set -e

. dependencies.sh
. rooms.sh

uptime=12
if [ $1 == "-d" ]; then
	uptime=0
fi

clear
act=$(menu)
if [ $act == 'q' ]; then
	echo 'goodbye!'
	exit
fi
clear
establishingshot $uptime

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

isdone=''
while [ "$isdone" != 'done' ]; do
	clear
	act=$(shopdoor $isdone)
	clear
	isdone=$(shopdoorresolve $act)
	stderr -n 'Press enter to continue'
	continueprompt
done

isdone=''
while [ "$isdone" != 'done' ]; do
	clear
	act=$(hallway $isdone)
	clear
	isdone=$(hallwayresolve $act)
	stderr -n 'Press enter to continue'
	continueprompt
done

clear
endnotdead
backtoshell
