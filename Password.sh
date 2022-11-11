#!/bin/bash
password=""
echo "Enter Username: "
read username
pass_var="Enter Password: "
while IFS= read -p "$pass_var" -r -s -n 1 letter
do
    if [[ $letter == $'\0' ]]
    then
        break
    fi
    password=password+"$letter"
    pass_var="*"
done
echo
echo "Your password has been read with an asterisk (*)."
