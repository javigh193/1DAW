-- Crea una base datos llamada donación.
CREATE DATABASE donacion;
USE donacion;
-- Crea una tabla llamada persona con los siguientes campos:
DROP TABLE IF EXISTS persona;
CREATE TABLE persona(
    id VARCHAR(9) PRIMARY KEY,
    peso SMALLINT,
    admitido ENUM('Si', 'No'),
    sexo ENUM('H', 'M'),
    fecha_ultima_donacion DATETIME
);
-- Realiza los siguientes procedimientos:
-- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. 
-- El procedimiento debe de recibir como parámetro de entrada el número de registros que se 
-- desea insertar y se debe de lanzar, al menos, en dos aciones, para verificar su correcto 
-- funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción de debe de 
-- autogenerar o seleccionar uno al azar, de los campos requeridos.
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_personas//
CREATE PROCEDURE insertar_personas(IN numero_personas INT UNSIGNED)
BEGIN
    DECLARE insertados INT UNSIGNED;
    DECLARE nuevo_id VARCHAR(9);
    DECLARE nuevo_peso SMALLINT;
    DECLARE nuevo_admitido ENUM('Si', 'No');
    DECLARE nuevo_sexo ENUM('H', 'M');
    DECLARE nueva_fecha DATETIME;
    SET insertados = 0;
    SET nuevo_id = (SELECT FLOOR(0 + (RAND() * 99999999)));
    SET nuevo_id = LPAD(nuevo_id, 8, 0);
    SET nuevo_id = CONCAT(nuevo_id, 'A');
    SET nuevo_peso =(SELECT FLOOR(2 + (RAND() * 300)));
    IF (nuevo_peso % 2) = 0 THEN
        SET nuevo_admitido = 'Si';
    ELSE
        SET nuevo_admitido = 'No';
    END IF;
    IF (nuevo_peso % 3) = 0 THEN   
        SET nuevo_sexo = 'H';
    ELSE
        SET nuevo_sexo = 'M';
    END IF;
    SET nueva_fecha = (SELECT NOW() - INTERVAL FLOOR(0 + (RAND() * 10000)) DAY);
    WHILE insertados < numero_personas DO
        WHILE (SELECT EXISTS(SELECT id FROM persona WHERE id=nuevo_id)) DO
            SET nuevo_id = (SELECT FLOOR(0 + (RAND() * 99999999)));
            SET nuevo_id = LPAD(nuevo_id, 8, 0);
            SET nuevo_id = CONCAT(nuevo_id, 'A');
        END WHILE;
        INSERT INTO persona VALUES (nuevo_id, nuevo_peso, nuevo_admitido, nuevo_sexo, nueva_fecha);
        SET insertados = insertados + 1;
    END WHILE;
END
//
DELIMITER ;

-- (2) Realiza un procedimiento que permita actualizar la fecha de última donación, 
-- teniendo como parámetro de entrada el identificador de la persona, y una fecha.

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_fecha//
CREATE PROCEDURE actualizar_fecha(IN nueva_fecha DATETIME, IN id_persona VARCHAR(9))
BEGIN
    UPDATE persona SET fecha_ultima_donacion = nueva_fecha WHERE id = id_persona;
END//
DELIMITER ;

-- (3) Realiza un procedimiento que permita actualizar la fecha de última donación y el 
-- valor de admitido de una persona, teniendo como parámetro de entrada el identificador de la
-- persona, y una fecha.

DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_fecha_estado//
CREATE PROCEDURE actualizar_fecha_estado(IN nueva_fecha DATETIME, IN id_persona VARCHAR(9))
BEGIN
    DECLARE peso_persona SMALLINT;
    DECLARE sexo_persona VARCHAR(1);
    DECLARE ultima_donacion DATETIME;
    DECLARE fecha_actual DATETIME;
    DECLARE dias_pasados INT;
    DECLARE puede_donar VARCHAR(2);
    SET peso_persona = (SELECT peso FROM persona WHERE id = id_persona);
    SET sexo_persona = (SELECT sexo FROM persona WHERE id = id_persona);
    SET ultima_donacion = (SELECT fecha_ultima_donacion FROM persona WHERE id = id_persona);
    SET fecha_actual = nueva_fecha;
    SET dias_pasados = (DATEDIFF(fecha_actual, ultima_donacion));
    IF (peso_persona > 50) THEN
        IF (sexo_persona = 'H') THEN
            IF (dias_pasados > 90) THEN
                SET puede_donar = 'Si';
            ELSE
                SET puede_donar = 'No';
            END IF;
        ELSEIF (dias_pasados > 120) THEN
            SET puede_donar = 'Si';
        ELSE 
            SET puede_donar = 'No';
        END IF;
    END IF;
    UPDATE persona SET fecha_ultima_donacion = nueva_fecha WHERE id = id_persona;
END//
DELIMITER ;

-- Realizar cada una de las siguientes funciones:
-- (1) Realiza una función que determine si una persona almacenada en la tabla persona puede 
-- realizar una donación. Para ello la función recibe como parámetro de entrada el identificador 
-- de esta persona, y una fecha de donación. Los campos a tener en cuenta para determinar, si 
-- puede o no, será el peso. Posteriormente actualice el valor de la última donación de la persona 
-- indicada con el parámetro de entrada.

