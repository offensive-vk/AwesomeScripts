#!/bin/bash

# Special Script For Installing Necessary Tools of Mine.
echo -e "\n:::::::::::::::::::::::::::::::::::::\n"
echo -e "\n\t Welcome To Custom Install Script ! \t\n"
echo -e "\n\t By @offensive-vk (Vedansh) \n"
echo -e "\n\t Source: https://github.com/offensive-vk/AwesomeScripts/blob/master/shell/install.sh \t\n"
echo -e "\n:::::::::::::::::::::::::::::::::::::\n"
sleep 2

# Update and upgrade installed packages.
# sudo apt update && sudo apt upgrade -y

# Function to install basic tools
install_basic_tools() {
    for tool in "${basic_tools[@]}"; do
        echo "Installing $tool..."
        sudo apt install $tool
    done
}

# Function to install advanced tools
install_advanced_tools() {
    for tool in "${advanced_tools[@]}"; do
        echo "Installing $tool..."
        sudo apt install $tool
    done
}

# Function to install additional tools
install_additional_tools() {
    for tool in "${additional_tools[@]}"; do
        echo "Installing $tool..."
        sudo apt install $tool
    done
}

# Function to install networking tools
install_networking_tools() {
    for tool in "${networking_tools[@]}"; do
        echo "Installing $tool..."
        sudo apt install $tool
    done
}

# Function to install developer stuff
install_dev_stuff() {
    for tool in "${dev_stuff[@]}"; do
        echo "Installing $tool..."
        sudo apt install $tool
    done
}
# List of basic tools
basic_tools=(
    "curl"
    "wget"
    "git"
    "unzip"
    "jq"
    "net-tools"
    "toilet"
    "figlet"
    "tar"
    "btop"
    "nano"
)
# List of advanced tools
advanced_tools=(
    "htop"
    "neofetch"
    "curl"
    "git"
    "whois"
    "speedtest-cli"
    "tor"
    "nikto"
    "wpscan"
    "gobuster"
    "sublist3r"
    "searchsploit"
    "ptunnel"
    "amass"
)
# List of additional tools
additional_tools=(
    "exiftool"
    "cmatrix"
    "espeak"
    "asciiquarium"
    "micro"
    "hollywood"
    "btop"
    "tmux"
    "w3m"
)
# dev stuff
dev_stuff=(
    "python3"
    "pip"
    "php"
    "nodejs"
    "docker"
    "npm"
    "bun"
    "vscodium"
    "typescript"
    "ts-node"
)
# networking tools
networking_tools=(
    "nmap"
    "net-tools"
    "netcat"
    "airmon-ng"
    "wireshark"
    "tcpdump"
    "tshark"
    "iftop"
    "hping3"
    "masscan"
    "whatweb"
)
# Main menu
echo -e "\n:::::::::::::::::::::::::::::::::::::\n"
echo -e "\t Select category of tools to install:"
echo -e "\t 0. Exit (Ctrl + C Anytime)"
echo -e "\t 1. Basic Tools"
echo -e "\t 2. Advanced Tools"
echo -e "\t 3. Additional Tools"
echo -e "\t 4. Networking Tools"
echo -e "\t 5. Developer's Stuff"
echo -e "\n:::::::::::::::::::::::::::::::::::::\n"
read -p "What do you want ? (0-5) : " choice
sleep 3
case "$choice" in
    1)
        install_basic_tools
        ;;
    2)
        install_advanced_tools
        ;;
    3)
        install_additional_tools
        ;;
    4)
        install_networking_tools
        ;;
    5)
        install_dev_stuff
        ;;
    0)
        sleep 1
        echo "Exiting installation process."
        exit 0
        ;;
    *)
        sleep 1
        echo "Invalid choice. Exiting installation process."
        exit 1
        ;;
esac