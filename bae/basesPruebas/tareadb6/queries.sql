--1.Obtener todos los datos de los productos de la tienda.
select * from articulo;
--2.Obtener los nombres de los productos de la tienda.
select nombre from articulo;
--3.Obtener los nombres y precio de los productos de la tienda. Obtener los nombres de los artículos sin repeticiones.
select distinct nombre, precio from articulo;
--4.Obtener todos los datos del artículo cuya clave de producto es 5.
select * from articulo where clave=5;
--5.Obtener todos los datos del artículo cuyo nombre del producto es Teclado.
select * from articulo where nombre='Teclado';
--6.Obtener todos los datos de la Memoria RAM y memorias USB.
select * from articulo where nombre in ('Memoria RAM', 'Memoria USB');
--7.Obtener todos los datos de los artículos que empiezan con M.
select * from articulo where nombre like 'M%';
--8.Obtener el nombre de los productos donde el precio sea 100.
select nombre from articulo where precio=100;
--9.Obtener el nombre de los productos donde el precio sea mayor a 200.
select nombre from articulo where precio>200;
--10.Obtener todos los datos de los artículos cuyo precio este entre 100 y 350.
select * from articulo where precio between 100 and 300;
--11.Obtener el precio medio de todos los productos.
select avg(precio) from articulo;
--12.Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
select avg(precio) from articulo where clave_fabricante='2';
--13.Obtener el nombre y precio de los artículos ordenados por Nombre.
select nombre, precio from articulo order by nombre;
--14.Obtener todos los datos de los productos ordenados descendentemente por Precio.
select * from articulo order by precio desc;
--15.Obtener el nombre y precio de los artículos cuyo precio sea mayor a 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre.
select nombre, precio from articulo where precio>250 order by precio desc, nombre asc;
--16.Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante.
select a.clave, a.nombre, a.precio, a. clave_fabricante, f.nombre from articulo as a, fabricante as f where a.clave_fabricante=f.dni;
--17.Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta
select a.clave, a.nombre, f.nombre from articulo as a, fabricante as f where a.clave_fabricante=f.dni;
--18.Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre del producto.
select a.nombre, a.precio from articulo as a, fabricante as f where a.clave_fabricante=f.dni and f.nombre='Logitech' order by a.nombre;
--19.Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendentemente por precio.
select a.nombre, a.precio, f.nombre from articulo as a, fabricante as f where a.clave_fabricante=f.dni and f.nombre in ('Lexar','Kingston') order by a.precio desc;
--20.Añade un nuevo producto: Clave del producto 11, Altavoces de 120 del fabricante 2.
insert into articulo values (11, 'Altavoces', 120, 2);
--21.Cambia el nombre del producto 6 a Impresora Laser.
update articulo 
set nombre='Impresora Láser' 
where clave=6;
--22.Aplicar un descuento del 10% a todos los productos.
select precio * 0.9 as precio_rebajado, precio as precio_original from articulo;
--23.Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 300.
select precio * 0.9 as precio_rebajado, precio as precio_original from articulo where precio>=300;
--24.Borra el producto número 6.
delete from articulo
where clave=6;