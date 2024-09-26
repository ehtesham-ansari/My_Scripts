#!/bin/bash


############################################
# author: Md Ehtesham
# purpose: find biggest numbers
# usager: biggest_no.sh 1st_number 2nd_number 3rd_number
# version: 1.0.0
############################################

# Check if three arguments are provided
if [ "$#" -ne 3 ]; then
  echo "Error: Three numbers are required."
  echo "Usage: $0 num1 num2 num3"
  exit 1
fi

# Assign the command-line arguments to variables
      num1=$1
      num2=$2
      num3=$3

# Determine the biggest number
      if [ "$num1" -ge "$num2" ] && [ "$num1" -ge "$num3" ]; then
      	biggest=$num1
      elif [ "$num2" -ge "$num1" ] && [ "$num2" -ge "$num3" ]; then
      	biggest=$num2
      else
        biggest=$num3
      fi

# Display the biggest number
      echo "The biggest number among $num1, $num2, and $num3 is: $biggest"

