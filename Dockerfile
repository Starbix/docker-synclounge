FROM node:alpine

ENV DOMAIN=example.com

RUN apk add --no-cache git make g++ python \
  && mkdir /opt && cd /opt \
  && git clone https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build \
  && cd server \
  && npm install \
  && apk del git make g++ python \
  && rm -rf /tmp/* /root/*

COPY run.sh /opt/run.sh

RUN chmod a+x /opt/run.sh

EXPOSE 8088 8089

CMD /opt/run.sh
