#!/bin/bash

set -e

# stage installer
if [ -e /data/install.sh ]; then
  rm -f /data/install.sh 
fi

wget -q -O /data/install.sh https://get.pmmp.io
chmod 755 /data/install.sh

# check if configuration file exists
if [ ! -e /data/server.properties ]; then
  cp /tmp/server.properties /data/server.properties
fi

# setup owner
chown -R minecraft:minecraft /data

# install pocketmine
sudo -E -u minecraft ./install.sh

# start pocketmine
exec sudo -E -u minecraft PHP_BINARY=/data/bin/php7/bin/php ./start.sh