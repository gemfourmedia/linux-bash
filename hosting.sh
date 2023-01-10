#!/bin/bash

domain=$1
BASEDIR=$(dirname "$0")

# Init nginx vhost block

cat $BASEDIR/nginx.default.txt | sed -e "s/##domain##/${domain}/g" >> /etc/nginx/sites-available/${domain}

if [ ! -f "/etc/nginx/sites-enabled/$domain" ]; then
	ln -s /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/${domain}
fi

## Create www folder
if [ ! -d "/var/www/$domain" ]; then
	mkdir /var/www/${domain}
	chown www-data:www-data /var/www/${domain}
	chmod g+rw /var/www/${domain}
fi
