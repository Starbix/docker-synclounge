#!/bin/sh
sed -i -e "s/<DOMAIN>/$DOMAIN/g" /etc/nginx/nginx.conf
cd /opt/synclounge
npm run server & node webapp.js --url=http://$DOMAIN/slweb & nginx
