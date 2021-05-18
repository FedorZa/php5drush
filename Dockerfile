FROM ubuntu:16.04

RUN apt update && apt install -y software-properties-common && LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt update && apt install -y \
    php5.6-cli \
    php5.6-ctype \
    php5.6-curl \
    php5.6-dom \
    php5.6-gd \
    php5.6-iconv \
    php5.6-intl \
    php5.6-json \
    php5.6-ldap \
    php5.6-mcrypt \
    php5.6-memcache \
    php5.6-mysql \
    php5.6-mysqli \
    php5.6-opcache \
    php5.6-pdo \
    php5.6-mbstring \
    php-pear \
    php5.6-pgsql \
    php5.6-phar \
    php5.6-sockets \
    php5.6-sqlite3 \
    php5.6-xml \
    php5.6-zip \
    git \
    curl \
    mariadb-common \
    mariadb-client \
    libxml2-utils \
    s3cmd \
    jq

RUN curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/bin --filename=composer


RUN echo nameserver 8.8.8.8 > /etc/resolve.conf 
RUN composer global require drush/drush:8.*

RUN useradd fedor

EXPOSE 9000
EXPOSE 22

VOLUME ["/etc/php5/custom.d", "/app", "$HENCE_APP_VOL_PREFIX/conf", "$HENCE_APP_VOL_PREFIX/logs/php-general-logs", "$HENCE_APP_VOL_PREFIX/logs/php-error-logs","/vendor", "/config"]

WORKDIR /app

ENTRYPOINT /bin/bash
