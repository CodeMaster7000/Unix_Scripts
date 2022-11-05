# DB Log-in using PasswordSafe for different regions
#!/bin/bash
#Usage
echo 'On command line run ./db_login.sh <region> <account_number> <password>'
echo 'Example region is LDN or TKY or DEV'
echo 'account_number is just the safe account'
echo 'password is the password copied from Safe page'
 
if [ $# -ne 3 ]
then
      echo 'Usage:./db_login.sh <region> <account_number> <password>'
      exit 1
fi
#LDN
if [ $1 == 'LDN' ]
then
    #LDN
    user=$2
    pass=$3
    dbName=$1
elif [ $1 == 'TKY' ]
then
    #TKY
    user=$2
    pass=$3
    dbName=$1
elif [ $1 == 'DEV' ]
then
    #DEV
    user=$2
    pass=$3
    dbName=$1
fi
#LDN connection string
echo '------------------------------------------------------------------'
echo "Database: $dbName"
echo "Account user $user"
while true; do
  read -p 'Do you wish to continue? ' yn
  case $yn in
  [Yy]* ) break;;
  [Nn]* ) exit;;
  * ) echo 'Please answer yes or no.';;
  esac
done
 connection_string="sqsh -S $dbName -U $user -P $pass"
 echo 'Running '$connection_string'...'
 exec $connection_string
