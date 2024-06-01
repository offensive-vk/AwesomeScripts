#!/bin/bash
generate_password() {
    local length="$1"
    local password=""
    local characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+{}[]|;:,.<>?~"

    for i in $(seq 1 "$length"); do
        random_index=$(($RANDOM % ${#characters}))
        password="${password}${characters:$random_index:1}"
    done

    echo "$password"
}

# Main script
echo "Welcome to the random password generator!"
read -p "Enter the length of the password: " password_length

if [[ ! $password_length =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

echo "Generating password..."
password=$(generate_password "$password_length")
echo "Your random password is: $password"
