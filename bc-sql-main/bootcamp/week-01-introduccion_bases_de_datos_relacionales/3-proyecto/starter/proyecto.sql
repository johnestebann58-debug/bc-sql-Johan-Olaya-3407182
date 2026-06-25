-- ============================================
-- PROYECTO SEMANAL: Estudio de Fotografía y Video
-- Semana 01 — Introducción a Bases de Datos Relacionales
-- ============================================

-- ============================================
-- PASO 1: Crear las entidades principales
-- ============================================

-- Tabla de clientes
CREATE TABLE clients (
    client_id       INTEGER PRIMARY KEY,
    first_name      TEXT NOT NULL,
    last_name       TEXT NOT NULL,
    email           TEXT UNIQUE NOT NULL,
    phone_number    TEXT NOT NULL
);

-- Tabla de paquetes de servicios
CREATE TABLE packages (
    package_id       INTEGER PRIMARY KEY,
    package_name     TEXT NOT NULL,
    package_type     TEXT NOT NULL,
    price            REAL NOT NULL,
    duration_hours   INTEGER NOT NULL
);

-- Tabla de sesiones fotográficas o de video
CREATE TABLE sessions (
    session_id       INTEGER PRIMARY KEY,
    client_id        INTEGER NOT NULL,
    package_id       INTEGER NOT NULL,
    session_date     TEXT NOT NULL,
    location         TEXT NOT NULL,
    status           TEXT NOT NULL,

    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (package_id) REFERENCES packages(package_id)
);

-- Tabla de entregas de material al cliente
CREATE TABLE deliveries (
    delivery_id      INTEGER PRIMARY KEY,
    session_id       INTEGER NOT NULL,
    delivery_date    TEXT NOT NULL,
    file_format      TEXT NOT NULL,
    delivery_status  TEXT NOT NULL,

    FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

-- ============================================
-- PASO 2: Insertar datos de prueba
-- ============================================

-- Insertar clientes
INSERT INTO clients (
    client_id,
    first_name,
    last_name,
    email,
    phone_number
) VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '3001111111'),
(2, 'Emily', 'Johnson', 'emily.johnson@email.com', '3002222222'),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '3003333333'),
(4, 'Sophia', 'Davis', 'sophia.davis@email.com', '3004444444'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@email.com', '3005555555');

-- Insertar paquetes
INSERT INTO packages (
    package_id,
    package_name,
    package_type,
    price,
    duration_hours
) VALUES
(1, 'Basic Portrait', 'Photography', 250.00, 2),
(2, 'Wedding Premium', 'Photography & Video', 1800.00, 10),
(3, 'Corporate Event', 'Video', 1200.00, 6),
(4, 'Family Session', 'Photography', 400.00, 3),
(5, 'Social Media Content', 'Video', 650.00, 4);

-- Insertar sesiones
INSERT INTO sessions (
    session_id,
    client_id,
    package_id,
    session_date,
    location,
    status
) VALUES
(1, 1, 1, '2026-06-15', 'Studio A', 'Completed'),
(2, 2, 2, '2026-07-10', 'Grand Palace Hotel', 'Scheduled'),
(3, 3, 3, '2026-06-20', 'Business Center', 'Completed'),
(4, 4, 4, '2026-06-25', 'City Park', 'Completed'),
(5, 5, 5, '2026-07-05', 'Downtown Office', 'Scheduled');

-- Insertar entregas
INSERT INTO deliveries (
    delivery_id,
    session_id,
    delivery_date,
    file_format,
    delivery_status
) VALUES
(1, 1, '2026-06-18', 'JPEG', 'Delivered'),
(2, 2, '2026-07-20', 'MP4', 'Pending'),
(3, 3, '2026-06-23', 'MP4', 'Delivered'),
(4, 4, '2026-06-28', 'JPEG', 'Editing'),
(5, 5, '2026-07-12', 'MP4', 'Pending');

-- ============================================
-- PASO 3: Consultas básicas
-- ============================================

-- Mostrar todos los clientes
SELECT *
FROM clients;

-- Mostrar todos los paquetes
SELECT *
FROM packages;

-- Mostrar los nombres de los paquetes ordenados alfabéticamente
SELECT package_name
FROM packages
ORDER BY package_name ASC;

-- Contar el total de clientes
SELECT COUNT(*) AS total_clients
FROM clients;

-- Contar el total de sesiones
SELECT COUNT(*) AS total_sessions
FROM sessions;

-- ============================================
-- PASO 4: Consultas con relaciones
-- ============================================

-- Mostrar sesiones con información del cliente y paquete
SELECT
    s.session_id,
    c.first_name,
    c.last_name,
    p.package_name,
    s.session_date,
    s.location,
    s.status
FROM sessions s
INNER JOIN clients c
    ON s.client_id = c.client_id
INNER JOIN packages p
    ON s.package_id = p.package_id;

-- Mostrar entregas con información del cliente
SELECT
    d.delivery_id,
    c.first_name,
    c.last_name,
    p.package_name,
    d.delivery_date,
    d.file_format,
    d.delivery_status
FROM deliveries d
INNER JOIN sessions s
    ON d.session_id = s.session_id
INNER JOIN clients c
    ON s.client_id = c.client_id
INNER JOIN packages p
    ON s.package_id = p.package_id;

-- TODO: Contar cuántos items tienes en total
-- SELECT COUNT(*) AS total_items
-- FROM   items;
