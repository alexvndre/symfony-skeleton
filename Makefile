PROJECT_NAME = app
HELP_FUN = \
	%help; \
    while(<>) { \
        if(/^([a-z0-9_-]+):.*\#\#(?:@(\w+))?\s(.*)$$/) { \
            push(@{$$help{$$2}}, [$$1, $$3]); \
        } \
    }; \
    print "\nusage: make [target]\n\n"; \
    for ( sort keys %help ) { \
        printf("  %-20s %s\n", $$_->[0], $$_->[1]) for @{$$help{$$_}}; \
        print "\n"; \
    }

bash: ## Access to bash ${PROJECT_NAME}_php_fpm container
	docker exec -it ${PROJECT_NAME}_php_fpm bash

build: ## Build the containers
	docker-compose -f docker/docker-compose.yml build

build-no-cache: ## Build the containers without a cache
	docker-compose -f docker/docker-compose.yml build --no-cache

cache-clear: ## Clear the symfony cache
	docker exec -it ${PROJECT_NAME}_php_fpm bin/console cache:clear

consume-my-consumer: ## Consume a queue
	docker exec -it ${PROJECT_NAME}_php_fpm bin/console swarrot:consume:my_consumer queue_name

help: ## List commands with help
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

ps: ## Show docker process
	docker-compose -f docker/docker-compose.yml ps

restart: cache-clear stop start ## Stop and start the volumes

start: ## Start volumes and configure RabbitMQ
	docker-compose -f docker/docker-compose.yml up -d
	docker exec -it ${PROJECT_NAME}_php_fpm vendor/bin/rabbit vhost:mapping:create rabbitmq_default_vhost.yml --host=${PROJECT_NAME}_rabbitmq

stop: ## Stop voumes
	docker-compose -f docker/docker-compose.yml stop
