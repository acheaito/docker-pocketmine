# PocketMine Minecraft PE Server
FROM centos:7
MAINTAINER  Ali Cheaito <acheaito@gmail.com>

# Update, Install Prerequisites
RUN yum -y update && \
  yum install -y vim sudo wget perl gcc g++ make automake libtool autoconf m4 gcc-multilib && \  
  yum clean all && \
  rm -rf /var/lib/apt/lists/*

# Stage Files
COPY server.properties /tmp/server.properties
COPY start.sh /start.sh
RUN chmod 755 /start.sh

# Setup User
RUN useradd -d /data -s /bin/bash --uid 1000 minecraft

# Setup container
EXPOSE 19132
VOLUME ["/data"]
WORKDIR /data

# Start Pocketmine
CMD ["/start.sh"]
