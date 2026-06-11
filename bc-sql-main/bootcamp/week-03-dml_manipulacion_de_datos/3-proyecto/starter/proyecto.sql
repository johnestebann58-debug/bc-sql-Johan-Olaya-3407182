-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03 — INSERT INTO, UPDATE, DELETE
-- ============================================

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- Agregar 5 nuevos clientes

INSERT INTO clients (
    client_id,
    first_name,
    last_name,
    email,
    phone_number,
    city,
    is_active
)
VALUES
(21,'Carlos','Ramirez','carlos.ramirez@email.com','3021000001','Bogotá',1),
(22,'Laura','Moreno','laura.moreno@email.com','3021000002','Medellín',1),
(23,'Andrés','Castro','andres.castro@email.com','3021000003','Cali',1),
(24,'Valentina','Rojas','valentina.rojas@email.com','3021000004','Barranquilla',1),
(25,'Santiago','Gómez','santiago.gomez@email.com','3021000005','Bucaramanga',1);

-- Agregar 5 nuevos paquetes

INSERT INTO packages (
    package_id,
    package_name,
    package_type,
    price,
    duration_hours,
    is_available
)
VALUES
(21,'Birthday Premium','Photography',750,4,1),
(22,'Wedding Deluxe','Photography & Video',2500,12,1),
(23,'Business Portrait','Photography',500,2,1),
(24,'Drone Event','Video',1600,6,1),
(25,'Influencer Pack','Photography & Video',1800,5,1);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar una columna

UPDATE clients
SET city = 'Cartagena'
WHERE client_id = 21;

-- Actualizar varias columnas

UPDATE packages
SET
    price = 2900,
    duration_hours = 14
WHERE package_id = 22;

-- Actualizar múltiples registros

UPDATE deliveries
SET delivery_status = 'Delivered'
WHERE delivery_status = 'Pending';

-- ============================================
-- PARTE 3: DELETE
-- ============================================

-- Verificar los registros

SELECT 
    client_id,
    first_name,
    last_name,
    email,
    phone_number,
    city,
    is_active
FROM clients
WHERE client_id IN (24,25);

-- Eliminarlos

DELETE FROM clients
WHERE client_id IN (24,25);

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT
    client_id,
    first_name,
    last_name,
    email,
    phone_number,
    city,
    is_active
FROM clients
ORDER BY client_id;

SELECT 
    package_id,
    package_name,
    package_type,
    price,
    duration_hours,
    is_available
FROM packages
ORDER BY package_id;

SELECT 
    session_id,
    client_id,
    package_id,
    session_date,
    location,
    status
FROM sessions
ORDER BY session_id;

SELECT 
    delivery_id,
    session_id,
    delivery_date,
    file_format,
    delivery_status
FROM deliveries
ORDER BY delivery_id;
