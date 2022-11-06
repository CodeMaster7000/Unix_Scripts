#!usr/bin/env bash
file="file.txt"
while read -r line; do
    echo -e "$line\n"
done <$file 
