#!/bin/bash

###################################
# Purpose: simple password generator
# author: Md Ehtesham
# version: 1.0.0
###################################

echo "Please enter the desired password length (max 15):"
read pass_length

# checking if the provided argument is a number or not.
if ! expr "$pass_length" + 0 >/dev/null 2>&1; then
    echo "Invalid input. The Input could only be in numbers."
    exit 1
fi

if [ "$pass_length" -gt 15 ]; then
    echo "the password length cannot exceed 15 charactors"
    exit 1
else
        password=$(openssl rand -base64 48 | cut -c1-$pass_length)
        echo "generated password is: $password"
fi
