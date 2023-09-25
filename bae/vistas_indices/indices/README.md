# Tarea 1 de trabajo con índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

- número de inscripción, comienza desde 1 cada año,
- año de inscripción,
- nombre del alumno,
- documento del alumno,
- domicilio,
- ciudad,
- provincia,
- clave primaria: número de inscripto y año de inscripción.

Se pide:

1. Elimine la tabla "alumno" si existe. Nota:Muestra el comando y la salida.
~~~~sql
mysql> drop table if exists alumno;
Query OK, 0 rows affected, 1 warning (0,04 sec)
~~~~
2. Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción). Nota:Muestra el comando y la salida.
~~~~sql
create table alumno(
    numero_inscripcion int auto_increment,
    año_inscripcion smallint,
    nombre_alumno varchar(20),
    documento_alumno varchar(9),
    domicilio varchar(20),
    ciudad varchar(20),
    provincia varchar(20),
    primary key (numero_inscripcion, año_inscripcion)
);
~~~~
3. Define los siguientes indices:
~~~~sql

-- 3.1. Un índice único por el campo "documento" y un índice común por ciudad y provincia. 
-- Nota: Muestra el comando y la salida. Justifica el tipo de indice en un comentario.

create unique index idx_documento on alumno(documento_alumno); 
mysql> create unique index idx_documento on alumno(documento_alumno); 
Query OK, 0 rows affected (0,05 sec)
Records: 0  Duplicates: 0  Warnings: 0

create index idx_localizacion on alumno(ciudad, provincia);
mysql> create index idx_localizacion on alumno(ciudad, provincia);
Query OK, 0 rows affected (0,05 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- 3.2. Vea los índices de la tabla. 
-- Nota: Muestra el comando y la salida "show index".

mysql> show index from alumno;
+--------+------------+------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name         | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY          |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY          |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | idx_documento    |            1 | documento_alumno   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_localizacion |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| alumno |          1 | idx_localizacion |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
5 rows in set (0,10 sec)

-- 3.4. Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria. Nota: Muestra el comando y la salida.

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_alumnos//
CREATE PROCEDURE insertar_alumnos(IN numero_alumnos INT UNSIGNED)
BEGIN
    DECLARE insertados INT UNSIGNED;
    DECLARE nuevo_documento VARCHAR(9);
    DECLARE nuevo_numero SMALLINT;
    DECLARE nuevo_año SMALLINT;
    DECLARE nuevo_nombre varchar(20);
    DECLARE nuevo_domicilio varchar(20);
    DECLARE nueva_ciudad varchar(20);
    DECLARE nueva_provincia varchar(20);
    SET insertados = 0;
    SET nuevo_documento = (SELECT FLOOR(0 + (RAND() * 99999999)));
    SET nuevo_documento = LPAD(nuevo_documento, 8, 0);
    SET nuevo_documento = CONCAT(nuevo_documento, 'A');
    SET nuevo_numero =(SELECT FLOOR(1 + (RAND() * 9999)));
    SET nuevo_año =(SELECT FLOOR(1935 + (RAND() * 2024)));
    IF (nuevo_año % 2) = 0 THEN
        SET nuevo_nombre = 'Juan';
    ELSE
        SET nuevo_nombre = 'Luisa';
    END IF;
    IF (nuevo_año % 3) = 0 THEN 
        SET nuevo_domicilio = 'Calle Triana';  
        SET nueva_ciudad = 'Sevilla';
        SET nueva_provincia = 'Sevilla';
    ELSE
        SET nuevo_domicilio = 'Calle Hortaleza'; 
        SET nueva_ciudad = 'Madrid';
        SET nueva_provincia = 'Madrid';
    END IF;
    WHILE insertados < numero_alumnos DO
        WHILE (SELECT EXISTS(SELECT documento_alumno FROM alumno WHERE documento_alumno=nuevo_documento)) DO
            SET nuevo_documento = (SELECT FLOOR(0 + (RAND() * 99999999)));
            SET nuevo_documento = LPAD(nuevo_documento, 8, 0);
            SET nuevo_documento = CONCAT(nuevo_documento, 'A');
        END WHILE;
        INSERT INTO alumno VALUES (nuevo_numero, nuevo_año, nuevo_nombre, nuevo_documento, nuevo_domicilio, nueva_ciudad, nueva_provincia);
        SET insertados = insertados + 1;
    END WHILE;
END
//
DELIMITER ;

mysql> call insertar_alumnos(5);
ERROR 1062 (23000): Duplicate entry '7232-2012' for key 'alumno.PRIMARY'
mysql> call insertar_alumnos(5);
ERROR 1062 (23000): Duplicate entry '8950-2946' for key 'alumno.PRIMARY'

mysql> select * from alumno;
+--------------------+------------------+---------------+------------------+-----------------+---------+-----------+
| numero_inscripcion | año_inscripcion  | nombre_alumno | documento_alumno | domicilio       | ciudad  | provincia |
+--------------------+------------------+---------------+------------------+-----------------+---------+-----------+
|               7232 |             2012 | Juan          | 19261795A        | Calle Hortaleza | Madrid  | Madrid    |
|               8950 |             2946 | Juan          | 99175508A        | Calle Triana    | Sevilla | Sevilla   |
+--------------------+------------------+---------------+------------------+-----------------+---------+-----------+
2 rows in set (0,00 sec)

--Pendiente de revisar...

-- 3.5. Intente ingresar un alumno con clave primaria repetida. Nota: Muestra el comando y la salida.
-- El propio procedimiento ya lo intento y fallo...

mysql> call insertar_alumnos(5);
ERROR 1062 (23000): Duplicate entry '7232-2012' for key 'alumno.PRIMARY'

-- 3.6. Intente ingresar un alumno con documento repetido. Nota: Muestra el comando y la salida.

mysql> insert into alumno values (1, 2050, 'Pepe', '19261795A', 'Calle Manzano', 'Córdoba', 'Córdoba');
ERROR 1062 (23000): Duplicate entry '19261795A' for key 'alumno.idx_documento'

-- 3.7. Ingrese varios alumnos de la misma ciudad y provincia. Nota: Muestra el comando y la salida.

mysql> insert into alumno values (1, 2050, 'Pepe', '1926179B', 'Calle Manzano', 'Córdoba', 'Córdoba');
Query OK, 1 row affected (0,02 sec)

mysql> insert into alumno values (2, 2050, 'Pepe', '1926179C', 'Calle Manzano', 'Córdoba', 'Córdoba');
Query OK, 1 row affected (0,05 sec)

mysql> insert into alumno values (3, 2050, 'Pepe', '1926179D', 'Calle Manzano', 'Córdoba', 'Córdoba');
Query OK, 1 row affected (0,01 sec)

-- 3.8. Elimina los indices creados, y muestra que ya no se encuentran. Nota: Muestra el comando y la salida.

mysql> drop index idx_documento on alumno;
Query OK, 0 rows affected (0,09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> drop index idx_localizacion on alumno;
Query OK, 0 rows affected (0,06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show index from alumno;
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           5 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,04 sec)
~~~~
