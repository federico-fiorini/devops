#!/bin/bash

# Load env variables
source ./env-vars.sh

# Pull docker image
docker pull rabbitmq:management

# Create network
docker network create -d bridge local_network

# Run rabbit container
docker run -d -p 5672:5672 -p 8080:15672 --name rabbit --restart=always \
    -e RABBITMQ_NODENAME=$RABBITMQ_NODENAME \
    -e RABBITMQ_DEFAULT_USER=$RABBITMQ_USER \
    -e RABBITMQ_DEFAULT_PASS=$RABBITMQ_PASSWORD \
    --network=local_network \
    rabbitmq:management;
