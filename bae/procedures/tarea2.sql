-- 1. Eliminamos la tabla, si existe y la creamos.
DELIMITER $$
DROP TABLE IF EXISTS empleados$$
DROP PROCEDURE IF EXISTS crear_tabla_empleados$$
CREATE PROCEDURE crear_tabla_empleados()
BEGIN
    CREATE TABLE empleados(
        documento char(8) NOT NULL PRIMARY KEY,
        nombre varchar(20) DEFAULT NULL,
        apellido VARCHAR(20) DEFAULT NULL,
        sueldo DECIMAL(6,2) DEFAULT NULL,
        cantidadhijos INT DEFAULT NULL,
        seccion VARCHAR(20) DEFAULT NULL
    );
END
$$
-- 2. Ingrese algunos registros.
DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_empleados()
CREATE PROCEDURE insertar_empleados()
BEGIN 
    INSERT INTO empleados VALUES ('22222222', 'Juan', 'Pérez', 300.00, 2, 'Contaduria');
    INSERT INTO empleados VALUES ('22333333', 'Luis', 'López', 300.00, 1, 'Contaduria');
    INSERT INTO empleados VALUES ('22444444', 'Marta', 'Pérez', 500.00, 0, 'Sistemas');
    INSERT INTO empleados VALUES ('22555555', 'Susana', 'García', 400.00, 2, 'Secretaria');
    INSERT INTO empleados VALUES ('22666666', 'Jose Maria', 'Morales', 400.00, 3, 'Secretaria');
END
$$
-- 3. Elimine el procedimiento llamado pa_empleados_sueldo si existe.
DELIMITER $$ 
DROP PROCEDURE IF EXISTS pa_empleados_sueldo()
$$
-- 4. Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres.
DELIMITER $$
CREATE PROCEDURE pa_empleados_sueldo()
BEGIN
    SELECT nombre FROM empleados;
END
$$
-- 5. Ejecute el procedimiento creado anteriormente.
DELIMITER //
CALL pa_empleados_sueldo()
//
-- 6. Elimine el procedimiento pa_empleados_hijos, si existe.
DELIMITER $$
DROP PROCEDURE IF EXISTS  pa_empleados_hijos()
$$
-- 7. Cree un procedimiento almacenado llamado pa_empleados_hijos que seleccione los nombres 
-- apellidos y cantidad de hijos de los empleados con hijos.
DELIMITER $$
CREATE PROCEDURE pa_empleados_hijos()
BEGIN
    SELECT nombre, apellido, cantidadhijos 
    FROM empleados
    WHERE cantidadhijos > 0;
END
$$
-- 8. Ejecute el procedimiento creado anteriormente.
DELIMITER //
CALL pa_empleados_hijos()
//
-- 9. Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el
-- procedimiento para verificar que ahora si aparece en la lista.
DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_mostrar()$$
CREATE PROCEDURE insertar_mostrar(IN nuevos_hijos INT, IN id_persona VARCHAR(20))
BEGIN
    UPDATE empleados
    SET cantidadhijos = nuevos_hijos
    WHERE documento = id_persona;
    CALL pa_empleados_hijos();
END
$$