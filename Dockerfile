FROM ubuntu:18.04
MAINTAINER  Ali Cheaito <acheaito@gmail.com>

COPY build.sh /
COPY server.properties /tmp/server.properties
RUN chmod 755 /build.sh
RUN /build.sh

USER minecraft
CMD ["/startup.sh"]