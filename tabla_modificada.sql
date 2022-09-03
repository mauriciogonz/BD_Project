
CREATE TABLE asignatura (
    id_asignatura       serial 
    ,nombre_asignatura   VARCHAR(250) NOT NULL
    ,creditos_asignatura INTEGER NOT NULL
    ,CONSTRAINT asignatura_pk PRIMARY KEY (id_asignatura)
);

CREATE TABLE carrera (
    id_carrera    serial
    ,nombre_car    VARCHAR(250) NOT NULL
    ,semestres_car VARCHAR(2) NOT NULL
    ,CONSTRAINT carrera_pk PRIMARY KEY (id_carrera)
);

CREATE TABLE docente (
    id_docente           serial
    ,nombre_doc           VARCHAR(250) NOT NULL
    ,fecha_nacimiento_doc DATE NOT NULL
    ,direccion_doc        VARCHAR(100)
    ,telefono_doc         VARCHAR(10)
    ,CONSTRAINT docente_pk PRIMARY KEY (id_docente)
);

CREATE TABLE estudiante (
    id_estudiante       serial
    ,nombre_est           VARCHAR(250) NOT NULL
    ,fecha_nacimiento_est DATE NOT NULL
    ,semestre_est         VARCHAR(2) NOT NULL
    ,genero_est           CHAR(1) NOT NULL
    ,trabaja_est          CHAR(1) NOT NULL
    ,facebook             VARCHAR(600)
    ,id_carrera   INTEGER NOT NULL
    ,CONSTRAINT estudiante_pk PRIMARY KEY (id_estudiante)
);

CREATE TABLE carrera_asignatura (
    id_carrera     INTEGER NOT NULL
    ,id_asignatura INTEGER NOT NULL
    ,CONSTRAINT carrera_asignatura_pk PRIMARY KEY (id_carrera, id_asignatura)
);

CREATE TABLE estudiante_docente (
    id_estudiante INTEGER NOT NULL
    ,id_docente   INTEGER NOT NULL
    ,salon        VARCHAR(5) NOT NULL
    ,CONSTRAINT docente_estudiante_pk PRIMARY KEY (id_estudiante, id_docente)
);

CREATE TABLE docente_asignatura (
    id_docente       INTEGER NOT NULL
    ,id_asignatura   INTEGER NOT NULL
    ,CONSTRAINT docente_asignatura_pk PRIMARY KEY (id_docente,id_asignatura)
);


ALTER TABLE estudiante
    ADD CONSTRAINT e_carrera_fk FOREIGN KEY (id_carrera)
        REFERENCES carrera (id_carrera);

ALTER TABLE estudiante_docente
    ADD CONSTRAINT ed_docente_fk FOREIGN KEY (id_docente)
        REFERENCES docente (id_docente);

ALTER TABLE estudiante_docente
    ADD CONSTRAINT ed_estudiante_fk FOREIGN KEY (id_estudiante)
        REFERENCES estudiante (id_estudiante);

ALTER TABLE docente_asignatura
    ADD CONSTRAINT da_asignatura_fk FOREIGN KEY (id_asignatura)
        REFERENCES asignatura (id_asignatura);

ALTER TABLE docente_asignatura
    ADD CONSTRAINT da_docente_fk FOREIGN KEY (id_docente)
        REFERENCES docente (id_docente);

ALTER TABLE carrera_asignatura
    ADD CONSTRAINT ca_asignatura_fk FOREIGN KEY (id_asignatura)
        REFERENCES asignatura (id_asignatura);

ALTER TABLE carrera_asignatura
    ADD CONSTRAINT ca_carrera_fk FOREIGN KEY (id_carrera)
        REFERENCES carrera (id_carrera);

Insert into carrera(nombre_car,semestres_car) Values ( 'MatemÃ¡ticas','9');
Insert into carrera(nombre_car,semestres_car) Values ('IngenierÃ­a de sistemas','9');
Insert into carrera(nombre_car,semestres_car) Values ( 'IngenierÃ­a Industrial','9');
Insert into carrera(nombre_car,semestres_car) Values ( 'PsicologÃ­a','10');
Insert into carrera(nombre_car,semestres_car) Values ( 'Negocios Internacionales','10');
Insert into carrera(nombre_car,semestres_car) Values ( 'Mercadeo','10');

Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ('Calculo I','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'ProgramaciÃ³n 1','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Catedra 1','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Teoria del color','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Impuestos','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Marketing','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Finanzas','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Ingles','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'ProgramaciÃ³n 2','4');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Catedra 2','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Ingles 2','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Ingles 3','3');
Insert into asignatura (NOMBRE_ASIGNATURA,CREDITOS_ASIGNATURA) Values ( 'Ingles 4','3');

Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Andres Ramirez','21/05/1986','Cra 21 No 63 -28','');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Pedro Perez','25/08/1956','Cra 25 No 35-96','3125489638');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Diana Suarez','25/10/1980','','');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ('Daniel Rodriguez','15/08/1970','','3158966423');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Pilar Marquez','4/09/1970','Calle 17 F no 52 - 30','');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Milena Diaz','13/05/1986','','3115986542');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Pedro Gonzalez','23/08/1950','','');
Insert into docente (NOMBRE_DOC,FECHA_NACIMIENTO_DOC, DIRECCION_DOC,TELEFONO_DOC) Values ( 'Tatiana Perez','13/05/1960','','3496582');

Insert into estudiante (NOMBRE_EST,FECHA_NACIMIENTO_EST, SEMESTRE_EST,GENERO_EST,TRABAJA_EST,FACEBOOK,ID_CARRERA) Values ('Diego Perez','21/10/2000','4','M','0','Diego_Perez',3);
Insert into estudiante (NOMBRE_EST,FECHA_NACIMIENTO_EST, SEMESTRE_EST,GENERO_EST,TRABAJA_EST,FACEBOOK,ID_CARRERA) Values ('Pedro Linares','21/10/2001','3','M','1','',4);
Insert into estudiante (NOMBRE_EST,FECHA_NACIMIENTO_EST, SEMESTRE_EST,GENERO_EST,TRABAJA_EST,FACEBOOK,ID_CARRERA) Values ('Carla Mendez','15/04/2005','3','F','0','Carla_mendez',1);

Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (1,1);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (2,1);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (3,1);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (1,2);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (2,2);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (3,2);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (1,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (2,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (3,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (4,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (5,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (6,3);
Insert into carrera_asignatura (ID_CARRERA,ID_ASIGNATURA) Values (4,4);

Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (1,1);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (2,2);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (2,9);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (3,3);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (3,10);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (4,5);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (4,6);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (4,7);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (5,8);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (5,11);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (5,12);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (5,13);
Insert into docente_asignatura (ID_DOCENTE,ID_ASIGNATURA) Values (6,4);
