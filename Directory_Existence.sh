#!/bin/bash
echo "Enter directory name: "
read ndir
if [ -d "$ndir" ]
then
echo "Directory exists."
else
`mkdir $ndir`
echo "Directory created!"
fi
