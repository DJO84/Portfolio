#!/bin/bash
#Download from website and loop until user enters exit
#David Olsen
#26/07/2021

#Start the loop to look for website name
while :;
do
    read -p "Please type the URL of the file you would like to download or type 'exit' to quit " url
    #Start logic looking if user enters "exit" and if so exits app
    if [ "$url" == "exit" ]; then
    break;
    fi

#ask for folder where user wants to save within working directory path
read -p "input the directory where you wish to save: " directory

#download link and save to user specified location
wget -P $directory $url

done

