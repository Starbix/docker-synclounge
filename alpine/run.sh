#!/bin/sh

cd /opt/synclounge

needRebuild=false
if [ $webroot != "" ]; then
  needRebuild=true
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

export accessUrl=http://$DOMAIN; npm run server & node webapp.js
