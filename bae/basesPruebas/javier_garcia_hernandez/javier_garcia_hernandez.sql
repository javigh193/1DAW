--Javier García Hernández
create table clase(
	id int,
	max_alumnos int,
	primary key (id)
);
create table alumno(
	dni text,
	nombre text,
	apellido text,
	nota int,
	id_clase int,
	primary key (dni),
	foreign key (id_clase) references clase (id)
);
--1. Realiza la inserción de, al menos, 10 alumnos.
insert into clase values (1, 10);
insert into clase values (2, 20);
insert into clase values (3, 10);
insert into clase values (4, 20);
insert into clase values (5, 10);
insert into clase values (6, 30);
insert into clase values (7, 10);
insert into clase values (8, 20);
insert into clase values (9, 30);
insert into clase values (10, 20);
insert into alumno values ('1111111A', 'Pablo', 'García', 9, 1);
insert into alumno values ('1111112A', 'Pedro', 'Martínez', 9, 1);
insert into alumno values ('4111111A', 'Pablo', 'Pérez', 7, 2);
insert into alumno values ('1111611A', 'Pablo', 'García', 4, 3);
insert into alumno values ('1111113B', 'Juan', 'Pérez', 9, 3);
insert into alumno values ('1111122A', 'Marcos', 'Pulido', 6, 4);
insert into alumno values ('1111143A', 'Pedro', 'García', 9, 5);
insert into alumno values ('1111777A', 'Francisco', 'Peraza', 9, 8);
insert into alumno values ('1111571A', 'Pablo', 'Palmero', 5, 5);
insert into alumno values ('1142111A', 'Macarena', 'Pérez', 8, 5);
--2. Obtener los apellidos de los alumnos.
select apellido from alumno;
--3. Obtener los apellidos de los alumnos sin repeticiones.
select distinct apellido from alumno;
--4. Obtener todos los datos de los alumnos que se apellidan __Martínez__.
select * from alumno where apellido='Martínez';
--5. Obtener todos los datos de los alumnos que se apellidan __Martínez__ y los que se apellidan __Pérez__.
select * from alumno where apellido in ('Martínez', 'Pérez');
--6. Obtener todos los datos de los alumnos que asisten a la clase __10__.
select * from alumno where id_clase=10;
--7. Obtener todos los datos de los alumnos que asisten a la clase __8__ y para el clase 5.
select * from alumno where id_clase in (8, 5);
--8. Obtener todos los datos de los alumnos cuyo apellido comience por __P__.
select * from alumno where apellido like 'P%';
--9. Obtener el número máximo de alumnos por en todas las clases.
select max_alumnos from clase;
--10. Obtener el número de alumnos en cada clase.
select count(*) from alumno group by id_clase;
--12. Muestra todos los alumnos ordenando por nombre de forma descendiente y por nota de forma ascendente.
select nombre, nota from alumno order by nombre desc, nota;
--11. Obtener un listado completo de alumnos, incluyendo los datos de su clase a la que asisten.
select a.dni, a.nombre, a.apellido, a.nota, a.id_clase, c.max_alumnos 
from alumno as a, clase as c 
where a.id_clase=c.id; 
--13. Obtener los nombres y apellido de los alumnos que asisten a la clase 4 y cuyo máximo de alumnos es mayor 10.
select nombre, apellido from alumno where id_clase=4 or id_clase in (
	select id from clase where max_alumnos>10); 
--14. Obtener los datos de los clases cuyo número de alumnos es superior a la media de todos los clases.
select * from clase where id in (
	select id_clase from alumno group by count(*)>avg(count(*))); 
--15. Obtener los nombres (únicamente los nombres) de los clases que tiene más de dos alumnos.
select * from clase where id in (
	select id from clase where max_alumnos>10);	
--16. Añadir un nuevo clase, con un número máximo de alumnos es 20.
insert into clase values (11, 20);
--17. Añadir dos nuevos alumnos vinculando a la clase creada.
insert into alumno values ('1159111A', 'Marta', 'García', 7, 11);
insert into alumno values ('1100111A', 'Rubén', 'García', 9, 11);
--18. Calcula el 10% de los alumnos por clase.
select count(*) * 0.1 from alumno group by id_clase;
--19. Elimina a todos los alumnos que asisten a la clase con id 2.
delete from alumno where id_clase=2;
--20. Elimina a todos los alumnos cuya nota sea inferior al 30%.
delete from alumno where nota in(
	select nota from alumno group by nota
	having nota <(
		select sum(nota)*0.3 from alumno)
	);
