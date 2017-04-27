#!/bin/sh

if [ -z "$HOSTNAME" ]; then
	if [ -n "$VIRTUAL_HOST" ]; then
		HOSTNAME="$VIRTUAL_HOST"
	fi
fi

if [ -z "$LOCATION" ]; then
	if [ -n "$VIRTUAL_HOST" ]; then
		LOCATION="https://$VIRTUAL_HOST/"
	else
		echo "No location set, exiting!" >&2
		exit 1
	fi
fi

exec /feedo/feedo.py --host="$HOSTNAME" --location="$LOCATION" --port=80 --plugins='/feedo/plugins'
