#!/bin/bash

#If there aren't two arguments to the script

echo "Please enter two numbers:"
read Num1
read Num2

#if [ $Numbers != 2 ]; then
#
#    #Print an error and exit
#    echo "Error, provide two numbers" && exit 1
#fi

#For every number between the first argument and the last

for ((i = $Num1; i <= $Num2; i++))

do
    #Create a new folder for that number
    echo "Creating directory number $i"
    mkdir "week $i"
done