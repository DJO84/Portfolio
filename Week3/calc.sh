#!/bin/bash

#Blue= echo -e "\e[34m"
#Green= echo -e "\e[32m"
#Red= echo -e "\e[31m"
#Purple= echo -e "\e[35m"

#Take the user Input

echo "Please select 2 numbers"
read num1
read num2

echo "Please select from the options:"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Divide"
read option

case $option in
    1) 
    echo -e "\e[34m"
    echo "Your answer is:"
    echo $num1 + $num2 | bc
    ;;
    2) 
    echo -e "\e[32m"
    echo "Your answer is:"
    echo $num1 - $num2 | bc
    ;;
    3) 
    echo -e "\e[31m"
    echo "Your answer is:"
    echo $num1 \* $num2 | bc
    ;;
    4) 
    echo -e "\e[35m"
    echo "Your answer is:"
    echo $num1 / $num2 | bc
    ;;
    *) echo "Wong Selection: Please choose from 1-4"
    ;;
esac
exit 0
