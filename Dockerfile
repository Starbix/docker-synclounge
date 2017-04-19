FROM node:alpine

ENV DOMAIN=example.com

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python \
  && cd /opt \
  && chmod a+x run.sh \
  && git clone https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build \
  && cd server \
  && npm install \
  && apk del git make g++ python \
  && rm -rf /tmp/* /root/*

EXPOSE 8088 8089

CMD /opt/run.sh
