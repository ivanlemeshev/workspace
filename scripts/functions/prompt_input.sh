#!/bin/bash

# Prompt the user for input with a message and optional default value.
function prompt_input() {
    if [[ -n "$2" ]]; then
        read -rp "$1 ($2): " input
    else
        read -rp "$1: " input
    fi
    [ -n "${input}" ] || input="$2"

    input="${input#"${input%%[![:space:]]*}"}" # Trim leading whitespace
    input="${input%"${input##*[![:space:]]}"}" # Trim trailing whitespace

    echo "${input}"
}
