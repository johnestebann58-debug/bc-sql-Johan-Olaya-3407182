-- ============================================
-- PROYECTO SEMANAL: JOINs aplicados a tu dominio
-- Semana 09 — INNER JOIN y LEFT JOIN
-- ============================================

-- NOTA PARA EL APRENDIZ:
-- Adapta este esquema a tu dominio asignado.
-- Ejemplos de adaptación:
--   Biblioteca  → books, members, loans
--   Farmacia    → medicines, suppliers, sales
--   Gimnasio    → members, trainers, routines
--   Restaurante → dishes, categories, orders
-- NO copies uno de estos ejemplos; usa tu dominio propio.

PRAGMA foreign_keys = ON;

-- ============================================
-- TABLA DE REFERENCIA
-- Categorías de equipos
-- ============================================

DROP TABLE IF EXISTS equipment_usage;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS equipment_categories;

CREATE TABLE equipment_categories (
    category_id     INTEGER PRIMARY KEY,
    category_name   TEXT NOT NULL UNIQUE,
    description     TEXT
);

-- ============================================
-- TABLA PRINCIPAL
-- Equipos
-- ============================================

CREATE TABLE equipment (
    equipment_id     INTEGER PRIMARY KEY,
    equipment_name   TEXT NOT NULL,
    serial_number    TEXT NOT NULL UNIQUE,
    purchase_price   REAL NOT NULL
                      CHECK (purchase_price > 0),
    status           TEXT NOT NULL DEFAULT 'Available'
                      CHECK (status IN
                      ('Available',
                       'In Use',
                       'Maintenance')),
    category_id      INTEGER NOT NULL,

    FOREIGN KEY (category_id)
        REFERENCES equipment_categories(category_id)
        ON DELETE RESTRICT
);

-- ============================================
-- TABLA HIJA
-- Registro de uso del equipo
-- ============================================

CREATE TABLE equipment_usage (
    usage_id        INTEGER PRIMARY KEY,
    recorded_at     TEXT NOT NULL
                    DEFAULT (DATE('now')),
    session_id      INTEGER NOT NULL,
    equipment_id    INTEGER NOT NULL,
    usage_hours     REAL NOT NULL
                    CHECK (usage_hours > 0),

    FOREIGN KEY (session_id)
        REFERENCES sessions(session_id)
        ON DELETE RESTRICT,

    FOREIGN KEY (equipment_id)
        REFERENCES equipment(equipment_id)
        ON DELETE RESTRICT
);

--- ============================================
-- DATOS DE PRUEBA
-- ============================================

-- ============================================
-- Categorías de equipos
-- ============================================

INSERT INTO equipment_categories (category_id, category_name, description) VALUES
(1, 'Categoría 1', 'Descripción categoría 1'),
(2, 'Categoría 2', 'Descripción categoría 2'),
(3, 'Categoría 3', 'Descripción categoría 3'),
(4, 'Categoría 4', 'Descripción categoría 4'),
(5, 'Categoría 5', 'Descripción categoría 5'),
(6, 'Categoría 6', 'Descripción categoría 6'),
(7, 'Categoría 7', 'Descripción categoría 7'),
(8, 'Categoría 8', 'Descripción categoría 8'),
(9, 'Categoría 9', 'Descripción categoría 9'),
(10, 'Categoría 10', 'Descripción categoría 10'),
(11, 'Categoría 11', 'Descripción categoría 11'),
(12, 'Categoría 12', 'Descripción categoría 12'),
(13, 'Categoría 13', 'Descripción categoría 13'),
(14, 'Categoría 14', 'Descripción categoría 14'),
(15, 'Categoría 15', 'Descripción categoría 15'),
(16, 'Categoría 16', 'Descripción categoría 16'),
(17, 'Categoría 17', 'Descripción categoría 17'),
(18, 'Categoría 18', 'Descripción categoría 18'),
(19, 'Categoría 19', 'Descripción categoría 19'),
(20, 'Categoría 20', 'Descripción categoría 20');
-- ============================================
-- Equipos
-- ============================================

