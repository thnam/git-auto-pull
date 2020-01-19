FROM alpine as alpine

RUN apk add --no-cache git openssh-client

ADD pull.sh entrypoint.sh /
RUN chmod +x pull.sh entrypoint.sh

ARG INTERVAL=2
RUN echo "*/${INTERVAL} * * * * /pull.sh" > crontab.txt
RUN crontab crontab.txt

WORKDIR /repo
VOLUME /repo
VOLUME /ssh

ENTRYPOINT ["/entrypoint.sh"]
