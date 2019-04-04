bash:
	docker exec -it app_php_fpm bash

build:
	docker-compose -f docker/docker-compose.yml build

build-no-cache:
	docker-compose -f docker/docker-compose.yml build --no-cache

cache-clear:
	docker exec -it app_php_fpm bin/console cache:clear

consume-my-consumer:
	docker exec -it app_php_fpm bin/console swarrot:consume:my_consumer queue_name

ps:
	docker-compose -f docker/docker-compose.yml ps

restart: stop start

start:
	docker-compose -f docker/docker-compose.yml up -d
	docker exec -it app_php_fpm vendor/bin/rabbit vhost:mapping:create rabbitmq_default_vhost.yml --host=app_rabbitmq

stop:
	docker-compose -f docker/docker-compose.yml stop
