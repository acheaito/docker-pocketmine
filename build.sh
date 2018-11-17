alias apt-get='apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
apt-get update -y
apt-get install -y sudo curl wget
apt-get clean
apt-get autoremove

# stage installer
mkdir -p /data/workarea /data/minecraft
wget -q -O /data/workarea/install.sh https://get.pmmp.io
chmod 755 /data/workarea/install.sh
cp /tmp/server.properties /data/workarea/server.properties

# setup owner
useradd --shell /bin/bash minecraft
chown -R minecraft:minecraft /data

# install pocketmine
cd /data/workarea
sudo -E -u minecraft ./install.sh

# create startup script
echo '#!/bin/bash' > /startup.sh
echo 'cp -r -n -v /data/workarea/* /data/minecraft' >> /startup.sh
echo 'cd /data/minecraft' >> /startup.sh
echo './start.sh' >> /startup.sh
chmod 755 /startup.sh