FROM node:alpine

ENV DOMAIN=example.com

COPY run.sh /opt/run.sh

RUN apk add --no-cache git make g++ python nginx \
  && cd /opt \
  && git clone https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build \
  && apk del git make g++ python \
  && rm -rf /tmp/* /root/* \
  && chmod a+x /opt/run.sh

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/opt/run.sh"]
