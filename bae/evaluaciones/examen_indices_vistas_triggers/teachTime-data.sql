INSERT INTO `rol` (`id`, `nombre`) VALUES
('admin', 'Administrador'),
('profe', 'Profesor'),
('jdept', 'JefeDepartamento');

INSERT INTO `departamento` (`id`, `nombre`) VALUES
('ALE', 'Alemán'),
('CAR', 'Transporte y Mantenimiento de Vehículos'),
('CIE', 'Ciencias Naturales'),
('DIB', 'Artes Plásticas'),
('ECO', 'Economía'),
('EFI', 'Educación Física y Deportiva'),
('ELE', 'Electricidad-Electrónica'),
('FIL', 'Filosofía'),
('FOL', 'Formación y Orientación Laboral'),
('FRA', 'Francés'),
('FYQ', 'Física y Química'),
('GEO', 'Geografía e Historia'),
('INF', 'Informática'),
('ING', 'Inglés'),
('LAT', 'Latín'),
('LEN', 'Lengua Castellana y Literatura'),
('MAT', 'Matemáticas'),
('MUS', 'Música'),
('ORI', 'Orientación'),
('REL', 'Religión'),
('TEC', 'Tecnología'),
('TUR', 'Hostelería y Turismo');

INSERT INTO `tipohora` (`tipo`, `codigo`, `nombre`,`activo`) VALUES
('OL', 'OL', 'Acciones de mediación y mejora de la convivencia escolar', DEFAULT),
('OL', 'OL', 'Acciones para desarrollar plan de comunicación lingüística', FALSE),
('OL', 'OL', 'Acciones para fomentar la igualdad de oportunidades', FALSE),
('OL', 'OL', 'Adjuntía a jefatura de estudios', FALSE),
('OL', 'OL', 'Apoyo a vicedirección', FALSE),
('OL', 'CLA', 'Clases', DEFAULT),
('OL', 'OL', 'Clases ITG/Proyecto', DEFAULT),
('OL', 'HP', 'Clases prácticas', FALSE),
('OL', 'OL', 'Clases semipresencial', DEFAULT),
('OL', 'OL', 'Completar horario lectivo en otro centro', FALSE),
('OL', 'CD', 'Coordinación', FALSE),
('OL', 'OL', 'Coordinación de acciones para fomento del patrimonio', FALSE),
('OL', 'CAM', 'Coordinación de ámbito', DEFAULT),
('OL', 'OL', 'Coordinación de calidad', FALSE),
('OL', 'CT', 'Coordinación de formación en centros de trabajo', DEFAULT),
('OL', 'OL', 'Coordinación del plan lector', FALSE),
('OL', 'OL', 'Coordinación FP Dual', DEFAULT),
('OL', 'OL', 'Coordinación FPB', FALSE),
('OL', 'OL', 'Coordinación FSE', DEFAULT),
('OL', 'OL', 'Coordinación interna de las redes de un centro', FALSE),
('OL', 'CD', 'Coordinación PIDAS', DEFAULT),
('OL', 'OL', 'Coordinación prevención riesgos laborales', DEFAULT),
('OL', 'OL', 'Coordinación Proyecto Enlaza', DEFAULT),
('OL', 'OL', 'Coordinación red familias', FALSE),
('OL', 'OL', 'Coordinación red solidaridad', FALSE),
('OL', 'OL', 'Coordinación Sostenibilidad', DEFAULT),
('OL', 'OL', 'Descuento por edad mayores 59', FALSE),
('OL', 'ED', 'Desempeño de cargos directivos', DEFAULT),
('OL', 'OL', 'Dinamización de recreos', FALSE),
('OL', 'OL', 'EOEP', FALSE),
('OL', 'OL', 'Fomento de las TIC', DEFAULT),
('OL', 'ATF', 'Formación en centros de trabajo', DEFAULT),
('OL', 'OL', 'Gestión de contenidos audiovisuales', FALSE),
('OL', 'OL', 'Gestión de taller', FALSE),
('OL', 'JD', 'Jefatura de departamento', DEFAULT),
('OL', 'OL', 'Otras lectivas', DEFAULT),
('OL', 'AT', 'Preparación del plan de acción tutorial', DEFAULT),
('OL', 'OL', 'Programas europeos', DEFAULT),
('OL', 'OL', 'PROMECO', DEFAULT),
('OL', 'OL', 'Responsable COVID', DEFAULT),
('OL', 'TUO', 'Tutoría con alumnos', DEFAULT),
('OC', 'OC', 'Acciones de mediación y mejora de la convivencia escolar', FALSE),
('OC', 'OC', 'Adjuntía a jefatura de estudios', FALSE),
('OC', 'OC', 'Apoyo a secretaría', FALSE),
('OC', 'OC', 'Apoyo a vicedirección', FALSE),
('OC', 'B', 'Atención a la biblioteca', DEFAULT),
('OC', 'AF', 'Atención a las familias', DEFAULT),
('OC', 'PC', 'CCP', DEFAULT),
('OC', 'AL', 'Complementarias de atención al alumnado', FALSE),
('OC', 'OC', 'Consejo Escolar', DEFAULT),
('OC', 'OC', 'Coordinación de Ámbito', DEFAULT),
('OC', 'OC', 'Coordinación de calidad', FALSE),
('OC', 'OC', 'Coordinación de FCT', FALSE),
('OC', 'OC', 'Coordinación FP Dual', DEFAULT),
('OC', 'OC', 'Coordinación prevención riesgos laborales', FALSE),
('OC', 'OC', 'Coordinación Proyecto GLOBE', DEFAULT),
('OC', 'OC', 'Coordinación Redes', DEFAULT),
('OC', 'OC', 'Descuento por edad mayores 59', DEFAULT),
('OC', 'OC', 'Desempeño de cargos directivos', DEFAULT),
('OC', 'OC', 'Equipo gestión de la convivencia', DEFAULT),
('OC', 'OC', 'Exceso de lectivas', DEFAULT),
('OC', 'OC', 'Fomento de las TIC', DEFAULT),
('OC', 'OC', 'Gestión de contenidos audiovisuales', DEFAULT),
('OC', 'SL', 'Gestión de taller', DEFAULT),
('OC', 'G', 'Guardia', DEFAULT),
('OC', 'OC', 'Huerto Escolar', DEFAULT),
('OC', 'OC', 'Otras complementarias', DEFAULT),
('OC', 'OC', 'Programas europeos', DEFAULT),
('OC', 'AP', 'Recuperación para alumnos pendientes', FALSE),
('OC', 'OC', 'Redes educativas', DEFAULT),
('OC', 'OC', 'Reducción de jornada por lactancia de hijo/a', FALSE),
('OC', 'OC', 'Responsable convalidaciones', FALSE),
('OC', 'OC', 'Responsable FSE', FALSE),
('OC', 'OC', 'Responsable Prácticas Profesorado', DEFAULT),
('OC', 'OC', 'Responsable suplente COVID', FALSE),
('OC', 'OC', 'Reunión con orientación', DEFAULT),
('OC', 'RD', 'Reunión de departamento', DEFAULT),
('OC', 'OC', 'Reunión de equipo directivo', DEFAULT),
('OC', 'OC', 'Reunión NEAE', FALSE),
('OC', 'TT', 'Tareas derivadas de la acción tutorial', DEFAULT),
('OC', 'TT', 'Tutoría coordinación con orientación', DEFAULT);

