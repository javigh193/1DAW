-- Consultas sobre una tabla (0,6 puntos)
-- 1. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio limit 1;
-- ┌───────────────────────────┬────────┐
-- │          nombre           │ precio │
-- ├───────────────────────────┼────────┤
-- │ Impresora HP Deskjet 3720 │ 59.99  │
-- └───────────────────────────┴────────┘
-- 2. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre from producto where precio>=80 and precio<=300;
-- ┌─────────────────────────────────┐
-- │             nombre              │
-- ├─────────────────────────────────┤
-- │ Disco duro SATA3 1TB            │
-- │ Memoria RAM DDR4 8GB            │
-- │ Disco SSD 1 TB                  │
-- │ GeForce GTX 1050Ti              │
-- │ Monitor 24 LED Full HD          │
-- │ Monitor 27 LED Full HD          │
-- │ Impresora HP Laserjet Pro M26nw │
-- └─────────────────────────────────┘
-- 3. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where nombre regexp '^.{4}$';
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Asus   │
-- └────────┘
-- 4. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from producto where nombre regexp 'Portátil';
-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘
-- 5. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre regexp 'Monitor' and precio<215;
-- ┌────────────────────────┐
-- │         nombre         │
-- ├────────────────────────┤
-- │ Monitor 24 LED Full HD │
-- └────────────────────────┘
-- 6. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from producto where precio>=180 order by precio desc, nombre;
-- ┌─────────────────────────────────┬────────┐
-- │             nombre              │ precio │
-- ├─────────────────────────────────┼────────┤
-- │ GeForce GTX 1080 Xtreme         │ 755.0  │
-- │ Portátil Yoga 520               │ 559.0  │
-- │ Portátil Ideapd 320             │ 444.0  │
-- │ Monitor 27 LED Full HD          │ 245.99 │
-- │ Monitor 24 LED Full HD          │ 202.0  │
-- │ GeForce GTX 1050Ti              │ 185.0  │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- └─────────────────────────────────┴────────┘
-- Consultas multitabla (INNER 0,7 puntos) Obligatorio aprobar
-- 7. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
select p.nombre, max(p.precio) as precio, f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante;
-- ┌─────────────────────────┬────────┬─────────┐
-- │         nombre          │ precio │ nombre  │
-- ├─────────────────────────┼────────┼─────────┤
-- │ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial │
-- └─────────────────────────┴────────┴─────────┘
-- 8. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select p.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre in ('Crucial') and precio>200;
-- ┌─────────────────────────┐
-- │         nombre          │
-- ├─────────────────────────┤
-- │ GeForce GTX 1080 Xtreme │
-- └─────────────────────────┘
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select p.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre='Asus' or f.nombre='Hewlett-Packard' or f.nombre='Seagate';
-- ┌─────────────────────────────────┐
-- │             nombre              │
-- ├─────────────────────────────────┤
-- │ Disco duro SATA3 1TB            │
-- │ Monitor 24 LED Full HD          │
-- │ Monitor 27 LED Full HD          │
-- │ Impresora HP Deskjet 3720       │
-- │ Impresora HP Laserjet Pro M26nw │
-- └─────────────────────────────────┘
-- 10. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select p.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
-- ┌─────────────────────────────────┐
-- │             nombre              │
-- ├─────────────────────────────────┤
-- │ Disco duro SATA3 1TB            │
-- │ Monitor 24 LED Full HD          │
-- │ Monitor 27 LED Full HD          │
-- │ Impresora HP Deskjet 3720       │
-- │ Impresora HP Laserjet Pro M26nw │
-- └─────────────────────────────────┘
-- 11. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select p.nombre, p.precio from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre regexp 'e$';
-- ┌──────────────────────┬────────┐
-- │        nombre        │ precio │
-- ├──────────────────────┼────────┤
-- │ Disco duro SATA3 1TB │ 86.99  │
-- │ GeForce GTX 1050Ti   │ 185.0  │
-- └──────────────────────┴────────┘
-- 12. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select p.nombre, p.precio from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where f.nombre regexp 'w';
-- ┌─────────────────────────────────┬────────┐
-- │             nombre              │ precio │
-- ├─────────────────────────────────┼────────┤
-- │ Impresora HP Deskjet 3720       │ 59.99  │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- └─────────────────────────────────┴────────┘
-- 13. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio, f.nombre from producto as p join fabricante as f on f.codigo=p.codigo_fabricante where p.precio>180 order by precio desc, p.nombre;
-- ┌─────────────────────────┬────────┬──────────┐
-- │         nombre          │ precio │  nombre  │
-- ├─────────────────────────┼────────┼──────────┤
-- │ GeForce GTX 1080 Xtreme │ 755.0  │ Crucial  │
-- │ Portátil Yoga 520       │ 559.0  │ Lenovo   │
-- │ Portátil Ideapd 320     │ 444.0  │ Lenovo   │
-- │ Monitor 27 LED Full HD  │ 245.99 │ Asus     │
-- │ Monitor 24 LED Full HD  │ 202.0  │ Asus     │
-- │ GeForce GTX 1050Ti      │ 185.0  │ Gigabyte │
-- └─────────────────────────┴────────┴──────────┘
-- 14. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select distinct f.codigo, f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante;
-- ┌────────┬─────────────────┐
-- │ codigo │     nombre      │
-- ├────────┼─────────────────┤
-- │ 5      │ Seagate         │
-- │ 6      │ Crucial         │
-- │ 4      │ Samsung         │
-- │ 7      │ Gigabyte        │
-- │ 1      │ Asus            │
-- │ 2      │ Lenovo          │
-- │ 3      │ Hewlett-Packard │
-- └────────┴─────────────────┘
-- Consultas multitabla (LEFT/RIGHT JOIN 0,2) Obligatorio aprobar
-- 15. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
--El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select f.nombre as fabricante_nombre, p.nombre as producto_nombre from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante order by f.nombre;
-- ┌───────────────────┬─────────────────────────────────┐
-- │ fabricante_nombre │         producto_nombre         │
-- ├───────────────────┼─────────────────────────────────┤
-- │ Asus              │ Monitor 24 LED Full HD          │
-- │ Asus              │ Monitor 27 LED Full HD          │
-- │ Crucial           │ GeForce GTX 1080 Xtreme         │
-- │ Crucial           │ Memoria RAM DDR4 8GB            │
-- │ Gigabyte          │ GeForce GTX 1050Ti              │
-- │ Hewlett-Packard   │ Impresora HP Deskjet 3720       │
-- │ Hewlett-Packard   │ Impresora HP Laserjet Pro M26nw │
-- │ Huawei            │                                 │
-- │ Lenovo            │ Portátil Ideapd 320             │
-- │ Lenovo            │ Portátil Yoga 520               │
-- │ Samsung           │ Disco SSD 1 TB                  │
-- │ Seagate           │ Disco duro SATA3 1TB            │
-- │ Xiaomi            │                                 │
-- └───────────────────┴─────────────────────────────────┘
-- 16. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select f.nombre from fabricante as f left join producto as p on f.codigo=p.codigo_fabricante where p.codigo is null order by f.nombre;
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘
--  Consultas resumen (0,6)
-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
--El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select f.nombre as nombre_fabricante, max(p.precio) as precio_máximo, min(p.precio) as precio_mínimo, avg(p.precio) as precio_promedio 
from producto as p join fabricante as f on f.codigo=p.codigo_fabricante 
group by f.nombre;
-- ┌───────────────────┬───────────────┬───────────────┬─────────────────┐
-- │ nombre_fabricante │ precio_máximo │ precio_mínimo │ precio_promedio │
-- ├───────────────────┼───────────────┼───────────────┼─────────────────┤
-- │ Asus              │ 245.99        │ 202.0         │ 223.995         │
-- │ Crucial           │ 755.0         │ 120.0         │ 437.5           │
-- │ Gigabyte          │ 185.0         │ 185.0         │ 185.0           │
-- │ Hewlett-Packard   │ 180.0         │ 59.99         │ 119.995         │
-- │ Lenovo            │ 559.0         │ 444.0         │ 501.5           │
-- │ Samsung           │ 150.99        │ 150.99        │ 150.99          │
-- │ Seagate           │ 86.99         │ 86.99         │ 86.99           │
-- └───────────────────┴───────────────┴───────────────┴─────────────────┘
-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
--No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
select f.codigo, max(p.precio) as precio_máximo, min(p.precio) as precio_mínimo, avg(p.precio) as precio_promedio, count(*) as cantidad_productos 
from producto as p join fabricante as f on f.codigo=p.codigo_fabricante
group by f.codigo having precio_promedio>200;
-- ┌────────┬───────────────┬───────────────┬─────────────────┬────────────────────┐
-- │ codigo │ precio_máximo │ precio_mínimo │ precio_promedio │ cantidad_productos │
-- ├────────┼───────────────┼───────────────┼─────────────────┼────────────────────┤
-- │ 1      │ 245.99        │ 202.0         │ 223.995         │ 2                  │
-- │ 6      │ 755.0         │ 120.0         │ 437.5           │ 2                  │
-- │ 2      │ 559.0         │ 444.0         │ 501.5           │ 2                  │
-- └────────┴───────────────┴───────────────┴─────────────────┴────────────────────┘
-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que 
--tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
select f.nombre, max(p.precio) as precio_máximo, min(p.precio) as precio_mínimo, avg(p.precio) as precio_promedio, count(*) as cantidad_productos 
from producto as p join fabricante as f on f.codigo=p.codigo_fabricante
group by f.codigo having precio_promedio>200;
-- ┌─────────┬───────────────┬───────────────┬─────────────────┬────────────────────┐
-- │ nombre  │ precio_máximo │ precio_mínimo │ precio_promedio │ cantidad_productos │
-- ├─────────┼───────────────┼───────────────┼─────────────────┼────────────────────┤
-- │ Asus    │ 245.99        │ 202.0         │ 223.995         │ 2                  │
-- │ Crucial │ 755.0         │ 120.0         │ 437.5           │ 2                  │
-- │ Lenovo  │ 559.0         │ 444.0         │ 501.5           │ 2                  │
-- └─────────┴───────────────┴───────────────┴─────────────────┴────────────────────┘
-- 20. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
--El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ 
--deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select distinct f.nombre as nombre_fabricante, coalesce((select count(*) from producto where codigo_fabricante=f.codigo group by codigo_fabricante having precio>=220), 0) as 'cantidad_220+'
from fabricante as f left join producto as p on p.codigo_fabricante=f.codigo;
-- ┌───────────────────┬───────────────┐
-- │ nombre_fabricante │ cantidad_220+ │
-- ├───────────────────┼───────────────┤
-- │ Asus              │ 0             │
-- │ Lenovo            │ 2             │
-- │ Hewlett-Packard   │ 0             │
-- │ Samsung           │ 0             │
-- │ Seagate           │ 0             │
-- │ Crucial           │ 0             │
-- │ Gigabyte          │ 0             │
-- │ Huawei            │ 0             │
-- │ Xiaomi            │ 0             │
-- └───────────────────┴───────────────┘
-- 21. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
select f.nombre from fabricante as f join producto as p on f.codigo=p.codigo_fabricante group by f.codigo having sum(p.precio)>1000;
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Lenovo │
-- └────────┘
-- 22. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
--El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select p.nombre as producto_nombre, max(p.precio) as producto_más_caro, f.nombre as fabricante_nombre
from producto as p join fabricante as f on f.codigo=p.codigo_fabricante
group by f.codigo
order by f.nombre; 
-- ┌─────────────────────────────────┬───────────────────┬───────────────────┐
-- │         producto_nombre         │ producto_más_caro │ fabricante_nombre │
-- ├─────────────────────────────────┼───────────────────┼───────────────────┤
-- │ Monitor 27 LED Full HD          │ 245.99            │ Asus              │
-- │ GeForce GTX 1080 Xtreme         │ 755.0             │ Crucial           │
-- │ GeForce GTX 1050Ti              │ 185.0             │ Gigabyte          │
-- │ Impresora HP Laserjet Pro M26nw │ 180.0             │ Hewlett-Packard   │
-- │ Portátil Yoga 520               │ 559.0             │ Lenovo            │
-- │ Disco SSD 1 TB                  │ 150.99            │ Samsung           │
-- │ Disco duro SATA3 1TB            │ 86.99             │ Seagate           │
-- └─────────────────────────────────┴───────────────────┴───────────────────┘
--  Subconsultas (En la cláusula WHERE 0,9 obligatorio aprobar). 
--Con operadores básicos de comparación.
-- 24. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre='Lenovo');
-- ┌─────────────────────┐
-- │       nombre        │
-- ├─────────────────────┤
-- │ Portátil Yoga 520   │
-- │ Portátil Ideapd 320 │
-- └─────────────────────┘
-- 25. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto where precio=(select max(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre='Lenovo'));
-- ┌────────┬───────────────────┬────────┬───────────────────┐
-- │ codigo │      nombre       │ precio │ codigo_fabricante │
-- ├────────┼───────────────────┼────────┼───────────────────┤
-- │ 8      │ Portátil Yoga 520 │ 559.0  │ 2                 │
-- └────────┴───────────────────┴────────┴───────────────────┘
-- 26. Lista el nombre del producto más caro del fabricante Lenovo.
select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre='Lenovo') and precio=(select max(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre='Lenovo'));
-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘
-- 27. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre='Hewlett-Packard') and precio=(select min(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre='Hewlett-Packard'));
-- ┌───────────────────────────┐
-- │          nombre           │
-- ├───────────────────────────┤
-- │ Impresora HP Deskjet 3720 │
-- └───────────────────────────┘
-- 28. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select nombre from producto where precio>=(select max(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre='Lenovo'));
-- ┌─────────────────────────┐
-- │         nombre          │
-- ├─────────────────────────┤
-- │ GeForce GTX 1080 Xtreme │
-- │ Portátil Yoga 520       │
-- └─────────────────────────┘
-- 29. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select nombre from producto where codigo_fabricante=(select codigo from fabricante where nombre='Asus') 
and precio>(select avg(precio) from producto where codigo_fabricante=(select codigo from fabricante where nombre='Asus'));
-- ┌────────────────────────┐
-- │         nombre         │
-- ├────────────────────────┤
-- │ Monitor 27 LED Full HD │
-- └────────────────────────┘
-- 30. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

