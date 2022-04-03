#! /bin/bash

#Obtaining userinput  (File to be checked, advertised checksum)
echo "Please enter choose the file whose integrity is to be checked (Provide fullpath like ~/Downloads/examplefile)"
read in_file
echo "Input Hash to check against"
read in_hash
echo "Choose the hashing algorithm:"
echo "1) Md5"
echo "2) SHA-1"
echo "3) SHA-256"
read selection

#calculate the hash based on the user's choice of hashing algorithm
case $selection in
	1)
		out_hash=$(md5sum $in_file | cut -d " " -f 1)
		;;
	2)
		out_hash=$(sha1sum $in_file | cut -d " " -f 1)
                ;;
	3)
		out_hash=$(sha256sum $in_file | cut -d " " -f 1)
                ;;
esac

#comparing the generated hash with the advertised hash
if [ $in_hash == $out_hash ]; then 
	echo "The file has not been altered. You are safe and you can proceed to do whatever you want with your file."
else
	echo "Houston we have a problem!!!"
	echo "The file seems to be compromised. I would get rid off/quarantine it immediately."
fi
