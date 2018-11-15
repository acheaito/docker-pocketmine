apt-get update -y
apt-get install -y apt-utils sudo curl wget perl openssl gcc g++ git bison bzip2 make automake libtool autoconf m4 gcc-multilib
apt-get clean
apt-get autoremove

# stage installer
mkdir -p /data
rm -f /data/install.sh 
wget -q -O /data/install.sh https://get.pmmp.io
chmod 755 /data/install.sh

# check if configuration file exists
if [ ! -e /data/server.properties ]; then
  cp /tmp/server.properties /data/server.properties
fi

# setup owner
useradd --home-dir /data --shell /bin/bash --password minecraft --uid 1000 minecraft
chown -R minecraft:minecraft /data

# install pocketmine
cd /data
sudo -E -u minecraft ./install.sh