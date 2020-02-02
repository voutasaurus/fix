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

function home {
	local answer=''
	local action=''
    declare -a command
	stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/view
	while [ "$answer" == '' ]; do
		## TODO: add dynamic home
		stderr 'What do you do?'
		stderr ''
		if [ "$action" != '' ]; then
			stderr "Option selected ($action) not available, pick again."
		fi
		action=$(prompt)
		sentence=($action)
		verb=${sentence[0]}
	    case $verb in
	        b | B | bash | Bash ) answer='bash';;
	        f | F | fix | Fix ) answer='fix';;
	    esac
		nounphrase=$(echo $action | cut -d' ' -f2-)
		case $nounphrase in
			droid | 'small droid' ) noun='droid';;
			*) answer='';;
		esac
	done

	echo $answer
}

function homeresolve {
	local answer=$1
	if [ "$answer" == 'bash' ]; then
		soundbash &
	    sleep 1
		soundhurtdroid &
		stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/bash
	elif [ "$answer" == 'fix' ]; then
		soundrepair &
	    sleep 1
		soundhappydroid &
		stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/fix
	fi
	#stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/leave
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
	sleep 1
	stderr -n "."
	sleep 1
	stderr -n "."
	sleep 1
	stderr ""
}
