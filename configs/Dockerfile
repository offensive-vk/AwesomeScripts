# Using Kali as base image.
FROM kalilinux/kali-rolling:amd64

# Update Everything.
RUN apt update && apt upgrade -y
	
# Neccessary system tools
RUN apt install -y \
	nano \
	wget \
	curl \
	unzip \
	tar \
	net-tools \
	btop \
	toilet \
	lolcat \
	neofetch \
	git \
	w3m \ 
	sudo  
	
RUN curl https://raw.githubusercontent.com/offensive-vk/AwesomeScripts/master/shell/install.sh -o install.sh
RUN	chmod +x install.sh 

# Advanced Tools.
RUN apt install -y \
	nmap \
	wireshark \
	tshark \
	netsniff-ng \
	hping3 \
	sqlmap \
	whatweb \
	iftop \
	ping \
	netcat \
	tor \
	cmatrix \
	whois \
	speedtest-cli

# Startup shell
ENTRYPOINT ["/bin/bash"]
	
# Put on some trademarks lol.
LABEL date="May, 2024 19:10:00PM IST"
LABEL description="Personalized Kali Linux Docker Image for Instant Operations."
LABEL maintainer="Vedansh <superuser.ntsystems@outlook.com>"