#! /usr/bin/bash

port="$1"
honeypot_pid=()
touch honeypot.log

# Handle SIGNI and kill created processes
function ctrl_c()
{
	#kill "$honeypot_pid"
#	wait
#	cleanup
#	exit 1
	echo -e "\nEncerrando o servidor..."
	for pid in "${honeypot_pid[@]}"; do
		kill -- -"$pid"
	done
	killall honeypot.sh
	exit 1
}

# Netcat server
server ()
{
	set -m
	while true; do
		( echo -e "^--------" $(date) "--------^\n\n" ; nc -vnlp $port < banner.txt) >>  honeypot.log 2>&1
	done &
	honeypot_pid+=($!)
	set +m
}

# Handles ctrl-c
trap ctrl_c INT

echo "Initializing server..."

ifconfig
server

# Show real time log
tail -f ./honeypot.log
