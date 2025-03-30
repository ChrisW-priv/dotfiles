#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <program_name> [program_arguments...]"
    exit 1
fi

PROGRAM="$1"

if pgrep -x "$(basename "$PROGRAM")" > /dev/null
then
    echo "$PROGRAM is already running."
else
    "$PROGRAM" &
fi
