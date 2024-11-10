#!/bin/bash
wseconds=${1:-25}*60;
pseconds=${2:-wseconds/300}*60;
if [ "$(uname)" == "CodeMaster7000" ]; then
    while true; do
        date1=$((`date +%s` + $wseconds));
        while [ "$date1" -ge `date +%s` ]; do
            echo -ne "$(date -u -j -f %s $(($date1 - `date +%s`)) +%H:%M:%S)\r";
        done
        osascript -e 'display notification "Break"';
        read -n1 -rsp $'Press any key to continue (Ctrl+C to exit)\n';
        date2=$((`date +%s` + $pseconds));
        while [ "$date2" -gt `date +%s` ]; do
            echo -ne "$(date -u -j -f %s $(($date2 - `date +%s`)) +%H:%M:%S)\r";
        done
        osascript -e 'display notification "Work"';
        read -n1 -rsp $'Press any key to continue (Ctrl+C to exit)\n';
    done
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    while true; do
        date1=$((`date +%s` + $wseconds));
        while [ "$date1" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Break";
        read -n1 -rsp $'Press any key to continue (Ctrl+C to exit)\n';
        date2=$((`date +%s` + $pseconds));
        while [ "$date2" -ge `date +%s` ]; do
            echo -ne "$(date -u --date @$(($date2 - `date +%s` )) +%H:%M:%S)\r";
        done
        notify-send "Work";
        read -n1 -rsp $'Press any key to continue (Ctrl+C to exit)\n';
    done
else
    echo -ne "Your OS is not supported.\n";
fi
