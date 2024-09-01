FROM php:8.2-fpm

ARG UID
ARG GID

RUN groupadd -g $GID appgroup && \
    useradd -u $UID -g appgroup -m appuser

# Instala lo necesario para instalar php-redis
RUN pecl install redis \
    && docker-php-ext-enable redis

# Instala las dependencias necesarias para instalar Node.js
RUN curl -sL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh \
    && ./nodesource_setup.sh \
    && apt-get install -y nodejs \
    && rm nodesource_setup.sh

# Instala lo necesario para tener xdebug en el contenedor
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Instala las dependencias necesarias y las extensiones de PHP requeridas por Laravel
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    curl \
    unzip \
    libcurl4-openssl-dev \
    && docker-php-ext-install pdo_pgsql zip exif pcntl xml bcmath mbstring  \
    && docker-php-ext-configure curl \
    && docker-php-ext-install curl \
    && docker-php-ext-enable curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ../../../../config/toggle-xdebug.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/toggle-xdebug.sh

RUN echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "[xdebug]" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.discover_client_host=false" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log_level=10" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/proc/self/fd/2" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && chmod 664 /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN sed -i 's/user = www-data/user = appuser/g' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i 's/group = www-data/group = appgroup/g' /usr/local/etc/php-fpm.d/www.conf

RUN chown -R appuser:appgroup /usr/local/etc/php /var/www

WORKDIR /var/www/exam-creator

USER appuser