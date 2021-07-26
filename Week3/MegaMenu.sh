#!/bin/bash
#mega munu to call additional scripts from week 3
#David Olsen
#26/07/2021

#call passwordCheck.sh script with full path due to being saved in different directories
/home/student/scripts/portfolio/Week2/passwordCheck.sh

result=$?

#Start loop so that user must select Exit to quit.
while :;
do
    #Check error record that was retured from passwordCheck.sh
    if [ $result -eq 1 ]; then
    break;
    else 
        #If correct write to screen
        echo -e "\e[1;36mPlease choose from the following options: \e[0m"
        echo -e "\e[1;34m1. Create a Folder"
        echo "2. Copy a Folder"
        echo "3. Set a Password"
        echo "4. Calcuator"
        echo "5. Create Week Folders"
        echo "6. Check Filenames"
        echo -e "7. Download a File \e[0m"
        echo -e "\e[1;32m8. Exit \e[0m" 
    fi

    read UserOption
    echo "You have selected option: $UserOption" #Confirmation message of users slection

    #Case statement that will start corresponding scripts based on users input.
    case $UserOption in 
        1)
            /home/student/scripts/portfolio/Week2/foldermaker.sh
            ;;
        2)
            /home/student/scripts/portfolio/Week2/foldercopier.sh
            ;;
        3)
            /home/student/scripts/portfolio/Week2/setPassword.sh
            ;;
        4)
            /home/student/scripts/portfolio/Week3/calc.sh
            ;;
        5)
            /home/student/scripts/portfolio/Week3/megafoldermaker.sh
            ;;
        6)
            /home/student/scripts/portfolio/Week3/filenames.sh
            ;;
        7)
            /home/student/scripts/portfolio/Week3/InternetDownloader.sh
            ;;
        8)
            exit 0
            ;;
        *)
            echo "Not a correct option, Please try again"
            ;;
    esac
done