-- 31.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

-- Subconsultas con IN y NOT IN (0,2 obligatorio aprobar)
-- 32. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select distinct f.nombre from fabricante as f, producto as p where f.codigo in (select distinct p.codigo_fabricante);
-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Seagate         │
-- │ Crucial         │
-- │ Samsung         │
-- │ Gigabyte        │
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- └─────────────────┘
-- 33. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select distinct f.nombre from fabricante as f, producto as p where f.codigo not in (select codigo_fabricante from producto);
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘
-- Subconsultas con EXISTS y NOT EXISTS (0,2 obligatorio aprobar)
-- 34. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select distinct nombre from fabricante as f where exists (select * from producto where codigo_fabricante=f.codigo);
-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- │ Samsung         │
-- │ Seagate         │
-- │ Crucial         │
-- │ Gigabyte        │
-- └─────────────────┘
-- 35. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select distinct nombre from fabricante as f where not exists (select * from producto where codigo_fabricante=f.codigo);
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Huawei │
-- │ Xiaomi │
-- └────────┘
--  Subconsultas correlacionadas (0,5 obligatorio aprobar)
-- 36. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select f.nombre as nombre_fabricante, p.nombre as nombre_producto, p.precio
from fabricante as f, producto as p where p.codigo_fabricante=f.codigo 
and precio=(select max(precio) from producto where codigo_fabricante=p.codigo_fabricante group by codigo_fabricante);
-- ┌───────────────────┬─────────────────────────────────┬────────┐
-- │ nombre_fabricante │         nombre_producto         │ precio │
-- ├───────────────────┼─────────────────────────────────┼────────┤
-- │ Seagate           │ Disco duro SATA3 1TB            │ 86.99  │
-- │ Samsung           │ Disco SSD 1 TB                  │ 150.99 │
-- │ Gigabyte          │ GeForce GTX 1050Ti              │ 185.0  │
-- │ Crucial           │ GeForce GTX 1080 Xtreme         │ 755.0  │
-- │ Asus              │ Monitor 27 LED Full HD          │ 245.99 │
-- │ Lenovo            │ Portátil Yoga 520               │ 559.0  │
-- │ Hewlett-Packard   │ Impresora HP Laserjet Pro M26nw │ 180.0  │
-- └───────────────────┴─────────────────────────────────┴────────┘
-- 37. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select p.nombre as nombre_producto
from fabricante as f, producto as p where p.codigo_fabricante=f.codigo 
and precio>=(select (precio) from producto where codigo_fabricante=p.codigo_fabricante group by codigo_fabricante);
-- ┌─────────────────────────────────┐
-- │         nombre_producto         │
-- ├─────────────────────────────────┤
-- │ Disco duro SATA3 1TB            │
-- │ Memoria RAM DDR4 8GB            │
-- │ Disco SSD 1 TB                  │
-- │ GeForce GTX 1050Ti              │
-- │ GeForce GTX 1080 Xtreme         │
-- │ Monitor 24 LED Full HD          │
-- │ Monitor 27 LED Full HD          │
-- │ Portátil Yoga 520               │
-- │ Impresora HP Deskjet 3720       │
-- │ Impresora HP Laserjet Pro M26nw │
-- └─────────────────────────────────┘
-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
select p.nombre from producto as p, fabricante as f where p.codigo_fabricante=f.codigo and p.codigo_fabricante=(select codigo from fabricante where nombre='Lenovo') 
and p.precio=(select max(precio) from producto where codigo_fabricante=p.codigo_fabricante);
-- ┌───────────────────┐
-- │      nombre       │
-- ├───────────────────┤
-- │ Portátil Yoga 520 │
-- └───────────────────┘
--Subconsultas (En la cláusula HAVING)
-- 40 .Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
select distinct f.nombre from fabricante as f join producto as p on p.codigo_fabricante=f.codigo where f.codigo in (
    select codigo_fabricante from producto group by codigo_fabricante having count(*)=(
        select count(*) from producto where codigo_fabricante in (select codigo from fabricante where nombre='Lenovo'
    )));
-- ┌─────────────────┐
-- │     nombre      │
-- ├─────────────────┤
-- │ Crucial         │
-- │ Asus            │
-- │ Lenovo          │
-- │ Hewlett-Packard │
-- └─────────────────┘