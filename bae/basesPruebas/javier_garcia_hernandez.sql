--creacion base de datos
.open tarea11.db
--creacion tablas
create table cientifico(id text, nombre text, apellido1 text, apellido2 text, primary key (id) );
create table proyecto (id text, nombre text, horas int, primary key (id));
create table cientifico_proyecto (ref_cientifico text, ref_proyecto text, primary key (ref_cientifico, ref_proyecto), foreign key (ref_cientifico) references cientifico (id), foreign key (ref_proyecto) references proyecto (id) );
--inserts
insert into cientifico values ('1234567A', 'Juan', 'Pérez', 'Pérez');
insert into cientifico values ('1234567B', 'María', 'Martínez', 'Pérez');
insert into cientifico values ('1234567C', 'Pablo', 'García', 'Pérez');
insert into cientifico values ('1234567D', 'Julia', 'Mendoza', 'Pérez');
insert into cientifico values ('1234567E', 'Marta', 'Torres', 'Puentes');
insert into cientifico values ('1234567F', 'Juan', 'Pérez', 'Peraza');
insert into cientifico values ('1234567G', 'Pedro', 'Torres', 'García');
insert into cientifico values ('1234567H', 'Luis', 'Conejo', 'Hernández');
insert into cientifico values ('1234567I', 'Ana', 'García', 'Martínez');
insert into cientifico values ('1234567J', 'Marcos', 'López', 'Pérez');
insert into proyecto values ('JE29','Jóvenes Emprendedores', 96);
insert into proyecto values ('AL75','Ardillas Libres', 56);
insert into proyecto values ('LND17','Lenguaje de Marcas', 20);
insert into proyecto values ('MSA5','Música Subacuática', 60);
insert into proyecto values ('K34','Kilómetros Seguros', 57);
insert into cientifico_proyecto values ('1234567A', 'JE29');
insert into cientifico_proyecto values ('1234567B', 'AL75');
insert into cientifico_proyecto values ('1234567C', 'LND17');
insert into cientifico_proyecto values ('1234567D', 'MSA5');
insert into cientifico_proyecto values ('1234567E', 'K34');
insert into cientifico_proyecto values ('1234567F', 'JE29');
insert into cientifico_proyecto values ('1234567G', 'AL75');
insert into cientifico_proyecto values ('1234567H', 'LND17');
insert into cientifico_proyecto values ('1234567I', 'MSA5');
insert into cientifico_proyecto values ('1234567J', 'K34');
--consultas
--1.Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, identificador del proyecto y nombre del proyecto.
select c.id, c.nombre, p.id, p.nombre from cientifico as c, proyecto as p, cientifico_proyecto as cp where cp.ref_cientifico=c.id and cp.ref_proyecto=p.id;
--2.Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).
select c.id, c.nombre, count(cp.ref_proyecto) from cientifico as c join cientifico_proyecto as cp on c.id=cp.ref_cientifico group by c.id;
--3. Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).
select p.id, p.nombre, count(cp.ref_cientifico) from proyecto as p join cientifico_proyecto as cp on p.id=cp.ref_proyecto group by p.id;
--4.Obtener el número de horas de dedicación de cada científico.
select sum(p.horas) from proyecto as p, cientifico_proyecto as cp where p.id=cp.ref_proyecto group by cp.ref_cientifico;
--5.Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior __ a un número de horas superior a 10, por ejemplo 11 horas__.
select c.id, c.nombre from cientifico as c join cientifico_proyecto as cp on 
c.id=cp.ref_cientifico join proyecto as p on
p.id=cp.ref_proyecto group by c.id having avg(p.horas) > 10;

