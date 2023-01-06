#!/bin/bash
DELAY=1 
while true; do
    clear
	cat << EOF
        Please Select:
        1. Display System Information
        2. Display Disk Space
        3. Display Home Space Utilization
        0. Quit
EOF
    read -p "Enter selection [0-3] > "
    case "$REPLY" in
        0)
            break
            ;;
        1)
            echo "Hostname: $HOSTNAME"
            uptime
            ;;
        2)
            df -h
            ;;
        3)
            if [[ $(id -u) -eq 0 ]]; then
                echo "Home Space Utilization (all users)"
                du -sh /home/*
            else
                echo "Home Space Utilization ($USER)"
                du -sh $HOME
            fi
            ;;
        *)
            echo "Invalid entry."
            ;;
    esac
    sleep "$DELAY"
done
echo "Program terminated."
