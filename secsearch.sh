#!/bin/bash
#App to load from nd.nist.gov all latest vulnerabilities for a selected product
#David Olsen
#13/08/2021 (created)
#20/08/2021 (last modified)


# Display welcome banner when the script starts
clear
echo '+----------------------------------------------------------------------------+'
echo '|       Welcome to the...                                                    |'
echo '|                             Security Search Tool                           |'
echo '|                                                                            |'
echo '|       This tool will search for security information for the product       |'
echo '|       that you enter below. e.g. Windows 10, Exchange Server, Ubuntu       |'
echo '+----------------------------------------------------------------------------+'
echo
read -p ' Enter Product Name: ' searchterm
echo 
echo 
echo Thank you, searching $searchterm now, please wait...
echo 


# Query the website with the user's request (convert spaces to pluses per HTML standard)
# Users an agent query string from Chrome so that our requests are less likely to be blocked
url="https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=${searchterm// /+}&queryType=phrase&search_type=all&isCpeNameSearch=false"
agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36"
wget --no-check-certificate -U "$agent" -O "temp.html" "$url"  #hitting certificate errors so had to get around that

clear
echo
echo ' Search results have been downloaded... processing data now...' #display waiting message as data download can be slow
echo 

#process the html file into something more usable 
grep "data-testid" temp.html > temp.dat      #extract the relevant data table lines out of the html file
datastart=$(grep -Fn "vuln-results-table" < temp.dat | cut --delimiter=":" --fields=1)  #Finding the line number of where the actual data starts and removing the rest
sed -i -e "1,${datastart}d" temp.dat         #dump the irrelevant lines at the start of the file
python3 extract-fields.py > data.txt         #extract individual fields out of the raw data using a python script, and put them into a pipe delimited file
clear

#enter an infinite loop that will continue until the users decides they've had enough
while :
  do
    #display the table of records
    clear
    echo '[  Most recent vunerabilities of ' $searchterm '  ]'
    awk -F'|' '{printf("%4s %10s %14s %8s %s\n", $1, $2, $3, $4, substr($5, 1, 40)) }' < data.txt
    printf '\n'
    read -p 'Enter a line number for more info, [g] for graph, or [x] to exit> ' selection

    if [[ ${selection,,} = 'g' ]] #convert $selection to lower case before comparing in case user has caplock on
    then
      #User wants to display the graph/stats - clear the screen and display it until they press a key
      clear
      echo
      cat stats.txt
      read -p 'Press any key to continue: '

    elif [[ ${selection,,} = 'x' ]]
    then
      # User has decided to exit - clean up temp files and break out of the loop
      rm temp.html       #delete raw html file
      rm temp.dat        #delete grep'd "filtered" file
      rm stats.txt       #comment out row to keep the graph/stats file
      rm data.txt   	   #comment out row to keep the file of processed data
      break;

    else
      #User wants to display more information about one specific record
      sed -n "${selection}p" < data.txt > line.txt   #put the selected line into a temp file
      clear                                          #display it neatly (format with awk)
      printf '\n Full details:\n\n'
      printf '+-------------------+----------------+\n'
      awk -F'|' '{printf("| Date Reported:    | %14s |\n| Vulnerability ID: | %14s |\n| Severity:         | %14s |\n+-------------------+----------------+\n\nDescription:\n============\n%s\n", $3, $2, $4, $5)}' < line.txt
      printf '\n\n'
      rm line.txt                                    #clean up the temp file
      read -p 'Press any key to continue...'
    fi
  done

clear
exit 0