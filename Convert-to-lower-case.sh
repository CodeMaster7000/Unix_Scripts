#!/usr/bin/env bash
echo -n "Enter file name: "
read -r file
if [ ! -f "$file" ]; then
	echo "Filename $file does not exist."
	exit 1
fi
tr '[:upper:]' '[:lower:]' < "$file" >> small.txt
