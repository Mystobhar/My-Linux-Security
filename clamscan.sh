#!/bin/bash

#Clamscan is a cli AV for linux based systems. This AV's databases need to initialised before every scan which is automated down below.

green='\033[0;32m'
blue='\033[0;34m'
clear='\033[0m'

echo "Restarting and refreshing the database"
sudo systemctl stop clamav-freshclam    #stops the clamscan service
sudo freshclam				#updates the clam database
sudo systemctl start clamav-freshclam	#starts the clamscan service
echo 
echo -e "Which folder/file do you want to scan?    ${blue}e.g. ~/Desktop${clear}"
echo -e "${blue}TIP: Enter / if you want to scan the entire filesystem ${clear}"
read folder
echo
echo -e "${green}Do you want to scan now? ${clear}y/n"
read answer
if [ $answer == "y" ]; then
	echo "Starting scan, sit tight this might take a while..."
	clamscan -r -i -v $folder		#runs the clamscan 
else
	echo "comeback and restart the script when you want to run the scan"
fi


