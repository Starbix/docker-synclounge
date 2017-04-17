FROM node:latest

COPY run.sh /opt/run.sh

RUN chmod a+x /opt/run.sh \
  && cd /opt \
  && git clone -b dev https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build

EXPOSE 8080

CMD /opt/run.sh
