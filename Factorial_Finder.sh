#!/usr/bin/env bash
echo -n "Enter number: "
read -r a
fact=1
while [ "$a" -ne 0 ]; do
	fact=$((fact * a))
	a=$((a - 1))
done
echo $fact
