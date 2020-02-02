#!/bin/bash
set -e

function stderr {
	>&2 echo $@
} 

function stderrcat {
	>&2 cat $@
}

function rawprompt {
	>&2 printf "> "
}

function prompt {
	rawprompt
	read input
	echo "$input"
}

function continueprompt {
	read input
	echo "$input"
}

function menu {
	local answer=''
	local action=''
	while [ "$answer" == '' ]; do
		stderrcat room/A83749A5-B563-4883-B4B0-65601FF04D9D/view
		if [ "$action" != '' ]; then
			stderr "Option selected ($action) not available, pick again."
		fi
		action=$(prompt)
	    case $action in
	        p | P | play | Play ) answer='p';;
	        q | Q | quit | Quit ) answer='q';;
	    esac
	done
	echo $answer
}

function dramaticellipsis {
	for n in $(seq $1); do
	  stderr -n "."
	  sleep 1
	done
	stderr ""
}

function establishingshot {
	stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/set
	dramaticellipsis $1
	stderr ""
}

function soundrepair {
	afplay sound/robot-repair.wav
}

function soundhappydroid {
	afplay sound/robot-happy.wav
}

function soundbash {
	afplay sound/robot-hit.wav
}

function sounddoorbash {
	afplay sound/door-bash.wav
}

function sounddooropen {
	afplay sound/door-open.wav
}

function soundhurtdroid {
	afplay sound/robot-hurt.wav
}

function endnotdead {
	stderr ""
	stderr "!!! CONGRATULATIONS YOU ARE NOT DEAD !!!"
}

function backtoshell {
	stderr ""
	stderr "GAME OVER"
	stderr ""
	stderr -n "returning to terminal shell in 3 seconds."
    dramaticellipsis 3
	stderr ""
}
