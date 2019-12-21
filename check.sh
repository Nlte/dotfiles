#!/usr/bin/env bash

doexit=false

req="requirements.txt"
while IFS= read -r binary
do
    if ! [ -x "$(command -v $binary)" ]; then
        echo "Error: $binary is not installed." >&2
        doexit=true
    fi
done < "$req"

if $doexit; then
    exit 1
fi
