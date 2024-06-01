#!/bin/bash

# Function to display a progress bar
progress_bar() {
    local duration=$1
    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }
    
    for ((elapsed=1; elapsed<=$duration; elapsed+=1)); do
        clean_line
        already_done; remaining; percentage
        sleep 0.1
    done
    clean_line
    printf "\n"
}

# Display system information
echo "System Information:"
echo "-------------------"
echo "Hostname: $(hostname)"
echo "OS: $(uname -s)"
echo "Kernel Version: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo
echo "::::::::::::::::::::::::::::::::::::::::::"

# Setting up a simple Python HTTP server
echo "Setting up your local web server..."
progress_bar 30  # Progress bar for 3 seconds

# Starting the server
echo "Starting the server on http://localhost:8000"
python3 -m http.server 8000 &

# Displaying the server URL
echo "::::::::::::::::::::::::::::::::::::::::::"
echo "Server is running at http://localhost:8000"
echo "Press Ctrl+C to stop the server"

# Wait indefinitely to keep the script running
while :; do
    sleep 1
done
