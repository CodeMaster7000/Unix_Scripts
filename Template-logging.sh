export DEBUG_FLAG=1
Log_Info() {
	local timestamp=`date +"%Y%m%d%H%M%S"`
	log_message="$timestamp INFO: $1"
	test $DEBUG_FLAG -eq 1 && echo "$log_message"
}
Log_Error() {
	local timestamp=`date +"%Y%m%d%H%M%S"`
	log_message="$timestamp ERROR: $1"
	echo "$log_message" 1>&2; 		
}
Log_Error "This is an error message. Ideally I should be followed by a exit <non-zero-value>."
Log_Info "For your info, I am an info message."
