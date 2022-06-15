#!/bin/bash
if [ ! -f "/etc/hosts_initial" ]; 
then
echo 'Since you did not run the program, I will just create a copy of /etc/hosts'
sudo cp /etc/hosts /etc/hosts_initial
fi

sudo cp /etc/hosts_initial /etc/hosts
echo 'You just restored the backup from /etc/hosts_initial'
