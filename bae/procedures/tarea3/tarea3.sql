CREATE DATABASE donacion;
USE donacion;
DROP TABLE IF EXISTS persona;
CREATE TABLE persona(
    id INT PRIMARY KEY,
    peso INT,
    admitido ENUM('Si', 'No'),
    sexo ENUM('H', 'M'),
    fecha_ultima_donacion  DATETIME
);
INSERT INTO persona VALUES (1234, 70, 'No', 'H', '2000-01-01');
INSERT INTO persona VALUES (1134, 59, 'Si', 'H', '2000-01-01');
INSERT INTO persona VALUES (1334, 66, 'Si', 'M', '2000-01-01');
INSERT INTO persona VALUES (1434, 80, 'No', 'M', '2000-01-01');
INSERT INTO persona VALUES (1534, 64, 'Si', 'H', '2000-01-01');
INSERT INTO persona VALUES (1634, 77, 'No', 'M', '2000-01-01');
INSERT INTO persona VALUES (1344, 97, 'Si', 'H', '2000-01-01');
INSERT INTO persona VALUES (1264, 103, 'No', 'M', '2000-01-01');
INSERT INTO persona VALUES (1294, 67, 'Si', 'M', '2000-01-01');
INSERT INTO persona VALUES (1211, 80, 'Si', 'H', '2000-01-01');

-- El procedimiento siguiente actualiza el valor 'admitido' de la persona asociada a la 'id' 
-- indicada en función de su 'peso'
DELIMITER //
DROP PROCEDURE IF EXISTS actualizar_admitido//
CREATE PROCEDURE actualizar_admitido (IN peso_minimo INT)
BEGIN 
    UPDATE persona SET admitido = 'Si' WHERE peso > peso_minimo;
    UPDATE persona SET admitido = 'No' WHERE peso < peso_minimo; 
END
//
