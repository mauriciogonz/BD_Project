------------TABLA AUDITORIA-------------------------------------

CREATE TABLE auditoria (
    id_auditoria    serial 
    ,nombre_tabla   VARCHAR(250) NOT NULL
    ,nombre_usuario VARCHAR(250) NOT NULL
	,fecha timestamp NOT NULL
	,tipo_accion VARCHAR (10) NOT NULL
	,valor_anterior VARCHAR(250) 
	,valor_nuevo VARCHAR(250) 
    ,PRIMARY KEY (id_auditoria)
);
----------------------------------------------------------------

-----------------NUEVA_CARRERA----------------------------------
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

insert into carrera (
					 nombre_car
					 ,semestres_car
                      )
       values(
			 'Minas2'
			 ,10)
			 
select *  from auditoria

select * from carrera
-----------------------------------------------------------------

----------------ACTUALIZAR_CARRERA------------------------------
create or replace function actualizar_carrera()
returns trigger
as
$$
begin 
	insert into auditoria(nombre_tabla,nombre_usuario,fecha,tipo_accion,valor_anterior,valor_nuevo)
            values ('Carrera', user,now(),'U',old,new);
			 return new;
	end
$$ language PLPGSQL;


create or replace trigger tr_actualizar_carrera
   after update on carrera
    for each row
        execute procedure actualizar_carrera();
end;
update carrera set nombre_car='Ingenieria Agropecuaria' where id_carrera=7;

------------------------------------------------------------------

----------------ELIMINAR CARRERA-------------------------------
create or replace function eliminar_carrera()
returns trigger
as
$$
begin 
	insert into auditoria(nombre_tabla,nombre_usuario,fecha,tipo_accion,valor_anterior,valor_nuevo)
            values ('Carrera', user,now(),'D',old,new);
			 return new;
	end
$$ language PLPGSQL;

create or replace trigger tr_eliminar_carrera
   after delete on carrera
    for each row
        execute procedure eliminar_carrera();
end;

delete from carrera where id_carrera=7;
