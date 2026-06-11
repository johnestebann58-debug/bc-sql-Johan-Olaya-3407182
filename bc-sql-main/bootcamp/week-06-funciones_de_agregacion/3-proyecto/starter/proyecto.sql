-- ============================================
-- PROYECTO SEMANAL: Funciones de Agregación
-- Semana 06 — COUNT, SUM, AVG, GROUP BY, HAVING
-- ============================================

-- TABLAS USADAS:
-- clients, packages, sessions, deliveries

-- ============================================
-- REPORTE 1: Totales globales
-- ============================================
-- Total de clientes, suma de precios de paquetes y promedio

SELECT
    COUNT(*) AS total_clients,
    SUM(price) AS suma_total_paquetes,
    AVG(price) AS promedio_precio_paquetes
FROM packages;


-- ============================================
-- REPORTE 2: Extremos
-- ============================================
-- Precio mínimo y máximo de los paquetes

SELECT
    MIN(price) AS precio_minimo,
    MAX(price) AS precio_maximo
FROM packages;


-- ============================================
-- REPORTE 3: Subtotales por categoría (GROUP BY)
-- ============================================
-- Cantidad de paquetes y promedio de precio por tipo

SELECT
    package_type,
    COUNT(*) AS total_paquetes,
    AVG(price) AS promedio_precio
FROM packages
GROUP BY package_type
ORDER BY total_paquetes DESC;


-- ============================================
-- REPORTE 4: GROUP BY con clientes por ciudad
-- ============================================

SELECT
    city,
    COUNT(*) AS total_clientes
FROM clients
GROUP BY city
ORDER BY total_clientes DESC;


-- ============================================
-- REPORTE 5: Sesiones por estado
-- ============================================

SELECT
    status,
    COUNT(*) AS total_sesiones
FROM sessions
GROUP BY status
ORDER BY total_sesiones DESC;


-- ============================================
-- REPORTE 6: HAVING (filtro de grupos)
-- ============================================
-- Ciudades con más de 1 cliente

SELECT
    city,
    COUNT(*) AS total_clientes
FROM clients
GROUP BY city
HAVING COUNT(*) > 1;


-- ============================================
-- REPORTE 7: Paquetes más usados en sesiones
-- ============================================

SELECT
    p.package_name,
    COUNT(s.session_id) AS total_sesiones
FROM sessions s
INNER JOIN packages p ON s.package_id = p.package_id
GROUP BY p.package_name
ORDER BY total_sesiones DESC;


-- ============================================
-- REPORTE 8: Promedio de duración por tipo de paquete
-- ============================================

SELECT
    package_type,
    AVG(duration_hours) AS promedio_duracion
FROM packages
GROUP BY package_type;


-- ============================================
-- REPORTE 9: Entregas por estado
-- ============================================

SELECT
    delivery_status,
    COUNT(*) AS total_entregas
FROM deliveries
GROUP BY delivery_status;


-- ============================================
-- REPORTE 10: HAVING en sesiones
-- ============================================
-- Solo estados con más de 1 sesión

SELECT
    status,
    COUNT(*) AS total
FROM sessions
GROUP BY status
HAVING COUNT(*) > 1;