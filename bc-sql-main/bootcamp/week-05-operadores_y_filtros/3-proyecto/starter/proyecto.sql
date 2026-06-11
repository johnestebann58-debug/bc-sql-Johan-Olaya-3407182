-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- Esquema: photography database
-- SELECTS ESPECÍFICOS (NO SELECT *)
-- ============================================


-- ============================================
-- CONSULTA 1: BETWEEN (rango de precios)
-- ============================================
SELECT 
    package_id,
    package_name,
    package_type,
    price,
    duration_hours
FROM packages
WHERE price BETWEEN 100000 AND 500000;


-- ============================================
-- CONSULTA 2: IN (tipos de paquetes)
-- ============================================
SELECT 
    package_id,
    package_name,
    package_type,
    price,
    is_available
FROM packages
WHERE package_type IN ('Photography', 'Video');


-- ============================================
-- CONSULTA 3: LIKE (búsqueda de texto)
-- ============================================
SELECT 
    client_id,
    first_name,
    last_name,
    email,
    city
FROM clients
WHERE first_name LIKE '%a%';


-- ============================================
-- CONSULTA 4: COMBINADA (BETWEEN + IN + LIKE)
-- ============================================
SELECT 
    p.package_id,
    p.package_name,
    p.package_type,
    p.price,
    p.duration_hours
FROM packages p
WHERE p.price BETWEEN 100000 AND 800000
  AND p.package_type IN ('Photography', 'Photography & Video')
  AND p.package_name LIKE '%Pro%'
ORDER BY p.price;