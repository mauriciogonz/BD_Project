CREATE TABLE auditoria (
    id_auditoria       INTEGER NOT NULL
    ,nombre_tabla   VARCHAR(250) NOT NULL
    ,nombre_usuario VARCHAR(250) NOT NULL
	,fecha timestamp NOT NULL
	,tipo_accion VARCHAR (10) NOT NULL
	,valor_anterior VARCHAR(250) NOT NULL
	,valor_nuevo VARCHAR(250) NOT NULL
    ,PRIMARY KEY (id_auditoria)
);
hola