FROM node:10.15.0-alpine

ENV DOMAIN=localhost
ENV webroot=/slweb
ENV serverroot=/slserver
ENV autoJoin=false
ENV autoJoinServer=
ENV autoJoinRoom=
ENV autoJoinPassword=

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python nginx bash \
  && cd /opt \
  && git clone https://github.com/samcm/synclounge \
  && cd synclounge \
  && npm install \
  && npm run build \
  && apk del make g++ python \
  && rm -rf /tmp/* /root/* \
  && chmod a+x /opt/run.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/opt/run.sh"]
