#!/bin/bash

docker-compose down

DOCKER_NETWORK_RESULT=$(docker network ls)
if [[ "$DOCKER_NETWORK_RESULT" != *arduino_net* ]]; then
    echo "Create arduino_net Network"
    docker network create arduino_net
fi

echo -e "Build Docker-Compose"
docker-compose build -q

echo -e "Docker-Compose Service Start..."
docker-compose up -d

