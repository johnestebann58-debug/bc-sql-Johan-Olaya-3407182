-- ============================================
-- PROYECTO INTEGRADOR: Etapa 0 — Capstone
-- Semana 08 — DDL + DML + SELECT completo
-- Dominio: Estudio de Fotografía y Video
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- PARTE 1: ESQUEMA (DDL)
-- ============================================

DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS packages;
DROP TABLE IF EXISTS clients;

-- ============================================
-- TABLA: CLIENTES
-- ============================================

CREATE TABLE clients (
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

CREATE TABLE packages (
    package_id      INTEGER PRIMARY KEY,
    package_name    TEXT NOT NULL UNIQUE,
    package_type    TEXT NOT NULL
                    CHECK(package_type IN
                    ('Photography',
                     'Video',
                     'Photography & Video')),
    price           REAL NOT NULL
                    CHECK(price > 0),
    duration_hours  INTEGER NOT NULL
                    CHECK(duration_hours > 0),
    is_available    INTEGER NOT NULL DEFAULT 1
                    CHECK(is_available IN (0,1))
);

-- ============================================
-- TABLA: SESIONES
-- ============================================

CREATE TABLE sessions (
    session_id      INTEGER PRIMARY KEY,
    client_id       INTEGER NOT NULL,
    package_id      INTEGER NOT NULL,
    session_date    TEXT NOT NULL,
    location        TEXT NOT NULL,
    notes           TEXT,
    status          TEXT NOT NULL DEFAULT 'Scheduled'
                    CHECK(status IN
                    ('Scheduled',
                     'Completed',
                     'Cancelled',
                     'Editing')),

    FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
        ON DELETE RESTRICT,

    FOREIGN KEY (package_id)
        REFERENCES packages(package_id)
        ON DELETE RESTRICT
);

-- ============================================
-- TABLA: ENTREGAS
-- ============================================

CREATE TABLE deliveries (
    delivery_id      INTEGER PRIMARY KEY,
    session_id       INTEGER NOT NULL,
    delivery_date    TEXT NOT NULL,
    file_format      TEXT NOT NULL
                     CHECK(file_format IN
                     ('JPEG',
                      'PNG',
                      'RAW',
                      'MP4')),
    delivery_status  TEXT NOT NULL DEFAULT 'Pending'
                     CHECK(delivery_status IN
                     ('Pending',
                      'Editing',
                      'Delivered')),

    FOREIGN KEY (session_id)
        REFERENCES sessions(session_id)
        ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS (DML)
-- ============================================
-- Seed data Semana 08
-- CLIENTS
INSERT INTO clients (client_id,first_name,last_name,email,phone_number,city,is_active) VALUES
(1,'Name1','Last1','user1@mail.com','3100000001','Bogotá',1),
(2,'Name2','Last2','user2@mail.com','3100000002','Bogotá',1),
(3,'Name3','Last3','user3@mail.com','3100000003','Bogotá',1),
(4,'Name4','Last4','user4@mail.com','3100000004','Bogotá',1),
(5,'Name5','Last5','user5@mail.com','3100000005','Bogotá',1),
(6,'Name6','Last6','user6@mail.com','3100000006','Bogotá',1),
(7,'Name7','Last7','user7@mail.com','3100000007','Bogotá',1),
(8,'Name8','Last8','user8@mail.com','3100000008','Bogotá',1),
(9,'Name9','Last9','user9@mail.com','3100000009','Bogotá',1),
(10,'Name10','Last10','user10@mail.com','3100000010','Bogotá',1),
(11,'Name11','Last11','user11@mail.com','3100000011','Bogotá',1),
(12,'Name12','Last12','user12@mail.com','3100000012','Bogotá',1),
(13,'Name13','Last13','user13@mail.com','3100000013','Bogotá',1),
(14,'Name14','Last14','user14@mail.com','3100000014','Bogotá',1),
(15,'Name15','Last15','user15@mail.com','3100000015','Bogotá',1),
(16,'Name16','Last16','user16@mail.com','3100000016','Bogotá',1),
(17,'Name17','Last17','user17@mail.com','3100000017','Bogotá',1),
(18,'Name18','Last18','user18@mail.com','3100000018','Bogotá',1),
(19,'Name19','Last19','user19@mail.com','3100000019','Bogotá',1),
(20,'Name20','Last20','user20@mail.com','3100000020','Bogotá',1),
(21,'Name21','Last21','user21@mail.com','3100000021','Bogotá',1),
(22,'Name22','Last22','user22@mail.com','3100000022','Bogotá',1),
(23,'Name23','Last23','user23@mail.com','3100000023','Bogotá',1),
(24,'Name24','Last24','user24@mail.com','3100000024','Bogotá',1),
(25,'Name25','Last25','user25@mail.com','3100000025','Bogotá',1),
(26,'Name26','Last26','user26@mail.com','3100000026','Bogotá',1),
(27,'Name27','Last27','user27@mail.com','3100000027','Bogotá',1),
(28,'Name28','Last28','user28@mail.com','3100000028','Bogotá',1),
(29,'Name29','Last29','user29@mail.com','3100000029','Bogotá',1),
(30,'Name30','Last30','user30@mail.com','3100000030','Bogotá',1),
(31,'Name31','Last31','user31@mail.com','3100000031','Bogotá',1),
(32,'Name32','Last32','user32@mail.com','3100000032','Bogotá',1),
(33,'Name33','Last33','user33@mail.com','3100000033','Bogotá',1),
(34,'Name34','Last34','user34@mail.com','3100000034','Bogotá',1),
(35,'Name35','Last35','user35@mail.com','3100000035','Bogotá',1),
(36,'Name36','Last36','user36@mail.com','3100000036','Bogotá',1),
(37,'Name37','Last37','user37@mail.com','3100000037','Bogotá',1),
(38,'Name38','Last38','user38@mail.com','3100000038','Bogotá',1),
(39,'Name39','Last39','user39@mail.com','3100000039','Bogotá',1),
(40,'Name40','Last40','user40@mail.com','3100000040','Bogotá',1);

INSERT INTO packages (package_id,package_name,package_type,price,duration_hours,is_available) VALUES
(1,'Package 1','Photography',550,3,1),
(2,'Package 2','Video',600,4,1),
(3,'Package 3','Photography & Video',650,5,1),
(4,'Package 4','Photography',700,6,1),
(5,'Package 5','Video',750,7,1),
(6,'Package 6','Photography & Video',800,2,1),
(7,'Package 7','Photography',850,3,1),
(8,'Package 8','Video',900,4,1),
(9,'Package 9','Photography & Video',950,5,1),
(10,'Package 10','Photography',1000,6,1),
(11,'Package 11','Video',1050,7,1),
(12,'Package 12','Photography & Video',1100,2,1),
(13,'Package 13','Photography',1150,3,1),
(14,'Package 14','Video',1200,4,1),
(15,'Package 15','Photography & Video',1250,5,1),
(16,'Package 16','Photography',1300,6,1),
(17,'Package 17','Video',1350,7,1),
(18,'Package 18','Photography & Video',1400,2,1),
(19,'Package 19','Photography',1450,3,1),
(20,'Package 20','Video',1500,4,1),
(21,'Package 21','Photography & Video',1550,5,1),
(22,'Package 22','Photography',1600,6,1),
(23,'Package 23','Video',1650,7,1),
(24,'Package 24','Photography & Video',1700,2,1),
(25,'Package 25','Photography',1750,3,1),
(26,'Package 26','Video',1800,4,1),
(27,'Package 27','Photography & Video',1850,5,1),
(28,'Package 28','Photography',1900,6,1),
(29,'Package 29','Video',1950,7,1),
(30,'Package 30','Photography & Video',2000,2,1),
(31,'Package 31','Photography',2050,3,1),
(32,'Package 32','Video',2100,4,1),
(33,'Package 33','Photography & Video',2150,5,1),
(34,'Package 34','Photography',2200,6,1),
(35,'Package 35','Video',2250,7,1),
(36,'Package 36','Photography & Video',2300,2,1),
(37,'Package 37','Photography',2350,3,1),
(38,'Package 38','Video',2400,4,1),
(39,'Package 39','Photography & Video',2450,5,1),
(40,'Package 40','Photography',2500,6,1);

INSERT INTO sessions (session_id,client_id,package_id,session_date,location,notes,status) VALUES
(1,1,1,'2026-09-02','Location 1','Observación 1','Scheduled'),
(2,2,2,'2026-09-03','Location 2','Observación 2','Completed'),
(3,3,3,'2026-09-04','Location 3','Observación 3','Editing'),
(4,4,4,'2026-09-05','Location 4','Observación 4','Cancelled'),
(5,5,5,'2026-09-06','Location 5',NULL,'Scheduled'),
(6,6,6,'2026-09-07','Location 6','Observación 6','Completed'),
(7,7,7,'2026-09-08','Location 7','Observación 7','Editing'),
(8,8,8,'2026-09-09','Location 8','Observación 8','Cancelled'),
(9,9,9,'2026-09-10','Location 9','Observación 9','Scheduled'),
(10,10,10,'2026-09-11','Location 10',NULL,'Completed'),
(11,11,11,'2026-09-12','Location 11','Observación 11','Editing'),
(12,12,12,'2026-09-13','Location 12','Observación 12','Cancelled'),
(13,13,13,'2026-09-14','Location 13','Observación 13','Scheduled'),
(14,14,14,'2026-09-15','Location 14','Observación 14','Completed'),
(15,15,15,'2026-09-16','Location 15',NULL,'Editing'),
(16,16,16,'2026-09-17','Location 16','Observación 16','Cancelled'),
(17,17,17,'2026-09-18','Location 17','Observación 17','Scheduled'),
(18,18,18,'2026-09-19','Location 18','Observación 18','Completed'),
(19,19,19,'2026-09-20','Location 19','Observación 19','Editing'),
(20,20,20,'2026-09-21','Location 20',NULL,'Cancelled'),
(21,21,21,'2026-09-22','Location 21','Observación 21','Scheduled'),
(22,22,22,'2026-09-23','Location 22','Observación 22','Completed'),
(23,23,23,'2026-09-24','Location 23','Observación 23','Editing'),
(24,24,24,'2026-09-25','Location 24','Observación 24','Cancelled'),
(25,25,25,'2026-09-26','Location 25',NULL,'Scheduled'),
(26,26,26,'2026-09-27','Location 26','Observación 26','Completed'),
(27,27,27,'2026-09-28','Location 27','Observación 27','Editing'),
(28,28,28,'2026-09-01','Location 28','Observación 28','Cancelled'),
(29,29,29,'2026-09-02','Location 29','Observación 29','Scheduled'),
(30,30,30,'2026-09-03','Location 30',NULL,'Completed'),
(31,31,31,'2026-09-04','Location 31','Observación 31','Editing'),
(32,32,32,'2026-09-05','Location 32','Observación 32','Cancelled'),
(33,33,33,'2026-09-06','Location 33','Observación 33','Scheduled'),
(34,34,34,'2026-09-07','Location 34','Observación 34','Completed'),
(35,35,35,'2026-09-08','Location 35',NULL,'Editing'),
(36,36,36,'2026-09-09','Location 36','Observación 36','Cancelled'),
(37,37,37,'2026-09-10','Location 37','Observación 37','Scheduled'),
(38,38,38,'2026-09-11','Location 38','Observación 38','Completed'),
(39,39,39,'2026-09-12','Location 39','Observación 39','Editing'),
(40,40,40,'2026-09-13','Location 40',NULL,'Cancelled');

INSERT INTO deliveries (delivery_id,session_id,delivery_date,file_format,delivery_status) VALUES
(1,1,'2026-10-02','JPEG','Pending'),
(2,2,'2026-10-03','PNG','Editing'),
(3,3,'2026-10-04','RAW','Delivered'),
(4,4,'2026-10-05','MP4','Pending'),
(5,5,'2026-10-06','JPEG','Editing'),
(6,6,'2026-10-07','PNG','Delivered'),
(7,7,'2026-10-08','RAW','Pending'),
(8,8,'2026-10-09','MP4','Editing'),
(9,9,'2026-10-10','JPEG','Delivered'),
(10,10,'2026-10-11','PNG','Pending'),
(11,11,'2026-10-12','RAW','Editing'),
(12,12,'2026-10-13','MP4','Delivered'),
(13,13,'2026-10-14','JPEG','Pending'),
(14,14,'2026-10-15','PNG','Editing'),
(15,15,'2026-10-16','RAW','Delivered'),
(16,16,'2026-10-17','MP4','Pending'),
(17,17,'2026-10-18','JPEG','Editing'),
(18,18,'2026-10-19','PNG','Delivered'),
(19,19,'2026-10-20','RAW','Pending'),
(20,20,'2026-10-21','MP4','Editing'),
(21,21,'2026-10-22','JPEG','Delivered'),
(22,22,'2026-10-23','PNG','Pending'),
(23,23,'2026-10-24','RAW','Editing'),
(24,24,'2026-10-25','MP4','Delivered'),
(25,25,'2026-10-26','JPEG','Pending'),
(26,26,'2026-10-27','PNG','Editing'),
(27,27,'2026-10-28','RAW','Delivered'),
(28,28,'2026-10-01','MP4','Pending'),
(29,29,'2026-10-02','JPEG','Editing'),
(30,30,'2026-10-03','PNG','Delivered'),
(31,31,'2026-10-04','RAW','Pending'),
(32,32,'2026-10-05','MP4','Editing'),
(33,33,'2026-10-06','JPEG','Delivered'),
(34,34,'2026-10-07','PNG','Pending'),
(35,35,'2026-10-08','RAW','Editing'),
(36,36,'2026-10-09','MP4','Delivered'),
(37,37,'2026-10-10','JPEG','Pending'),
(38,38,'2026-10-11','PNG','Editing'),
(39,39,'2026-10-12','RAW','Delivered'),
(40,40,'2026-10-13','MP4','Pending');

-- ============================================
-- PARTE 3: REPORTES (SELECT)
-- ============================================

-- ============================================
-- REPORTE 1: Totales globales
-- COUNT + SUM + AVG
-- ============================================

SELECT
    COUNT(package_id) AS total_paquetes,
    SUM(price) AS valor_total_paquetes,
    AVG(price) AS precio_promedio
FROM packages;


-- ============================================
-- REPORTE 2: Reporte por categoría
-- GROUP BY + ORDER BY
-- Categoría = Tipo de paquete
-- ============================================

SELECT
    package_type AS tipo_paquete,
    COUNT(package_id) AS cantidad_paquetes,
    AVG(price) AS precio_promedio
FROM packages
GROUP BY package_type
ORDER BY cantidad_paquetes DESC;


-- ============================================
-- REPORTE 3: Grupos con umbral
-- GROUP BY + HAVING
-- ============================================

SELECT
    status AS estado_sesion,
    COUNT(session_id) AS total_sesiones
FROM sessions
GROUP BY status
HAVING COUNT(session_id) > 5;


-- ============================================
-- REPORTE 4: Manejo de NULL
-- IS NULL + COALESCE
-- ============================================

SELECT
    session_id,
    location,
    COALESCE(notes, 'Sin observaciones') AS observaciones
FROM sessions
WHERE notes IS NULL;


-- ============================================
-- REPORTE 5: Búsqueda combinada
-- WHERE + BETWEEN + LIKE
-- ============================================

SELECT
    package_name,
    package_type,
    price,
    duration_hours
FROM packages
WHERE price BETWEEN 1000 AND 2500
  AND package_name LIKE 'Package%'
ORDER BY price DESC
LIMIT 5;