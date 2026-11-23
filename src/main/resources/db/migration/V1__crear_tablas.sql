-- =====================================================================
-- V1__crear_tablas.sql
-- Esquema inicial de Respira y Sigue (7 tablas)
-- Nombres de tablas y columnas tomados de las migraciones de Laravel
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. users
-- (Laravel: create_users_table + add_profile) + role para Spring Security
-- ---------------------------------------------------------------------
CREATE TABLE users (
    id                BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name              VARCHAR(255)    NOT NULL,
    email             VARCHAR(255)    NOT NULL,
    password          VARCHAR(255)    NOT NULL,
    fecha_nacimiento  DATE            NULL,
    genero            VARCHAR(255)    NULL,
    role              VARCHAR(20)     NOT NULL DEFAULT 'USER',
    created_at        TIMESTAMP       NULL,
    updated_at        TIMESTAMP       NULL,
    PRIMARY KEY (id),
    CONSTRAINT users_email_unique UNIQUE (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 2. tests_emocionales
-- (Laravel: create_tests_emocionales + add_categoria_slug)
-- ---------------------------------------------------------------------
CREATE TABLE tests_emocionales (
    id                     BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    user_id                BIGINT UNSIGNED  NOT NULL,
    puntaje_estres         TINYINT UNSIGNED NOT NULL,
    puntaje_ansiedad       TINYINT UNSIGNED NOT NULL,
    nivel_estres           VARCHAR(255)     NOT NULL,
    nivel_ansiedad         VARCHAR(255)     NOT NULL,
    categoria_recomendada  VARCHAR(255)     NOT NULL,
    categoria_slug         VARCHAR(255)     NULL,
    respuestas             JSON             NULL,
    created_at             TIMESTAMP        NULL,
    updated_at             TIMESTAMP        NULL,
    PRIMARY KEY (id),
    CONSTRAINT tests_emocionales_user_id_foreign
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 3. ejercicios  (Laravel: create_ejercicios)
-- categoria: respiracion, relajacion, mindfulness, meditacion
-- ---------------------------------------------------------------------
CREATE TABLE ejercicios (
    id                BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
    categoria         VARCHAR(255)      NOT NULL,
    titulo            VARCHAR(255)      NOT NULL,
    descripcion       TEXT              NOT NULL,
    instrucciones     TEXT              NOT NULL,
    duracion_minutos  SMALLINT UNSIGNED NULL,
    created_at        TIMESTAMP         NULL,
    updated_at        TIMESTAMP         NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 4. ejercicio_registros  (Laravel: create_ejercicio_registros)
-- Sin created_at / updated_at, igual que Laravel
-- ---------------------------------------------------------------------
CREATE TABLE ejercicio_registros (
    id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id        BIGINT UNSIGNED NOT NULL,
    ejercicio_id   BIGINT UNSIGNED NOT NULL,
    completado_en  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT ejercicio_registros_user_id_foreign
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT ejercicio_registros_ejercicio_id_foreign
        FOREIGN KEY (ejercicio_id) REFERENCES ejercicios (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 5. recordatorios  (Laravel: create_recordatorios)
-- ---------------------------------------------------------------------
CREATE TABLE recordatorios (
    id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     BIGINT UNSIGNED NOT NULL,
    icono       VARCHAR(255)    NOT NULL DEFAULT '🔔',
    titulo      VARCHAR(255)    NOT NULL,
    hora        TIME            NOT NULL,
    activo      TINYINT(1)      NOT NULL DEFAULT 1,
    created_at  TIMESTAMP       NULL,
    updated_at  TIMESTAMP       NULL,
    PRIMARY KEY (id),
    CONSTRAINT recordatorios_user_id_foreign
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 6. recursos  (Laravel: create_recursos)
-- tipo: articulo, lectura, video, audio
-- ---------------------------------------------------------------------
CREATE TABLE recursos (
    id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo         VARCHAR(255)    NOT NULL,
    icono        VARCHAR(255)    NOT NULL DEFAULT '📄',
    titulo       VARCHAR(255)    NOT NULL,
    descripcion  VARCHAR(255)    NOT NULL,
    contenido    TEXT            NULL,
    url          VARCHAR(255)    NULL,
    created_at   TIMESTAMP       NULL,
    updated_at   TIMESTAMP       NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 7. estados_animo  (Laravel: create_estados_animo)
-- valor: 1 = Muy mal ... 5 = Muy bien
-- ---------------------------------------------------------------------
CREATE TABLE estados_animo (
    id          BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    user_id     BIGINT UNSIGNED  NOT NULL,
    valor       TINYINT UNSIGNED NOT NULL,
    fecha       DATE             NOT NULL,
    created_at  TIMESTAMP        NULL,
    updated_at  TIMESTAMP        NULL,
    PRIMARY KEY (id),
    CONSTRAINT estados_animo_user_id_foreign
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    CONSTRAINT estados_animo_user_id_fecha_unique UNIQUE (user_id, fecha)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
