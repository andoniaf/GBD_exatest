CREATE TABLE alumnos (
    `idAlumno` int(11) NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `apellido1` varchar(50) NOT NULL,
    `apellido2` varchar(50) NOT NULL,
    `email` varchar(50) NOT NULL,
    `telefono` char(9) NOT NULL,
    `usuario` varchar(50) NOT NULL,
    `password` char(128) NOT NULL,
    PRIMARY KEY (`idAlumno`),
    UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB ;

CREATE TABLE preguntas (
    `idPregunta` INT NOT NULL AUTO_INCREMENT,
    `descripcion` varchar(255) NOT NULL,
    PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB ;

CREATE TABLE opciones (
    `idOpcion` INT NOT NULL AUTO_INCREMENT,
    `idPregunta` INT NOT NULL ,
    `descripcion` varchar(255) NOT NULL,
    `isTrue` BOOLEAN NOT NULL,
    PRIMARY KEY (`idOpcion`)
) ENGINE=InnoDB ;

CREATE TABLE respuestas (
    `idRespuesta` INT NOT NULL AUTO_INCREMENT,
    `idPregunta` INT NOT NULL ,
    `idOpcion` INT NOT NULL ,
    `idIntento` INT NOT NULL ,
    PRIMARY KEY (`idRespuesta`)
) ENGINE=InnoDB ;

CREATE TABLE intentos (
    `idIntento` INT NOT NULL AUTO_INCREMENT,
    `idAlumno` INT NOT NULL ,
    `idRespuesta` INT NOT NULL ,
    `fecha` DATETIME NOT NULL,
    PRIMARY KEY (`idIntento`)
) ENGINE=InnoDB ;

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  KEY `index_id` (`id`)
) ENGINE=InnoDB ;

ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `alumnos` (`idAlumno`);

ALTER TABLE `opciones`
    ADD CONSTRAINT `fk_preguntas_opciones`
    FOREIGN KEY (`idPregunta`)
    REFERENCES `preguntas` (`idPregunta`);

ALTER TABLE `intentos`
    ADD CONSTRAINT `fk_alumnos_intentos`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `alumnos` (`idAlumno`);

ALTER TABLE `respuestas`
    ADD CONSTRAINT `fk_preguntas_respuestas`
    FOREIGN KEY (`idPregunta`)
    REFERENCES `preguntas` (`idPregunta`),
    ADD CONSTRAINT `fk_opciones_respuestas`
	FOREIGN KEY (`idOpcion`)
	REFERENCES `opciones` (`idOpcion`),
	ADD CONSTRAINT `fk_intentos_respuestas`
	FOREIGN KEY (`idIntento`)
	REFERENCES `intentos` (`idIntento`);

INSERT INTO `preguntas` (`descripcion`) VALUES
	('Who am I? PiPaPoPU!'),
	('¿Quien es root?'),
	('¿Quien gana?'),
	('"Recuerdo los buenos tiempos, recuerdo buenas historias. Y aún arde _____ en mi memoria."'),
	('¿Cual es la respuesta al sentido de la vida el universo y todo lo demas?');

INSERT INTO `opciones` (`idPregunta`, `descripcion`, `isTrue`) VALUES
    ('1','George Lucas',0),
    ('1','Stephen Hawking',1),
    ('1','Amy Acker',0),
    ('1','Artoo (R2D2)',0),
    ('2','Groot',0),
    ('2','Snowden',0),
    ('2','Amy Acker',1),
    ('2','Juanmi',0),
    ('3','Iron Man',1),
    ('3','Ojo de halcón',0),
    ('3','Cpt. America',0),
    ('3','Thor',0),
    ('4','Madrid',1),
    ('4','Mordor',0),
    ('4','Valencia',0),
    ('4','Londres',0),
    ('5','13',0),
    ('5','Amy Acker',0),
    ('5','Taylor Swift',0),
    ('5','42',1);

INSERT INTO `alumnos` (`nombre`, `apellido1`,`apellido2`,`email`,`telefono`,`usuario`,`password`) VALUES
    ('Ginevra','Weasley','Wisly','ginny@griffindor.org','963141592','gweasley',SHA2('ronron',512)),
    ('Harry','Potter','Terpo','elprota@griffindor.org','916535897','hpotter',SHA2('ronron'),512),
    ('Hermione','Granger','Watson','sexy_emma@griffindor.org','939323846','hgranger',SHA2('ronron'),512),
    ('Serverus','Snape','Sneip','snake@slytherin','942643383','ssnape',SHA2('ronron'),512),
    ('Tom','Sorvolo','Ryddle','voldemort@slytherin','972795028','tsorvolo',SHA2('ronron'),512),
    ('Sirius','Black','and White','blackadnwhite@griffindor.org','928419716','sblack',SHA2('ronron'),512),
    ('Neville','Longbottom','Shortpants','botonlargo@griffindor.org','928419717','nlongbottom',SHA2('ronron'),512);