-- Datos para realizar pruebas luego se borrará para cargar desde los xml o csv 

INSERT INTO `users` (`username`, `password`, `email`,`enabled`,`roles`) VALUES
('admin', '$2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm', 'siciliahernandezguillermo@gmail.com', DEFAULT, 'admin profe jdept'),
('gracar123', '$2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm', 'gracecp@gmail.com', DEFAULT, 'profe jdept'),
('pedmar', '$2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm', 'pemar@gmail.com', DEFAULT, 'profe'),
('marcab', '$2a$10$J4LFvwpGgjlZ2LlWaRbsauveePpfEsEDBBL.Ryv.Fggv5601B60hm', 'macab@gmail.com', DEFAULT, 'profe');

INSERT INTO `authorities` (`username`, `authority`) VALUES
('admin', 'admin'),
('pedmar', 'profe'),
('marcab', 'jdept');

INSERT INTO `profesor` (`id`, `nombre`, `apellido`, `email`, `telefono`, `h_perm`, `h_lect`, `sustituto`, `id_sustituto`, `username`, `foto`) VALUES
('Profe1', 'Guillermo', 'Sicilia', 'siciliahernandezguillermo@gmail.com', NULL, 24, 18, DEFAULT, null, 'admin', ''),
('Profe2', 'Pedro', 'Martinez', 'pema@gmail.com', '234567890', 24, 18, DEFAULT, null, 'pedmar', ''),
('Profe3', 'Maria', 'Cabrera', 'maca@gmail.com', '345678901', 24, 18, DEFAULT, null, 'marcab', ''),
('Profe4', 'Grace', 'Caraballo', 'gracecp@gmail.com', '123124123', 24, 18, DEFAULT, null, 'gracar123', '');

