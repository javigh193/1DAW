create table almacen (
	id int,
	lugar text,
	capacidad int,
	primary key (id)
);
create table caja (
	id int,
	contenido text,
	valor int,
	id_almacen int,
	primary key (id),
	foreign key (id_almacen) references almacen (id)
);
insert into almacen values (1, 'Bilbao', 4);
insert into almacen values (2, 'Madrid', 4);
insert into almacen values (3, 'Sevilla', 3);
insert into almacen values (4, 'Córdoba', 2);
insert into almacen values (5, 'La Laguna', 2);
insert into almacen values (6, 'Palma de Mallorca', 4);
insert into almacen values (7, 'Santa Cruz de Tenerife', 2);
insert into almacen values (10, 'Santiago de Compostela', 2);
insert into almacen values (11, 'Granada', 3);
insert into almacen values (12, 'Cádiz', 2);
insert into almacen values (13, 'San Sebastián', 3);
insert into almacen values (14, 'Zaragoza', 2);
insert into almacen values (15, 'Vigo', 2);
insert into almacen values (16, 'La Coruña', 3);
insert into almacen values (17, 'Lugo', 2);
insert into almacen values (18, 'Girona', 3);
insert into almacen values (19, 'Ibiza', 3);
insert into almacen values (20, 'Valencia', 4);

insert into caja values (1, 'Bolos', 100, 4);
insert into caja values (2, 'Papel', 200, 4);
insert into caja values (3, 'Periódicos', 300, 3);
insert into caja values (4, 'Cartón', 200, 2);
insert into caja values (5, 'Lacón', 400, 2);
insert into caja values (6, 'Macarrones', 150, 4);
insert into caja values (7, 'Chorizo', 200, 2);
insert into caja values (10, 'Salvia', 170, 2);
insert into caja values (11, 'Gominolas', 160, 3);
insert into caja values (12, 'Cartuchos', 180, 2);
insert into caja values (13, 'Naranjas', 200, 3);
insert into caja values (14, 'Fresas', 400, 2);
insert into caja values (15, 'Tartas', 300, 2);
insert into caja values (16, 'Pan', 120, 3);
insert into caja values (17, 'Leche', 100, 2);
insert into caja values (18, 'Gatos', 200, 3);
insert into caja values (19, 'Nachos', 150, 3);
insert into caja values (20, 'Aguacate', 100, 4);

---1.Obtener todos los almacenes
select * from almacen;
---2.Obtener todas las cajas cuyo contenido tenga un valor superior a 150€
select * from caja where valor>150;
---3.Obtener los tipos de contenidos de las cajas
select distinct contenido from caja;
---4.Obtener el valor medio de todas las cajas
select avg(valor) from caja;
---5.Obtener el valor medio de las cajas de cada almacen
select avg(valor) from caja group by id_almacen;
---6.Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150€
select id from almacen where id in (select id_almacen from caja group by id having avg(valor)>150);
--7.Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en la que se encuentra.
select c.id, a.lugar from caja as c, almacen as a where c.id_almacen=a.id;
--8.Obtener el número de cajas que hay en cada almacén.
select count(*), id_almacen from caja group by id_almacen;
--9.Obtener los códigos de los almacenes que están saturados (los almacenes donde el número de cajas es superior a la capacidad).
select id_almacen from caja, almacen group by id_almacen having count(id_almacen)>almacen.capacidad;
--10.Obtener los números de referencia de las cajas que están en Bilbao.
select c.id from caja as c, almacen as a where a.lugar='Bilbao';
--11.Insertar un nuevo almacén en Madrid con capacidad para 3 cajas.
insert into almacen values (21, 'Madrid', 3);
--12.Rebajar el valor de todas las cajas un 15%, dado que estamos en rebajas.
select valor*0.85 as valor_rebajas from caja;
--13.Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.
select valor*0.8 as valor_rebajas from caja where valor > (select avg(valor) from caja);
--14.Eliminar todas las cajas cuyo valor sea inferior a 100.
delete from caja where valor<100;
--15.Vaciar el contenido de los almacenes que están saturados.
update caja
set contenido='Vacio'
where id_almacen in 
(select id_almacen from caja, almacen group by id_almacen having count(id_almacen)>almacen.capacidad);
select id_almacen from caja, almacen group by id_almacen having count(id_almacen)>almacen.capacidad;