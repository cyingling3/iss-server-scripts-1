#!/bin/bash

# upgrade system
DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y

# install nginx & jq & curl
apt install nginx jq curl -y
# configure nginx
rm -r /var/www/html/*
wget -O /var/www/html/index.html https://github.com/cyingling3/iss-server-scripts-1/edit/main/install.sh
# create scripts directory & download scripts
rm -r /scripts
mkdir /scripts
wget -O /scripts/install.sh https://github.com/cyingling3/iss-server-scripts-1/edit/main/install.sh
wget -O /scripts/update-webpage.sh https://github.com/cyingling3/iss-server-scripts-1/edit/main/install.sh
# create crontab
echo "* * * * * sh /scripts/update-webpage.sh" >> /var/tmp/cronconfig
crontab /var/tmp/cronconfig
rm /var/tmp/cronconfig
