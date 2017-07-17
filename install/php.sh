#!/bin/sh

# install essentials
apk --no-cache update && apk upgrade
apk --no-cache add curl git

# install mysql pdo
docker-php-ext-install pdo_mysql

# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# clean cache
rm /var/cache/apk/*
