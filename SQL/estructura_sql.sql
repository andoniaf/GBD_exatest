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
