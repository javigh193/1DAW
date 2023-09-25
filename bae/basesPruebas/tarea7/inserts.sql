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
