#!/bin/bash
#munu to call other scripts
#David Olsen
#20/07/2021

#call passwordCheck.sh script
./passwordCheck.sh 

#Check return code for result
if [ $? -eq 0 ]; then
    #If correct write to screen
    echo "Please choose from the following options: "
    echo "1. Create a Folder"
    echo "2. Copy a Folder"
    echo "3. Set a Password"
else
    #If wrong exit with goodbye
    echo "Goodbye"
    exit 0
fi

read UserOption

    echo " You have selected option: $UserOption" #Confirmation message of users slection

#Case statement that will start corresponding scripts based on users input.
case $UserOption in 
    1)
        ./foldermaker.sh
        ;;
    2)
        ./foldercopier.sh
        ;;
    3)
        ./setPassword.sh
        ;;
    *)
        echo "Not a correct option, please start again"
        ;;
esac
exit 0