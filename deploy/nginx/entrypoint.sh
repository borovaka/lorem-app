#!/bin/bash
sed -i "s/#PHP_CONTAINER_NAME#/${PHP_CONTAINER_NAME}/" /etc/nginx/conf.d/default.conf
exec nginx -g 'daemon off;'