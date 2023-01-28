 $ for i in {1..65535}; do (echo < /dev/tcp/127.0.0.1/$i) &>/dev/null && printf "\n[+] Open port at\n: \t%d\n" "$i" || printf "."; done
