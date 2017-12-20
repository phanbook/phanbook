#!/usr/bin/env bash
APP_PATH=`pwd`
OPSFILES_DOCKER='opsfiles/docker'
DOCKER_BIN=`command -v docker 2>/dev/null || true`
DOCKER_COMPOSE_BIN=`command -v docker-compose 2>/dev/null || true`

if [ ! -d "opsfiles" ]; then
    git clone --depth=1  https://github.com/phanbook/opsfiles.git
fi



# Now use docker setup for default
if [ x"$DOCKER_BIN" = x ]; then
    echo "Docker doesn't seem to be installed. Please download and install it"
    echo "from https://docs.docker.com/engine/installation/ and re-run phanbook."
    exit 3
fi

if [ x"$DOCKER_COMPOSE_BIN" = x ]; then
    curl -L https://github.com/docker/compose/releases/download/1.3.3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    service docker start
fi

cd "$OPSFILES_DOCKER"

if [ 'build' == "$1" ]; then
	cd "$APP_PATH"
	chmod 777 -R public/
	chmod 777 -R content/cache/
	chmod 777 -R content/logs
	
	cd "$OPSFILES_DOCKER"
	docker-compose config
	docker-compose build
	docker-compose up -d

fi

if [ 'destroy' == "$1" ]; then
    # Stop and remove any existing containers
    docker rm -f $(docker ps -a -q)
    # Delete all images
    docker rmi -f $(docker images -q)
fi


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
