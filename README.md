# docker-plextogether
Dockerfile for PlexTogether 🐳

[![Docker Pulls](https://img.shields.io/docker/pulls/starbix/plextogether.svg)](https://hub.docker.com/r/starbix/plextogether)

[![](https://images.microbadger.com/badges/version/starbix/plextogether:latest.svg)](https://microbadger.com/images/starbix/plextogether:latest) [![](https://images.microbadger.com/badges/image/starbix/plextogether:latest.svg)](https://microbadger.com/images/starbix/plextogether:latest)


[![](https://images.microbadger.com/badges/version/starbix/plextogether:dev.svg)](https://microbadger.com/images/starbix/plextogether:dev) [![](https://images.microbadger.com/badges/image/starbix/plextogether:dev.svg)](https://microbadger.com/images/starbix/plextogether:dev)

[![](https://images.microbadger.com/badges/version/starbix/plextogether:nginx.svg)](https://microbadger.com/images/starbix/plextogether:nginx) [![](https://images.microbadger.com/badges/image/starbix/plextogether:nginx.svg)](https://microbadger.com/images/starbix/plextogether:nginx)


[![](https://images.microbadger.com/badges/version/starbix/plextogether:server.svg)](https://microbadger.com/images/starbix/plextogether:server) [![](https://images.microbadger.com/badges/image/starbix/plextogether:server.svg)](https://microbadger.com/images/starbix/plextogether:server)

The following tags are available:

- latest / alpine: webapp and server based on alpine
- server: only server based on alpine
- dev: development version based on alpine

```
docker run \
  --name=plextogether \
	-p 8088:8088 \
	-p 8089:8089 \
  -e DOMAIN=example.com \
  starbix/plextogether
```

- nginx: latest + nginx reverse proxy

```
docker run \
  --name=plextogether_nginx \
	-p 80:80 \
  -e DOMAIN=example.com \
  starbix/plextogether:nginx
```


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
