#!/bin/sh
# Code from http://samba.anu.edu.au/rsync/examples.html
# You will end up with a 7 day rotating incremental backup.
BDIR=$HOME
EXCLUDES=$HOME/local/etc/backup_exclude
BLOCATION=/Volumes/Storage/Backups
SCRIPTS_DIR=$HOME/local/etc/backup.d
if [[ -d $SCRIPTS_DIR ]]
then
   for file in `ls $SCRIPTS_DIR`
   do
      $SCRIPTS_DIR/$file $BDIR 2> /dev/null > /dev/null
      if (( $? != 0 )) 
      then
         ERRCODE=$?
         echo Execution of script $SCRIPTS_DIR/$file failed.
         exit $?
      fi
   done
fi
BACKUPDIR=`date +%A`
OPTS="--extended-attributes --force --ignore-errors --delete-excluded --exclude-from=$EXCLUDES
      --delete --times --backup --backup-dir=../$BACKUPDIR -a"
[ -d $HOME/emptydir ] || mkdir $HOME/emptydir
rsync --delete -a $HOME/emptydir/ $BLOCATION/$USER/$BACKUPDIR/
rmdir $HOME/emptydir
rsync $OPTS $BDIR $BLOCATION/$USER/current
