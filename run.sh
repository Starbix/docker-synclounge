#!/bin/sh
cd /opt/plextogether
npm run server & node webapp.js --url=http://$DOMAIN/ptweb
