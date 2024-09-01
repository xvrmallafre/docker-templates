#!/bin/sh

XDEBUG_INI="/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"

if [ "$1" = "on" ]; then
    sed -i 's/^;zend_extension/zend_extension/' $XDEBUG_INI
    echo "Xdebug activated"
elif [ "$1" = "off" ]; then
    sed -i 's/^zend_extension/;zend_extension/' $XDEBUG_INI
    echo "Xdebug deactivated"
else
    echo "Usage: $0 [on|off]"
    exit 1
fi

# Enviar señal a PHP-FPM para recargar la configuración
kill -USR2 1