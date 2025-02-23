#!/bin/bash
# Author: Enoch Gyampoh
# Created on: 30/08/2023
# Descriptiion:  Create a bash script that creates a new ubuntu user. The
# script should accept name, group name and password of the
# new user and use it to create an account for the user.

# Prompt for user details
read -p "Enter the new user's name: " new_username
read -p "Enter the group name (existing or new): " new_groupname
read -sp "Enter the password for $new_username: " new_password
echo  # Move to a new line after password input

# Check if the group exists, or create a new one
if grep -qE "^$new_groupname:" /etc/group; then
    echo "Using existing group: $new_groupname"
else
    sudo groupadd "$new_groupname"
    echo "Created new group: $new_groupname"
fi

# Create the new user account
sudo useradd -m -g "$new_groupname" "$new_username"
echo "$new_username user created."

# Set the password for the new user
echo "$new_username:$new_password" | sudo chpasswd

echo "User '$new_username' created with password '$new_password'."
