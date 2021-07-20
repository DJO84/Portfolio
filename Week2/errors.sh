#!/bin/bash
#fix this file so that it doesnt contain any errors
#David Olsen
#20/07/2021

secret='shhh' #Don't tell anyone!
read -s -p "what's the secret code? " REPLY
echo 
echo 

#if the user types in the correct secret, tell them they got it right! 
if [ "$secret" = $REPLY ]; then 
    echo "You got it right!"
    correct=true
else
    echo "You got it wrong :(" 
    correct=false
fi 

echo 

case $correct in 
    true) 
        echo "you have unlocked the secret menu!" 
        #TODO: add a secret menu for people in the know. 
        ;; 
    
    *) 
        echo "Go Away!" #people who get it wrong need to be told to go away! 
        ;; 
    
esac