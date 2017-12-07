#!/usr/bin/env bash

if [ ! -d "opsfile" ]; then
    git clone --depth=1  https://github.com/phanbook/opsfiles.git
fi

chmod 777 -R public/
chmod 777 -R content/cache/
chmod 777 -R content/logs


# Now use docker setup for default
if ! which docker > /dev/null; then
    echo "Docker doesn't seem to be installed. Please download and install it"
    echo "from https://docs.docker.com/engine/installation/ and re-run phanbook."
    exit 3
fi
if [[ "destroy" == "$1" ]]; then
    # Stop and remove any existing containers
    docker rm -f $(docker ps -a -q)
    # Delete all images
    docker rmi -f $(docker images -q)
fi

if ! which docker-compose > /dev/null; then
    curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    sudo service docker start
fi

cd opsfiles/docker
docker-compose config
docker-compose build
docker-compose up -d

if [ 'rebuild' == "$1" ]; then
	docker-compose down -v
	docker-compose up -d
fi

if [ 'composer' == "$1" ]; then
    docker-compose up composer
fi

if [ 'migrate' == "$1" ]; then
    docker-compose up migrate
fi

# Fix PSR2
if [ 'psr2' == "$1" ]; then
    vendor/bin/phpcbf --standard=PSR2 $2
fi