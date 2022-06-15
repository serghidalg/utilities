#!/bin/bash
if [ ! -f "/etc/hosts_changed" ]; 
then
echo 'Since you did not run the program, enter the url to block and we will do the rest ;)'
sudo bash block.sh
fi

sudo cp /etc/hosts_changed /etc/hosts
echo 'You just blocked the sites from /etc/hosts_changed'
