--Creación de las tablas
create table despacho(
	id int,
	capacidad int,
	primary key (id)
);
create table director(
	dni text,
	nombre text,
	apellido text,
	id_despacho int,
	director_jefe text,
	foreign key (director_jefe) references dni,
	foreign key (id_despacho) references despacho (id),
	primary key (dni)
);
--Inserciones a las tablas
--Tabla despacho
insert into despacho (id, capacidad) values (1, 5);
insert into despacho (id, capacidad) values (2, 5);
insert into despacho (id, capacidad) values (3, 3);
insert into despacho (id, capacidad) values (4, 1);
insert into despacho (id, capacidad) values (5, 5);
--Tabla director
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11111111T', 'Paco', 'Pérez', 3, null);
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('00000000H', 'Juán', 'López', 3, null);
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11111112K', 'Alberto', 'Pérez', 3, null);
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11413112T', 'Luis', 'Márquez', 2, null);
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11111987M', 'Pablo', 'Abreu', 4, null);
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11111122L', 'Marcos', 'Hernández', 1, '11111987M');
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11113132U', 'María', 'Puentes', 1, '11111987M');
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('32111122L', 'Raúl', 'Hernández', 1, '11111987M');
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('11114444P', 'Luis', 'Herrera', 5, '11111987M');
insert into director (dni, nombre, apellido, id_despacho, director_jefe) values ('12345678O', 'Marcos', 'Gómez', 5, '11111987M');
--Consultas
--1.Mostrar el DNI, nombre y apellidos de todos los directores.
select dni, nombre, apellido from director;
--2.Mostrar los datos de los directores que no tienen jefes.
select * from director where director_jefe=null;
--3.Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra.
select dir.nombre, dir.apellido, des.capacidad from director as dir, despacho as des where id_despacho=des.id;
--4.Mostrar el número de directores que hay en cada despacho.
select count(*) from director group by id_despacho;
--5.Mostrar los datos de los directores cuyos jefes no tienen jefes.
select * from director where director_jefe in (select dni from director where director_jefe=null);
--6-Mostrar los nombres y apellidos de los directores junto con los de su jefe.
select d1.nombre, d1.apellido, d2.nombre, d2.apellido from director as d1, director as d2 where d1.director_jefe=d2.dni;
--7.Mostrar el número de despachos que están sobreutilizados.
select id from despacho where capacidad>(select count(*) from director where id_despacho=id);
--8.Añadir un nuevo director llamado Paco Pérez, DNI 11111111T, sin jefe, situado en el despacho 3.
insert into director values ('11111111T', 'Paco', 'Pérez', 3, null);
--9.Asignar a todos los empleados apellidados Pérez un nuevo jefe con DNI 00000000H.
update director 
set director_jefe='00000000H'
where apellido='Pérez';
--10.Despedir a todos los directores que tengan jefe.
delete from director where director_jefe is not null; 