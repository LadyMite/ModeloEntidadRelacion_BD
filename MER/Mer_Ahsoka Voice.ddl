-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-04-21 23:39:04 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE área CASCADE CONSTRAINTS;

DROP TABLE "Like" CASCADE CONSTRAINTS;

DROP TABLE logro CASCADE CONSTRAINTS;

DROP TABLE usuario CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE área (
    idarea     VARCHAR2(50 CHAR) NOT NULL,
    nombrearea VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE área ADD CONSTRAINT área_pk PRIMARY KEY ( idarea );


CREATE TABLE Área_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,IdArea VARCHAR2 (50 CHAR) NOT NULL
 ,nombreArea VARCHAR2 (50 CHAR) NOT NULL
 );

CREATE OR REPLACE TRIGGER Área_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Área for each row 
 Declare 
  rec Área_JN%ROWTYPE; 
  blank Área_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.IdArea := :NEW.IdArea; 
      rec.nombreArea := :NEW.nombreArea; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.IdArea := :OLD.IdArea; 
      rec.nombreArea := :OLD.nombreArea; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Área_JN VALUES rec; 
  END; 
  /CREATE TABLE "Like" (
    idlike            INTEGER NOT NULL,
    usuario_idusuario INTEGER NOT NULL,
    logro_logro_id    NUMBER NOT NULL
);

ALTER TABLE "Like" ADD CONSTRAINT like_pk PRIMARY KEY ( idlike );


CREATE TABLE Like_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,IdLike INTEGER NOT NULL
 ,Usuario_IdUsuario INTEGER NOT NULL
 ,Logro_Logro_ID NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER Like_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Like for each row 
 Declare 
  rec Like_JN%ROWTYPE; 
  blank Like_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.IdLike := :NEW.IdLike; 
      rec.Usuario_IdUsuario := :NEW.Usuario_IdUsuario; 
      rec.Logro_Logro_ID := :NEW.Logro_Logro_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.IdLike := :OLD.IdLike; 
      rec.Usuario_IdUsuario := :OLD.Usuario_IdUsuario; 
      rec.Logro_Logro_ID := :OLD.Logro_Logro_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Like_JN VALUES rec; 
  END; 
  /CREATE TABLE logro (
    idlogro           INTEGER NOT NULL,
    titulologro       VARCHAR2(50 CHAR) NOT NULL,
    fechalogro        DATE NOT NULL,
    descripcionlogro  VARCHAR2(100 CHAR) NOT NULL,
    imagenlogro       BLOB,
    usuario_idusuario INTEGER NOT NULL,
    área_idarea       VARCHAR2(50 CHAR) NOT NULL,
    logro_id          NUMBER NOT NULL
);

ALTER TABLE logro ADD CONSTRAINT logro_pk PRIMARY KEY ( logro_id );


CREATE TABLE Logro_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,IdLogro INTEGER NOT NULL
 ,tituloLogro VARCHAR2 (50 CHAR) NOT NULL
 ,fechaLogro DATE NOT NULL
 ,descripcionLogro VARCHAR2 (100 CHAR) NOT NULL
 ,imagenLogro BLOB
 ,Usuario_IdUsuario INTEGER NOT NULL
 ,Área_IdArea VARCHAR2 (50 CHAR) NOT NULL
 ,Logro_ID NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER Logro_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Logro for each row 
 Declare 
  rec Logro_JN%ROWTYPE; 
  blank Logro_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.IdLogro := :NEW.IdLogro; 
      rec.tituloLogro := :NEW.tituloLogro; 
      rec.fechaLogro := :NEW.fechaLogro; 
      rec.descripcionLogro := :NEW.descripcionLogro; 
      rec.imagenLogro := :NEW.imagenLogro; 
      rec.Usuario_IdUsuario := :NEW.Usuario_IdUsuario; 
      rec.Área_IdArea := :NEW.Área_IdArea; 
      rec.Logro_ID := :NEW.Logro_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.IdLogro := :OLD.IdLogro; 
      rec.tituloLogro := :OLD.tituloLogro; 
      rec.fechaLogro := :OLD.fechaLogro; 
      rec.descripcionLogro := :OLD.descripcionLogro; 
      rec.imagenLogro := :OLD.imagenLogro; 
      rec.Usuario_IdUsuario := :OLD.Usuario_IdUsuario; 
      rec.Área_IdArea := :OLD.Área_IdArea; 
      rec.Logro_ID := :OLD.Logro_ID; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Logro_JN VALUES rec; 
  END; 
  /CREATE TABLE usuario (
    idusuario          INTEGER NOT NULL,
    nombreusuario      VARCHAR2(30 CHAR) NOT NULL,
    contraseniauusario VARCHAR2(32 CHAR) NOT NULL,
    correouusario      VARCHAR2(30 CHAR) NOT NULL,
    fechanacusuario    DATE NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( idusuario );


CREATE TABLE Usuario_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,IdUsuario INTEGER NOT NULL
 ,nombreUsuario VARCHAR2 (30 CHAR) NOT NULL
 ,contraseniaUusario VARCHAR2 (32 CHAR) NOT NULL
 ,correoUusario VARCHAR2 (30 CHAR) NOT NULL
 ,fechaNacUsuario DATE NOT NULL
 );

CREATE OR REPLACE TRIGGER Usuario_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Usuario for each row 
 Declare 
  rec Usuario_JN%ROWTYPE; 
  blank Usuario_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.IdUsuario := :NEW.IdUsuario; 
      rec.nombreUsuario := :NEW.nombreUsuario; 
      rec.contraseniaUusario := :NEW.contraseniaUusario; 
      rec.correoUusario := :NEW.correoUusario; 
      rec.fechaNacUsuario := :NEW.fechaNacUsuario; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.IdUsuario := :OLD.IdUsuario; 
      rec.nombreUsuario := :OLD.nombreUsuario; 
      rec.contraseniaUusario := :OLD.contraseniaUusario; 
      rec.correoUusario := :OLD.correoUusario; 
      rec.fechaNacUsuario := :OLD.fechaNacUsuario; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Usuario_JN VALUES rec; 
  END; 
  /ALTER TABLE "Like"
    ADD CONSTRAINT like_logro_fk FOREIGN KEY ( logro_logro_id )
        REFERENCES logro ( logro_id );

ALTER TABLE "Like"
    ADD CONSTRAINT like_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE logro
    ADD CONSTRAINT logro_área_fk FOREIGN KEY ( área_idarea )
        REFERENCES área ( idarea );

ALTER TABLE logro
    ADD CONSTRAINT logro_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

CREATE SEQUENCE logro_logro_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER logro_logro_id_trg BEFORE
    INSERT ON logro
    FOR EACH ROW
    WHEN ( new.logro_id IS NULL )
BEGIN
    :new.logro_id := logro_logro_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              8
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
