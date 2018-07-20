#!/bin/sh
cd /opt/synclounge
if [ "autoJoin" == "true" ]; then
  echo 'Rebuilding for autojoin support'
  npm run build
else
  echo 'Not rebuilding the app'
fi
export accessUrl=http://$DOMAIN; npm run server & node webapp.js
