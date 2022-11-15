#!/bin/bash
clear
echo "Enter values for A, B & C."
read "A"
read "B"
read "C"
if test $A -gt $B -a $A -gt  $C;
then
  echo "A is the greatest."
else
  if test $B -gt $cC;
  then
     echo "B is the greatest."
  else
     echo "C is the greatest."
  fi
fi
