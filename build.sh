docker stop pocketmine
docker rm pocketmine
docker rmi -f acheaito/docker-pocketmine:latest
docker build . --tag acheaito/docker-pocketmine:latest
docker create -it -p 19132:19132/tcp -p 19132:19132/udp -v ~/.pocketmine/data:/data --name pocketmine acheaito/docker-pocketmine:latest