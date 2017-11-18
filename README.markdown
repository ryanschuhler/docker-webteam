# Docker Webteam
This repo is for webteam's server infrastructure on docker.

# Steps
* Intall Docker (https://docs.docker.com/engine/installation/)
	* Increase memory in docker (in app preferences)
* Navigate to /docker-webteam folder
	* fill in CURL_USERNAME and CURL_PASSWORD in the docker-compose file with your liferay credentials (it is so you can download the bundle from files.liferay)
	* run `docker-compose up -d`
	* After all of that loads you should be able to run `docker ps -a` and see the containers up
* Notes
	* If you want to build only liferay you can navigate to the liferay folder and run `docker build -t liferay . && docker run -d -p 8080:8080 --name liferay liferay`
	* If you are seeing issues with apache and conflicting ports you can run `sudo apachectl stop`
	* For logs run `docker logs -f [CONTAINER_ID|CONTAINER_NAME]`
	* To navigate the terminal of a container run  `docker exec -it [CONTAINER_ID|CONTAINER_NAME] /bin/sh`