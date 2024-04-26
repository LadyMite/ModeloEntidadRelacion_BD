-- Database: DB_AhsokaVoice

-- DROP DATABASE IF EXISTS "DB_AhsokaVoice";

CREATE DATABASE "DB_AhsokaVoice"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
--DROP DATABASE IF EXISTS DB_AhsokaVoice;

--CREATE DATABASE DB_AhsokaVoice;

CREATE TABLE Usuario(
	IdUsuario serial PRIMARY KEY,
	nombreUsuario character varying(30) NOT NULL,
	contraseniaUsuario character varying(32) NOT NULL,
	correoUsuario character varying(30) NOT NULL,
	fechaNacUsuario timestamp without time zone NOT NULL
);

CREATE TABLE Area (
    IdArea serial PRIMARY KEY,
    nombreArea character varying(50) NOT NULL
	--CONSTRAINT PK_IdArea PRIMARY KEY (IdArea);
);

CREATE TABLE Logro (
    IdLogro serial PRIMARY KEY,
    tituloLogro character varying(50) NOT NULL,
    fechaLogro timestamp without time zone NOT NULL,
    descripcionLogro character varying(100) NOT NULL,
    imagenLogro bytea NOT NULL,
    IdUsuario integer NOT NULL,
    IdArea integer NOT NULL,
	--CONSTRAINT PK_IdLogro PRIMARY KEY (IdLogro);
	CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_IdArea FOREIGN KEY (IdArea) REFERENCES Area (IdArea) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Likes(
    IdLike serial PRIMARY KEY,
    IdUsuario integer NOT NULL,
    IdLogro integer NOT NULL,
	--CONSTRAINT PK_IdLike  PRIMARY KEY (IdLike );
	CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_IdLogro FOREIGN KEY (IdLogro) REFERENCES Logro (IdLogro) ON DELETE CASCADE ON UPDATE CASCADE

);

SELECT * FROM Usuario;
SELECT * FROM Area;
SELECT * FROM Logro;
SELECT * FROM Likes;

INSERT INTO Usuario (nombreUsuario, contraseniaUsuario, correoUsuario, fechaNacUsuario)
VALUES('Lady','1234','lady@gmail.com','30/08/1995'),
	('Stephanie','1234','stephanie@gmail.com','31/08/1995'),
	('Tatiana','1234','tatiana@gmail.com','25/04/1994'),
	('Blanca','1234','blanca@gmail.com','26/04/1993'),
	('Andrea','1234','andrea@gmail.com','15/10/1993'),
	('Andreina','1234','andreina@gmail.com','16/10/1992');

INSERT INTO Area (nombreArea)
VALUES('Personal'),('Profesional'),('Aprendizaje'),('Deportiva'),('Laboral');

INSERT INTO Area (nombreArea)
VALUES('Personal'),('Profesional'),('Aprendizaje'),('Deportiva'),('Laboral');

INSERT INTO Logro (tituloLogro, fechaLogro, descripcionLogro, imagenLogro, IdUsuario, IdArea)
VALUES ('Logro 1', '2024-04-25', 'Nivel 1', 'imagen1.png', 1, 1),
       ('Logro 2', '2024-04-26', 'Descripción del logro 2', 'imagen2.png', 2, 2),
       ('Logro 3', '2024-04-27', 'Descripción del logro 3', 'imagen3.png', 3, 1);
	   
UPDATE Logro
SET descripcionLogro = 'Nivel 2'
WHERE IdLogro = 2;

UPDATE Logro
SET descripcionLogro = 'Nivel 3'
WHERE IdLogro = 3;
	   
INSERT INTO Likes (IdUsuario, IdLogro)
VALUES ( 1, 1),
       ( 2, 2),
       ( 3, 3);

--buscar usuario por fecha de nacimiento
SELECT * FROM Usuario
WHERE fechaNacUsuario = '15/10/1993';

/*ALTER TABLE Logro
ADD CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) 
REFERENCES Usuario (IdUsuario) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

ALTER TABLE Logro
ADD CONSTRAINT FK_IdArea FOREIGN KEY (IdArea) 
REFERENCES Area (IdArea) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

on delete restrict on update restrict;*/