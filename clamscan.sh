#!/bin/bash
echo "Restarting and refreshing the database"
sudo systemctl stop clamav-freshclam    #stops the clamscan service
sudo freshclam				#updates the clam database
sudo systemctl start clamav-freshclam	#starts the clamscan service
echo 
echo
echo
echo "Do you want to scan now? y/n"
read answer
if [ $answer == "y" ]; then
	echo "Starting scan, sit tight this might take a while..."
	clamscan -r -i -v /		#runs the clamscan 
else
	echo "comeback and restart the script when you want to run the scan"
fi


