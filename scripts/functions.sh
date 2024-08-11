#!/bin/bash

function print_header() {
    local title="$*"
    local width=80
    local padding=$((width - 2 - ${#title}))

    echo -n "╔"
    for ((i=0; i<width-2; i++)); do
        echo -n "═"
    done
    echo "╗"

    echo -n "║ $title"
    for ((i=0; i<padding-1; i++)); do
        echo -n " "
    done
    echo "║"

    echo -n "╚"
    for ((i=0; i<width-2; i++)); do
        echo -n "═"
    done
    echo "╝"
}

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
