-- sentencia sql de creación de la/s tabla/s de la bbdd
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

-- sentencia sql para la inserción de datos
insert into Departamento (id, nombre, presupuesto) values (11, 'RRHH', 60000);
insert into Departamento (id, nombre, presupuesto) values (2, 'Informática', 120000);
insert into Departamento (id, nombre, presupuesto) values (10, 'Ventas', 150000);
insert into Departamento (id, nombre, presupuesto) values (9, 'Jardinería', 40000);
insert into Departamento (id, nombre, presupuesto) values (8, 'Ingeniería', 60000);
insert into Departamento (id, nombre, presupuesto) values (7, 'Logística', 80000);
insert into Departamento (id, nombre, presupuesto) values (12, 'Mantenimiento', 70000);
insert into Departamento (id, nombre, presupuesto) values (5, 'Márketing', 120000);
insert into Departamento (id, nombre, presupuesto) values (4, 'Servicios', 100000);
insert into Departamento (id, nombre, presupuesto) values (3, 'Asuntos Internos', 40000);

insert into Empleado (dni, nombre, apellido, id_departamento) values ('1111A','Juan','Pérez',11);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1112A','Paco','García',12);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1113A','Marcos','Pérez',13);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1114A','Luis','Pérez',11);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1115A','Juan','Márquez',12);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1122A','Juan','Pérez',2);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1133A','María','García',2);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('00000000','Esther','Vázquez',11);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1134P','Carlos','Palmero',11);
insert into Empleado (dni, nombre, apellido, id_departamento) values ('1234G','Carla','López',12);

-- Sentencia sql para cada una de las consultas especificadas.
--- 1. Obtener los apellidos de los empleados.
select apellido from Empleado;
--- 2. Obtener los apellidos de los empleados sin repeticiones.
select distinct apellido from Empleado;
--- 3. Obtener todos los datos de los empleados que se apellidan López.
select * from Empleado where apellido='López';
--- 4. Obtener todos los datos de los empleados que se apellidan López y los que se apellidan Pérez.
select * from Empleado where apellido in ('López', 'Pérez');
--- 5. Obtener todos los datos de los empleados que trabajan para el departamento 10.
select * from Empleado where id_departamento=10;
--- 6. Obtener todos los datos de los empleados que trabajan para el departamento 8 y para el departamento 5.
select * from Empleado where id_departamento in (8, 5);
--- 7. Obtener todos los datos de los empleados cuyo apellido comience por P.
select * from Empleado where apellido like 'P%';
--- 8. Obtener el presupuesto total de todos los departamentos.
select sum(presupuesto) from Departamento;
--- 9. Obtener el número de empleados en cada departamento.
select count(nombre) as numero_empleados, id_departamento from Empleado group by id_departamento;
--- 10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
select e.dni, e.nombre, e.apellido, e.id_departamento, d.nombre, d.presupuesto from Empleado as e join Departamento as d on e.id_departamento=d.id;
--- 11. Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.
select Empleado.nombre, apellido, Departamento.nombre, Departamento.id from Empleado join Departamento on Empleado.id_departamento=Departamento.id;
--- 12. Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.
select Empleado.nombre, apellido from Empleado join Departamento on Empleado.id_departamento=Departamento.id where Departamento.presupuesto>60000;
--- 13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
select * from Departamento where presupuesto > (select avg(presupuesto) from Departamento);
--- 14. Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.
select nombre from Departamento where id in (select id_departamento from (select count(nombre) as numero_empleados, id_departamento from Empleado group by id_departamento) where numero_empleados > 2);
--- 15. Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11 (14, ya tenía el 11).  
insert into Departamento values (14, 'Calidad', 40000);
--- 16. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.
--- Ya se creó con dicha empleada, le cambio el dni: 
insert into Empleado values (00000007, Esther, Vázquez, 14);
--- 17. Calcular un recorte presupuestario del 10 % a todos los departamentos.
select presupuesto, presupuesto * 0.9 as presupuesto_recortado from Departamento;
--- 18. Despedir a todos los empleados que trabajan para el departamento de informática (código 2).
delete from Empleado where id_departamento=2;
--- 19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.
delete from Empleado where id_departamento in (select id where presupuesto>60000);
--- 20.Despedir a todos los empleados.
delete * from Empleado;