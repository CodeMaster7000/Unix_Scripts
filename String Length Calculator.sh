clear
echo "Enter string: "
read "str"
len=`echo $str | wc -c`
len=`expr $len - 1`
echo "Length of string = $len"