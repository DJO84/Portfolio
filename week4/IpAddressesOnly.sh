#!/bin/bash
#Using SED to input from a script and display different result
#David Olsen
#29/07/2021

#Using the variable to take the output of the script
Run1="$(./IpInfo.sh)"

#Printing to screen the output of IPInfo.sh only showing the lines that contain IP Address:
echo "$Run1" | sed -n '/IP Address:/p'