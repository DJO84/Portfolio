#!/bin/bash
#Check that the password entered matches the saved HASH within a file
#David Olsen
#20/07/2021

echo -e "\e[1;31m"
read -sp "Please type your secret password:" PassName #Ask user for Password
echo -e "\e[0m"
echo

#Run User Entered Password through HASH and check file to return code
echo "$PassName" | sha256sum --status -c /home/student/scripts/portfolio/Week2/Passwords/Secret.txt

#Check return code and display appropriate message
if [[ $? -eq 0 ]]; then
    echo -e "\e[1;32m Access Granted. \e[0m"
    exit 0
else 
    echo -e "\e[1;31m Access Denied. \e[0m"
    exit 1
fi