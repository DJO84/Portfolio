#!/bin/bash
#Creating a folder
#David Olsen
#20/07/2021

read -p "Type the name of the folder you would like to create: " folderName
mkdir "$folderName"
echo "You have chosen to create : $folderName"
exit 0