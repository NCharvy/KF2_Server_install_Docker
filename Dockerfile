FROM 	debian:9
USER 	root

#Install all packages | Updates
RUN 	apt-get update && apt-get upgrade -y
RUN 	apt-get install lib32gcc1 wget tar vim -y

#Setup install Dir
RUN 	mkdir /steam
WORKDIR /steam 

COPY install_kf2_server.script ./kf2.script
#Getting steamcmd && running steamCMD

RUN 	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    	tar -xvzf steamcmd_linux.tar.gz && \
    	rm steamcmd_linux.tar.gz && \
	chmod +x steamcmd.sh

RUN	./steamcmd.sh +runscript kf2.script
