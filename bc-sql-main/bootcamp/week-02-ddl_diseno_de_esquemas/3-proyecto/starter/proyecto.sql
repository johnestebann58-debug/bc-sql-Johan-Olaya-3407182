
-- ============================================
-- PROYECTO SEMANAL: DDL de Estudio de Fotografía y Video
-- Semana 02 — DDL: Diseño de Esquemas
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS packages;
DROP TABLE IF EXISTS clients;

-- ============================================
-- TABLA: CLIENTES
-- ============================================

CREATE TABLE IF NOT EXISTS clients (
    client_id      INTEGER PRIMARY KEY,
    first_name     TEXT NOT NULL,
    last_name      TEXT NOT NULL,
    email          TEXT NOT NULL UNIQUE,
    phone_number   TEXT NOT NULL UNIQUE,
    city           TEXT NOT NULL DEFAULT 'Bogotá',
    is_active      INTEGER NOT NULL DEFAULT 1
                    CHECK (is_active IN (0,1))
);

-- ============================================
-- TABLA: PAQUETES
-- ============================================

CREATE TABLE IF NOT EXISTS packages (
    package_id      INTEGER PRIMARY KEY,
    package_name    TEXT NOT NULL UNIQUE,
    package_type    TEXT NOT NULL
                    CHECK (package_type IN
                    ('Photography','Video','Photography & Video')),
    price           REAL NOT NULL
                    CHECK (price > 0),
    duration_hours  INTEGER NOT NULL
                    CHECK (duration_hours > 0),
    is_available    INTEGER NOT NULL DEFAULT 1
                    CHECK (is_available IN (0,1))
);

-- ============================================
-- TABLA: SESIONES
-- ============================================

CREATE TABLE IF NOT EXISTS sessions (
    session_id      INTEGER PRIMARY KEY,
    client_id       INTEGER NOT NULL,
    package_id      INTEGER NOT NULL,
    session_date    TEXT NOT NULL,
    location        TEXT NOT NULL,
    status          TEXT NOT NULL DEFAULT 'Scheduled'
                    CHECK (status IN
                    ('Scheduled','Completed','Cancelled','Editing')),

    FOREIGN KEY (client_id)
        REFERENCES clients(client_id),

    FOREIGN KEY (package_id)
        REFERENCES packages(package_id)
);

-- ============================================
-- TABLA: ENTREGAS
-- ============================================

CREATE TABLE IF NOT EXISTS deliveries (
    delivery_id      INTEGER PRIMARY KEY,
    session_id       INTEGER NOT NULL,
    delivery_date    TEXT NOT NULL,
    file_format      TEXT NOT NULL
                     CHECK (file_format IN
                     ('JPEG','PNG','RAW','MP4')),
    delivery_status  TEXT NOT NULL DEFAULT 'Pending'
                     CHECK (delivery_status IN
                     ('Pending','Editing','Delivered')),

    FOREIGN KEY (session_id)
        REFERENCES sessions(session_id)
);

-- ============================================
-- VERIFICACIÓN
-- ============================================

.tables

PRAGMA table_info(clients);
PRAGMA table_info(packages);
PRAGMA table_info(sessions);
PRAGMA table_info(deliveries);
