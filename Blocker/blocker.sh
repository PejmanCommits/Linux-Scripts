#!/bin/bash
#: Title : blocker
#: Date : 2023-04-26
#: Author : "Pejman Rezaei" <prezaeiw@gmail.com>
#: Version : 1.0
#: Description : Block and unBlock Given IP Addresses using iptables
#: Options : None
#: Run this script using sudo command.
#: Usage: ./blocker.sh {block|unblock|list} IP_ADDRESS



if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi

# Block the given ip
if [[ "$1" == block ]]; then
    if [[ "$2" == $(cat /etc/iptables/blocked.txt | grep '$2') ]]; then
        echo 'IP $2 has been already blocked!'
    else
        iptables -A INPUT -s "$2" -j DROP && netfilter-persistent save && echo "$2" >> /etc/iptables/blocked.txt && echo "IP $2 has been successfully blocked!"
    fi
# Unblock the given ip
elif [ "$1" == unblock ]; then
    iptables -D INPUT -s "$2" -j DROP && netfilter-persistent save && sed -i "/$2/d" /etc/iptables/blocked.txt && echo "IP $2 has been successfully unBlocked!"
# Get the list of blocked items
elif [ "$1" == list ]; then
    cat /etc/iptables/blocked.txt
fi
