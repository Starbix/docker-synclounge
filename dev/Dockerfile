FROM node:alpine

ENV accessUrl=localhost
ENV webroot=
ENV serverroot=
ENV autoJoin=false
ENV autoJoinServer=
ENV autoJoinRoom=
ENV autoJoinPassword=

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python \
  && cd /opt \
  && git clone -b v2 https://github.com/samcm/synclounge \
  && cd synclounge \
  && npm install \
  && npm run build \
  && apk del git make g++ python \
  && rm -rf /tmp/* /root/* \
  && chmod a+x /opt/run.sh

EXPOSE 8088 8089

CMD ["/opt/run.sh"]
