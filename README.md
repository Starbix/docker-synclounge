# docker-plextogether
Dockerfile for PlexTogether 🐳


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
