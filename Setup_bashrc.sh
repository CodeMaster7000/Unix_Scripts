#!/bin/bash
if [ "$0" == "$BASH_SOURCE" ]; then
  echo >&2 "Setup script has to be sourced, not run with sh. Aborting..."
  exit 1
fi
if [ ! -e ~/.sp ] ; then
    touch ~/.sp
fi
if [ $(uname -o) == "Cygwin" ]; then
  (set -o igncr) 2>/dev/null && set -o igncr;
fi
echo "
################################################################################
#Hide user name and host in terminal 
#export PS1="\w$ "
#Make ls every time a terminal opens
ls
#cd + ls
function cs () {
    cd \$1
    ls -a
}
#transfer path: save the current path to a hidden file
function tp () {
    pwd > ~/.sp
}
#goto transfer path: goes where the previously saved tp points
function gtp () {
    cs \`cat ~/.sp\`
}
#cat with color
function ccat () {
    source-highlight -fesc -i \$1
}
#Remove trash from terminal and runs program in background
function evince () {
    /usr/bin/evince \$* 2> /dev/null & disown
}
function gedit (){
        /usr/bin/gedit \$* 2> /dev/null & disown
}
# up N: moves N times upwards (cd ../../../{N})
function up () {
  LIMIT=\$1
  P=\$PWD
  for ((i=1; i <= LIMIT; i++))
  do
      P=\$P/..
  done
  cs \$P
  export MPWD=\$P
}
" >> ~/.bashrc
source ~/.bashrc
if [ $(uname -o) == "Cygwin" ]; then
  if [ command -v dos2unix >/dev/null 2>&1 ]; then
    dos2unix $INTENDED_BASH_PATH
  fi
fi
if [ ! -f ~/.bash_profile ]; then
    echo ".bash_profile not found. Creating..."
    echo "
# include .bashrc if it exists
if [ -f "\$HOME/.bashrc" ]; then
. "\$HOME/.bashrc"
fi
    " > ~/.bash_profile
fi
echo ".bashrc updated!"
