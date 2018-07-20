#!/bin/sh
echo Hello

nohttp=${$accessUrl/http:\/\//}

nohttps=${$nohttp/https:\/\//}

echo Domain is $nohttps

sed -i -e "s/<DOMAIN>/$nohttps/g" /etc/nginx/nginx.conf
if [ $webroot != "" ]; then
  sed -i -e "s/<webroot>/$webroot/g" /etc/nginx/nginx.conf
else
  sed -i -e "s/<webroot>/ /g" /etc/nginx/nginx.conf
fi
if [ $serveroot != "" ]; then
  sed -i -e "s/<serverroot>/$serverroot/g" /etc/nginx/nginx.conf
else
  sed -i -e "s/<serverroot>/ /g" /etc/nginx/nginx.conf
fi
if [ $autoJoin == "true" ]; then
  echo 'Rebuilding for autojoin support'
  npm run build
else
  echo 'Not rebuilding the app'
fi
export accessUrl=$accessUrl; npm run server & node webapp.js & nginx
