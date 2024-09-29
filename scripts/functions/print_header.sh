#!/bin/bash

# Print a header with a title centered in the middle of the header box with
# a width of 80 characters and a border of '═' characters.
function print_header() {
    local title="$*"
    local width=80
    local padding=$((width - 2 - ${#title}))

    echo -n "╔"
    for ((i = 0; i < width - 2; i++)); do
        echo -n "═"
    done
    echo "╗"

    echo -n "║ $title"
    for ((i = 0; i < padding - 1; i++)); do
        echo -n " "
    done
    echo "║"

    echo -n "╚"
    for ((i = 0; i < width - 2; i++)); do
        echo -n "═"
    done
    echo "╝"
}
