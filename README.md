# Proyecto de Configuración de Entornos de Desarrollo con Docker

Este repositorio tiene como objetivo proporcionar configuraciones de entornos de desarrollo utilizando Docker para diferentes frameworks y tecnologías. La idea es facilitar la configuración y despliegue de entornos de desarrollo consistentes y reproducibles.

## Propósito

El propósito de este repositorio es ofrecer configuraciones listas para usar que permitan a los desarrolladores iniciar rápidamente sus proyectos con las tecnologías y frameworks de su elección. Cada configuración incluirá los servicios necesarios, scripts útiles y documentación detallada para facilitar su uso.

## Estructura del Proyecto

- **config/**: Archivos de configuración comunes.
- **DockerFiles/**: Archivos Docker para construir las imágenes personalizadas.
- **.env.example**: Archivo de ejemplo para la configuración de variables de entorno.
- **docker-compose.yml**: Archivo de configuración de Docker Compose.
- **frameworks/**: Directorio que contiene configuraciones específicas para diferentes frameworks y tecnologías.
  - **laravel-11.x/**: Configuración para Laravel 11.x (más detalles en su propio `README.md`).

## Uso

### Requisitos Previos

- Docker
- Docker Compose

### Configuración General

1. Copia el archivo `.env.example` a `.env` y completa las variables necesarias.
   ```sh
   cp .env.example .env
    ```

2. Navega al directorio del framework o tecnología que deseas utilizar y sigue las instrucciones específicas en su README.md.

## Comandos Útiles
  - Construir y levantar los contenedores Docker:
     ```sh
    docker-compose up --build
    ```
  - Detener los contenedores Docker:
     ```sh
    docker-compose up --build
    ```

## Licencia

MIT License