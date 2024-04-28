#!/bin/bash
echo -e "\n\t Device MAC Changer Script !\n"
echo -e "Checking is macchanger is installed or not."
sleep 1

if ! command -v macchanger &> /dev/null; then
    echo "macchanger is not installed. Installing..."

    sudo apt-get install macchanger

    if ! command -v macchanger &> /dev/null; then
        echo "Failed to install macchanger. Exiting."
        exit 1
    fi

    echo "macchanger installed successfully."
else
    echo "macchanger is already installed."
fi

sudo macchanger -e eth0 --random
echo -e "\vProcessing... 1st\n"
sleep 2

macchanger -e eth0 --random
echo -e "\vProcessing... 2nd\n"
sleep 2

macchanger -e eth0 --random
echo -e "\vProcessing... 3rd\n"
sleep 2

echo -e "\n\t Device MAC Changed !\n"