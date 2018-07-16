#!/bin/sh
cd /opt/synclounge
export accessUrl=http://$DOMAIN; npm run server & node webapp.js
