FROM php:7.3-fpm

LABEL version="0.1"
LABEL maintainer="Alexandre Vallot <alexandre.vallot@gmail.com>"
LABEL maintainer="Kévin Pires <pires.kev@gmail.com>"

# Install composer
RUN apt-get update && \
    apt-get install -y openssl git unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer --version 

# Install and enable xDebug
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

WORKDIR /app

EXPOSE 9000
