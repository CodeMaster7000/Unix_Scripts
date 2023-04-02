MULTIHOSTEXEC_HOSTLIST_FILE=template-multihost-hosts.lst
nHostListCount=`grep -v "^$\|#" $MULTIHOSTEXEC_HOSTLIST_FILE 2>/dev/null | wc -l`
arrHostList=`grep -v "^$\|#" $MULTIHOSTEXEC_HOSTLIST_FILE 2>/dev/null`
if [ ! -s $MULTIHOSTEXEC_HOSTLIST_FILE -o ! -r $MULTIHOSTEXEC_HOSTLIST_FILE -o $nHostListCount -eq 0 ]; then
	echo "Error: Cannot read host file/file is empty."
	exit 1
fi
echo "Found $nHostListCount hosts."
nHostIndex=0
for nHost in $arrHostList
do
	nHostIndex=`expr $nHostIndex + 1`
	echo "Processing [$nHostIndex of $nHostListCount] $nHost."
	ssh -q -T $nHost <<-'ENDSSH'
	ENDSSH
  strRemoteFileName="/some/remote-folder/*$(date +%Y%m%d).tar.gz"
	echo "On LOCAL - Downloading remote file $nHost:$strRemoteFileName $strRemoteFileName."
	scp -q $nHost:$strRemoteFileName
	test $? && echo "On LOCAL - File download complete!"
done
echo "Complete!"
