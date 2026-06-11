-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07 — NOT NULL, UNIQUE, CHECK, FK
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: AMPLIAR EL ESQUEMA
-- ============================================

-- Agregar una columna opcional para practicar NULL

ALTER TABLE sessions
ADD COLUMN notes TEXT;

-- ============================================
-- PARTE 2: DATOS DE PRUEBA
-- ============================================

-- Agregar observaciones a algunas sesiones.
-- Las demás permanecerán en NULL.

UPDATE sessions
SET notes = 'Cliente solicitó edición premium'
WHERE session_id = 5;

UPDATE sessions
SET notes = 'Entregar antes del fin de semana'
WHERE session_id = 12;

UPDATE sessions
SET notes = 'Incluir fotografías en blanco y negro'
WHERE session_id = 18;

UPDATE sessions
SET notes = 'Sesión reprogramada por lluvia'
WHERE session_id = 25;

UPDATE sessions
SET notes = 'Agregar versión para redes sociales'
WHERE session_id = 40;

-- ============================================
-- PARTE 3: CONSULTAS CON NULL
-- ============================================

-- Mostrar sesiones donde notes es NULL

SELECT
    session_id      AS "ID Sesión",
    client_id       AS "Cliente",
    location        AS "Ubicación",
    notes           AS "Observaciones"
FROM sessions
WHERE notes IS NULL
ORDER BY session_id;

-- Mostrar todas las sesiones reemplazando NULL

SELECT
    session_id                         AS "ID Sesión",
    location                           AS "Ubicación",
    COALESCE(notes,'Sin observaciones') AS "Observaciones",
    status                             AS "Estado"
FROM sessions
ORDER BY session_id;

SELECT COUNT(*) AS total_sesiones
FROM sessions;

SELECT COUNT(*) FROM clients;

SELECT COUNT(*) FROM packages;

SELECT COUNT(*) FROM sessions;

SELECT COUNT(*) FROM deliveries;