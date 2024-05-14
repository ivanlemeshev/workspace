#!/bin/sh

set -e

# Use the configured user if the container has been configured already.
if [ -e /var/run/configured ]; then
  exec sh -c "su - $(head -1 /var/run/configured_user)"
fi

prompt_input() {
    if [ -n $2 ]; then
        read -p "$1 ($2): " input
    else
        read -p "$1: " input
    fi
    [ -n "${input}" ] || input="$2"

    input="${input#"${input%%[![:space:]]*}"}" # Trim leading whitespace
    input="${input%"${input##*[![:space:]]}"}" # Trim trailing whitespace

    echo "${input}"
}

# Ask the user information for the configuration on the first run.
username=$(prompt_input "What username do you want to use?" "user")
userid=$(prompt_input "What user ID do you want to use?" "1001")
group=$(prompt_input "What group name do you want to use?" "${username}")
groupid=$(prompt_input "What group ID do you want to use?" "1001")
home_directory=$(prompt_input "What user home directory do you want to use?" "/home/${username}")

# `-g` sets the group ID for the new group.
groupadd -g "${groupid}" "${group}"

# `-m` tells useradd to create the home directory if it doesn't exist.
# `-s` sets the user's login shell.
# `-d` sets the user's home directory.
# `-u` sets the user's UID.
# `-g` sets the user's primary group ID.
useradd -m -s "/bin/bash" -d "${home_directory}" -u "${userid}" -g "${groupid}" "${username}"

# The user can run any command as any user without being asked for a password.
echo "${username} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /home/"${username}"/code/github.com
cd /home/"${username}"/code/github.com
git clone https://github.com/ivanlemeshev/dot.git
cd -

# Change the owner and group of the files or directories at the home directory
# recursively.
chown -R "${username}:${group}" "${home_directory}"

# This file is created to indicate that the container has been configured.
touch /var/run/configured

# Save the configured useusernamer to a file to use it in the next run.
echo "${username}" > /var/run/configured_user


# The su command is used to switch users, and the - option tells su to make the
# environment the same as if the new user had logged in directly.
exec su - "${username}"
