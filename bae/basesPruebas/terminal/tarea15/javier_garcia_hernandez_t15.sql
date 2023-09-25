--Gestión Ventas
--Creación de las tablas
CREATE TABLE cliente (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    ciudad TEXT,
    categoria INTEGER
);
CREATE TABLE comercial (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    apellido1 TEXT,
    apellido2 TEXT,
    categoria REAL
);
CREATE TABLE pedido (
    id INTEGER PRIMARY KEY,
    total REAL,
    fecha TEXT,
    id_cliente INTEGER,
    id_comercial INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_comercial) REFERENCES comercial(id)
); 
--Inserts
INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);
INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);
INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);
--Consultas sobre una tabla
--1.Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido order by fecha;
-- ┌────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- └────┴─────────┴────────────┴────────────┴──────────────┘
--2.Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by total desc limit 2;
-- ┌────┬────────┬────────────┬────────────┬──────────────┐
-- │ id │ total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼────────┼────────────┼────────────┼──────────────┤
-- │ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
-- │ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
-- └────┴────────┴────────────┴────────────┴──────────────┘
--3.Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select distinct id_cliente from pedido;
-- ┌────────────┐
-- │ id_cliente │
-- ├────────────┤
-- │ 5          │
-- │ 1          │
-- │ 2          │
-- │ 8          │
-- │ 7          │
-- │ 4          │
-- │ 3          │
-- │ 6          │
-- └────────────┘
--4.Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
select * from pedido where fecha regexp '^2017-' and total>500;
-- ┌────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- └────┴─────────┴────────────┴────────────┴──────────────┘
--5.Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT nombre, apellido1, apellido2 FROM comercial WHERE categoria BETWEEN 0.05 AND 0.11;
-- ┌─────────┬───────────┬───────────┐
-- │ nombre  │ apellido1 │ apellido2 │
-- ├─────────┼───────────┼───────────┤
-- │ Diego   │ Flores    │ Salas     │
-- │ Antonio │ Vega      │ Hernández │
-- │ Alfredo │ Ruiz      │ Flores    │
-- └─────────┴───────────┴───────────┘
--6.Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT max(categoria) AS comision FROM comercial;
-- ┌──────────┐
-- │ comision │
-- ├──────────┤
-- │ 0.15     │
-- └──────────┘
--7.Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, nombre, apellido1 FROM cliente WHERE apellido2 IS NOT NULL ORDER BY apellido1, nombre;
-- ┌────┬───────────┬───────────┐
-- │ id │  nombre   │ apellido1 │
-- ├────┼───────────┼───────────┤
-- │ 5  │ Marcos    │ Loyola    │
-- │ 9  │ Guillermo │ López     │
-- │ 1  │ Aarón     │ Rivero    │
-- │ 3  │ Adolfo    │ Rubio     │
-- │ 8  │ Pepe      │ Ruiz      │
-- │ 2  │ Adela     │ Salas     │
-- │ 10 │ Daniel    │ Santana   │
-- │ 6  │ María     │ Santana   │
-- └────┴───────────┴───────────┘
--8.Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre REGEXP '(^A.*n$)|(^P.*$)' ORDER BY nombre;
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Aarón  │
-- │ Adrián │
-- │ Pepe   │
-- │ Pilar  │
-- └────────┘
--9.Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre REGEXP '^[^A]' ORDER BY nombre;
-- ┌───────────┐
-- │  nombre   │
-- ├───────────┤
-- │ Daniel    │
-- │ Guillermo │
-- │ Marcos    │
-- │ María     │
-- │ Pepe      │
-- │ Pilar     │
-- └───────────┘
--10.Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM comercial WHERE nombre REGEXP 'o$';
-- ┌─────────┐
-- │ nombre  │
-- ├─────────┤
-- │ Diego   │
-- │ Antonio │
-- │ Alfredo │
-- └─────────┘
--Consultas multitabla
--Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.
--1.Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
--El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT cl.id, cl.nombre, cl.apellido1, cl.apellido2 FROM cliente AS cl INNER JOIN pedido as p ON cl.id=p.id_cliente ORDER BY cl.nombre;
-- ┌────┬────────┬───────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │
-- ├────┼────────┼───────────┼───────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │
-- │ 2  │ Adela  │ Salas     │ Díaz      │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │
-- │ 4  │ Adrián │ Suárez    │           │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │
-- │ 6  │ María  │ Santana   │ Moreno    │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │
-- │ 7  │ Pilar  │ Ruiz      │           │
-- └────┴────────┴───────────┴───────────┘
--2.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. 
--El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT DISTINCT cl.*, p.* FROM cliente AS cl INNER JOIN pedido as p ON cl.id=p.id_cliente ORDER BY cl.nombre;
-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
--3.Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
--El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT DISTINCT cm.*, p.* FROM comercial AS cm INNER JOIN pedido as p ON cm.id=p.id_comercial ORDER BY cm.nombre;
-- ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- └────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
--4.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT DISTINCT cl.*, p.*, cm.* FROM comercial AS cm INNER JOIN pedido as p ON cm.id=p.id_comercial 
INNER JOIN cliente as cl ON cl.id=id_cliente;
-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
--5.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT cl.nombre FROM cliente AS cl INNER JOIN pedido AS p ON  cl.id=p.id_cliente WHERE p.fecha REGEXP '^2017-' AND p.total BETWEEN 300 AND 1000;
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Marcos │
-- └────────┘
--6.Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT DISTINCT cm.nombre, cm.apellido1, cm.apellido2 FROM comercial as cm INNER JOIN pedido AS p ON p.id_comercial=cm.id INNER JOIN cliente as cl ON cl.id=p.id_cliente
WHERE cl.nombre='María' AND cl.apellido1='Santana' AND cl.apellido2='Moreno';
-- ┌────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │
-- ├────────┼───────────┼───────────┤
-- │ Daniel │ Sáez      │ Vega      │
-- └────────┴───────────┴───────────┘
--Consultas multitabla
--Nota: Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--1.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. 
--Este listado también debe incluir los clientes que no han realizado ningún pedido. 
--El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT cl.*, p.* FROM cliente AS cl LEFT JOIN pedido AS p ON cl.id=p.id_cliente ORDER BY cl.apellido1, cl.apellido2, cl.nombre;
-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │    │         │            │            │              │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- │ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- │ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │    │         │            │            │              │
-- │ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
--2.Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. 
--Este listado también debe incluir los comerciales que no han realizado ningún pedido. 
--El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT cm.*, p.* FROM comercial AS cm LEFT JOIN pedido AS p ON cm.id=p.id_comercial ORDER BY cm.apellido1, cm.apellido2, cm.nombre;
-- ┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
-- │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
-- │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
-- │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
-- │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │    │         │            │            │              │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │    │         │            │            │              │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
-- │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
-- └────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
--3.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT cl.* FROM cliente AS cl LEFT JOIN pedido AS p ON p.id_cliente=cl.id WHERE p.id IS NULL;
-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘
--4.Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT cm.* FROM comercial AS cm LEFT JOIN pedido AS p ON p.id_comercial=cm.id WHERE p.id IS NULL;
-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘
--5.Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. 
--Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
SELECT cl.apellido1, cl.apellido2, cl.nombre, 'cliente' AS tipo FROM cliente AS cl LEFT JOIN pedido AS p ON p.id_cliente=cl.id WHERE p.id IS NULL
UNION
SELECT cm.apellido1, cm.apellido2, cm.nombre, 'comercial' AS tipo FROM comercial AS cm LEFT JOIN pedido AS p ON p.id_comercial=cm.id WHERE p.id IS NULL
ORDER BY apellido1, apellido2, nombre;
-- ┌───────────┬───────────┬───────────┬───────────┐
-- │ apellido1 │ apellido2 │  nombre   │   tipo    │
-- ├───────────┼───────────┼───────────┼───────────┤
-- │ Herrera   │ Gil       │ Marta     │ comercial │
-- │ López     │ Gómez     │ Guillermo │ cliente   │
-- │ Ruiz      │ Flores    │ Alfredo   │ comercial │
-- │ Santana   │ Loyola    │ Daniel    │ cliente   │
-- └───────────┴───────────┴───────────┴───────────┘
--¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
--Daría problemas ya que no distinguiría entre comerciales y clientes que se llamasen igual
--Consultas resumen
--1.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT sum(total) FROM pedido;
-- ┌────────────┐
-- │ sum(total) │
-- ├────────────┤
-- │ 20992.83   │
-- └────────────┘
--2.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT avg(total) FROM pedido;
-- ┌─────────────┐
-- │ avg(total)  │
-- ├─────────────┤
-- │ 1312.051875 │
-- └─────────────┘
--3.Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT count(DISTINCT id_comercial) AS num_comerciales FROM pedido;
-- ┌─────────────────┐
-- │ num_comerciales │
-- ├─────────────────┤
-- │ 6               │
-- └─────────────────┘
--4.Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT count(*) AS num_clientes FROM cliente;
-- ┌──────────────┐
-- │ num_clientes │
-- ├──────────────┤
-- │ 10           │
-- └──────────────┘
--5.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT max(total) FROM pedido;
-- ┌────────────┐
-- │ max(total) │
-- ├────────────┤
-- │ 5760.0     │
-- └────────────┘
--6.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT min(total) FROM pedido;
-- ┌────────────┐
-- │ min(total) │
-- ├────────────┤
-- │ 65.26      │
-- └────────────┘
--7.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT max(categoria) as max_categoria, ciudad FROM cliente GROUP BY ciudad;
-- ┌───────────────┬─────────┐
-- │ max_categoria │ ciudad  │
-- ├───────────────┼─────────┤
-- │ 200           │ Almería │
-- │ 100           │ Cádiz   │
-- │ 225           │ Granada │
-- │ 200           │ Huelva  │
-- │ 300           │ Jaén    │
-- │ 300           │ Sevilla │
-- └───────────────┴─────────┘
--8.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. 
--Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
--Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
--Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, max(p.total) AS 'pedido mayor dia'
FROM cliente AS cl INNER JOIN pedido as p ON p.id_cliente=cl.id
GROUP BY cl.id, p.fecha 
ORDER BY cl.nombre, cl.apellido1;
-- ┌────┬────────┬───────────┬───────────┬────────────┬──────────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │   fecha    │ pedido mayor dia │
-- ├────┼────────┼───────────┼───────────┼────────────┼──────────────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ 2016-09-10 │ 270.65           │
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23          │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0           │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6           │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2017-10-05 │ 65.26            │
-- │ 3  │ Adolfo │ Rubio     │ Flores    │ 2016-08-17 │ 75.29            │
-- │ 4  │ Adrián │ Suárez    │           │ 2017-10-10 │ 1983.43          │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ 2017-09-10 │ 948.5            │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ 2017-10-05 │ 150.5            │
-- │ 6  │ María  │ Santana   │ Moreno    │ 2017-02-02 │ 145.82           │
-- │ 6  │ María  │ Santana   │ Moreno    │ 2019-01-25 │ 545.75           │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ 2015-06-27 │ 250.45           │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-08-17 │ 110.5            │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4           │
-- │ 7  │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6           │
-- └────┴────────┴───────────┴───────────┴────────────┴──────────────────┘
--9.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
--teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, p.fecha, max(p.total) AS 'pedido mayor dia'
FROM cliente AS cl INNER JOIN pedido as p ON p.id_cliente=cl.id
WHERE p.total>2000
GROUP BY cl.id, p.fecha 
ORDER BY cl.nombre, cl.apellido1;
-- ┌────┬────────┬───────────┬───────────┬────────────┬──────────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │   fecha    │ pedido mayor dia │
-- ├────┼────────┼───────────┼───────────┼────────────┼──────────────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ 2019-03-11 │ 2389.23          │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2015-09-10 │ 5760.0           │
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2017-04-25 │ 3045.6           │
-- │ 8  │ Pepe   │ Ruiz      │ Santana   │ 2016-10-10 │ 2480.4           │
-- │ 7  │ Pilar  │ Ruiz      │           │ 2016-07-27 │ 2400.6           │
-- └────┴────────┴───────────┴───────────┴────────────┴──────────────────┘
--10.Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT cm.id, cm.nombre, cm.apellido1, cm.apellido2, max(p.total) 
FROM comercial AS cm INNER JOIN pedido AS p ON p.id_comercial=cm.id
WHERE fecha='2016-08-17'
GROUP BY cm.id;
-- ┌────┬─────────┬───────────┬───────────┬──────────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ max(p.total) │
-- ├────┼─────────┼───────────┼───────────┼──────────────┤
-- │ 3  │ Diego   │ Flores    │ Salas     │ 110.5        │
-- │ 7  │ Antonio │ Vega      │ Hernández │ 75.29        │
-- └────┴─────────┴───────────┴───────────┴──────────────┘
--11.Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, COALESCE(count(p.id_cliente), 0) AS num_pedidos
FROM cliente AS cl LEFT JOIN pedido AS p ON p.id_cliente=cl.id
GROUP BY cl.id;
-- ┌────┬───────────┬───────────┬───────────┬─────────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ num_pedidos │
-- ├────┼───────────┼───────────┼───────────┼─────────────┤
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ 3           │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ 3           │
-- │ 3  │ Adolfo    │ Rubio     │ Flores    │ 1           │
-- │ 4  │ Adrián    │ Suárez    │           │ 1           │
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ 2           │
-- │ 6  │ María     │ Santana   │ Moreno    │ 2           │
-- │ 7  │ Pilar     │ Ruiz      │           │ 1           │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ 3           │
-- │ 9  │ Guillermo │ López     │ Gómez     │ 0           │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ 0           │
-- └────┴───────────┴───────────┴───────────┴─────────────┘
--12.Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(p.id_cliente) AS num_pedidos
FROM cliente AS cl JOIN pedido AS p ON p.id_cliente=cl.id
WHERE p.fecha REGEXP '2017-'
GROUP BY cl.id;
-- ┌────┬────────┬───────────┬───────────┬─────────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ num_pedidos │
-- ├────┼────────┼───────────┼───────────┼─────────────┤
-- │ 2  │ Adela  │ Salas     │ Díaz      │ 2           │
-- │ 4  │ Adrián │ Suárez    │           │ 1           │
-- │ 5  │ Marcos │ Loyola    │ Méndez    │ 2           │
-- │ 6  │ María  │ Santana   │ Moreno    │ 1           │
-- └────┴────────┴───────────┴───────────┴─────────────┘
--13.Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. 
--El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, COALESCE(max(p.total), 0) AS 'mayor pedido'
FROM cliente AS cl LEFT JOIN  pedido AS p ON p.id_cliente=cl.id
GROUP BY cl.id;
-- ┌────┬───────────┬───────────┬───────────┬──────────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ mayor pedido │
-- ├────┼───────────┼───────────┼───────────┼──────────────┤
-- │ 1  │ Aarón     │ Rivero    │ Gómez     │ 2389.23      │
-- │ 2  │ Adela     │ Salas     │ Díaz      │ 5760.0       │
-- │ 3  │ Adolfo    │ Rubio     │ Flores    │ 75.29        │
-- │ 4  │ Adrián    │ Suárez    │           │ 1983.43      │
-- │ 5  │ Marcos    │ Loyola    │ Méndez    │ 948.5        │
-- │ 6  │ María     │ Santana   │ Moreno    │ 545.75       │
-- │ 7  │ Pilar     │ Ruiz      │           │ 2400.6       │
-- │ 8  │ Pepe      │ Ruiz      │ Santana   │ 2480.4       │
-- │ 9  │ Guillermo │ López     │ Gómez     │ 0            │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ 0            │
-- └────┴───────────┴───────────┴───────────┴──────────────┘
--14.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT  SUBSTRING(fecha, 1, 4) AS año, max(total) AS 'mayor pedido' FROM pedido GROUP BY año;
-- ┌──────┬──────────────┐
-- │ año  │ mayor pedido │
-- ├──────┼──────────────┤
-- │ 2015 │ 5760.0       │
-- │ 2016 │ 2480.4       │
-- │ 2017 │ 3045.6       │
-- │ 2019 │ 2389.23      │
-- └──────┴──────────────┘
--15.Devuelve el número total de pedidos que se han realizado cada año.
SELECT  SUBSTRING(fecha, 1, 4) AS año, count(*) AS num_pedidos FROM pedido GROUP BY año;
-- ┌──────┬─────────────┐
-- │ año  │ num_pedidos │
-- ├──────┼─────────────┤
-- │ 2015 │ 2           │
-- │ 2016 │ 5           │
-- │ 2017 │ 6           │
-- │ 2019 │ 3           │
-- └──────┴─────────────┘
--Subconsultas
--Con operadores básicos de comparación
--1.Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT * FROM pedido WHERE id_cliente IN (
    SELECT id FROM cliente WHERE nombre='Adela' AND apellido1='Salas' AND apellido2='Díaz'
);
-- ┌────┬────────┬────────────┬────────────┬──────────────┐
-- │ id │ total  │   fecha    │ id_cliente │ id_comercial │
-- ├────┼────────┼────────────┼────────────┼──────────────┤
-- │ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
-- │ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
-- │ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
-- └────┴────────┴────────────┴────────────┴──────────────┘
--2.Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT count(*) AS num_pedidos FROM pedido WHERE id_comercial IN (
    SELECT id FROM comercial WHERE nombre='Daniel' AND apellido1='Sáez' AND apellido2='Vega'
);
-- ┌─────────────┐
-- │ num_pedidos │
-- ├─────────────┤
-- │ 6           │
-- └─────────────┘
--3.Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
SELECT * FROM cliente WHERE id IN (
    SELECT id_cliente FROM pedido WHERE fecha REGEXP '^2019-' GROUP BY SUBSTRING(fecha, 1, 4) HAVING total=max(total)
);
-- ┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
-- └────┴────────┴───────────┴───────────┴─────────┴───────────┘
--4.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, min(total) AS min_pedido FROM pedido WHERE id_cliente IN (
    SELECT id FROM cliente WHERE nombre='Pepe' AND apellido1='Ruiz' AND apellido2='Santana'
);
-- ┌────────────┬────────────┐
-- │   fecha    │ min_pedido │
-- ├────────────┼────────────┤
-- │ 2016-08-17 │ 110.5      │
-- └────────────┴────────────┘
--5.Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 
--con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT p.*, c.* FROM pedido AS p, cliente AS c WHERE p.id_cliente=c.id AND p.total >= (
    SELECT avg(total) FROM pedido WHERE fecha REGEXP '^2017-'
);
-- ┌────┬─────────┬────────────┬────────────┬──────────────┬────┬────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼─────────┼────────────┼────────────┼──────────────┼────┼────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
-- │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
-- └────┴─────────┴────────────┴────────────┴──────────────┴────┴────────┴───────────┴───────────┴─────────┴───────────┘
--Subconsultas con IN y NOT IN
--1.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM cliente WHERE id NOT IN (
    SELECT id_cliente FROM pedido
);
-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘
--2.Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT * FROM comercial WHERE id NOT IN (
    SELECT id_comercial FROM pedido
);
-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘
--Subconsultas con EXISTS y NOT EXISTS
--1.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT c.* FROM cliente AS c WHERE NOT EXISTS (
    SELECT * FROM pedido AS p WHERE p.id_cliente=c.id
);
-- ┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
-- │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
-- ├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
-- │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
-- │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
-- └────┴───────────┴───────────┴───────────┴─────────┴───────────┘
--2.Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT c.* FROM comercial AS c WHERE NOT EXISTS (
    SELECT * FROM pedido AS p WHERE p.id_comercial=c.id
);
-- ┌────┬─────────┬───────────┬───────────┬───────────┐
-- │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
-- ├────┼─────────┼───────────┼───────────┼───────────┤
-- │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
-- │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
-- └────┴─────────┴───────────┴───────────┴───────────┘