-- Creo la estructura de la base de datos
source teachTime-schema.sql
-- mysql> show tables;
-- +------------------------+
-- | Tables_in_TeachTime    |
-- +------------------------+
-- | asignatura             |
-- | authorities            |
-- | curso                  |
-- | departamento           |
-- | fichar                 |
-- | horario                |
-- | jefedepartamento       |
-- | profecurso             |
-- | profedepartamento      |
-- | profehorario           |
-- | profeobservaciones     |
-- | profesor               |
-- | repartohorarioprofesor |
-- | rol                    |
-- | tipohora               |
-- | tutor                  |
-- | users                  |
-- +------------------------+
-- 17 rows in set (0,00 sec)
-- Creo datos para la base de datos
source teachTime-data.sql
-- mysql> select * from curso;
-- +--------+-------+-------+---------------------------------------------------+--------------+
-- | id     | grado | grupo | nombre                                            | etapa        |
-- +--------+-------+-------+---------------------------------------------------+--------------+
-- | 1BACHA | 1BACH | A     | Primero Bachillerato A                            | BACHILLERATO |
-- | 1DAM   | 1DAM  | NULL  | Primero Desarollo de Aplicaciones Multiplataforma | FPGS         |
-- | 2DAW   | 2DAW  | NULL  | Segundo Desarollo de Aplicaciones Web             | FPGS         |
-- | 2ESOB  | grado | B     | nombre                                            | ESO          |
-- +--------+-------+-------+---------------------------------------------------+--------------+
-- 4 rows in set (0,00 sec)

-- Crear 3 vistas que combinen 3 tablas cada una

DELIMITER $$
DROP VIEW IF EXISTS tutores_curso
$$
CREATE VIEW tutores_curso AS
(SELECT c.id, c.grado, c.grupo, c.nombre AS curso, t.aula, p.nombre AS nombre_profesor, p.apellido AS apellido_profesor 
FROM curso AS c JOIN tutor AS t ON c.id = t.curso JOIN profesor AS p ON t.profe = p.id)
$$
-- mysql> select * from tutores_curso$$
-- +--------+-------+-------+---------------------------------------------------+----------+-----------------+-------------------+
-- | id     | grado | grupo | curso                                             | aula     | nombre_profesor | apellido_profesor |
-- +--------+-------+-------+---------------------------------------------------+----------+-----------------+-------------------+
-- | 1BACHA | 1BACH | A     | Primero Bachillerato A                            | Aula 101 | Guillermo       | Sicilia           |
-- | 2ESOB  | grado | B     | nombre                                            | Aula 202 | Maria           | Cabrera           |
-- | 1DAM   | 1DAM  | NULL  | Primero Desarollo de Aplicaciones Multiplataforma | Aula 103 | Pedro           | Martinez          |
-- +--------+-------+-------+---------------------------------------------------+----------+-----------------+-------------------+
-- 3 rows in set (0,00 sec)

DROP VIEW IF EXISTS jefes_departamento
$$
CREATE VIEW jefes_departamento AS
(SELECT d.id, d.nombre AS departamento, p.nombre AS nombre_profesor, p.apellido AS apellido_profesor 
FROM departamento AS d JOIN jefedepartamento AS j ON d.id = j.departamento 
JOIN profesor AS p ON j.profe = p.id)
$$
-- mysql> select * from profesores_departamento$$
-- -- +-----+-----------------------------------+-----------------+-------------------+
-- -- | id  | departamento                      | nombre_profesor | apellido_profesor |
-- -- +-----+-----------------------------------+-----------------+-------------------+
-- -- | FOL | Formación y Orientación Laboral   | Guillermo       | Sicilia           |
-- -- | FIL | Filosofía                         | Maria           | Cabrera           |
-- -- | GEO | Geografía e Historia              | Pedro           | Martinez          |
-- -- +-----+-----------------------------------+-----------------+-------------------+
-- -- 3 rows in set (0,00 sec)

DROP VIEW IF EXISTS profesores_departamento
$$
CREATE VIEW profesores_departamento AS
(SELECT d.id, d.nombre AS departamento, p.nombre AS nombre_profesor, p.apellido AS apellido_profesor 
FROM profesor AS p JOIN profedepartamento AS pd ON p.id = pd.profe
JOIN departamento AS d ON pd.departamento = d.id)
$$
-- mysql> select * from profesores_departamento$$
-- +-----+-----------------------------------+-----------------+-------------------+
-- | id  | departamento                      | nombre_profesor | apellido_profesor |
-- +-----+-----------------------------------+-----------------+-------------------+
-- | FOL | Formación y Orientación Laboral   | Guillermo       | Sicilia           |
-- | FIL | Filosofía                         | Maria           | Cabrera           |
-- | GEO | Geografía e Historia              | Pedro           | Martinez          |
-- +-----+-----------------------------------+-----------------+-------------------+
-- 3 rows in set (0,00 sec)

-- Crear 2 tablas con triggers asociados

DROP TABLE IF EXISTS historial_fichar
$$
CREATE TABLE historial_fichar (
    id INT PRIMARY KEY,
    anotacion VARCHAR(200) DEFAULT NULL,
    FOREIGN KEY (id) REFERENCES fichar(id)
)$$