INSERT INTO `curso` (`id`, `grado`, `grupo`, `nombre`,`etapa`) VALUES
('1BACHA', '1BACH', 'A', 'Primero Bachillerato A', 'BACHILLERATO'),
('2ESOB', 'grado', 'B', 'nombre', 'ESO'),
('1DAM', '1DAM', NULL, 'Primero Desarollo de Aplicaciones Multiplataforma', 'FPGS'),
('2DAW', '2DAW', NULL, 'Segundo Desarollo de Aplicaciones Web', 'FPGS');

INSERT INTO `profecurso` (`id`, `profe`, `curso`) VALUES
(NULL, 'Profe1', '1BACHA'),
(NULL, 'Profe1', '2ESOB'),
(NULL, 'Profe1', '2DAW'),
(NULL, 'Profe2', '1DAM'),
(NULL, 'Profe2', '2ESOB'),
(NULL, 'Profe3', '2DAW'),
(NULL, 'Profe3', '2ESOB'),
(NULL, 'Profe3', '1DAM'),
(NULL, 'Profe3', '1BACHA');

INSERT INTO `profedepartamento` (`id`,`profe`, `departamento`) VALUES
(NULL,'Profe1', 'FOL'),
(NULL, 'Profe3', 'FIL'),
(NULL,'Profe2', 'GEO');

INSERT INTO `jefedepartamento` (`id`,`profe`, `departamento`) VALUES
(NULL,'Profe1', 'FOL'),
(NULL, 'Profe3', 'FIL');

INSERT INTO `tutor` (`id`,`profe`, `curso`, `aula`, `fct`) VALUES
('1','Profe1', '1BACHA', 'Aula 101', TRUE),
('2', 'Profe3', '2ESOB', 'Aula 202', FALSE),
('3','Profe2', '1DAM', 'Aula 103', FALSE);

INSERT INTO `asignatura` (`id`, `nombre`, `id_dpto`, `descripcion`) VALUES
('ING', 'Inglés', 'ING', NULL),
('ALE', 'Alemán', 'ALE',  NULL),
('DPL', 'Despliegue de aplicaciones web', 'INF',  NULL),
('SI', 'Sistemas informáticos', 'INF',  NULL);

INSERT INTO `fichar` (`id_profe`, `dia`, `hora`) VALUES
('Profe2', '2023-03-02', '08:00:50'),
('Profe1', '2023-03-02', '08:32:50'),
('Profe3', '2023-03-02', '08:34:03'),
('Profe1', '2023-03-02', '11:34:40'),
('Profe3', '2023-03-02', '12:45:50');

INSERT INTO `horario` (`id`, `id_tipo_hora`, `hora_inicio`, `hora_fin`, `dia`) VALUES
(NULL, 1, '08:00:00', '08:55:00', 'L'),
(NULL, 2, '08:00:00', '08:55:00', 'L'),
(NULL, 1, '08:55:00', '09:50:00', 'M'),
(NULL, 3, '09:50:00', '10:45:00', 'X');

INSERT INTO `repartohorarioprofesor` (`id`, `profe`, `tipohora`, `tri1`, `tri2`, `tri3`, `objetivo`) VALUES
(NULL, 'Profe1', 1, 8, 8, 8, 8),
(NULL, 'Profe1', 2, 6, 6, 6, 6),
(NULL, 'Profe1', 3, 10, 10, 10, 10),
(NULL, 'Profe2', 4, 18, 18, 18, 18);
