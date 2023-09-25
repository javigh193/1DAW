--Creación db
.open empleados.db
--Creación de tablas
create table empleado (codigo int primary key, nif text, nombre text, apellido1 text, apellido2 text, codigo_departamento int, 
foreign key (codigo_departamento) references departamento(codigo));
create table departamento (codigo int, nombre text, presupuesto real, gastos real);
--Creación de las tuplas
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);
--Consultas sobre una tabla
--1.Lista el primer apellido de todos los empleados.
select apellido1 from empleado;
-- ┌───────────┐
-- │ apellido1 │
-- ├───────────┤
-- │ Rivero    │
-- │ Salas     │
-- │ Rubio     │
-- │ Suárez    │
-- │ Loyola    │
-- │ Santana   │
-- │ Ruiz      │
-- │ Ruiz      │
-- │ Gómez     │
-- │ Flores    │
-- │ Herrera   │
-- │ Salas     │
-- │ Sáez      │
-- └───────────┘
--2.Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;
-- ┌───────────┐
-- │ apellido1 │
-- ├───────────┤
-- │ Rivero    │
-- │ Salas     │
-- │ Rubio     │
-- │ Suárez    │
-- │ Loyola    │
-- │ Santana   │
-- │ Ruiz      │
-- │ Gómez     │
-- │ Flores    │
-- │ Herrera   │
-- │ Sáez      │
-- └───────────┘
--3.Lista todas las columnas de la tabla empleado.
select * from empleado;
-- ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
-- │ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │
-- │ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │
-- │ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │
-- │ 4      │ 77705545E │ Adrián       │ Suárez    │           │ 4                   │
-- │ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │
-- │ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │
-- │ 7      │ 80576669X │ Pilar        │ Ruiz      │           │ 2                   │
-- │ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │
-- │ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │
-- │ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │
-- │ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
-- └────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘
--4.Lista el nombre y los apellidos de todos los empleados.
select nombre, apellido1, apellido2 from empleado;
-- ┌──────────────┬───────────┬───────────┐
-- │    nombre    │ apellido1 │ apellido2 │
-- ├──────────────┼───────────┼───────────┤
-- │ Aarón        │ Rivero    │ Gómez     │
-- │ Adela        │ Salas     │ Díaz      │
-- │ Adolfo       │ Rubio     │ Flores    │
-- │ Adrián       │ Suárez    │           │
-- │ Marcos       │ Loyola    │ Méndez    │
-- │ María        │ Santana   │ Moreno    │
-- │ Pilar        │ Ruiz      │           │
-- │ Pepe         │ Ruiz      │ Santana   │
-- │ Juan         │ Gómez     │ López     │
-- │ Diego        │ Flores    │ Salas     │
-- │ Marta        │ Herrera   │ Gil       │
-- │ Irene        │ Salas     │ Flores    │
-- │ Juan Antonio │ Sáez      │ Guerrero  │
-- └──────────────┴───────────┴───────────┘
--5.Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
select codigo_departamento from empleado;
-- ┌─────────────────────┐
-- │ codigo_departamento │
-- ├─────────────────────┤
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 4                   │
-- │ 5                   │
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 2                   │
-- │ 5                   │
-- │ 1                   │
-- │                     │
-- │                     │
-- └─────────────────────┘
--6.Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct codigo_departamento from empleado;
-- ┌─────────────────────┐
-- │ codigo_departamento │
-- ├─────────────────────┤
-- │ 1                   │
-- │ 2                   │
-- │ 3                   │
-- │ 4                   │
-- │ 5                   │
-- │                     │
-- └─────────────────────┘
--7.Lista el nombre y apellidos de los empleados en una única columna.
select nombre||' '||apellido1||' '||coalesce(apellido2, '') as nombre_apellidos from empleado;
-- ┌────────────────────────────┐
-- │      nombre_apellidos      │
-- ├────────────────────────────┤
-- │ Aarón Rivero Gómez         │
-- │ Adela Salas Díaz           │
-- │ Adolfo Rubio Flores        │
-- │ Adrián Suárez              │
-- │ Marcos Loyola Méndez       │
-- │ María Santana Moreno       │
-- │ Pilar Ruiz                 │
-- │ Pepe Ruiz Santana          │
-- │ Juan Gómez López           │
-- │ Diego Flores Salas         │
-- │ Marta Herrera Gil          │
-- │ Irene Salas Flores         │
-- │ Juan Antonio Sáez Guerrero │
-- └────────────────────────────┘
--8.Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper(nombre||' '||apellido1||' '||coalesce(apellido2,'')) as nombre_apellidos from empleado;
-- ┌────────────────────────────┐
-- │      nombre_apellidos      │
-- ├────────────────────────────┤
-- │ AARóN RIVERO GóMEZ         │
-- │ ADELA SALAS DíAZ           │
-- │ ADOLFO RUBIO FLORES        │
-- │ ADRIáN SUáREZ              │
-- │ MARCOS LOYOLA MéNDEZ       │
-- │ MARíA SANTANA MORENO       │
-- │ PILAR RUIZ                 │
-- │ PEPE RUIZ SANTANA          │
-- │ JUAN GóMEZ LóPEZ           │
-- │ DIEGO FLORES SALAS         │
-- │ MARTA HERRERA GIL          │
-- │ IRENE SALAS FLORES         │
-- │ JUAN ANTONIO SáEZ GUERRERO │
-- └────────────────────────────┘
--9.Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower(nombre||' '||apellido1||' '||coalesce(apellido2,'')) as nombre_apellidos from empleado;
-- ┌────────────────────────────┐
-- │      nombre_apellidos      │
-- ├────────────────────────────┤
-- │ aarón rivero gómez         │
-- │ adela salas díaz           │
-- │ adolfo rubio flores        │
-- │ adrián suárez              │
-- │ marcos loyola méndez       │
-- │ maría santana moreno       │
-- │ pilar ruiz                 │
-- │ pepe ruiz santana          │
-- │ juan gómez lópez           │
-- │ diego flores salas         │
-- │ marta herrera gil          │
-- │ irene salas flores         │
-- │ juan antonio sáez guerrero │
-- └────────────────────────────┘
--10.Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
select codigo, substr(nif,1,8) as nif_digits, substr(nif, 9, 1) as nif_letter from empleado;
-- ┌────────┬────────────┬────────────┐
-- │ codigo │ nif_digits │ nif_letter │
-- ├────────┼────────────┼────────────┤
-- │ 1      │ 32481596   │ F          │
-- │ 2      │ Y5575632   │ D          │
-- │ 3      │ R6970642   │ B          │
-- │ 4      │ 77705545   │ E          │
-- │ 5      │ 17087203   │ C          │
-- │ 6      │ 38382980   │ M          │
-- │ 7      │ 80576669   │ X          │
-- │ 8      │ 71651431   │ Z          │
-- │ 9      │ 56399183   │ D          │
-- │ 10     │ 46384486   │ H          │
-- │ 11     │ 67389283   │ A          │
-- │ 12     │ 41234836   │ R          │
-- │ 13     │ 82635162   │ B          │
-- └────────┴────────────┴────────────┘
--11.Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. 
--Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). 
--Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
select nombre, (presupuesto-gastos) as presupuesto_restante from departamento;
-- ┌──────────────────┬──────────────────────┐
-- │      nombre      │ presupuesto_restante │
-- ├──────────────────┼──────────────────────┤
-- │ Desarrollo       │ 114000.0             │
-- │ Sistemas         │ 129000.0             │
-- │ Recursos Humanos │ 255000.0             │
-- │ Contabilidad     │ 107000.0             │
-- │ I+D              │ -5000.0              │
-- │ Proyectos        │ 0.0                  │
-- │ Publicidad       │ -1000.0              │
-- └──────────────────┴──────────────────────┘
--12.Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre, (presupuesto-gastos) as presupuesto_actual from departamento order by presupuesto_actual;
-- ┌──────────────────┬────────────────────┐
-- │      nombre      │ presupuesto_actual │
-- ├──────────────────┼────────────────────┤
-- │ I+D              │ -5000.0            │
-- │ Publicidad       │ -1000.0            │
-- │ Proyectos        │ 0.0                │
-- │ Contabilidad     │ 107000.0           │
-- │ Desarrollo       │ 114000.0           │
-- │ Sistemas         │ 129000.0           │
-- │ Recursos Humanos │ 255000.0           │
-- └──────────────────┴────────────────────┘
--13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamento order by nombre;
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Contabilidad     │
-- │ Desarrollo       │
-- │ I+D              │
-- │ Proyectos        │
-- │ Publicidad       │
-- │ Recursos Humanos │
-- │ Sistemas         │
-- └──────────────────┘
--14.Lista el nombre de todos los departamentos ordenados de forma desscendente.
select nombre from departamento order by nombre desc;
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Publicidad       │
-- │ Proyectos        │
-- │ I+D              │
-- │ Desarrollo       │
-- │ Contabilidad     │
-- └──────────────────┘
--15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
select apellido1, apellido2, nombre from empleado order by apellido1, apellido2, nombre;
-- ┌───────────┬───────────┬──────────────┐
-- │ apellido1 │ apellido2 │    nombre    │
-- ├───────────┼───────────┼──────────────┤
-- │ Flores    │ Salas     │ Diego        │
-- │ Gómez     │ López     │ Juan         │
-- │ Herrera   │ Gil       │ Marta        │
-- │ Loyola    │ Méndez    │ Marcos       │
-- │ Rivero    │ Gómez     │ Aarón        │
-- │ Rubio     │ Flores    │ Adolfo       │
-- │ Ruiz      │           │ Pilar        │
-- │ Ruiz      │ Santana   │ Pepe         │
-- │ Salas     │ Díaz      │ Adela        │
-- │ Salas     │ Flores    │ Irene        │
-- │ Santana   │ Moreno    │ María        │
-- │ Suárez    │           │ Adrián       │
-- │ Sáez      │ Guerrero  │ Juan Antonio │
-- └───────────┴───────────┴──────────────┘
--16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by presupuesto desc limit 3;
-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ I+D              │ 375000.0    │
-- │ Recursos Humanos │ 280000.0    │
-- │ Sistemas         │ 150000.0    │
-- └──────────────────┴─────────────┘
--17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto limit 3;
-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Proyectos    │ 0.0         │
-- │ Publicidad   │ 0.0         │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘
--18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre, gastos from departamento order by gastos desc limit 2;
-- ┌──────────────────┬──────────┐
-- │      nombre      │  gastos  │
-- ├──────────────────┼──────────┤
-- │ I+D              │ 380000.0 │
-- │ Recursos Humanos │ 25000.0  │
-- └──────────────────┴──────────┘
--19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre, gastos from departamento order by gastos limit 2;
-- ┌────────────┬────────┐
-- │   nombre   │ gastos │
-- ├────────────┼────────┤
-- │ Proyectos  │ 0.0    │
-- │ Publicidad │ 1000.0 │
-- └────────────┴────────┘
--20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. 
--La respuesta debe incluir todas las columnas de la tabla empleado.
select * from empleado limit 5 offset 2;
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 3      │ R6970642B │ Adolfo │ Rubio     │ Flores    │ 3                   │
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre, presupuesto from departamento where presupuesto>=150000;
-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Sistemas         │ 150000.0    │
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- └──────────────────┴─────────────┘
--22.Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
select nombre, gastos from departamento where gastos<5000;
-- ┌──────────────┬────────┐
-- │    nombre    │ gastos │
-- ├──────────────┼────────┤
-- │ Contabilidad │ 3000.0 │
-- │ Proyectos    │ 0.0    │
-- │ Publicidad   │ 1000.0 │
-- └──────────────┴────────┘
--23.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto>100000 and presupuesto<200000;
-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Desarrollo   │ 120000.0    │
-- │ Sistemas     │ 150000.0    │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘
--24.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto<100000 or presupuesto>200000;
-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- │ Proyectos        │ 0.0         │
-- │ Publicidad       │ 0.0         │
-- └──────────────────┴─────────────┘
--25.Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto between 100000 and 200000;
-- ┌──────────────┬─────────────┐
-- │    nombre    │ presupuesto │
-- ├──────────────┼─────────────┤
-- │ Desarrollo   │ 120000.0    │
-- │ Sistemas     │ 150000.0    │
-- │ Contabilidad │ 110000.0    │
-- └──────────────┴─────────────┘
--26.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamento where presupuesto not between 100000 and 200000;
-- ┌──────────────────┬─────────────┐
-- │      nombre      │ presupuesto │
-- ├──────────────────┼─────────────┤
-- │ Recursos Humanos │ 280000.0    │
-- │ I+D              │ 375000.0    │
-- │ Proyectos        │ 0.0         │
-- │ Publicidad       │ 0.0         │
-- └──────────────────┴─────────────┘
--27.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos>presupuesto;
-- ┌────────────┬──────────┬─────────────┐
-- │   nombre   │  gastos  │ presupuesto │
-- ├────────────┼──────────┼─────────────┤
-- │ I+D        │ 380000.0 │ 375000.0    │
-- │ Publicidad │ 1000.0   │ 0.0         │
-- └────────────┴──────────┴─────────────┘
--28.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos<presupuesto;
-- ┌──────────────────┬─────────┬─────────────┐
-- │      nombre      │ gastos  │ presupuesto │
-- ├──────────────────┼─────────┼─────────────┤
-- │ Desarrollo       │ 6000.0  │ 120000.0    │
-- │ Sistemas         │ 21000.0 │ 150000.0    │
-- │ Recursos Humanos │ 25000.0 │ 280000.0    │
-- │ Contabilidad     │ 3000.0  │ 110000.0    │
-- └──────────────────┴─────────┴─────────────┘
--29.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre, gastos, presupuesto from departamento where gastos=presupuesto;
-- ┌───────────┬────────┬─────────────┐
-- │  nombre   │ gastos │ presupuesto │
-- ├───────────┼────────┼─────────────┤
-- │ Proyectos │ 0.0    │ 0.0         │
-- └───────────┴────────┴─────────────┘
--30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 not null;
-- ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
-- │ 1      │ 32481596F │ Aarón        │ Rivero    │ Gómez     │ 1                   │
-- │ 2      │ Y5575632D │ Adela        │ Salas     │ Díaz      │ 2                   │
-- │ 3      │ R6970642B │ Adolfo       │ Rubio     │ Flores    │ 3                   │
-- │ 5      │ 17087203C │ Marcos       │ Loyola    │ Méndez    │ 5                   │
-- │ 6      │ 38382980M │ María        │ Santana   │ Moreno    │ 1                   │
-- │ 8      │ 71651431Z │ Pepe         │ Ruiz      │ Santana   │ 3                   │
-- │ 9      │ 56399183D │ Juan         │ Gómez     │ López     │ 2                   │
-- │ 10     │ 46384486H │ Diego        │ Flores    │ Salas     │ 5                   │
-- │ 11     │ 67389283A │ Marta        │ Herrera   │ Gil       │ 1                   │
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
-- └────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘
--32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2='López';
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2 regexp 'Díaz|Moreno';
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in ('Díaz', 'Moreno');
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
-- │ 6      │ 38382980M │ María  │ Santana   │ Moreno    │ 1                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--35.Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre, apellido1, apellido2, nif from empleado where codigo_departamento=3;
-- ┌────────┬───────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │    nif    │
-- ├────────┼───────────┼───────────┼───────────┤
-- │ Adolfo │ Rubio     │ Flores    │ R6970642B │
-- │ Pepe   │ Ruiz      │ Santana   │ 71651431Z │
-- └────────┴───────────┴───────────┴───────────┘    
--36.Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado where codigo_departamento in (2, 4, 5);
-- ┌────────┬───────────┬───────────┬───────────┐
-- │ nombre │ apellido1 │ apellido2 │    nif    │
-- ├────────┼───────────┼───────────┼───────────┤
-- │ Adela  │ Salas     │ Díaz      │ Y5575632D │
-- │ Adrián │ Suárez    │           │ 77705545E │
-- │ Marcos │ Loyola    │ Méndez    │ 17087203C │
-- │ Pilar  │ Ruiz      │           │ 80576669X │
-- │ Juan   │ Gómez     │ López     │ 56399183D │
-- │ Diego  │ Flores    │ Salas     │ 46384486H │
-- └────────┴───────────┴───────────┴───────────┘
--Consultas multitabla (Composición interna)
--1.Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from empleado as e join departamento as d on e.codigo_departamento=d.codigo;
-- ┌─────────────────┬────────┬───────────┬───────────┬─────────────────────┬──────────────────┬─────────────┬──────────┐
-- │ código_empleado │ nombre │ apellido1 │ apellido2 │ código_departamento │      nombre      │ presupuesto │  gastos  │
-- ├─────────────────┼────────┼───────────┼───────────┼─────────────────────┼──────────────────┼─────────────┼──────────┤
-- │ 1               │ Aarón  │ Rivero    │ Gómez     │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 2               │ Adela  │ Salas     │ Díaz      │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 3               │ Adolfo │ Rubio     │ Flores    │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 4               │ Adrián │ Suárez    │           │ 4                   │ Contabilidad     │ 110000.0    │ 3000.0   │
-- │ 5               │ Marcos │ Loyola    │ Méndez    │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 6               │ María  │ Santana   │ Moreno    │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 7               │ Pilar  │ Ruiz      │           │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 8               │ Pepe   │ Ruiz      │ Santana   │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 9               │ Juan   │ Gómez     │ López     │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 10              │ Diego  │ Flores    │ Salas     │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 11              │ Marta  │ Herrera   │ Gil       │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- └─────────────────┴────────┴───────────┴───────────┴─────────────────────┴──────────────────┴─────────────┴──────────┘
--2.Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del 
--departamento (en orden alfabético) y en segundo lugar por los apellidos y el nombre de los empleados.
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from empleado as e join departamento as d on e.codigo_departamento=d.codigo
order by d.nombre, e.apellido1, e.apellido2, e.nombre;
-- ┌─────────────────┬────────┬───────────┬───────────┬─────────────────────┬──────────────────┬─────────────┬──────────┐
-- │ código_empleado │ nombre │ apellido1 │ apellido2 │ código_departamento │      nombre      │ presupuesto │  gastos  │
-- ├─────────────────┼────────┼───────────┼───────────┼─────────────────────┼──────────────────┼─────────────┼──────────┤
-- │ 4               │ Adrián │ Suárez    │           │ 4                   │ Contabilidad     │ 110000.0    │ 3000.0   │
-- │ 11              │ Marta  │ Herrera   │ Gil       │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 1               │ Aarón  │ Rivero    │ Gómez     │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 6               │ María  │ Santana   │ Moreno    │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 10              │ Diego  │ Flores    │ Salas     │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 5               │ Marcos │ Loyola    │ Méndez    │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 3               │ Adolfo │ Rubio     │ Flores    │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 8               │ Pepe   │ Ruiz      │ Santana   │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 9               │ Juan   │ Gómez     │ López     │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 7               │ Pilar  │ Ruiz      │           │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 2               │ Adela  │ Salas     │ Díaz      │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- └─────────────────┴────────┴───────────┴───────────┴─────────────────────┴──────────────────┴─────────────┴──────────┘
--3.Devuelve un listado con el identificador y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select distinct d.codigo, d.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento;
-- ┌────────┬──────────────────┐
-- │ codigo │      nombre      │
-- ├────────┼──────────────────┤
-- │ 1      │ Desarrollo       │
-- │ 2      │ Sistemas         │
-- │ 3      │ Recursos Humanos │
-- │ 4      │ Contabilidad     │
-- │ 5      │ I+D              │
-- └────────┴──────────────────┘
--4.Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto actual del que dispone, solamente de aquellos 
--departamentos que tienen empleados. El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) 
--el valor de los gastos que ha generado (columna gastos).
select distinct d.codigo, d.nombre, d.presupuesto-d.gastos as presupuesto_actual from departamento as d join empleado as e on d.codigo=e.codigo_departamento;
-- ┌────────┬──────────────────┬────────────────────┐
-- │ codigo │      nombre      │ presupuesto_actual │
-- ├────────┼──────────────────┼────────────────────┤
-- │ 1      │ Desarrollo       │ 114000.0           │
-- │ 2      │ Sistemas         │ 129000.0           │
-- │ 3      │ Recursos Humanos │ 255000.0           │
-- │ 4      │ Contabilidad     │ 107000.0           │
-- │ 5      │ I+D              │ -5000.0            │
-- └────────┴──────────────────┴────────────────────┘
--5.Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
select e.nombre from empleado as e join departamento as d on e.codigo_departamento=d.codigo where e.nif='38382980M';
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ María  │
-- └────────┘
--6.Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
select d.nombre from departamento as d join empleado as e on d.codigo=e.codigo_departamento where e.nombre||e.apellido1||e.apellido2='PepeRuizSantana'; 
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Recursos Humanos │
-- └──────────────────┘
--7.Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select e.* from empleado as e join departamento as d on e.codigo_departamento=d.codigo where d.nombre='I+D' order by e.apellido1, e.apellido2, e.nombre;
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 10     │ 46384486H │ Diego  │ Flores    │ Salas     │ 5                   │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--8.Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select e.* from empleado as e join departamento as d on e.codigo_departamento=d.codigo where d.nombre in ('I+D', 'Sistemas', 'Contabilidad') order by e.apellido1, e.apellido2, e.nombre;
-- ┌────────┬───────────┬────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │ nombre │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼────────┼───────────┼───────────┼─────────────────────┤
-- │ 10     │ 46384486H │ Diego  │ Flores    │ Salas     │ 5                   │
-- │ 9      │ 56399183D │ Juan   │ Gómez     │ López     │ 2                   │
-- │ 5      │ 17087203C │ Marcos │ Loyola    │ Méndez    │ 5                   │
-- │ 7      │ 80576669X │ Pilar  │ Ruiz      │           │ 2                   │
-- │ 2      │ Y5575632D │ Adela  │ Salas     │ Díaz      │ 2                   │
-- │ 4      │ 77705545E │ Adrián │ Suárez    │           │ 4                   │
-- └────────┴───────────┴────────┴───────────┴───────────┴─────────────────────┘
--9.Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select e.nombre from empleado as e join departamento as d on e.codigo_departamento=d.codigo where d.presupuesto between 100000 and 200000;
-- ┌────────┐
-- │ nombre │
-- ├────────┤
-- │ Aarón  │
-- │ Marta  │
-- │ María  │
-- │ Adela  │
-- │ Juan   │
-- │ Pilar  │
-- │ Adrián │
-- └────────┘
--10.Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no 
--debe mostrar nombres de departamentos que estén repetidos.
select distinct d.nombre from departamento as d join empleado as e on e.codigo_departamento=d.codigo where e.apellido2 is null;
-- ┌──────────────┐
-- │    nombre    │
-- ├──────────────┤
-- │ Contabilidad │
-- │ Sistemas     │
-- └──────────────┘
--Consultas multitabla (Composición externa)
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--1.Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. Este listado también debe 
--incluir los empleados que no tienen ningún departamento asociado.
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from empleado as e left join departamento as d on e.codigo_departamento=d.codigo;
-- ┌─────────────────┬──────────────┬───────────┬───────────┬─────────────────────┬──────────────────┬─────────────┬──────────┐
-- │ código_empleado │    nombre    │ apellido1 │ apellido2 │ código_departamento │      nombre      │ presupuesto │  gastos  │
-- ├─────────────────┼──────────────┼───────────┼───────────┼─────────────────────┼──────────────────┼─────────────┼──────────┤
-- │ 1               │ Aarón        │ Rivero    │ Gómez     │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 2               │ Adela        │ Salas     │ Díaz      │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 3               │ Adolfo       │ Rubio     │ Flores    │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 4               │ Adrián       │ Suárez    │           │ 4                   │ Contabilidad     │ 110000.0    │ 3000.0   │
-- │ 5               │ Marcos       │ Loyola    │ Méndez    │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 6               │ María        │ Santana   │ Moreno    │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 7               │ Pilar        │ Ruiz      │           │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 8               │ Pepe         │ Ruiz      │ Santana   │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 9               │ Juan         │ Gómez     │ López     │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 10              │ Diego        │ Flores    │ Salas     │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 11              │ Marta        │ Herrera   │ Gil       │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 12              │ Irene        │ Salas     │ Flores    │                     │                  │             │          │
-- │ 13              │ Juan Antonio │ Sáez      │ Guerrero  │                     │                  │             │          │
-- └─────────────────┴──────────────┴───────────┴───────────┴─────────────────────┴──────────────────┴─────────────┴──────────┘
--2.Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select e.* from empleado as e left join departamento as d on e.codigo_departamento=d.codigo where codigo_departamento is null;
-- ┌────────┬───────────┬──────────────┬───────────┬───────────┬─────────────────────┐
-- │ codigo │    nif    │    nombre    │ apellido1 │ apellido2 │ codigo_departamento │
-- ├────────┼───────────┼──────────────┼───────────┼───────────┼─────────────────────┤
-- │ 12     │ 41234836R │ Irene        │ Salas     │ Flores    │                     │
-- │ 13     │ 82635162B │ Juan Antonio │ Sáez      │ Guerrero  │                     │
-- └────────┴───────────┴──────────────┴───────────┴───────────┴─────────────────────┘
--3.Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select d.* from departamento as d left join empleado as e on e.codigo_departamento=d.codigo where codigo_departamento is null;
-- ┌────────┬────────────┬─────────────┬────────┐
-- │ codigo │   nombre   │ presupuesto │ gastos │
-- ├────────┼────────────┼─────────────┼────────┤
-- │ 6      │ Proyectos  │ 0.0         │ 0.0    │
-- │ 7      │ Publicidad │ 0.0         │ 1000.0 │
-- └────────┴────────────┴─────────────┴────────┘
--4.Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. El listado debe incluir los empleados 
--que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por 
--el nombre del departamento.
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from empleado as e left join departamento as d on e.codigo_departamento=d.codigo 
union 
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from departamento as d left join empleado as e on e.codigo_departamento=d.codigo;
-- ┌─────────────────┬──────────────┬───────────┬───────────┬─────────────────────┬──────────────────┬─────────────┬──────────┐
-- │ código_empleado │    nombre    │ apellido1 │ apellido2 │ código_departamento │      nombre      │ presupuesto │  gastos  │
-- ├─────────────────┼──────────────┼───────────┼───────────┼─────────────────────┼──────────────────┼─────────────┼──────────┤
-- │                 │              │           │           │ 6                   │ Proyectos        │ 0.0         │ 0.0      │
-- │                 │              │           │           │ 7                   │ Publicidad       │ 0.0         │ 1000.0   │
-- │ 1               │ Aarón        │ Rivero    │ Gómez     │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 2               │ Adela        │ Salas     │ Díaz      │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 3               │ Adolfo       │ Rubio     │ Flores    │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 4               │ Adrián       │ Suárez    │           │ 4                   │ Contabilidad     │ 110000.0    │ 3000.0   │
-- │ 5               │ Marcos       │ Loyola    │ Méndez    │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 6               │ María        │ Santana   │ Moreno    │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 7               │ Pilar        │ Ruiz      │           │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 8               │ Pepe         │ Ruiz      │ Santana   │ 3                   │ Recursos Humanos │ 280000.0    │ 25000.0  │
-- │ 9               │ Juan         │ Gómez     │ López     │ 2                   │ Sistemas         │ 150000.0    │ 21000.0  │
-- │ 10              │ Diego        │ Flores    │ Salas     │ 5                   │ I+D              │ 375000.0    │ 380000.0 │
-- │ 11              │ Marta        │ Herrera   │ Gil       │ 1                   │ Desarrollo       │ 120000.0    │ 6000.0   │
-- │ 12              │ Irene        │ Salas     │ Flores    │                     │                  │             │          │
-- │ 13              │ Juan Antonio │ Sáez      │ Guerrero  │                     │                  │             │          │
-- └─────────────────┴──────────────┴───────────┴───────────┴─────────────────────┴──────────────────┴─────────────┴──────────┘
--5.Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. 
--Ordene el listado alfabéticamente por el nombre del departamento.
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from empleado as e left join departamento as d on e.codigo_departamento=d.codigo where e.codigo_departamento is null
union 
select e.codigo as código_empleado, e.nombre, e.apellido1, e.apellido2, d.codigo as código_departamento, d.nombre, d.presupuesto, d.gastos 
from departamento as d left join empleado as e on e.codigo_departamento=d.codigo where e.codigo_departamento is null
order by d.nombre;
-- ┌─────────────────┬──────────────┬───────────┬───────────┬─────────────────────┬────────────┬─────────────┬────────┐
-- │ código_empleado │    nombre    │ apellido1 │ apellido2 │ código_departamento │   nombre   │ presupuesto │ gastos │
-- ├─────────────────┼──────────────┼───────────┼───────────┼─────────────────────┼────────────┼─────────────┼────────┤
-- │ 12              │ Irene        │ Salas     │ Flores    │                     │            │             │        │
-- │ 13              │ Juan Antonio │ Sáez      │ Guerrero  │                     │            │             │        │
-- │                 │              │           │           │ 6                   │ Proyectos  │ 0.0         │ 0.0    │
-- │                 │              │           │           │ 7                   │ Publicidad │ 0.0         │ 1000.0 │
-- └─────────────────┴──────────────┴───────────┴───────────┴─────────────────────┴────────────┴─────────────┴────────┘
--Consultas resumen
--1.Calcula la suma del presupuesto de todos los departamentos.
--     Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) from departamento;
-- ┌──────────────────┐
-- │ avg(presupuesto) │
-- ├──────────────────┤
-- │ 147857.142857143 │
-- └──────────────────┘
--2.Calcula el valor mínimo del presupuesto de todos los departamentos.
select min(presupuesto) from departamento;
-- ┌──────────────────┐
-- │ min(presupuesto) │
-- ├──────────────────┤
-- │ 0.0              │
-- └──────────────────┘
--3.Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.
select nombre, min(presupuesto) from departamento;
-- ┌───────────┬──────────────────┐
-- │  nombre   │ min(presupuesto) │
-- ├───────────┼──────────────────┤
-- │ Proyectos │ 0.0              │
-- └───────────┴──────────────────┘
--4.Calcula el valor máximo del presupuesto de todos los departamentos.
select max(presupuesto) from departamento;
-- ┌──────────────────┐
-- │ max(presupuesto) │
-- ├──────────────────┤
-- │ 375000.0         │
-- └──────────────────┘
--5.Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.
select nombre, max(presupuesto) from departamento;
-- ┌────────┬──────────────────┐
-- │ nombre │ max(presupuesto) │
-- ├────────┼──────────────────┤
-- │ I+D    │ 375000.0         │
-- └────────┴──────────────────┘
--6.Calcula el número total de empleados que hay en la tabla empleado.
select count() from empleado;
-- ┌─────────┐
-- │ count() │
-- ├─────────┤
-- │ 13      │
-- └─────────┘
--7.Calcula el número de empleados que no tienen NULL en su segundo apellido.
select count() from empleado where apellido2 is not null;
-- ┌─────────┐
-- │ count() │
-- ├─────────┤
-- │ 11      │
-- └─────────┘
--8.Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.
select d.nombre, count(e.codigo) as num_empleados from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo;
-- ┌──────────────────┬───────────────┐
-- │      nombre      │ num_empleados │
-- ├──────────────────┼───────────────┤
-- │ Desarrollo       │ 3             │
-- │ Sistemas         │ 3             │
-- │ Recursos Humanos │ 2             │
-- │ Contabilidad     │ 1             │
-- │ I+D              │ 2             │
-- │ Proyectos        │ 0             │
-- │ Publicidad       │ 0             │
-- └──────────────────┴───────────────┘
--9.Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, 
--una con el nombre del departamento y otra con el número de empleados que tiene asignados.
select d.nombre, count(e.codigo) as num_empleados from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo having num_empleados>2;
-- ┌────────────┬───────────────┐
-- │   nombre   │ num_empleados │
-- ├────────────┼───────────────┤
-- │ Desarrollo │ 3             │
-- │ Sistemas   │ 3             │
-- └────────────┴───────────────┘
--10.Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir 
--aquellos departamentos que no tienen ningún empleado asociado.
select d.nombre, count(e.codigo) as num_empleados from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo;
-- ┌──────────────────┬───────────────┐
-- │      nombre      │ num_empleados │
-- ├──────────────────┼───────────────┤
-- │ Desarrollo       │ 3             │
-- │ Sistemas         │ 3             │
-- │ Recursos Humanos │ 2             │
-- │ Contabilidad     │ 1             │
-- │ I+D              │ 2             │
-- │ Proyectos        │ 0             │
-- │ Publicidad       │ 0             │
-- └──────────────────┴───────────────┘
--11.Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.
select d.nombre, count(e.codigo) as num_empleados from departamento as d left join empleado as e on e.codigo_departamento=d.codigo group by d.codigo having d.presupuesto>200000;
-- ┌──────────────────┬───────────────┐
-- │      nombre      │ num_empleados │
-- ├──────────────────┼───────────────┤
-- │ Recursos Humanos │ 2             │
-- │ I+D              │ 2             │
-- └──────────────────┴───────────────┘
-- Subconsultas
-- Con operadores básicos de comparación
--12.Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).
select e.codigo, e.nombre from departamento as d, empleado as e where e.codigo_departamento=d.codigo and d.nombre='Sistemas';
-- ┌────────┬────────┐
-- │ codigo │ nombre │
-- ├────────┼────────┤
-- │ 2      │ Adela  │
-- │ 7      │ Pilar  │
-- │ 9      │ Juan   │
-- └────────┴────────┘
--13.Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
select nombre, max(presupuesto) from departamento;
-- ┌────────┬──────────────────┐
-- │ nombre │ max(presupuesto) │
-- ├────────┼──────────────────┤
-- │ I+D    │ 375000.0         │
-- └────────┴──────────────────┘
--14.Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
select nombre, min(presupuesto) from departamento;
-- ┌───────────┬──────────────────┐
-- │  nombre   │ min(presupuesto) │
-- ├───────────┼──────────────────┤
-- │ Proyectos │ 0.0              │
-- └───────────┴──────────────────┘
-- Subconsultas con IN y NOT IN
--15.Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).
select distinct d.nombre from departamento as d, empleado as e where d.codigo=e.codigo_departamento and d.codigo in (select distinct e.codigo_departamento);
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Desarrollo       │
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Contabilidad     │
-- │ I+D              │
-- └──────────────────┘
--16.Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).
select distinct d.nombre from departamento as d left join empleado as e on d.codigo=e.codigo_departamento 
where d.codigo not in (select distinct e.codigo_departamento where e.codigo_departamento is not null);
-- ┌────────────┐
-- │   nombre   │
-- ├────────────┤
-- │ Proyectos  │
-- │ Publicidad │
-- └────────────┘
--"where e.codigo_departamento is not null", que la lista evaluada a la derecha del "is / is not" tenga null afecta al resultado
--No devuelve lo que busco...
-- Subconsultas con EXISTS y NOT EXISTS
--     Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
select distinct d.nombre from departamento as d left join empleado as e on d.codigo=e.codigo_departamento 
where exists 
(select e.codigo_departamento where e.codigo_departamento=d.codigo) 
group by d.codigo;
-- ┌──────────────────┐
-- │      nombre      │
-- ├──────────────────┤
-- │ Desarrollo       │
-- │ Sistemas         │
-- │ Recursos Humanos │
-- │ Contabilidad     │
-- │ I+D              │
-- └──────────────────┘
--17.Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).
select distinct d.nombre from departamento as d left join empleado as e on d.codigo=e.codigo_departamento 
where not exists 
(select e.codigo_departamento where e.codigo_departamento=d.codigo) 
group by d.codigo;
-- ┌────────────┐
-- │   nombre   │
-- ├────────────┤
-- │ Proyectos  │
-- │ Publicidad │
-- └────────────┘