#!/bin/sh

echo Domain is $DOMAIN
echo Webroot is $webroot
echo Autojoin is $autoJoin

cd /opt/synclounge

needRebuild=false
sed -i -e "s/<DOMAIN>/$DOMAIN/g" /etc/nginx/nginx.conf
if [ $webroot != "" ]; then
  sed -i -e "s/<WEBROOT>/\\$webroot/g" /etc/nginx/nginx.conf
  needRebuild=true
else
  sed -i -e "s/<WEBROOT>//g" /etc/nginx/nginx.conf
fi
if [ $serverroot != "" ]; then
  sed -i -e "s/<SERVERROOT>/\\$serverroot/g" /etc/nginx/nginx.conf
else
  sed -i -e "s/<SERVERROOT>//g" /etc/nginx/nginx.conf
fi
if [ $autoJoin == "true" ]; then
  needRebuild=true
fi
if [ $needRebuild == "true" ]; then
  echo 'Rebuilding Webapp for custom options support. This can take a minute or two.'
  npm install
  npm run build
else
  echo 'Not rebuilding webapp'
fi
cat /etc/nginx/nginx.conf
export accessUrl=http://$DOMAIN; npm run server & node webapp.js & nginx
