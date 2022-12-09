echo "*** Converting between different temperature units ***"
echo "1. Convert Celsius temperatures into Fahrenheit"
echo "2. Convert Fahrenheit temperatures into Celsius"
echo -n "Select your choice (1-2): "
read choice
 
if [ $choice -eq 1 ]
then
	echo -n "Enter temperature (C): "
	read tc
	tf=$(echo "scale=2;((9/5) * $tc) + 32" |bc)
	echo "$tc C = $tf F"
elif [ $choice -eq 2 ]
then
	echo -n "Enter temperature (F): "
	read tf 
	tc=$(echo "scale=2;(5/9)*($tf-32)"|bc)
	echo "$tf = $tc"
else
	echo "Please select 1 or 2 only"
	exit 1
fi
