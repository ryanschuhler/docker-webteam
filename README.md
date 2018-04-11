# Docker Environment
This is a repo to help build docker images for liferay development. For help, questions, improvements or anything else feel free to contact [Ryan Schuhler](ryan.schuhler@liferay.com)

## Getting Started
* Intall [Docker](https://docs.docker.com/engine/installation/)
	* Increase memory in docker (in app preferences)
* If you are not on the liferay network, from the root folder run `./update-credentials.sh` 
  * This will prompt you for your credentials for mirrors.liferay.com and save them locally on your computer.
* Run `docker-compose build`
  * This will build all of the docker images with the files you previously downloaded.
* Run `docker-compose up -d`
* Go to [localhost](http://localhost) in your browser
* To shut down your containers you can run `docker-compose down`
