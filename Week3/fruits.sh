#!/bin/bash
#For loop displaying Fruit names
#David Olsen
#22/07/2021

#Array of fruits
fruits=(Apple Mango Strawberry Orange Banana)

#Run through array with [@] expands each argument of array and prints out name
for i in ${fruits[@]}

do 
    echo "FRUIT: $i"
done

exit 0