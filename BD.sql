CREATE TABLE auditoria (
    id_auditoria    serial 
    ,nombre_tabla   VARCHAR(250) NOT NULL
    ,nombre_usuario VARCHAR(250) NOT NULL
	,fecha timestamp NOT NULL
	,tipo_accion VARCHAR (10) NOT NULL
	,valor_anterior VARCHAR(250) 
	,valor_nuevo VARCHAR(250) NOT NULL
    ,PRIMARY KEY (id_auditoria)
);

create or replace function nueva_carrera()
    returns trigger
    as
    $$
    begin
     insert into auditoria(nombre_tabla,nombre_usuario,fecha,tipo_accion,valor_anterior,valor_nuevo)
            values ('Carrera', user,now(),'I',old,new);
    return new;
	end
$$ language PLPGSQL;

create or replace trigger tr_nueva_carrera
   after insert on carrera
    for each row
        execute procedure nueva_carrera();
end;

insert into carrera ( id_carrera
					 ,nombre_car
					 ,semestres_car
                      )
       values(9,
			 'Minas'
			 ,10)
			 
select *  from auditoria

select * from carrera