DROP TRIGGER IF EXISTS generar_historial_fichar $$
CREATE TRIGGER generar_historial_fichar
AFTER INSERT ON fichar
FOR EACH ROW
BEGIN
    IF (NEW.id % 2 = 0) THEN
        INSERT INTO historial_fichar(id, anotacion) VALUES(NEW.id, 'Cambio de hora con otro profesor');
    ELSEIF (NEW.id % 3 = 0) THEN 
        INSERT INTO historial_fichar VALUES(NEW.id, 'Examen de recuperación');
    END IF;
END
$$

-- mysql> show triggers$$
-- +--------------------------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
-- | Trigger                  | Event  | Table  | Statement                                                                                                                                                                                                                                                                    | Timing | Created                | sql_mode                                                                                                              | Definer        | character_set_client | collation_connection | Database Collation |
-- +--------------------------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
-- | generar_historial_fichar | INSERT | fichar | BEGIN
--     IF (NEW.id % 2 = 0) THEN
--         INSERT INTO historial_fichar(id, anotacion) VALUES(NEW.id, 'Cambio de hora con otro profesor');
--     ELSEIF (NEW.id % 3 = 0) THEN 
--         INSERT INTO historial_fichar VALUES(NEW.id, 'Examen de recuperación');
--     END IF;
-- END  | AFTER  | 2023-05-29 14:29:04.13 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb3_spanish_ci |
-- +--------------------------+--------+--------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
-- 1 row in set (0,01 sec)

-- Procedimiento de generación aleatoria de datos para 2 tablas con primary key

-- DROP PROCEDURE IF EXISTS insertar_profesores $$
-- CREATE PROCEDURE insertar_profesores(IN cantidad INT)
-- BEGIN
--     DECLARE i TINYINT;
--     DECLARE _id VARCHAR(6);
--     DECLARE _nombre VARCHAR(20);
--     DECLARE _apellido VARCHAR(20);
--     DECLARE _email VARCHAR(60);
--     DECLARE _telefono VARCHAR(9);
--     DECLARE _h_perm SMALLINT;
--     DECLARE _h_lect SMALLINT;
--     DECLARE contador INT;
--     DECLARE _id_direccion INT;
--     DECLARE _username VARCHAR(20);
--     SET contador = 0;
--     WHILE (contador < cantidad) DO
--         SET _id = CONCAT('Profe', (SELECT count(*) FROM profesor) + 1);
--         SET i = FLOOR(RAND()*5);
--         CASE i
--             WHEN 0 THEN SET _nombre = 'Juan';
--             WHEN 1 THEN SET _nombre = 'Lucas';
--             WHEN 2 THEN SET _nombre = 'Ana';
--             WHEN 3 THEN SET _nombre = 'Pedro';
--             WHEN 4 THEN SET _nombre = 'Marta';
--         END CASE;
--         SET i = FLOOR(RAND()*5);
--         CASE i
--             WHEN 0 THEN SET _apellido = 'Abreu';
--             WHEN 1 THEN SET _apellido = 'Ramos';
--             WHEN 2 THEN SET _apellido = 'García';
--             WHEN 3 THEN SET _apellido = 'Pérez';
--             WHEN 4 THEN SET _apellido = 'Martinez';
--         END CASE;
--         SET _telefono = (SELECT FLOOR(RAND() * (100000000) + 100000000));
--         SET contador = contador + 1;
--     END WHILE ;
-- END 
-- $$

-- Creación de 2 índices de cada tipo
-- INEDX
CREATE INDEX idx_etapa ON curso(etapa)
$$
CREATE INDEX idx_grado ON curso(grado)
$$
-- UNIQUE 
CREATE UNIQUE INDEX idx_email ON profesor(email)
$$
CREATE UNIQUE INDEX idx_departamento ON jefedepartamento(departamento)
$$
-- FULL TEXT
CREATE FULLTEXT INDEX idx_anotacion ON historial_fichar(anotacion)
$$
CREATE FULLTEXT INDEX idx_nombre ON curso(nombre)
$$

-- mysql> show index from curso$$
-- +-------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +-------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | curso |          0 | PRIMARY    |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | curso |          1 | idx_etapa  |            1 | etapa       | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
-- | curso |          1 | idx_grado  |            1 | grado       | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | curso |          1 | idx_nombre |            1 | nombre      | NULL      |           4 |     NULL |   NULL | YES  | FULLTEXT   |         |               | YES     | NULL       |
-- +-------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- 4 rows in set (0,02 sec)

-- mysql> show index from historial_fichar$$
-- +------------------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table            | Non_unique | Key_name      | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +------------------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | historial_fichar |          0 | PRIMARY       |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | historial_fichar |          1 | idx_anotacion |            1 | anotacion   | NULL      |           0 |     NULL |   NULL | YES  | FULLTEXT   |         |               | YES     | NULL       |
-- +------------------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- 2 rows in set (0,01 sec)

-- mysql> show index from jefedepartamento$$
-- +------------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table            | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +------------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | jefedepartamento |          0 | PRIMARY          |            1 | id           | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | jefedepartamento |          0 | idx_departamento |            1 | departamento | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | jefedepartamento |          1 | profe            |            1 | profe        | A         |           2 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +------------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- 3 rows in set (0,01 sec)

-- mysql> show index from profesor$$
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | Table    | Non_unique | Key_name     | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- | profesor |          0 | PRIMARY      |            1 | id           | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          0 | idx_email    |            1 | email        | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | id_sustituto |            1 | id_sustituto | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
-- | profesor |          1 | username     |            1 | username     | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
-- +----------+------------+--------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
-- 4 rows in set (0,01 sec)

DELIMITER ;