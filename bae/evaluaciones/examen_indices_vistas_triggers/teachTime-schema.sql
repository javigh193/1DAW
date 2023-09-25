-- Creamos la base de datos borrando los datos si existen de años anteriores
DROP DATABASE IF EXISTS TeachTime;
CREATE DATABASE TeachTime DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;

use TeachTime;

-- Creamos las tablas
CREATE TABLE rol (
	id VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
   	email VARCHAR(100) NOT NULL,
	enabled TINYINT(1) NOT NULL DEFAULT 0,
    roles VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
) ENGINE = INNODB;

CREATE TABLE authorities (
	username VARCHAR(20) NOT NULL,
    authority VARCHAR(20) NOT NULL,
	FOREIGN KEY (username) REFERENCES users(username) ON UPDATE CASCADE,
	FOREIGN KEY (authority) REFERENCES rol(id) ON UPDATE CASCADE,
    PRIMARY KEY (username,authority)
) ENGINE = INNODB;

CREATE TABLE profesor (
	id VARCHAR(10) NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    h_perm INT NOT NULL DEFAULT 24,
    h_lect INT NOT NULL DEFAULT 18,
	sustituto BOOLEAN NOT NULL DEFAULT false,
	id_sustituto VARCHAR(10),
	username VARCHAR(20) NOT NULL,
    foto VARCHAR(255),
	FOREIGN KEY (id_sustituto) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (username) REFERENCES users(username) ON UPDATE CASCADE,
	PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE departamento (
	id VARCHAR(3) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE jefedepartamento (
	id INT NOT NULL AUTO_INCREMENT,
	profe VARCHAR(10) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (departamento) REFERENCES departamento(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE profedepartamento (
	id INT NOT NULL AUTO_INCREMENT,
	profe VARCHAR(10) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (departamento) REFERENCES departamento(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE curso (
	id VARCHAR(10) NOT NULL,
    grado VARCHAR(10) NOT NULL,
    grupo VARCHAR(1),
    nombre VARCHAR(70),
	etapa VARCHAR(20),
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE profecurso (
	id INT NOT NULL AUTO_INCREMENT,
    profe VARCHAR(10) NOT NULL,
    curso VARCHAR(10) NOT NULL,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
    FOREIGN KEY (curso) REFERENCES curso(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE tutor (
	id VARCHAR(10) NOT NULL,
	profe VARCHAR(10) NOT NULL,
	curso VARCHAR(10) NOT NULL,
	aula VARCHAR(10) NOT NULL UNIQUE,
	fct BOOLEAN NOT NULL DEFAULT false,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (curso) REFERENCES curso(id) ON UPDATE CASCADE, 
	PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE asignatura (
	id VARCHAR(10) NOT NULL,
	nombre VARCHAR(50) NOT NULL UNIQUE,
    id_dpto VARCHAR(10) NOT NULL,
	descripcion VARCHAR(200),
    FOREIGN KEY (id_dpto) REFERENCES departamento(id) ON UPDATE CASCADE,
	PRIMARY KEY (id)
) ENGINE = INNODB; 

CREATE TABLE fichar (
	id INT NOT NULL AUTO_INCREMENT,
	id_profe VARCHAR(10) NOT NULL,
	dia DATETIME NOT NULL,
	hora TIME NOT NULL,
	FOREIGN KEY (id_profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	PRIMARY KEY (id)
) ENGINE = INNODB; 

CREATE TABLE tipohora (
	id INT NOT NULL AUTO_INCREMENT,
	tipo VARCHAR(3) NOT NULL,
	codigo VARCHAR(3) NOT NULL,
	nombre VARCHAR(70) NOT NULL,
	descripcion VARCHAR(200),
	observaciones TEXT,
	activo boolean DEFAULT true,
	PRIMARY KEY (id)
) ENGINE = INNODB; 

CREATE TABLE horario (
	id INT NOT NULL AUTO_INCREMENT,
	id_tipo_hora INT NOT NULL,
	hora_inicio TIME NOT NULL,
	hora_fin TIME NOT NULL,
	dia VARCHAR(1) NOT NULL,
	FOREIGN KEY (id_tipo_hora) REFERENCES tipohora(id) ON UPDATE CASCADE,
	PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE profehorario (
	id INT NOT NULL AUTO_INCREMENT,
	id_profe VARCHAR(10) NOT NULL,
    id_horario INT NOT NULL,
	FOREIGN KEY (id_profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (id_horario) REFERENCES horario(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE repartohorarioprofesor (
	id INT NOT NULL AUTO_INCREMENT,
    profe VARCHAR(10) NOT NULL,
    tipohora INT NOT NULL,
    tri1 INT NOT NULL,
    tri2 INT NOT NULL,
	tri3 INT NOT NULL,
	objetivo INT NOT NULL,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
	FOREIGN KEY (tipohora) REFERENCES tipohora(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE profeobservaciones (
	id INT NOT NULL AUTO_INCREMENT,
    profe VARCHAR(10) NOT NULL,
    observaciones TEXT NOT NULL,
	FOREIGN KEY (profe) REFERENCES profesor(id) ON UPDATE CASCADE,
    PRIMARY KEY (id)
) ENGINE = INNODB;