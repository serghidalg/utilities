#!/bin/bash
#If hosts and changed coincide then its activated
if cmp -s /etc/hosts /etc/hosts_changed;
then
echo 'case1'
case='1'
fi


if [ ! -f "/etc/hosts_changed" ]; 
then
sudo cp /etc/hosts /etc/hosts_changed
sudo cp /etc/hosts /etc/hosts_initial
fi

read -p "Enter the url to block: " url
url1='127.0.0.1 www.'${url}
url2='127.0.0.1 '$url
echo $url1 | sudo tee -a /etc/hosts_changed
echo $url2 | sudo tee -a /etc/hosts_changed


#Since hosts and hosts_changed coincide, apply changes to both
if [ $case == '1' ];
then
bash activate.sh
fi
