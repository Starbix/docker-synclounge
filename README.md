# docker-plextogether
Dockerfile for PlexTogether 🐳

[![](https://images.microbadger.com/badges/image/starbix/plextogether.svg)](https://microbadger.com/images/starbix/plextogether)
[![](https://images.microbadger.com/badges/version/starbix/plextogether.svg)](https://microbadger.com/images/starbix/plextogether)
[![Docker Stars](https://img.shields.io/docker/stars/starbix/plextogether.svg)](https://hub.docker.com/r/starbix/plextogether/)
[![Docker Pulls](https://img.shields.io/docker/pulls/starbix/plextogether.svg)](https://hub.docker.com/r/starbix/plextogether/)
[![Docker Automated buil](https://img.shields.io/docker/automated/starbix/plextogether.svg)](https://hub.docker.com/r/starbix/plextogether/)
[![Docker Build Status](https://img.shields.io/docker/build/starbix/plextogether.svg)](https://hub.docker.com/r/starbix/plextogether/)

#### To run both the Plex Together webapp and the Plex Together server through a web server like nginx you will need to make sure you proxy websockets. Example nginx.conf:

 ```
 server {
     listen 80;
 	server_name example.com;
 	root /location/of/plextogether/;
 	location /ptweb {
 		proxy_pass http://localhost:8088/ptweb;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location /ptserver {
 		proxy_pass http://localhost:8089/ptserver;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location / {
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 		proxy_pass http://localhost:8088/ptweb;
 	}
 }
```
