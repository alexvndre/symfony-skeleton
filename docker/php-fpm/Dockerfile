FROM php:7.3-fpm

LABEL version="0.1"
LABEL maintainer="Alexandre Vallot <alexandre.vallot@gmail.com>"
LABEL maintainer="Kévin Pires <pires.kev@gmail.com>"

RUN apt-get update && \
    apt-get install -y \
    openssl \
    git \
    unzip \
    librabbitmq-dev \
    libssh-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer --version 

RUN pecl install amqp xdebug && \
    docker-php-ext-enable amqp xdebug

WORKDIR /app

EXPOSE 9000
