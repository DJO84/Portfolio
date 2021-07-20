#!/bin/bash
#Creating a password that is Hashed to a file
#David Olsen
#20/07/2021

read -p "Please type a folder name: " folderName #Requesting user to input folder name
read -sp "Please enter password" PassName #Requesting password from user
mkdir "$folderName" 
echo $PassName | sha256sum > "$folderName/Secret.txt" #Saving hash password to user specified folder
echo
echo "Credentails saved securely"
exit 0