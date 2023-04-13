read palindrome 
reverse=$( echo $palindrome | rev ) 
if [ $palindrome = $reverse ]; then  
echo "The number you provided is a palindrome." 
else 
echo "The number you provided is not a palindrome." 
fi