INSERT INTO equipment (equipment_id,equipment_name,serial_number,purchase_price,status,category_id) VALUES
(1,'Equipo 1','SER0001',1250,'Available',1),
(2,'Equipo 2','SER0002',1500,'In Use',2),
(3,'Equipo 3','SER0003',1750,'Maintenance',3),
(4,'Equipo 4','SER0004',2000,'Available',4),
(5,'Equipo 5','SER0005',2250,'In Use',5),
(6,'Equipo 6','SER0006',2500,'Maintenance',6),
(7,'Equipo 7','SER0007',2750,'Available',7),
(8,'Equipo 8','SER0008',3000,'In Use',8),
(9,'Equipo 9','SER0009',3250,'Maintenance',9),
(10,'Equipo 10','SER0010',3500,'Available',10),
(11,'Equipo 11','SER0011',3750,'In Use',11),
(12,'Equipo 12','SER0012',4000,'Maintenance',12),
(13,'Equipo 13','SER0013',4250,'Available',13),
(14,'Equipo 14','SER0014',4500,'In Use',14),
(15,'Equipo 15','SER0015',4750,'Maintenance',15),
(16,'Equipo 16','SER0016',5000,'Available',16),
(17,'Equipo 17','SER0017',5250,'In Use',17),
(18,'Equipo 18','SER0018',5500,'Maintenance',18),
(19,'Equipo 19','SER0019',5750,'Available',19),
(20,'Equipo 20','SER0020',6000,'In Use',20);

-- ============================================
-- Registro de uso de equipos
-- ============================================

INSERT INTO equipment_usage (usage_id,recorded_at,session_id,equipment_id,usage_hours) VALUES
(1,'2026-09-01',1,1,2),
(2,'2026-09-02',2,2,3),
(3,'2026-09-03',3,3,4),
(4,'2026-09-04',4,4,5),
(5,'2026-09-05',5,5,1),
(6,'2026-09-06',6,6,2),
(7,'2026-09-07',7,7,3),
(8,'2026-09-08',8,8,4),
(9,'2026-09-09',9,9,5),
(10,'2026-09-10',10,10,1),
(11,'2026-09-11',11,11,2),
(12,'2026-09-12',12,12,3),
(13,'2026-09-13',13,13,4),
(14,'2026-09-14',14,14,5),
(15,'2026-09-15',15,15,1),
(16,'2026-09-16',16,16,2),
(17,'2026-09-17',17,17,3),
(18,'2026-09-18',18,18,4),
(19,'2026-09-19',19,19,5);



-- ============================================
-- CONSULTA 1: INNER JOIN principal
-- Une las tablas equipment y equipment_usage
-- Muestra solo los equipos que tienen registros de uso
-- ============================================

SELECT
    e.equipment_name AS equipo,
    eu.recorded_at AS fecha_registro,
    eu.usage_hours AS horas_de_uso
FROM equipment e
INNER JOIN equipment_usage eu
    ON e.equipment_id = eu.equipment_id;


-- ============================================
-- CONSULTA 2: JOIN con tres tablas
-- Une categorías + equipos + registros de uso
-- ============================================

SELECT
    ec.category_name AS categoria,
    e.equipment_name AS equipo,
    eu.recorded_at AS fecha_registro,
    eu.usage_hours AS horas_de_uso
FROM equipment_categories ec
INNER JOIN equipment e
    ON ec.category_id = e.category_id
INNER JOIN equipment_usage eu
    ON e.equipment_id = eu.equipment_id;


-- ============================================
-- CONSULTA 3: LEFT JOIN
-- Mostrar todos los equipos, incluso si nunca han sido utilizados
-- ============================================

SELECT
    e.equipment_name AS equipo,
    eu.recorded_at AS fecha_registro,
    eu.usage_hours AS horas_de_uso
FROM equipment e
LEFT JOIN equipment_usage eu
    ON e.equipment_id = eu.equipment_id;


-- ============================================
-- CONSULTA 4: Detectar registros huérfanos
-- Equipos sin ningún registro de uso
-- ============================================

SELECT
    e.equipment_name AS equipo_sin_uso
FROM equipment e
LEFT JOIN equipment_usage eu
    ON e.equipment_id = eu.equipment_id
WHERE eu.usage_id IS NULL;


-- ============================================
-- CONSULTA 5: Reporte agregado
-- Cantidad de usos por cada equipo
-- ============================================

SELECT
    e.equipment_name AS equipo,
    COUNT(eu.usage_id) AS total_registros
FROM equipment e
LEFT JOIN equipment_usage eu
    ON e.equipment_id = eu.equipment_id
GROUP BY
    e.equipment_id,
    e.equipment_name
ORDER BY total_registros DESC;
