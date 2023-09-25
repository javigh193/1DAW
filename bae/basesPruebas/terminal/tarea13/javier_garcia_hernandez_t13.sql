--creación de la base de datos
.open tienda.db
--creación de las tablas
CREATE TABLE fabricante(codigo int, nombre text, primary key (codigo));
CREATE TABLE producto(codigo int, nombre text, precio real, codigo_fabricante int, primary key (codigo), foreign key (codigo_fabricante) references producto (codigo));
--inserts
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
--consultas
-- Consultas con multitabla con clausula where:
--1.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
-- Disco duro SATA3 1TB|86.99|Seagate
-- Memoria RAM DDR4 8GB|120.0|Crucial
-- Disco SSD 1 TB|150.99|Samsung
-- GeForce GTX 1050Ti|185.0|Gigabyte
-- GeForce GTX 1080 Xtreme|755.0|Crucial
-- Monitor 24 LED Full HD|202.0|Asus
-- Monitor 27 LED Full HD|245.99|Asus
-- Portátil Yoga 520|559.0|Lenovo
-- Portátil Ideapd 320|444.0|Lenovo
-- Impresora HP Deskjet 3720|59.99|Hewlett-Packard
-- Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
--**************************************************************************************
--2.Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el 
--resultado por el nombre del fabricante, por orden alfabético.
select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante order by f.nombre;
-- Monitor 24 LED Full HD|202.0|Asus
-- Monitor 27 LED Full HD|245.99|Asus
-- Memoria RAM DDR4 8GB|120.0|Crucial
-- GeForce GTX 1080 Xtreme|755.0|Crucial
-- GeForce GTX 1050Ti|185.0|Gigabyte
-- Impresora HP Deskjet 3720|59.99|Hewlett-Packard
-- Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
-- Portátil Yoga 520|559.0|Lenovo
-- Portátil Ideapd 320|444.0|Lenovo
-- Disco SSD 1 TB|150.99|Samsung
-- Disco duro SATA3 1TB|86.99|Seagate
--*******************************************************************************************
--3.Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos 
--los productos de la base de datos.
select p.codigo, p.nombre, f.codigo, f.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo;
-- 1|Disco duro SATA3 1TB|5|Seagate
-- 2|Memoria RAM DDR4 8GB|6|Crucial
-- 3|Disco SSD 1 TB|4|Samsung
-- 4|GeForce GTX 1050Ti|7|Gigabyte
-- 5|GeForce GTX 1080 Xtreme|6|Crucial
-- 6|Monitor 24 LED Full HD|1|Asus
-- 7|Monitor 27 LED Full HD|1|Asus
-- 8|Portátil Yoga 520|2|Lenovo
-- 9|Portátil Ideapd 320|2|Lenovo
-- 10|Impresora HP Deskjet 3720|3|Hewlett-Packard
-- 11|Impresora HP Laserjet Pro M26nw|3|Hewlett-Packard
--*********************************************************************************************
--3.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select p.nombre, min(p.precio), f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
--Impresora HP Deskjet 3720|59.99|Hewlett-Packard
--*********************************************************************************************
--4.Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, max(precio), f.nombre from producto as p, fabricante as f where f.codigo=p.codigo_fabricante;
--GeForce GTX 1080 Xtreme|755.0|Crucial
--*********************************************************************************************
--5.Devuelve una lista de todos los productos del fabricante Lenovo.
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo';
-- 8|Portátil Yoga 520|559.0|2|2|Lenovo
-- 9|Portátil Ideapd 320|444.0|2|2|Lenovo
--*********************************************************************************************
--6.Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Crucial' and precio>200;
--5|GeForce GTX 1080 Xtreme|755.0|6|6|Crucial
--*********************************************************************************************
--7.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre regexp 'Asus|Hewlett-Packard|Seagate';
-- 1|Disco duro SATA3 1TB|86.99|5|5|Seagate
-- 6|Monitor 24 LED Full HD|202.0|1|1|Asus
-- 7|Monitor 27 LED Full HD|245.99|1|1|Asus
-- 10|Impresora HP Deskjet 3720|59.99|3|3|Hewlett-Packard
-- 11|Impresora HP Laserjet Pro M26nw|180.0|3|3|Hewlett-Packard
--*********************************************************************************************
--8.Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre in ('Asus','Hewlett-Packard','Seagate');
-- 1|Disco duro SATA3 1TB|86.99|5|5|Seagate
-- 6|Monitor 24 LED Full HD|202.0|1|1|Asus
-- 7|Monitor 27 LED Full HD|245.99|1|1|Asus
-- 10|Impresora HP Deskjet 3720|59.99|3|3|Hewlett-Packard
-- 11|Impresora HP Laserjet Pro M26nw|180.0|3|3|Hewlett-Packard
--*********************************************************************************************
--9.Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre regexp 'e$';
-- Disco duro SATA3 1TB|86.99
-- GeForce GTX 1050Ti|185.0
--*********************************************************************************************
--10.Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select p.nombre, p.precio from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre regexp 'w';
-- Impresora HP Deskjet 3720|59.99
-- Impresora HP Laserjet Pro M26nw|180.0
--*********************************************************************************************
--11.Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio>180 order by precio desc, p.nombre;
-- GeForce GTX 1080 Xtreme|755.0|Crucial
-- Portátil Yoga 520|559.0|Lenovo
-- Portátil Ideapd 320|444.0|Lenovo
-- Monitor 27 LED Full HD|245.99|Asus
-- Monitor 24 LED Full HD|202.0|Asus
-- GeForce GTX 1050Ti|185.0|Gigabyte
--**********************************************************************************************
--12.Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select distinct f.codigo, f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo;
-- 5|Seagate
-- 6|Crucial
-- 4|Samsung
-- 7|Gigabyte
-- 1|Asus
-- 2|Lenovo
-- 3|Hewlett-Packard
--**********************************************************************************************
--Consultas con multitabla con LEFT JOIN y RIGHT JOIN
--13.Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
--El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select * from fabricante left join producto on fabricante.codigo=producto.codigo_fabricante;
-- 1|Asus|6|Monitor 24 LED Full HD|202.0|1
-- 1|Asus|7|Monitor 27 LED Full HD|245.99|1
-- 2|Lenovo|8|Portátil Yoga 520|559.0|2
-- 2|Lenovo|9|Portátil Ideapd 320|444.0|2
-- 3|Hewlett-Packard|10|Impresora HP Deskjet 3720|59.99|3
-- 3|Hewlett-Packard|11|Impresora HP Laserjet Pro M26nw|180.0|3
-- 4|Samsung|3|Disco SSD 1 TB|150.99|4
-- 5|Seagate|1|Disco duro SATA3 1TB|86.99|5
-- 6|Crucial|2|Memoria RAM DDR4 8GB|120.0|6
-- 6|Crucial|5|GeForce GTX 1080 Xtreme|755.0|6
-- 7|Gigabyte|4|GeForce GTX 1050Ti|185.0|7
-- 8|Huawei||||
-- 9|Xiaomi||||
--**********************************************************************************************
--14.Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select * from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante where p.nombre is null;
-- 8|Huawei||||
-- 9|Xiaomi||||
--**********************************************************************************************
--Nota:¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
--No. Al ser 'código_fabricante' FK de 'producto' referenciando a 'código' de 'fabricante', debe existir el 
--correspondiente fabricante a la hora de registrar un nuevo producto
--***********************************************************************************************
--Consultas realizando calculos
--15.Calcula el número total de productos que hay en la tabla productos.
select count(*) from producto;
--11
--16.Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(*) from fabricante;
--9
--17.Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select count(distinct codigo_fabricante) from producto;
--7
--18.Calcula la media del precio de todos los productos.
select avg(precio) from producto;
--271.723636363636
--19.Calcula el precio más barato de todos los productos.
select min(precio) from producto;
--59.99
--20.Calcula el precio más caro de todos los productos.
select max(precio) from producto;
--755.0
--21.Lista el nombre y el precio del producto más barato.
select nombre, min(precio) from producto;
--Impresora HP Deskjet 3720|59.99
--22.Lista el nombre y el precio del producto más caro.
select nombre, max(precio) from producto;
--GeForce GTX 1080 Xtreme|755.0
--23.Calcula la suma de los precios de todos los productos.
select sum(precio) from producto;
--2988.96
--24.Calcula el número de productos que tiene el fabricante Asus.
select count(*) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
--2
--25.Calcula la media del precio de todos los productos del fabricante Asus.
select avg(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
--223.995
--26.Calcula el precio más barato de todos los productos del fabricante Asus.
select min(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
--202.0
--27.Calcula el precio más caro de todos los productos del fabricante Asus.
select max(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
--245.99
--28.Calcula la suma de todos los productos del fabricante Asus.
select sum(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Asus';
--447.99
--29.Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
select max(precio),min(precio),avg(precio),count(precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante and f.nombre='Crucial';
--755.0|120.0|437.5|2
--30.Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
--El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
select f.nombre, count(p.codigo) as num_prod from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante group by f.codigo order by num_prod desc;
-- Asus|2
-- Lenovo|2
-- Hewlett-Packard|2
-- Crucial|2
-- Samsung|1
-- Seagate|1
-- Gigabyte|1
-- Huawei|0
-- Xiaomi|0
--*************************************************************************************************************************
--31.Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select f.nombre, max(p.precio), min(p.precio), avg(p.precio) from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante group by f.codigo;
-- Asus|245.99|202.0|223.995
-- Lenovo|559.0|444.0|501.5
-- Hewlett-Packard|180.0|59.99|119.995
-- Samsung|150.99|150.99|150.99
-- Seagate|86.99|86.99|86.99
-- Crucial|755.0|120.0|437.5
-- Gigabyte|185.0|185.0|185.0
-- Huawei|||
-- Xiaomi|||
--*************************************************************************************************************************
--32.Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
--No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
select p.codigo_fabricante, max(p.precio), min(p.precio), avg(p.precio) as promedio, count(p.precio) from producto as p group by p.codigo_fabricante having promedio>200;
-- 1|245.99|202.0|223.995|2
-- 2|559.0|444.0|501.5|2
-- 6|755.0|120.0|437.5|2
--**************************************************************************************************************************
--33.Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos 
--de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
select f.nombre, max(p.precio), min(p.precio), avg(p.precio) as promedio, count(p.precio) from producto as p, fabricante as f 
where p.codigo_fabricante=f.codigo group by p.codigo_fabricante having promedio>200;
-- Asus|245.99|202.0|223.995|2
-- Lenovo|559.0|444.0|501.5|2
-- Crucial|755.0|120.0|437.5|2
--***************************************************************************************************************************
--34.Calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(*) from producto where precio>=180;
--7
--35.Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
select codigo_fabricante, count(*) from producto where precio>=180 group by codigo_fabricante;
-- 1|2
-- 2|2
-- 3|1
-- 6|1
-- 7|1
--***************************************************************************************************************************
--36.Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
select codigo_fabricante, avg(precio) from producto group by codigo_fabricante;
-- 1|223.995
-- 2|501.5
-- 3|119.995
-- 4|150.99
-- 5|86.99
-- 6|437.5
-- 7|185.0
--****************************************************************************************************************************
--37.Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
select f.nombre, avg(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo group by codigo_fabricante;
-- Asus|223.995
-- Lenovo|501.5
-- Hewlett-Packard|119.995
-- Samsung|150.99
-- Seagate|86.99
-- Crucial|437.5
-- Gigabyte|185.0
--****************************************************************************************************************************
--38.Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
select f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo group by codigo_fabricante having avg(p.precio)>=150;
-- Asus
-- Lenovo
-- Samsung
-- Crucial
-- Gigabyte
--****************************************************************************************************************************
--39.Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
select f.nombre from fabricante as f, producto as p where f.codigo=p.codigo_fabricante group by codigo_fabricante having count(*)>=2;
-- Asus
-- Lenovo
-- Hewlett-Packard
-- Crucial
--****************************************************************************************************************************
--40.Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual 
--a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
select f.nombre, count(p.precio) from producto as p, fabricante as f where f.codigo=p.codigo_fabricante group by p.codigo_fabricante having p.precio>=220;
--Lenovo|2
--****************************************************************************************************************************
--41.Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
--El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o 
--igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select f.nombre, count(p.precio) as num_prod from fabricante as f left join (select * from producto where precio>=220) as p on p.codigo_fabricante=f.codigo 
group by f.codigo;
--****************************************************************************************************************************
--42.Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
select f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo group by codigo_fabricante having sum(p.precio)>1000;
--Lenovo
--****************************************************************************************************************************
--43.Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y 
--nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select p.nombre, p.precio, f.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo group by p.codigo_fabricante having p.precio=max(p.precio);
-- Monitor 27 LED Full HD|245.99|Asus
-- Portátil Yoga 520|559.0|Lenovo
-- Impresora HP Laserjet Pro M26nw|180.0|Hewlett-Packard
-- Disco SSD 1 TB|150.99|Samsung
-- Disco duro SATA3 1TB|86.99|Seagate
-- GeForce GTX 1080 Xtreme|755.0|Crucial
-- GeForce GTX 1050Ti|185.0|Gigabyte
--*****************************************************************************************************************************
--Subconsultas (En la cláusula WHERE)(Sin utilizar INNER JOIN)
--44.Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo';
-- 8|Portátil Yoga 520|559.0|2
-- 9|Portátil Ideapd 320|444.0|2
--*****************************************************************************************************************************
--45.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select p.* from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.precio=(
    select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo'
);
--8|Portátil Yoga 520|559.0|2
--*****************************************************************************************************************************
--46.Lista el nombre del producto más caro del fabricante Lenovo.
select p.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre='Lenovo' and p.precio=(
    select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo'
);
--Portátil Yoga 520
--****************************************************************************************************************************
--47.Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select p.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre='Hewlett-Packard' and p.precio=(
    select min(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Hewlett-Packard'
);
--Impresora HP Deskjet 3720
--****************************************************************************************************************************
--48.Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select p.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and p.precio>=(
    select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo'
);
-- GeForce GTX 1080 Xtreme
-- Portátil Yoga 520
--****************************************************************************************************************************
--49.Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select p.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo and f.nombre='Asus' and p.precio>(
    select avg(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Asus'
);
--Monitor 27 LED Full HD
--****************************************************************************************************************************
--Subconsultas con ALL y ANY
--Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
-- select * from producto where precio >= ALL (select precio from producto);
--     Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
--     Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
--     Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
--***No se pueden usar en sqlite según he investigado*************************************************************************
--Subconsultas con IN y NOT IN
--50.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante where codigo in (select codigo_fabricante from producto);
-- Asus
-- Lenovo
-- Hewlett-Packard
-- Samsung
-- Seagate
-- Crucial
-- Gigabyte
--*****************************************************************************************************************************
--51.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante where codigo not in (select codigo_fabricante from producto);
-- Huawei
-- Xiaomi
--*****************************************************************************************************************************
--Subconsultas con EXISTS y NOT EXISTS
--52.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select f.nombre from fabricante as f where not exists(
    select * from producto as p where p.codigo_fabricante=f.codigo
);
-- Asus
-- Lenovo
-- Hewlett-Packard
-- Samsung
-- Seagate
-- Crucial
-- Gigabyte
--*****************************************************************************************************************************
--53.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select f.nombre from fabricante as f where not exists(
    select * from producto as p where p.codigo_fabricante=f.codigo
);
-- Huawei
-- Xiaomi
--*****************************************************************************************************************************
--Subconsultas correlacionadas
--54.Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select f.nombre, p.nombre, max(p.precio) from fabricante as f, producto as p where f.codigo=p.codigo_fabricante group by f.codigo;
-- Asus|Monitor 27 LED Full HD|245.99
-- Lenovo|Portátil Yoga 520|559.0
-- Hewlett-Packard|Impresora HP Laserjet Pro M26nw|180.0
-- Samsung|Disco SSD 1 TB|150.99
-- Seagate|Disco duro SATA3 1TB|86.99
-- Crucial|GeForce GTX 1080 Xtreme|755.0
-- Gigabyte|GeForce GTX 1050Ti|185.0
--*****************************************************************************************************************************
--55.Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select * from producto where precio>=(
    select avg(precio) from producto group by codigo_fabricante 
);
-- 5|GeForce GTX 1080 Xtreme|755.0|6
-- 7|Monitor 27 LED Full HD|245.99|1
-- 8|Portátil Yoga 520|559.0|2
-- 9|Portátil Ideapd 320|444.0|2
--*****************************************************************************************************************************
--56.Lista el nombre del producto más caro del fabricante Lenovo.
select nombre from producto where precio=(
    select max(p.precio) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo'
);
--Portátil Yoga 520
--*****************************************************************************************************************************
--Subconsultas (En la cláusula HAVING)
--57.Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
select f.nombre from fabricante as f, producto as p where p.codigo_fabricante=f.codigo group by f.codigo having count(*)=(
    select count(*) from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and f.nombre='Lenovo'
);
-- Asus
-- Lenovo
-- Hewlett-Packard
-- Crucial
--*****************************************************************************************************************************