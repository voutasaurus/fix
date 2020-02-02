#!/bin/bash
set -e

function smalldroid {
	local answer=''
	local action=''
    declare -a command
	stderrcat room/80AC6D9C-A90F-4C19-82A8-E673A26099BF/view
	while [ "$answer" == '' ]; do
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
			droid | robot | 'small robot' | 'small droid' ) noun='droid';;
			*) answer='';;
		esac
	done
	echo $answer
}
function smalldroidresolve {
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
}

function meandroid {
	local answer=''
	local action=''
    declare -a command
    stderrcat room/78FB64EA-7E2C-49B4-B59A-3CCEA37427D1/view
	while [ "$answer" == '' ]; do
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
	        h | H | hack | Hack ) answer='hack';;
	    esac
		nounphrase=$(echo $action | cut -d' ' -f2-)
		case $nounphrase in
			droid | robot | 'mean robot' | 'mean droid' | 'mean looking droid' | 'mean looking robot' ) noun='droid';;
			*) answer='';;
		esac
	done
	echo $answer
}
function meandroidresolve {
	local answer=$1
	if [ "$answer" == 'bash' ]; then
		soundbash &
	    sleep 1
		soundhurtdroid &
		stderrcat room/78FB64EA-7E2C-49B4-B59A-3CCEA37427D1/bash
	elif [ "$answer" == 'hack' ]; then
		soundrepair &
	    sleep 1
		soundhappydroid &
		stderrcat room/78FB64EA-7E2C-49B4-B59A-3CCEA37427D1/hack
	fi
}

function shopdoor {
	local answer=''
	local action=''
    declare -a command
	if [ "$1" == '' ]; then
		stderrcat room/327EB2B7-E724-4025-8524-17659457CAC9/view
	else
		stderr 'The door is still locked.'
	fi
	while [ "$answer" == '' ]; do
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
			door | 'shop door' ) noun='door';;
			*) answer='';;
		esac
	done
	echo $answer
}
function shopdoorresolve {
	local answer=$1
	if [ "$answer" == 'bash' ]; then
		sounddoorbash &
	    sleep 0.5
		stderrcat room/327EB2B7-E724-4025-8524-17659457CAC9/bash
		echo 'notdone'
	elif [ "$answer" == 'fix' ]; then
		soundrepair &
	    sleep 1
		sounddooropen &
		stderrcat room/327EB2B7-E724-4025-8524-17659457CAC9/fix
		echo 'done'
	fi
}
