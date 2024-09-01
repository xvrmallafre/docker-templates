# Laravel 11.x con Docker

Esta configuración proporciona un entorno de desarrollo para Laravel 11.x utilizando Docker. Incluye servicios como PHP-FPM, Nginx, PostgreSQL, Redis, Composer y Mailhog para facilitar el desarrollo y despliegue de aplicaciones Laravel.

## Estructura del Proyecto

- **bin/**: Scripts útiles para interactuar con los contenedores Docker.
  - `artisan`: Ejecuta comandos de Artisan dentro del contenedor Docker.
  - `composer`: Ejecuta comandos de Composer dentro del contenedor Docker.
  - `npm`: Ejecuta comandos de npm dentro del contenedor Docker.
  - `xdebug`: Activa o desactiva Xdebug en el contenedor PHP.
- **config/**: Archivos de configuración.
  - `nginx.conf`: Configuración de Nginx.
  - `toggle-xdebug.sh`: Script para activar o desactivar Xdebug.
- **DockerFiles/**: Archivos Docker para construir las imágenes personalizadas.
- **.env.example**: Archivo de ejemplo para la configuración de variables de entorno.
- **docker-compose.yml**: Archivo de configuración de Docker Compose.

## Servicios

- **PHP-FPM**: Servicio PHP configurado con la versión especificada en el archivo `.env`.
- **Nginx**: Servidor web que sirve la aplicación Laravel.
- **PostgreSQL**: Base de datos relacional.
- **Redis**: Almacenamiento en caché.
- **Composer**: Herramienta de gestión de dependencias para PHP.
- **Mailhog**: Herramienta para capturar correos electrónicos enviados desde la aplicación.

## Uso

### Requisitos Previos

- Docker
- Docker Compose

### Configuración

1. Copia el archivo `.env.example` a `.env` y completa las variables necesarias.

   ```sh
   cp .env.example .env
   ```
2. Construye y levanta los contenedores Docker:

   ```sh
    docker-compose up --build
    ```
    
### Comandos Útiles

  - Ejecutar comandos de Artisan:

    ```sh
    ./bin/artisan [command]
    ```

  - Ejecutar comandos de Composer:

    ```sh
    ./bin/composer [command]
    ```

  - Ejecutar comandos de npm:

    ```sh
    ./bin/npm [command]
    ```

  - Activar o desactivar Xdebug:

    ```sh
    ./bin/xdebug [on|off]
    ```

## Licencia
Este proyecto está licenciado bajo la MIT License.