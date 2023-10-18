--TABLA SOPORTE
create table soporte (
	id SERIAL,
	id_tipo_soporte integer,
	numero_soporte
	primary key (id)
);

alter table soporte
add column id_expediente integer;

--FKEY ENTRE SOPORTE Y EXPEDIENTE
alter table soporte 
add constraint soporte_id_expediente_fkey foreign key (id_expediente)
references expediente (id) match simple;

--CREAR FKEY USUARIO EN TABLA SOLICITUD_MUESTRA MEDICA
alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;

--ELIMINAR FKEY USUARIO DE TABLA SOLICITUD_MUESTRA MEDICA
alter table solicitud_muestra_medica
drop constraint solicitud_muestra_medica_id_usuario_fkey;

--FKEY ENTRE SOPORTE Y TIPO DE SOPORTE
alter table soporte 
add constraint soporte_tipo_soporte_fkey foreign key (id_tipo_soporte)
references tipo_soporte (id) match simple;

--FKEY ENTRE EXPEDIENTE - SOPORTE
alter table expediente 
add constraint expediente_id_soporte_fkey foreign key (id_soporte)
references soporte (id) match simple;

--ELIMINAR RELACION ENTRE EXPEDIENTE - SOPORTE
alter table expediente 
drop constraint expediente_id_soporte_fkey;

--ELIMINACION DE CAMPO ID_EXPEDIENTE, CANTIDAD_MUESTRA DE TABLA DE SOLICITUD DE MUESTRA.
create table solicitud_muestra_medica (
	id SERIAL,
	id_expediente integer not null,
	cantidad_muestra integer,
	primary key (id)
);

--FKEY DE SOLICITUD_MUESTRA_MEDICA A EXPEDIENTE
alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_expediente_fkey foreign key (id_expediente)
references expediente (id) match simple;

--ELIMINAR FKEY EXPEDIENTE DE TABLA SOLICITUD_MUESTRA_MEDICA 
ALTER TABLE solicitud_muestra_medica
DROP CONSTRAINT solicitud_muestra_medica_id_expediente_fkey;

--ELIMINAR DE LA TABLA SOLICITUD_MUESTRA_MEDICA
alter table solicitud_muestra_medica
drop column id_expediente;
--ELIMINACION DE RELACION ENTRE SOPORTE Y TABLA EXPEDIENTE
ALTER TABLE soporte DROP CONSTRAINT soporte_expediente_fkey;

--ELIMINACION DE RELACION ENTRE SOPORTE Y TIPO DE SOPORTE
ALTER TABLE soporte DROP CONSTRAINT soporte_tipo_soporte_fkey;

--ELIMINACION DE TABLA SOPORTE
drop table soporte;

--MODIFICACION CAMPO DE SOPORTE A TIPO DE SOPORTE
alter table expediente rename column id_soporte to id_tipo_soporte;


--TABLA CLIENTE
create table cliente(
    id SERIAL,
    id_usuario integer,
    fecha_creacion date,
    primary key (id)
);

alter table cliente
add constraint cliente_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;

alter table solicitud_muestra_medica
add constraint solicitud_muestra_medica_id_cliente_fkey foreign key (id_cliente)
references cliente (id) match simple;


--TABLA EMPLEADOS
create table empleado (
    id SERIAL,
    id_rol integer,
    id_usuario integer,
    primary key (id)
);

--FKEY EMPLEADOS
alter table empleado
add constraint empleado_id_rol_fkey foreign key (id_rol)
references rol (id) match simple;

alter table empleado
add constraint empleado_id_usuario_fkey foreign key (id_usuario)
references usuario (id) match simple;