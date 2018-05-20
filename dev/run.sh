#!/bin/sh
cd /opt/synclounge
npm run server & node webapp.js --url=http://$DOMAIN
