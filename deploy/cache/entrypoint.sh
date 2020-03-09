#!/bin/bash
sed -i "s/#ORIGIN_NAME#/${ORIGIN_NAME}/" /etc/nginx/conf.d/default.conf
exec nginx -g 'daemon off;'