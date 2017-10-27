# Docker Webteam
This repo is testing setting up the webteams infrastructure on docker.

# Steps
* Intall Docker (https://docs.docker.com/engine/installation/)
	** Increase memory in docker (in app preferences)
	** docker-machine create -d virtualbox --virtualbox-memory 4096 default\
* Navigate to /docker-webteam folder and run docker-compose up -d
	** After all of that loads you should be able to run docker ps -a and see the containers up