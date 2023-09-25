create table fabricante (
	dni text,
	nombre text,
	primary key (dni)
);

create table articulo (
	clave int,
	nombre text,
	precio int,
	clave_fabricante text,
	primary key clave,
	foreign key (clave_fabricante) references fabricante(dni)
);

