# PocketMine Minecraft PE Server
FROM centos:7
MAINTAINER  Ali Cheaito <acheaito@gmail.com>

RUN useradd -d /data -s /bin/bash --uid 1000 minecraft

COPY build.sh /
COPY server.properties /tmp/server.properties
RUN chmod 755 /build.sh
RUN /build.sh

#USER minecraft
#CMD ["/data/start.sh"]
USER root
CMD ["/bin/bash"]