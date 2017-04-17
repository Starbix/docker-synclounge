FROM node:latest

COPY run.sh /opt/run.sh

RUN chmod a+x /opt/run.sh \
  && cd /opt \
  && git clone https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install \
  && npm run build \
  && cd server \
  && npm install

EXPOSE 8088 8089

CMD /opt/run.sh
