FROM node:latest

COPY run.sh /home/run.sh

RUN chmod a+x /home/run.sh \
  && mkdir /opt && cd /opt \
  && git clone https://github.com/samcm/plextogether \
  && cd plextogether \
  && npm install

EXPOSE 8080

CMD /home/run.sh
