#!/bin/bash

# Define the correct password
password="supersecret"

# Log file for unauthorized access attempts
log_file="unauthorized_access.log"

# Function to log unauthorized access attempts
log_attempt() {
    echo "$(date): Unauthorized access attempt detected!" >> "$log_file"
}

# Main script
echo "Welcome to the secure terminal!"

read -s -p "Enter password: " user_input
echo

if [ "$user_input" != "$password" ]; then
    echo "Incorrect password! Access denied."
    log_attempt
    exit 1
fi

echo "Password accepted. Access granted."

sudo apt update
############################