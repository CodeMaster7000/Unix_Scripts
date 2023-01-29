#!/bin/bash
echo -n "Enter directory: "
read -r x
du -sh "$x"
