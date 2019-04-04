bash:
	docker exec -it app-php-fpm bash

build:
	docker-compose -f docker/docker-compose.yml build

build-no-cache:
	docker-compose -f docker/docker-compose.yml build --no-cache

cache-clear:
	docker exec -it app-php-fpm bin/console cache:clear

ps:
	docker-compose -f docker/docker-compose.yml ps

restart: stop start

start:
	docker-compose -f docker/docker-compose.yml up -d

stop:
	docker-compose -f docker/docker-compose.yml stop
