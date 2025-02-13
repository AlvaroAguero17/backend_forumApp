# Backend forum app

**Proyecto solicitado por prueba tecnica**

_En primer lugar se debe crear el archivo .env, leugo incluir las variables de entorno para la base de datos, ya que esta en local puede variar el nombre y la clave_

## Variables de entorno

```
APP_PORT = 3000

DATABASE_NAME = 'forumAA'
DATABASE_USER = 'postgres'
DATABASE_PASSWORD = 'admin'
DATABASE_HOST = 'localhost'

```

## Generacion base de datos

_En el proyecto se encuentra una archivo llamado schema.sql donde se encontraran los scrips para la creacion de la base de datos, tablas y datos de prueba_

## Desiciones tecnicas

_Este proyecto esta realizado con node.js junto a express y typeorm, junto a una base de datos PostgreSQL y programado con typescript. La razon por la cual escogi typeorm versus otros ORM disponibles es que este ofrece soporte para typescript de buena manera, ya que en experiencia propia con otros orms he tenido ciertas dificultades y en opinion propia siento que su forma de realizar el crud es ordenada y facil de realizar_

## Mejoras pendientes o requerimientos no impementados

_Una mejora pendiente seria encriptar las contraseñas de los usuarios, tambien generar un token al momento de loguearse y reformular un poco el codigo. En cuanto a datos faltaria una especia de log o historial de comentarios y/o posts._

## Algunos requests de la API

GET `http://localhost:3000/post` **Obtener todos los posts ordenados por fecha DESC**
GET `http://localhost:3000/user` **Obtener todos los usuarios**
POST `http://localhost:3000/post` **Crear un post. JSON de ejemplo: {  
 "content": "Contenido del post",
"title": "Titulo del post",
"user": 1}**
