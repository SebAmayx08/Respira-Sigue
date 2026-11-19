# Respira y Sigue

Aplicación web construida con Spring Boot para el seguimiento del bienestar emocional: test de estrés y ansiedad, recomendación de ejercicios, recursos de apoyo, recordatorios diarios y perfil de usuario.

> Este proyecto es la migración a Spring Boot de la versión original hecha con Laravel.

## Requisitos previos

- JDK 21
- Maven 3.9 o superior
- MySQL 8
- Git

Para comprobar las versiones:

    java -version
    mvn -version

## Cómo correr el proyecto

1. Clonar el repositorio y cambiarse a la rama de desarrollo:

       git clone https://github.com/tu-usuario/respira-y-sigue.git
       cd respira-y-sigue
       git checkout develop

2. Crear la base de datos en MySQL:

       CREATE DATABASE respira_y_sigue CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

3. Compilar y ejecutar las pruebas:

       mvn clean package

4. Levantar la aplicación:

       mvn spring-boot:run

5. Abrir en el navegador: http://localhost:8080

> **Estado actual (Sprint 1, S1-01):** el proyecto ya compila y empaqueta, pero la conexión a MySQL, Flyway y la zona horaria se configuran en la historia S1-02. Hasta que esa historia esté integrada, el paso 4 no podrá arrancar por falta de datasource; el paso 3 sí funciona sin base de datos.

## Estructura del proyecto

    src/main/java/com/respirasigue/
    ├── RespiraYSigueApplication.java   Clase principal
    ├── config/        Configuración (seguridad, beans, zona horaria)
    ├── controller/    Controladores MVC
    ├── service/       Lógica de negocio
    ├── repository/    Repositorios Spring Data JPA
    ├── entity/        Entidades JPA
    └── dto/           Objetos de transferencia de datos

    src/main/resources/
    ├── static/        CSS e imágenes (reutilizados de la versión Laravel)
    ├── templates/     Vistas Thymeleaf
    └── db/migration/  Migraciones de Flyway

## Funcionalidades

- Registro e inicio de sesión de usuarios
- Perfil editable (datos personales y contraseña)
- Test emocional (estrés y ansiedad) con recomendación de ejercicios
- Catálogo de ejercicios filtrable por categoría, con registro de completado
- Recursos de apoyo (artículos, lecturas, videos, audios)
- Recordatorios personalizados
- Panel de inicio con estado de ánimo diario, frase del día y progreso semanal

## Tecnologías

- Java 21
- Spring Boot 4.1 (Web, Thymeleaf, Data JPA, Security, Validation)
- Flyway
- MySQL
- Maven
- Lombok

## Flujo de ramas

- `main`: versión estable.
- `develop`: integración del trabajo de cada sprint.

## Autores

Sebastian Robles
Jeison Avila
Sebastian Amaya
Liviston Palacios
