-- Crear la base de datos DB_AhsokaVoice
CREATE DATABASE DB_AhsokaVoice;
GO

-- Usar la base de datos DB_AhsokaVoice
USE DB_AhsokaVoice;
GO

-- Crear la tabla Usuarios
CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY,
    nombreUsuario VARCHAR(100),
    contraseniaUsuario VARCHAR(100),
    correoUsuario VARCHAR(100),
    fechaNacUsuario DATE
);
GO

-- Crear la tabla Areas
CREATE TABLE Area (
    IdArea INT PRIMARY KEY IDENTITY,
    nombreArea VARCHAR(100)
);
GO

-- Crear la tabla Logros
CREATE TABLE Logro (
    IdLogro INT PRIMARY KEY IDENTITY,
    tituloLogro VARCHAR(100),
    fechaLogro DATE,
    IdArea INT,
    descripcionLogro VARCHAR(MAX),
    imagenLogro VARBINARY(MAX),
    IdUsuario INT,
    FOREIGN KEY (IdArea) REFERENCES Area(IdArea),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);
GO


-- Crear la tabla Likes
CREATE TABLE Likes (
    ID_Like INT PRIMARY KEY IDENTITY,
    ID_Logro INT,
    ID_Usuario INT,
    FOREIGN KEY (ID_Logro) REFERENCES Logro(IdLogro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(IdUsuario)
);
GO

--
USE master;
GO

-- Eliminar la base de datos DB_AhsokaVoice
DROP DATABASE DB_AhsokaVoice;
GO

