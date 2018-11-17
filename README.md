# Pocketmine for Docker
Build a Pocketmine Docker image using the latest [installation script](https://get.pmmp.io).

# Usage 

## Requirements
* Download and install the appropriate [Docker installation](https://www.docker.com/) for your system (the host)
* Open server port in host firewall (default 19132) ([Windows](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/configure-a-windows-firewall-for-database-engine-access),[Linux](https://help.ubuntu.com/lts/serverguide/firewall.html))
* Enable C drive sharing in [Docker Settings](https://beta.docker.com/docs/windows/getting-started/#docker-settings)  

## Setting up the Pocketmine server 
* Create a pocketmine folder on C: 
* Create a minecraft folder under C:\pocketmine
* run ```docker pull acheaito/pocketmine```
* run ```docker create -it -p 19132:19132/tcp -p 19132:19132/udp --mount type=bind,source=C:/pocketmine/minecraft,target=/data/minecraft --name pocketmine acheaito/pocketmine```

## Starting the Pocketmine server

	docker start pocketmine

## Stopping the server

	docker stop pocketmine
	
## Attach (Admin console)

	docker attach pocketmine

## Show logs

	docker logs pocketmine
	
# Custom maps
To add maps, stop the server, rename the custom map directory to *world* (THIS IS IMPORTANT), then place it under:

	C:\pocketmine\data\worlds\ 
