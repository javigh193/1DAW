--creacion de tablas
create table pieza(
	id int,
	nombre text,
	primary key (id)
);
create table proveedor(
	id text,
	nombre text,
	primary key (id)
);
create table suministrador(	
	ref_pieza_codigo int,
	ref_proveedor text,
	precio int,
	primary key (ref_pieza_codigo, ref_proveedor),
	foreign key (ref_pieza_codigo) references pieza (id),
	foreign key (ref_proveedor) references proveedor (id)
);
--inserts en las tablas
insert into pieza values (1, 'tornillos');
insert into pieza values (2, 'tuerca');
insert into pieza values (3, 'soga');
insert into pieza values (4, 'llave');
insert into pieza values (5, 'nivel');
insert into pieza values (6, 'tubo');
insert into pieza values (7, 'martillo');
insert into pieza values (8, 'sierra');
insert into pieza values (9, 'taladro');
insert into pieza values (10, 'arandelas');
----------------------------------------------
insert into proveedor values ('HAL', 'HALAL');
insert into proveedor values ('TNBC', 'SkeHington Supplies');
insert into proveedor values ('RBT', 'Susan Calvin Corp');
insert into proveedor values ('DANTE', 'Dimas Abrante');
insert into proveedor values ('PTE', 'Puerto Enterprise');
----------------------------------------------
insert into suministrador values (2,'HAL',10);
insert into suministrador values (1,'HAL',8);
insert into suministrador values (4,'RBT',14);
insert into suministrador values (5,'HAL',7);
insert into suministrador values (3,'DANTE',10);
insert into suministrador values (8,'PTE',9);
insert into suministrador values (3,'PTE',9);
--queries
--1.Obtener los nombres de todas las piezas.
select nombre from pieza;
--2.Obtener todos los datos de todos los proveedores.
select * from proveedor;
--3.Obtener el precio medio al que se nos suministran las piezas.
select avg(precio) from suministrador;
--4.Obtener los nombres de los proveedores que suministran la pieza 1.
select nombre from proveedor where id in (
	select ref_proveedor from suministrador where ref_pieza_codigo=1);
--5.Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL.
select nombre from pieza where id in (
	select ref_pieza_codigo from suministrador where ref_proveedor='HAL');
--6.Obtener los nombres de los proveedores que suministran las piezas más caras, indicando el nombre de la pieza y el precio al que la suministran.
select nombre, precio from proveedor, suministrador 
where proveedor.id=suministrador.ref_proveedor and suministrador.ref_proveedor in (
	select ref_proveedor from suministrador where precio =(
		select max(precio) from suministrador));
--select p.nombre from proveedor as p, suministrador as s where s.ref_proveedor=p.id  group by s.ref_proveedor having s.precio = (select max(precio) from suministrador);
--7.Hacer constar en la base de datos que la empresa SkeHington Supplies (codigo TNBC) va a empezar a suministrarnos los elementos piezas con código 1 a 10 € cada tuerca.
insert into suministrador values (1, 'TNBC', 10);
--8.Aumentar los precios en una unidad.
update suministrador set precio=precio+1;
--9.Hacer constar en la base de datos que la empresa Susan Calvin Corp.(RBT) no va a suministrarnos ninguna pieza (aunque la empresa en si va a seguir constando en nuestra base de datos).
delete from suministrador where ref_proveedor='RBT';
--10.Hacer constar en la base de datos que la empresa Susan Calvin Corp. (RBT) ya no va a suministrarnos clavos (código 4).
delete from suministrador where ref_proveedor='RBT' and ref_pieza_codigo=4;