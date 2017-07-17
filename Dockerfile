FROM php:alpine

MAINTAINER Kevin <kevin.ongko@gmail.com>

# Install PHP extensions
ADD ./install/php.sh /usr/sbin/php.sh
RUN /usr/sbin/php.sh

# install Node & Yarn
ENV NODE_VERSION 8.1.3
ADD ./install/node.sh /usr/sbin/node.sh
RUN /usr/sbin/node.sh
RUN npm i -g yarn

# install node-sass
ADD ./install/node-sass.sh /usr/sbin/node-sass.sh
RUN /usr/sbin/node-sass.sh

WORKDIR /var/www

EXPOSE 80