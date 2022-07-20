#!/bin/bash

# DOCKER_COMPOSE_RESULT=$(docker-compose ps)
if [[ "$(docker-compose ps)" == *Up* ]]; then
    echo "Docker-Compose Down"
    docker-compose down
fi

# DOCKER_NETWORK_RESULT=$(docker network ls)
if [[ "$(docker network ls)" != *arduino_net* ]]; then
    echo "Create arduino_net Network"
    docker network create arduino_net
fi

ENV_FILE=".env"
if [ -e $ENV_FILE ]; then 
    echo -e "Build Docker-Compose"
    docker-compose build -q

    echo -e "Docker-Compose Service Start..."
    docker-compose up -d

else
    echo -e "Docker-Compose Service Do not Start. Check .env File"
fi


