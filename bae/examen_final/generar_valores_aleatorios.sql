-- se tiene que adaptar manualmente a la tabla donde se insertan las tuplas
DELIMITER //
DROP PROCEDURE IF EXISTS generar_tuplas//
CREATE PROCEDURE generar_tuplas(IN cantidad INT)
BEGIN
    DECLARE i INT;
    SET i = 0;
    WHILE i < cantidad DO
         SELECT 'HOLA';
    END WHILE;
END
//
DELIMITER ;