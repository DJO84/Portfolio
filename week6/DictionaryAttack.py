#!/usr/bin/python3
#Create a bruteforce script that runs through every character and integer combination to find a secret hashed password (written in python)
#David Olsen
#09/08/2021

import hashlib
import itertools

#hidden password hash
PasswordHash ="8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52"
#create a character set to be referenced and bruteforced
Charset ="abcdefghijklmnopqrstuvwxyz0123456789"
#Create empty variable to store the hashed value in
wordlistHash=''
#Starting Length variable
length=1

#Create loop to check if updated wordListHash does not equal the password
while wordlistHash != PasswordHash:
    #Utilise intertools product to go through the Charset values 
    for i in itertools.product(Charset, repeat=length):
        word = ''.join(i)
        #create variable wordlistHash and run "word" through Sha256 hash
        wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()
        #print to screen both variables
        print(f"Trying password: {word}:{wordlistHash}")
        #If variables match break loop and print to screen the cracked password
        if(wordlistHash == PasswordHash):
            print(f"The password has been cracked. It was: {word}")
            break
    #Incrmeent the length by 1 with every iteration    
    length = length + 1

#original Script from exercise below___________________________________________________________
#with open("wordlist.txt", "r") as wordlist:

    #repeat for each word

    #for word in wordlist.readlines():

    #    word = word.rstrip()

        #hash the word

   #     wordlistHash = hashlib.sha256(word.encode("utf-8")).hexdigest()

    #    print(f"Trying password {word}:{wordlistHash}")

        #if the hash is the same as the correct password's hash then we have cracked the password!

     #   if(wordlistHash == passwordHash):
#
 #           print(f"Password has been cracked! It was {word}")
#
 #           break