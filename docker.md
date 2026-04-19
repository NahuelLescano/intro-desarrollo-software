# Docker

## Introducción a Docker

Docker es una plataforma que permite desarrollar, empaquetar y ejecutar aplicaciones en contenedores. Un contenedor es una unidad ligera y portátil que contiene todo lo necesario para ejecutar una aplicación: código, runtime, librerías y configuraciones del sistema.

## ¿Para qué usar Docker?

Docker se ha convertido en una herramienta fundamental para el desarrollo moderno por múltiples razones:

* **Portabilidad**: permite correr una aplicación en distintos entornos (desarrollo, testing, producción) sin modificar el código.
* **Aislamiento**: cada contenedor tiene un propio entorno, lo que evita conflictos entre dependencias de distintos proyectos.
* **Reproducibilidad**: se puede garantizar que la aplicación se ejecute de la misma forma en cualquier equipo o servidor.
* **Escalabilidad**: facilia de despliegue de arquitecturas basadas en microservicios.
* **Automatización**: se integra fácilmente con herramienta de CI/CD para automatizar pruebas y despliegues.
* **Reducción de costos**: al ser más liviano que una máquina virtual, consume menos recursos.

## Componentes claves

* **Docker Engine**: es el motor central, compuesto por un deamon que se ejecuta en segundo plano. Se encarga de crear y ejecturar contenedores, gestionar imágenes, redes y volúmenes.
* **Dockerfile**: es un archivo de texto que contiene una serie de instrucciones declarativas para construir una imagen Docker. Se especifica el sistema base, las dependencias, el código a copiar, variables de entorno y el comando que se ejecutará al iniciar el contenedor.
* **Imagen**: es una plantilla inmutable que contiene todo el entorno necesario para ejecutar una aplicación. Las imágenes se crean a partir de un *dockerfile* y pueden ser compartidas y versionadas. No cambian mientras se usan.
* **Contenedor**: es una instancia en ejecución de una imagen. Representa una unidad de ejecución aislada, con su propio sistema de archivos, red y procesos. Al detenerse o eliminarse, no conserva los cambios salvo que se usen volúmenes.
* **Docker Hub**: es un servicio en línea donde los usuarios pueden subir y descargar imágenes Docker. Funciona como un repositorio público o privado que permite compartir imágenes entre distintos equipos o proyectos.

## Diferencia entre imagen y contenedor

Una *imagen* es la definición estática (template) de lo que contendrá el contenedor, mientras que un *contenedor* es una instancia en ejecución de esa imagen.

## Docker Compose

Docker Compose es una herramienta que permite definir, configurar y ejectuar múltiples contenedores Docker como una única aplicación. Es ideal para entornos donde se requiere una arquitectura basada en varios servicios interconectados.

Todo se gestiona desde un archivo YAML (`docker-compose.yml`), donde se describe la infraestructura de la aplicación, permitiendo abstraer detalles técnicos de la línea de comandos y facilitando el despliegue y mantenimiento del sistema.

## Comandos básicos:

* `docker compose up`: levanta todos los servicios definidos. Puede usar el flag `-d` para correr en modo "detached".
* `docker compose down`: detiene y elimina los servicios, redes y volúmenes asociados.
* `docker compose build`: construye las imágenes a partir de los `dockerfile`s definidos.
* `docker compose logs`: muestra los logs de todos los servicios.
* `docker compose ps`: lista los servicios que se están ejecutando.
* `docker compose exec <servicio> <comando>`: ejecuta un comando en un contenedor en ejecución.

### Ejemplo básico de archivo `docker-compose.yml`

```yml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
    environment:
      - FLASK_ENV=development
  redis:
    image: "redis:alpine"
```

Este archivo lanza dos servicios: *web*, que construye desde un `dockerfile` local, y *redis* que utiliza una imagen de Docker Hub. `web` monta el código local como volumen, expone el puerto 5000 y establece una variable de entorno.

También es posible definir:

* Redes personalizadas (`networks:`)
* volúmenes persistentes (`volumes:`)
* Dependencias entre servicios (`depends_on:`)
* Configuraciones especificas por entorno (`env_file:`)

## Docker avanzado

### Volúmenes y Bind Mounts

* **Volúmenes**: gestionados por Docker, ideales para persistencia.
* **Bind Mounts**: enlazan carpetas del host con el contenedor. Útiles en desarrollo.

### Redes personalizadas

* Docker permite crear redes virtuales entre contenedores.
* Se puede definir una red propia en Compose y conectar servicios.

```yml
networks:
    mynetwork:
        driver: bridge
```

### Variables de entorno y `.env`

* Docker Compose permite definir variables de entorno directamente en el archivo `docker-compose.yml` o en un archivo externo `.env`.

* Estas variables ayudan a mantener configuraciones desacopladas del código fuente.

* Son útiles para definir:
    * Puertos
    * Nombres de imágenes o contenedores
    * Claves de API
    * Usuarios y contraseñas (aunque se recomienda no incluir datos sensibles en texto plano)

### Ejemplo de archivo `.env`

```env
MYSQL_ROOT_PASSWORD=clave123
PORT=3306
```

### docker-compose.yml

```yml
services:
  db:
    image: mysql
    ports:
      - "${PORT}:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
```

De esta forma, se puede reutilizar el mismo archivo `docker-compose.yml` en diferentes entornos (dev, staging, production) simplemente cambiando el archivo `.env` correspondiente.

## Multi-stage builds

* Permite optimizar imágenes dividiendo el proceso en varias etapas.
* Reduce el tamaño de la imagen final eliminando herramientas de build.

```yml
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
```
