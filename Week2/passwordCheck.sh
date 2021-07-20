#!/bin/bash
#Check that the password entered matches the saved HASH within a file
#David Olsen
#20/07/2021

read -sp "Please type your secret password: " PassName #Ask user for Password
echo

#Run User Entered Password through HASH and check file to return code
echo "$PassName" | sha256sum --status -c Passwords/Secret.txt

#Check return code and display appropriate message
if [[ $? -eq 0 ]]; then
    echo "Access Granted."
    exit 0
else 
    echo "Access Denied."
    exit 1
fi