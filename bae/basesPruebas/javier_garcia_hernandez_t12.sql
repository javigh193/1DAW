--creación de la base de datos
.open tarea12.db
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
--1.Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
/*
Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
GeForce GTX 1080 Xtreme
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Portátil Yoga 520
Portátil Ideapd 320
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
*/
--2.Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;
/*
Disco duro SATA3 1TB|86.99
Memoria RAM DDR4 8GB|120.0
Disco SSD 1 TB|150.99
GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|245.99
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Impresora HP Deskjet 3720|59.99
Impresora HP Laserjet Pro M26nw|180.0

*/
--3.Lista todas las columnas de la tabla producto.
select * from producto;
/*
1|Disco duro SATA3 1TB|86.99|5
2|Memoria RAM DDR4 8GB|120.0|6
3|Disco SSD 1 TB|150.99|4
4|GeForce GTX 1050Ti|185.0|7
5|GeForce GTX 1080 Xtreme|755.0|6
6|Monitor 24 LED Full HD|202.0|1
7|Monitor 27 LED Full HD|245.99|1
8|Portátil Yoga 520|559.0|2
9|Portátil Ideapd 320|444.0|2
10|Impresora HP Deskjet 3720|59.99|3
11|Impresora HP Laserjet Pro M26nw|180.0|3

*/
--4.Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio||" $" as precio_USA, precio||" €" from producto;
/*
Disco duro SATA3 1TB|86.99 $|86.99 €
Memoria RAM DDR4 8GB|120.0 $|120.0 €
Disco SSD 1 TB|150.99 $|150.99 €
GeForce GTX 1050Ti|185.0 $|185.0 €
GeForce GTX 1080 Xtreme|755.0 $|755.0 €
Monitor 24 LED Full HD|202.0 $|202.0 €
Monitor 27 LED Full HD|245.99 $|245.99 €
Portátil Yoga 520|559.0 $|559.0 €
Portátil Ideapd 320|444.0 $|444.0 €
Impresora HP Deskjet 3720|59.99 $|59.99 €
Impresora HP Laserjet Pro M26nw|180.0 $|180.0 €
*/
--5.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.  
select upper(nombre), precio from producto;
/*
DISCO DURO SATA3 1TB|86.99
MEMORIA RAM DDR4 8GB|120.0
DISCO SSD 1 TB|150.99
GEFORCE GTX 1050TI|185.0
GEFORCE GTX 1080 XTREME|755.0
MONITOR 24 LED FULL HD|202.0
MONITOR 27 LED FULL HD|245.99
PORTáTIL YOGA 520|559.0
PORTáTIL IDEAPD 320|444.0
IMPRESORA HP DESKJET 3720|59.99
IMPRESORA HP LASERJET PRO M26NW|180.0
*/
--6.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre), precio from producto;
/*
disco duro sata3 1tb|86.99
memoria ram ddr4 8gb|120.0
disco ssd 1 tb|150.99
geforce gtx 1050ti|185.0
geforce gtx 1080 xtreme|755.0
monitor 24 led full hd|202.0
monitor 27 led full hd|245.99
portátil yoga 520|559.0
portátil ideapd 320|444.0
impresora hp deskjet 3720|59.99
impresora hp laserjet pro m26nw|180.0
*/
--7.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, upper(substring(nombre, 1, 2)) from fabricante;
/*
Asus|AS
Lenovo|LE
Hewlett-Packard|HE
Samsung|SA
Seagate|SE
Crucial|CR
Gigabyte|GI
Huawei|HU
Xiaomi|XI
*/
--8.Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) from producto;
/*
Disco duro SATA3 1TB|87.0
Memoria RAM DDR4 8GB|120.0
Disco SSD 1 TB|151.0
GeForce GTX 1050Ti|185.0
GeForce GTX 1080 Xtreme|755.0
Monitor 24 LED Full HD|202.0
Monitor 27 LED Full HD|246.0
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Impresora HP Deskjet 3720|60.0
Impresora HP Laserjet Pro M26nw|180.0

*/
--9.Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, cast(precio as int) from producto;
/*
Disco duro SATA3 1TB|86
Memoria RAM DDR4 8GB|120
Disco SSD 1 TB|150
GeForce GTX 1050Ti|185
GeForce GTX 1080 Xtreme|755
Monitor 24 LED Full HD|202
Monitor 27 LED Full HD|245
Portátil Yoga 520|559
Portátil Ideapd 320|444
Impresora HP Deskjet 3720|59
Impresora HP Laserjet Pro M26nw|180
*/
--9.Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select distinct f.codigo from fabricante as f, producto as p where f.codigo=p.codigo_fabricante;
/*
5
6
4
7
1
2
3
*/
--10.Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select distinct f.codigo from fabricante as f, producto as p where f.codigo=p.codigo_fabricante;
/*
5
6
4
7
1
2
3
*/
--11.Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre;
/*
Asus
Crucial
Gigabyte
Hewlett-Packard
Huawei
Lenovo
Samsung
Seagate
Xiaomi
*/
--12.Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;
/*
Xiaomi
Seagate
Samsung
Lenovo
Huawei
Hewlett-Packard
Gigabyte
Crucial
Asus
*/
--13.Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre from producto order by nombre, precio desc;
/*
Disco SSD 1 TB
Disco duro SATA3 1TB
GeForce GTX 1050Ti
GeForce GTX 1080 Xtreme
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
Memoria RAM DDR4 8GB
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Portátil Ideapd 320
Portátil Yoga 520
*/
--14.Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
/*
1|Asus
2|Lenovo
3|Hewlett-Packard
4|Samsung
5|Seagate
*/
--15.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante limit 3, 2;
/*
4|Samsung
5|Seagate
*/
--16.Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio limit 1;
/*
Impresora HP Deskjet 3720|59.99
*/
--17.Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;
/*
GeForce GTX 1080 Xtreme|755.0
*/
--18.Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select nombre from producto where codigo_fabricante=2;
/*
Portátil Yoga 520
Portátil Ideapd 320
*/
--19.Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto where precio<=120;
/*
Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Impresora HP Deskjet 3720
*/
--20.Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto where precio>=400;
/*
GeForce GTX 1080 Xtreme
Portátil Yoga 520
Portátil Ideapd 320
*/
--21.Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre from producto where precio>80 and precio<300;
/*
Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Laserjet Pro M26nw
*/
--22.Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select nombre from producto where precio between 60 and 200;
/*
Disco duro SATA3 1TB
Memoria RAM DDR4 8GB
Disco SSD 1 TB
GeForce GTX 1050Ti
Impresora HP Laserjet Pro M26nw
*/
--23.Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select nombre from producto where precio>200 and codigo_fabricante=6;
/*
GeForce GTX 1080 Xtreme
*/
--24.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select nombre from producto where codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5;
/*
Disco duro SATA3 1TB
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
*/
--25.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select nombre from producto where codigo_fabricante in (1,3,5);
/*
Disco duro SATA3 1TB
Monitor 24 LED Full HD
Monitor 27 LED Full HD
Impresora HP Deskjet 3720
Impresora HP Laserjet Pro M26nw
*/
--26.Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio*100 as precio_cent from producto;
/*
Disco duro SATA3 1TB|8699.0
Memoria RAM DDR4 8GB|12000.0
Disco SSD 1 TB|15099.0
GeForce GTX 1050Ti|18500.0
GeForce GTX 1080 Xtreme|75500.0
Monitor 24 LED Full HD|20200.0
Monitor 27 LED Full HD|24599.0
Portátil Yoga 520|55900.0
Portátil Ideapd 320|44400.0
Impresora HP Deskjet 3720|5999.0
Impresora HP Laserjet Pro M26nw|18000.0
*/
--27.Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre regexp '^S';
/*
Samsung
Seagate
*/
--28.Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre regexp 'e$';
/*
Seagate
Gigabyte
*/
--29.Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre regexp 'w';
/*
Hewlett-Packard
Huawei
*/
--30.Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where nombre regexp '^.{4}$';
/*
Asus
*/
--31.Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from producto where nombre regexp 'Portátil';
/*
Portátil Yoga 520
Portátil Ideapd 320
*/
--32.Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre regexp 'Monitor' and precio<215;
/*
Monitor 24 LED Full HD
*/
--33.Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from producto where precio>=180 order by precio desc, nombre;
/*
GeForce GTX 1080 Xtreme|755.0
Portátil Yoga 520|559.0
Portátil Ideapd 320|444.0
Monitor 27 LED Full HD|245.99
Monitor 24 LED Full HD|202.0
GeForce GTX 1050Ti|185.0
Impresora HP Laserjet Pro M26nw|180.0
*/