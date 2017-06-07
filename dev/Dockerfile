FROM node:alpine

ENV DOMAIN=localhost

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python \
  && cd /opt \
  && git clone -b dev https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build \
  && apk del git make g++ python \
  && rm -rf /tmp/* /root/* \
  && chmod a+x /opt/run.sh

EXPOSE 8088 8089

CMD ["/opt/run.sh"]
