#!/bin/bash
while true; do
    pids=$(ps -eo pid,%mem | awk '$2 > 70 && $1 != "PID" {print $1}')
    for pid in ${pids[@]}
    do
        cmd=$(ps -o comm= $pid)
        if [ "$cmd" != "mysqld" ]
        then 
            kill -9 $pid
            eval $(cat /proc/$pid/environ | tr '\0' '\n' | grep '^PWD=')
            nohup "$cmd" &
            echo "$(date): Killed and restarted process with PID: $pid." >> /var/log/killed_By_RamService.log 
        fi   
    done
    sleep 60
done & disown
exit 0;
