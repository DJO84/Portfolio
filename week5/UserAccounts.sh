#!/bin/bash
#Displaying passwd file edited and in a viewable table With the addon of filtering listed users based on their default shell location
#David Olsen
#02/08/2021

#Use Awk to display the data in a table utilising different colours.
awk 'BEGIN {

    FS=":"
    print "___________________________________________________________________________________________________";
    print "| \033[34mUsername\033[0m         | \033[34mUserID\033[0m | \033[34mGroupID\033[0m | \033[34mHome\033[0m                                | \033[34mShell\033[0m                |";
    print "|__________________|________|_________|_____________________________________|______________________|"; #lining up the PIPES with above to complete tables look

}

{
    if($7 == "/bin/bash") #New addition to file to filter output to only users with /bin/bash listed as their default shell in coloumn $7
    printf("| \033[33m%-16s\033[0m | \033[35m%-6s\033[0m | \033[35m%-7s\033[0m | \033[35m%-35s\033[0m | \033[35m%-20s\033[0m |\n", $1, $3, $4, $6, $7);

}

END {

    print("|__________________|________|_________|_____________________________________|______________________|"); #lining up pipes to end final table look

}' /etc/passwd

exit 0
