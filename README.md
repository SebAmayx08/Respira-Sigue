# Respira y Sigue

Aplicación web de bienestar emocional, migrada de Laravel a **Java 21 + Spring Boot** (Thymeleaf, Spring Data JPA, Spring Security, Flyway y MySQL).

## Requisitos
- Java 21 (JDK)
- MySQL 8+ en ejecución (por ejemplo MySQL Server, XAMPP o MySQL Workbench con un servidor local)
- No hace falta instalar Maven: el proyecto incluye `mvnw` / `mvnw.cmd`

## Configuración de la base de datos
La aplicación lee estas variables de entorno. Si no existen, usa los valores por defecto indicados:

| Variable | Por defecto | Descripción |
|---|---|---|
| `DB_URL` | `jdbc:mysql://localhost:3306/respira_y_sigue?createDatabaseIfNotExist=true&serverTimezone=America/Bogota` | URL de conexión |
| `DB_USER` | `root` | Usuario de MySQL |
| `DB_PASSWORD` | *(vacía)* | Contraseña de MySQL |

La base de datos `respira_y_sigue` se crea sola la primera vez.

**Windows (PowerShell):**
```powershell
$env:DB_PASSWORD="tu_contraseña"
```

**Linux / macOS:**
```bash
export DB_PASSWORD="tu_contraseña"
```

> Nunca subas contraseñas al repositorio. `application-local.properties` y `.env` están en `.gitignore`.
> `application-example.properties` es solo una plantilla.

## Cómo compilar
```powershell
.\mvnw.cmd clean package        # Windows
./mvnw clean package            # Linux / macOS
```

## Cómo ejecutar
```powershell
.\mvnw.cmd spring-boot:run      # Windows
./mvnw spring-boot:run          # Linux / macOS
```
La aplicación queda en http://localhost:8080

Mientras no esté lista la tarea de Spring Security (S1-03), Spring muestra su pantalla de inicio de sesión por defecto. El usuario es `user` y la contraseña aparece en la consola al arrancar (`Using generated security password`).

## Estructura
```
src/main/java/com/respirasigue
├── RespiraYSigueApplication.java
├── config        configuración (seguridad, etc.)
├── controller    controladores web
├── service       lógica de negocio
├── repository    repositorios Spring Data JPA
├── entity        entidades JPA
└── dto           objetos de transferencia
src/main/resources
├── db/migration  scripts Flyway (V1__crear_tablas.sql, V2__datos_iniciales.sql)
├── static        CSS, imágenes y JS
└── templates     vistas Thymeleaf
```

## Zona horaria
La aplicación trabaja en `America/Bogota`.
