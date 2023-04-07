FROM alpine

COPY bin /opt/bin

USER root

RUN apk add --no-cache speedtest-cli curl

RUN chmod u+x /opt/bin/*

RUN crontab -l | { cat; echo "* * * * * /bin/sh /opt/bin/do_speed_test.sh"; } | crontab -

CMD crond -f

