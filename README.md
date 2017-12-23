# docker-synclounge
Dockerfile for SyncLounge 🐳

[![Docker Pulls](https://img.shields.io/docker/pulls/starbix/synclounge.svg)](https://hub.docker.com/r/starbix/synclounge)

[![](https://images.microbadger.com/badges/version/starbix/synclounge:latest.svg)](https://microbadger.com/images/starbix/synclounge:latest) [![](https://images.microbadger.com/badges/image/starbix/synclounge:latest.svg)](https://microbadger.com/images/starbix/synclounge:latest)


[![](https://images.microbadger.com/badges/version/starbix/synclounge:dev.svg)](https://microbadger.com/images/starbix/synclounge:dev) [![](https://images.microbadger.com/badges/image/starbix/synclounge:dev.svg)](https://microbadger.com/images/starbix/synclounge:dev)

[![](https://images.microbadger.com/badges/version/starbix/synclounge:nginx.svg)](https://microbadger.com/images/starbix/synclounge:nginx) [![](https://images.microbadger.com/badges/image/starbix/synclounge:nginx.svg)](https://microbadger.com/images/starbix/synclounge:nginx)


[![](https://images.microbadger.com/badges/version/starbix/synclounge:server.svg)](https://microbadger.com/images/starbix/synclounge:server) [![](https://images.microbadger.com/badges/image/starbix/synclounge:server.svg)](https://microbadger.com/images/starbix/synclounge:server)

The following tags are available:

- latest / alpine: webapp and server based on alpine
- server: only server based on alpine
- dev: development version based on alpine

```
docker run \
  --name=SyncLounge \
	-p 8088:8088 \
	-p 8089:8089 \
  -e DOMAIN=example.com \
  starbix/synclounge
```

- nginx: latest + nginx reverse proxy

```
docker run \
  --name=SyncLounge_nginx \
	-p 80:80 \
  -e DOMAIN=example.com \
  starbix/synclounge:nginx
```


#### To run both the SyncLounge webapp and the SyncLounge server through a web server like nginx you will need to make sure you proxy websockets. Example nginx.conf:

 ```
 server {
     listen 80;
 	server_name example.com;
 	root /location/of/synclounge/;
 	location /slweb {
 		proxy_pass http://localhost:8088/slweb;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location /slserver {
 		proxy_pass http://localhost:8089/slserver;
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 	}     	
 	location / {
 	    proxy_http_version 1.1;
 	    proxy_set_header Upgrade $http_upgrade;
 	    proxy_set_header Connection "upgrade";
 		proxy_pass http://localhost:8088/slweb;
 	}
 }
```
