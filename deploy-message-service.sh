#!/bin/bash

# Load env variables
source ./env-vars.sh

# Pull latest docker image
docker pull federicofiorini/message-service:latest

# Remove previous container
if docker stop message-service; then docker rm message-service; fi

# Start message service container
docker run --name message-service --restart=always \
    -e RABBITMQ_HOST=rabbit \
    -e RABBITMQ_USER=$RABBITMQ_USER \
    -e RABBITMQ_PASSWORD=$RABBITMQ_PASSWORD \
    -e SLACK_TOKEN=$SLACK_TOKEN \
    --network=local_network \
    federicofiorini/message-service;
