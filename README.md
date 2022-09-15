# Alura DevOpsChallenge01

This is a challenge proposed by Alura. The main objective is to containerize a Python + Django applicationn using Docker.

# Running this container

Download the docker-compose.yml file and run "docker compose up". You can also clone this repository and build the image locally. I hosted the docker image on Docker HUB and it's available by the following pull command "docker pull maarcoalr/challenge-1:v2".

# Dockerfile

Using the Python 3.7 alpine official image, it will create a workdir; set environments variables; install dependencies, copy project to container and trigger django commands to populate the database and create a superuser. This application runs on port 3000.
