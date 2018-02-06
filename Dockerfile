FROM 	debian:9

#Setup port for Killing floor server 
EXPOSE 	7777/udp 27015/udp 8080/tcp 20650/udp

#Install all packages | Updates
RUN 	apt-get update && apt-get upgrade -y
RUN 	apt-get install lib32gcc1 wget tar vim -y

#Setup install Dir
RUN 	mkdir /home/steam
WORKDIR /home/steam 

#Getting steamcmd && running steamCMD
RUN 	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    	tar -xvzf steamcmd_linux.tar.gz && \
    	rm steamcmd_linux.tar.gz && \
	chmod +x steamcmd.sh && \
	./steamcmd.sh +login anonymous +force_install_dir ./kf2_server +app_update 232130 +exit
