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
    `opcion1` varchar(255) NOT NULL,
    `opcion2` varchar(255) NOT NULL,
    `opcion3` varchar(255) NOT NULL,
    `opcion4` varchar(255) NOT NULL,
    `opcion_true` varchar(255) NOT NULL,
    PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB ;

CREATE TABLE respuestas (
    `idRespuesta` INT NOT NULL AUTO_INCREMENT,
    `usuario` varchar(50) NOT NULL,
    `idPregunta` INT NOT NULL ,
    `idOpcion` INT NOT NULL ,
    `time` VARCHAR(150) NOT NULL ,
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

ALTER TABLE `intentos`
    ADD CONSTRAINT `fk_alumnos_intentos`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `alumnos` (`idAlumno`);

ALTER TABLE `respuestas`
    ADD CONSTRAINT `fk_preguntas_respuestas`
    FOREIGN KEY (`idPregunta`)
    REFERENCES `preguntas` (`idPregunta`),
    ADD CONSTRAINT `fk_intentos_respuestas`
	FOREIGN KEY (`idIntento`)
	REFERENCES `intentos` (`idIntento`);

INSERT INTO `preguntas` (`idPregunta`,`descripcion`,`opcion1`,`opcion2`,`opcion3`,`opcion4`,`opcion_true`) VALUES
	(1,'Who am I? PiPaPoPU!','George Lucas','Stephen Hawking','Amy Acker','Artoo (R2D2)',2),
	(2,'¿Quien es root?','Juanmi','Groot','Amy Acker','Snowden',3),
	(3,'¿Quien gana?','Thor','Cpt. America','Iron Man','Ojo de halcón',3),
	(4,'"Recuerdo los buenos tiempos, recuerdo buenas historias. Y aún arde _____ en mi memoria."','Londres','Madrid','Valencia','Mordor',2),
	(5,'¿Cual es la respuesta al sentido de la vida el universo y todo lo demas?','42','13','Amy Acker','Taylor Swift',1);

INSERT INTO `alumnos` (`nombre`, `apellido1`,`apellido2`,`email`,`telefono`,`usuario`,`password`) VALUES
    ('Ginevra','Weasley','Wisly','ginny@griffindor.org','963141592','gweasley',SHA2('ronron',512)),
    ('Harry','Potter','Terpo','elprota@griffindor.org','916535897','hpotter',SHA2('ronron',512)),
    ('Hermione','Granger','Watson','sexy_emma@griffindor.org','939323846','hgranger',SHA2('ronron',512)),
    ('Serverus','Snape','Sneip','snake@slytherin','942643383','ssnape',SHA2('ronron',512)),
    ('Tom','Sorvolo','Ryddle','voldemort@slytherin','972795028','tsorvolo',SHA2('ronron',512)),
    ('Sirius','Black','and White','blackadnwhite@griffindor.org','928419716','sblack',SHA2('ronron',512)),
    ('Neville','Longbottom','Shortpants','botonlargo@griffindor.org','928419717','nlongbottom',SHA2('ronron',512));
