yum install -y yum-utils epel-release http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php72
yum update -y

yum install -y sudo curl wget perl openssl gcc gcc-c++ git bison bzip2 make automake libtool autoconf m4 gcc-multilib


#clean up
yum clean all 
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/yum

# stage installer
rm -f /data/install.sh 
wget -q -O /data/install.sh https://get.pmmp.io
chmod 755 /data/install.sh

# check if configuration file exists
if [ ! -e /data/server.properties ]; then
  cp /tmp/server.properties /data/server.properties
fi

# setup owner
chown -R minecraft:minecraft /data

# install pocketmine
cd /data
#sudo -E -u minecraft ./install.sh -u