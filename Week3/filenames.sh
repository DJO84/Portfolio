#!/bin/bash
#Check external file and display results
#David Olsen
#23/07/2021


#reading input
read -p "What is the name of the file: " Myfile

#Changing Internal Field seperator to an "enter"
IFS=$'\n'

#Start for loop, cat user entered filename and display corresponding result based on lines of txt
for i in $(cat < "$Myfile");
    do
    
        if [ -d "$i" ]; then
            echo "$i - That's a directory";
        else
        if [ -f "$i" ]; then
            echo "$i - That file exists";
        else 
            echo "$i - I dont know what that is";
        fi
        fi
    done
exit 0