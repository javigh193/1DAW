-- Realiza las siguientes consultas:
-- 1.Sacar una relación completa de los científicos asignados a cada proyecto. 
-- Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto.
DELIMITER $$
DROP PROCEDURE IF EXISTS cientificos_proyecto$$
CREATE PROCEDURE cientificos_proyecto()
BEGIN
    SELECT c.id AS DNI, c.nombre AS Nombre del científico, p.id AS identificador del proyecto, p.nombre AS nombre del proyecto
    FROM cientifico AS c JOIN cientifico_proyecto AS cp ON c.id = cp.ref_cientifico JOIN proyecto AS p ON p.id = cp.ref_proyecto
    GROUP BY p.id;
END
$$
DELIMITER //
CALL cientifico_proyecto()
//
-- 2.Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).
DELIMITER $$
DROP PROCEDURE IF EXISTS proyectos_cientifico$$
CREATE PROCEDURE proyectos_cientifico()
BEGIN
    SELECT c.id AS DNI, c.nombre AS Nombre del científico, COUNT(cp.ref_proyecto) AS num_proyectos
    FROM cientifico AS c JOIN cientifico_proyecto AS cp ON c.id = cp.ref_cientifico
    GROUP BY c.id;
END
$$
DELIMITER //
CALL proyectos_cientifico()
//
-- 3.Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).
DELIMITER $$
DROP PROCEDURE IF EXISTS cientificos_proyecto$$
CREATE PROCEDURE cientificos_proyecto()
BEGIN
    SELECT p.id AS ID del proyecto, p.nombre AS Nombre del proyecto, COUNT(cp.ref_cientifico) AS num_cientificos
    FROM proyecto AS p JOIN cientifico_proyecto AS cp ON p.id = cp.ref_proyecto
    GROUP BY p.id;
END
$$
DELIMITER //
CALL cientificos_proyecto()
//
-- 4.Obtener el número de horas de dedicación de cada científico.
DELIMITER $$
DROP PROCEDURE IF EXISTS horas_cientifico$$
CREATE PROCEDURE horas_cientifico()
BEGIN
    SELECT sum(p.horas) AS horas_totales 
    FROM proyecto AS p JOIN cientifico_proyecto AS cp ON cp.ref_proyecto = p.id
    GROUP BY ref_cientifico;
END
$$
DELIMITER //
CALL horas_cientifico()
//
-- 5.Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea 
-- superior a un número de horas superior a 10, por ejemplo 11 horas.
DELIMITER $$
DROP PROCEDURE IF EXISTS cientificos_sobrecargados$$
CREATE PROCEDURE cientificos_sobrecargados(IN limite_horas INT, IN limite_proyectos INT)
BEGIN
    SELECT c.id AS DNI, c.nombre AS Nombre cientifico 
    FROM cientifico AS c JOIN cientifico_proyecto AS cp ON cp.ref_proyecto = c.id JOIN proyecto AS p ON cp.ref_proyecto = p.id
    GROUP BY c.id HAVING COUNT(cp.ref_proyecto) > limite_proyectos AND AVRG(p.horas) > limite_horas;
END
$$
DELIMITER //
CALL cientificos_sobrecargados(10, 2)
//

