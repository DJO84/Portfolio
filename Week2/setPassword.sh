#!/bin/bash
read -p "Please type a folder name: " folderName #getting user to input folder name
read -sp "Please enter password" PassName #getting password from user
mkdir "$folderName" 
echo $PassName | sha256sum > "$folderName/Secret.txt" #Saving password to user specified folder
echo
echo "Credentails saved securely"
exit 0