FROM php:7.4-fpm
RUN apt-get update && apt-get dist-upgrade -y && apt-get autoremove -y && apt-get autoclean -y
WORKDIR /var/www/html
COPY --chown=www-data:www-data ./lorem/ /var/www/html