#!/bin/bash
#author: Tanmay Shah <tanmay@uw.edu> and Biodepot team

if [ -z $OUTPUTDIR ]; then
	OUTPUTDIR="/.cprofiles"
fi
if [ -z $DELTA ]; then
	DELTA=1000
fi

if [ ! -d "$OUTPUTDIR" ]; then
	${@}
	exit
fi

echo "Command is: ${@}"

if [ "$DELTA" -eq 0 ]
then
	rudataall.sh $VERBOSITY > "${OUTPUTDIR}/$(date '+%Y_%m_%d__%H_%M_%S').json"
	${@}
	rudataall.sh $VERBOSITY > "${OUTPUTDIR}/$(date '+%Y_%m_%d__%H_%M_%S').json"
else
	#run command goes in background
	${@} &
	#capture the pid of the run command
	rpid=$!
	#kill the runcmd if there is an error
	trap "kill -9 $rpid 2> /dev/null" EXIT
	while [ -n "$rpid" -a -e /proc/$rpid ]
	do
	
    	t1=$(date '+%s%3N')
    	rudataall.sh $VERBOSITY > "${OUTPUTDIR}/$(date '+%Y_%m_%d__%H_%M_%S').json" &
    	t2=$(date '+%s%3N')
    	let profile_time=$t2-$t1
    	let sleep_time=$DELTA-$profile_time
    	sleep_time=`echo $sleep_time / 1000 | bc -l`

    	#if $sleep_time is negative, will result in non-crashing error. Is it faster to let this error happen or to do a check to not sleep if negative?
    	sleep $sleep_time
	done
fi
#rudataall.sh > "${OUTPUTDIR}/$(date '+%Y_%m_%d__%H_%M_%S').json"
