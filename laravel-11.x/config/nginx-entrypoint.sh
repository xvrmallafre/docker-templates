#!/bin/sh
# Guarda este archivo como nginx-entrypoint.sh

# Sustituye las variables en la plantilla de configuración
envsubst '${PHP_VERSION} ${PROJECT_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Inicia Nginx
exec nginx -g 'daemon off;'