DELIMITER //
DROP FUNCTION IF EXISTS puede_donar//
CREATE FUNCTION puede_donar(id_persona VARCHAR(9), fecha_donacion DATETIME)
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE peso_persona SMALLINT;
    DECLARE puede_donar VARCHAR(2);
    SET peso_persona = (SELECT peso FROM persona WHERE id = id_persona);
    IF (SELECT EXISTS(SELECT id FROM persona WHERE id = id_persona AND peso > 50)) THEN
        SET puede_donar = 'Si';
    ELSEIF (SELECT EXISTS(SELECT id FROM persona WHERE id = id_persona AND peso > 50)) THEN
        SET puede_donar = 'No';
    END IF;
    UPDATE persona SET fecha_ultima_donacion = fecha_donacion WHERE id = id_persona;
    RETURN puede_donar;
END//
DELIMITER ;

-- (2) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar 
-- una donación. Para ello la función recibe como parámetro de entrada el identificador de esta. Los 
-- campos a tener en cuenta son peso, el sexo y la fecha de la última donación, teniendo en cuento los 
-- requerimientos que se indican en la descripción del ejercicio.

DELIMITER //
DROP FUNCTION IF EXISTS puede_donar_plus//
CREATE FUNCTION puede_donar_plus(id_persona VARCHAR(9))
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE peso_persona SMALLINT;
    DECLARE sexo_persona VARCHAR(1);
    DECLARE ultima_donacion DATETIME;
    DECLARE fecha_actual DATETIME;
    DECLARE dias_pasados INT;
    DECLARE puede_donar VARCHAR(2);
    SET peso_persona = (SELECT peso FROM persona WHERE id = id_persona);
    SET sexo_persona = (SELECT sexo FROM persona WHERE id = id_persona);
    SET ultima_donacion = (SELECT fecha_ultima_donacion FROM persona WHERE id = id_persona);
    SET fecha_actual = (SELECT NOW());
    SET dias_pasados = (DATEDIFF(fecha_actual, ultima_donacion));
    IF (peso_persona > 50) THEN
        IF (sexo_persona = 'H') THEN
            IF (dias_pasados > 90) THEN
                SET puede_donar = 'Si';
            ELSE
                SET puede_donar = 'No';
            END IF;
        ELSEIF (dias_pasados > 120) THEN
            SET puede_donar = 'Si';
        ELSE 
            SET puede_donar = 'No';
        END IF;
    END IF;
    UPDATE persona SET fecha_ultima_donacion = fecha_actual WHERE id = id_persona;
    RETURN puede_donar;
END//
DELIMITER ;

-- Llamadas a los procedimientos y funciones:

call insertar_personas(10);

call insertar_personas(10);

-- mysql> select * from persona;
-- +-----------+------+----------+------+-----------------------+
-- | id        | peso | admitido | sexo | fecha_ultima_donacion |
-- +-----------+------+----------+------+-----------------------+
-- | 08532668A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 25852453A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 26455075A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 27109852A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 29802197A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 30073652A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 46131665A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 48407294A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 50750909A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 53100968A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 54153803A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 58452720A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 61043535A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 67911772A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 70772099A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 73329257A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 73652826A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 78857546A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- | 90410614A |   93 | Si       | H    | 2000-01-01 00:00:00   |
-- | 99902233A |  230 | Si       | H    | 2000-01-01 00:00:00   |
-- +-----------+------+----------+------+-----------------------+
-- 20 rows in set (0,00 sec)

-- mysql> call actualizar_fecha('1992-01-01', '01285544A');
-- Query OK, 1 row affected (0,01 sec)
-- mysql> select * from persona where id = '01285544A';
-- +-----------+------+----------+------+-----------------------+
-- | id        | peso | admitido | sexo | fecha_ultima_donacion |
-- +-----------+------+----------+------+-----------------------+
-- | 01285544A |  187 | Si       | H    | 1992-01-01 00:00:00   |
-- +-----------+------+----------+------+-----------------------+
-- 1 row in set (0,00 sec)

-- mysql> call actualizar_fecha_estado('1991-01-01','01285544A');
-- Query OK, 1 row affected (0,00 sec)

-- mysql> select * from persona where id = '01285544A';
-- +-----------+------+----------+------+-----------------------+
-- | id        | peso | admitido | sexo | fecha_ultima_donacion |
-- +-----------+------+----------+------+-----------------------+
-- | 01285544A |  187 | Si       | H    | 1991-01-01 00:00:00   |
-- +-----------+------+----------+------+-----------------------+
-- 1 row in set (0,00 sec)

-- mysql> select puede_donar('01285544A', '2009-02-02');
-- +----------------------------------------+
-- | puede_donar('01285544A', '2009-02-02') |
-- +----------------------------------------+
-- | Si                                     |
-- +----------------------------------------+
-- 1 row in set (0,01 sec)

-- -- mysql> 
-- mysql> select puede_donar_plus('01285544A');
-- +-------------------------------+
-- | puede_donar_plus('01285544A') |
-- +-------------------------------+
-- | Si                            |
-- +-------------------------------+
-- 1 row in set (0,00 sec)

-- mysql> select puede_donar_plus('01285544A');
-- +-------------------------------+
-- | puede_donar_plus('01285544A') |
-- +-------------------------------+
-- | No                            |
-- +-------------------------------+
-- 1 row in set (0,02 sec)

-- mysql> 
