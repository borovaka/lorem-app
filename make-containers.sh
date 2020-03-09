#!/bin/bash

if [[ ! -z "$1" ]]; then
DOCKER_TAG=$1
else
DOCKER_TAG="latest"
fi

PHP_CONTAINER_NAME=borovaka/lorem-php:${DOCKER_TAG}
NGINX_CONTAINER_NAME=borovaka/lorem-web:${DOCKER_TAG}
CACHE_CONTAINER_NAME=borovaka/lorem-cache:${DOCKER_TAG}

docker build --pull --no-cache -t ${PHP_CONTAINER_NAME} -f Dockerfile.php $(pwd) 
docker build --pull --no-cache -t ${NGINX_CONTAINER_NAME} -f Dockerfile.nginx $(pwd) 
docker build --pull --no-cache -t ${CACHE_CONTAINER_NAME} -f Dockerfile.cache $(pwd) 

docker push ${PHP_CONTAINER_NAME}
docker push ${NGINX_CONTAINER_NAME}
docker push ${CACHE_CONTAINER_NAME}
