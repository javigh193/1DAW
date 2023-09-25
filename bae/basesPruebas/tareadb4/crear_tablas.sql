create table Departamento (
    id int,
    nombre text,
    presupuesto int,
    primary key(id)
);

create table Empleado (
	dni text,
	nombre text,
	apellido text,
	id_departamento,
	primary key(dni),
	foreign key(id_departamento) references Departamento(id)
);

