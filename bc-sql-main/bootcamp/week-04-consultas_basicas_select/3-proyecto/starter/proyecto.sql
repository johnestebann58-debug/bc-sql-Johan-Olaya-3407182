-- ============================================
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — SELECT, WHERE, ORDER BY, LIMIT/OFFSET
-- ============================================

-- ============================================
-- CONSULTA 1: Listado general con alias
-- ============================================

SELECT
    client_id      AS "ID Cliente",
    first_name     AS "Nombre",
    last_name      AS "Apellido",
    city           AS "Ciudad",
    email          AS "Correo Electrónico"
FROM clients
ORDER BY last_name ASC;


-- ============================================
-- CONSULTA 2: Filtro por igualdad
-- ============================================

SELECT
    package_id     AS "ID Paquete",
    package_name   AS "Nombre del Paquete",
    package_type   AS "Tipo",
    price          AS "Precio"
FROM packages
WHERE package_type = 'Photography';


-- ============================================
-- CONSULTA 3: Filtro por comparación
-- ============================================

SELECT
    package_id      AS "ID",
    package_name    AS "Paquete",
    price           AS "Precio"
FROM packages
WHERE price > 1000
ORDER BY price DESC;


-- ============================================
-- CONSULTA 4: Filtro combinado (AND)
-- ============================================

SELECT
    session_id      AS "Sesión",
    client_id       AS "Cliente",
    package_id      AS "Paquete",
    session_date    AS "Fecha",
    status          AS "Estado"
FROM sessions
WHERE status = 'Completed'
AND package_id >= 10
ORDER BY session_date DESC;


-- ============================================
-- CONSULTA 5: Uso de LIKE
-- ============================================

SELECT
    client_id       AS "ID",
    first_name      AS "Nombre",
    last_name       AS "Apellido",
    city            AS "Ciudad"
FROM clients
WHERE city LIKE 'Bog%'
ORDER BY first_name ASC;


-- ============================================
-- CONSULTA 6: Top 5 paquetes más costosos
-- ============================================

SELECT
    package_id      AS "ID",
    package_name    AS "Paquete",
    price           AS "Precio"
FROM packages
ORDER BY price DESC
LIMIT 5;


-- ============================================
-- CONSULTA 7: Paginación (Página 1)
-- ============================================

SELECT
    client_id       AS "ID",
    first_name      AS "Nombre",
    last_name       AS "Apellido",
    city            AS "Ciudad"
FROM clients
ORDER BY client_id ASC
LIMIT 3 OFFSET 0;


-- ============================================
-- CONSULTA 8: Paginación (Página 2)
-- ============================================

SELECT
    client_id       AS "ID",
    first_name      AS "Nombre",
    last_name       AS "Apellido",
    city            AS "Ciudad"
FROM clients
ORDER BY client_id ASC
LIMIT 3 OFFSET 3;