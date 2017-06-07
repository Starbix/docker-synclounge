#!/bin/sh
sed -i -e "s/<DOMAIN>/$DOMAIN/g" /etc/nginx/nginx.conf
cd /opt/plextogether
npm run server & node webapp.js --url=http://$DOMAIN/ptweb & nginx
