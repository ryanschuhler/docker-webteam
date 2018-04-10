# Docker Environment
This is a repo to help build docker images for liferay development. For help, questions, improvements or anything else feel free to contact [Ryan Schuhler](ryan.schuhler@liferay.com)

## Getting Started
* Intall [Docker](https://docs.docker.com/engine/installation/)
	* Increase memory in docker (in app preferences)
* From the root folder run `./init.sh` 
  * This will download all of the necesssary files from mirrors.liferay as defined in the `download-files.sh` of each container. (you may need to be vpnd into the server room)
* Run `docker-compose build`
  * This will build all of the docker images with the files you previously downloaded.
* Run `docker-compose up -d`
* Go to [localhost](http://localhost) in your browser
* To shut down your containers you can run `docker-compose down`
