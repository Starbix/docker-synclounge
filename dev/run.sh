#!/bin/sh
cd /opt/synclounge
npm run server & node webapp.js --accessUrl=http://$DOMAIN
