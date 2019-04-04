bash:
	docker exec -it app-php-fpm bash

build:
	docker-compose -f docker/docker-compose.yml build

build-no-cache:
	docker-compose -f docker/docker-compose.yml build --no-cache

ps:
	docker-compose -f docker/docker-compose.yml ps

run:
	docker-compose -f docker/docker-compose.yml up -d

stop:
	docker-compose -f docker/docker-compose.yml stop
